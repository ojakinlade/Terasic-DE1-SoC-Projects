library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_top is
   generic(COLOR_DEPTH: integer := 24);
   port(CLOCK_50   : in std_logic;
        KEY        : in std_logic_vector(3 downto 0);
        VGA_HS     : out std_logic;
        VGA_VS     : out std_logic;
        VGA_CLK    : out std_logic;
        video_on   : out std_logic;
        VGA_R      : out std_logic_vector((COLOR_DEPTH / 3) - 1 downto 0);
        VGA_G      : out std_logic_vector((COLOR_DEPTH / 3) - 1 downto 0);
        VGA_B      : out std_logic_vector((COLOR_DEPTH / 3) - 1 downto 0));
end vga_top;

architecture vga_top_rtl of vga_top is
   signal pixel_x: std_logic_vector(9 downto 0); 
   signal pixel_y: std_logic_vector(9 downto 0);
   signal pixel_tick: std_logic;
   signal rgb_out: std_logic_vector(COLOR_DEPTH - 1 downto 0);
   signal rgb_reg: std_logic_vector(COLOR_DEPTH - 1 downto 0); 
   signal rgb_next: std_logic_vector(COLOR_DEPTH - 1 downto 0);
begin
    -- Instantiate VGA sync
   vga_sync_unit: entity work.vga_sync(vga_sync_rtl)
   port map(rst_n => KEY(0), clk => CLOCK_50, video_on => video_on,
            p_tick => pixel_tick, hsync => VGA_HS, vsync => VGA_VS,
            pixel_x => pixel_x, pixel_y => pixel_y);
            
   pixel_generate: entity work.pixel_gen(pixel_gen_rtl)
      port map(pixel_x => pixel_x, pixel_y => pixel_y, rgb_out => rgb_out);
      
   VGA_CLK <= pixel_tick;
    
   rgb_output: rgb_next <= rgb_out when pixel_tick = '1' 
               else rgb_reg; 
   
   -- Buffered ouputs
   VGA_R <= rgb_reg(23 downto 16); 
   VGA_G <= rgb_reg(15 downto 8); 
   VGA_B <= rgb_reg(7 downto 0); 
   
   rgb_register: process(CLOCK_50, KEY(0))
   begin
      if KEY(0) = '0' then
         rgb_reg <= (others => '0');
      elsif rising_edge(CLOCK_50) then
         rgb_reg <= rgb_next;
      end if;
   end process;
end vga_top_rtl;