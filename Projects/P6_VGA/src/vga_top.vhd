library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_top is
   generic(COLOR_DEPTH: integer := 12);
   port(CLOCK_50   : in std_logic;
        KEY        : in std_logic_vector(3 downto 0);
        VGA_HS     : out std_logic;
        VGA_VS     : out std_logic;
        frame_start: out std_logic;
        frame_end  : out std_logic;
        VGA_R    	 : out std_logic_vector(7 downto 0);
		  VGA_G      : out std_logic_vector(7 downto 0);
		  VGA_B      : out std_logic_vector(7 downto 0);
        hcount     : out std_logic_vector(10 downto 0);
        vcount     : out std_logic_vector(10 downto 0));
end vga_top;

architecture vga_top_rtl of vga_top is
   -- vga 640x480 parameters
   constant HD: integer := 640;         -- Horizontal diaplay area
   constant HF: integer := 16;          -- Horizontal front porch
   constant HB: integer := 48;          -- Horizontal back porch
   constant HR: integer := 96;          -- Horizontal retrace
   constant HT: integer := HD+HF+HB+HR; -- Horizontal total
   constant VD: integer := 480;         -- Vertical diaplay area
   constant VF: integer := 10;          -- Vertical front porch
   constant VB: integer := 33;          -- Vertical back porch
   constant VR: integer := 2;           -- Vertical retrace
   constant VT: integer := VD+VF+VB+VR; -- Vertical total
   -- sync counter and signals
   signal hcnt, vcnt : std_logic_vector(10 downto 0);
   signal hsync_i    : std_logic;
   signal vsync_i    : std_logic;
   signal video_on_i : std_logic;
   signal q_reg      : unsigned(1 downto 0);
   signal tick_25M   : std_logic;
   signal vga_in     : std_logic_vector(COLOR_DEPTH - 1 downto 0);
begin
   counter_unit: entity work.frame_counter(frame_counter_rtl)
      generic map(HMAX => HT, VMAX => VT)
      port map(clk => CLOCK_50, rst_n => KEY(0), sync_clr => '0',
      h_count => hcnt, v_count => vcnt, inc => tick_25M,
      frame_start => frame_start, frame_end => frame_end);
        
   pixel_generate: entity work.pixel_gen(pixel_gen_rtl)
      port map(h_count => hcnt, v_count => vcnt, rgb => vga_in);
        
   TICK_25MHZ: process(CLOCK_50, KEY(0))
   begin
      if KEY(0) = '0' then
         q_reg <= (others => '0');
      elsif rising_edge(CLOCK_50) then
         q_reg <= (q_reg + 1) mod 2;
      end if;
   end process;
    
   tick_25M <= '1' when q_reg = "01" else '0';

   hcount <= hcnt;
   vcount <= vcnt;
    
   -- Horizontal sync decoding
   hsync_i <= '0' when (unsigned(hcnt) >= HD+HF) and (unsigned(hcnt) <= HD+HF+HR-1) else '1';
   -- Vertical sync decoding
   vsync_i <= '0' when (unsigned(vcnt) >= VD+VF) and (unsigned(vcnt) <= VD+VF+VR-1) else '1';
   -- Display on/off
   video_on_i <= '1' when (unsigned(hcnt) < HD) and (unsigned(vcnt) < VD) else '0';
    
   -- Buffered output to VGA monitor
   process(CLOCK_50)
   begin
      if rising_edge(CLOCK_50) then
         VGA_VS <= vsync_i;
         VGA_HS <= hsync_i;
         if video_on_i = '1' then
            VGA_R <= "0000" & vga_in(11 downto 8);
				VGA_G <= "0000" & vga_in(7 downto 4);
				VGA_B <= "0000" & vga_in(3 downto 0);
         else	-- Black when display off
            VGA_R <= (others => '0');
				VGA_G <= (others => '0');
				VGA_B <= (others => '0');  
         end if;   
      end if;
   end process;
end vga_top_rtl;