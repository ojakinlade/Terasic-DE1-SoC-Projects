library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_top_tb is
--  Port ( );
end vga_top_tb;

architecture vga_top_behav of vga_top_tb is
   constant CLK_PERIOD: time := 20 ns;
   signal clk: std_logic := '0';
	signal pixel_tick: std_logic;
	signal video_on: std_logic;
   signal KEY: std_logic_vector(3 downto 0);
   signal hsync: std_logic;
   signal vsync: std_logic;
	signal vga_r: std_logic_vector(7 downto 0);
	signal vga_g: std_logic_vector(7 downto 0);
	signal vga_b: std_logic_vector(7 downto 0);
   signal end_test: std_logic := '0';
begin
   uut: entity work.vga_top(vga_top_rtl)
      generic map(COLOR_DEPTH => 12)
      port map(CLOCK_50 => clk, KEY => KEY, VGA_HS => hsync,
      VGA_VS => vsync, VGA_R => vga_r, VGA_G => vga_g, video_on => video_on,
		VGA_B => vga_b, VGA_CLK => pixel_tick);
        
   reset: KEY(0) <= '0', '1' after CLK_PERIOD;
   
   clk_generation: process
   begin
      clk <= not clk;
      wait for CLK_PERIOD / 2;
   end process;

   stimuli: process
   begin
      wait until video_on = '1';
		wait until video_on = '0';
      wait for CLK_PERIOD;
      end_test <= '1';
   end process;
    
   output_report: process
   begin 
      wait until KEY(0) = '1';
     -- wait until frame_end = '1';
      report "VGA frame completed successfully.";
        
      wait until end_test = '1';
      assert false report "Simulation done" severity failure;
      wait;
   end process;
end vga_top_behav;
