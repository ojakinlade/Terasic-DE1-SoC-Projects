library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;

entity sseg_top is
   port(CLOCK_50: in std_logic;
        KEY : in std_logic_vector(3 downto 0);
        HEX0: out std_logic_vector(6 downto 0);
        HEX1: out std_logic_vector(6 downto 0);
        HEX2: out std_logic_vector(6 downto 0);
        HEX3: out std_logic_vector(6 downto 0);
        HEX4: out std_logic_vector(6 downto 0);
        HEX5: out std_logic_vector(6 downto 0));
end sseg_top;

architecture sseg_top_rtl of sseg_top is
   signal shift_reg: std_logic_vector(39 downto 0) := "0000000100100011010001010110011110001000";
   signal clk_out: std_logic;
   Signal locked: std_logic;
   signal ticks: unsigned(23 downto 0);
   component PLL is
      port (
         refclk   : in  std_logic := 'X'; -- clk
         rst      : in  std_logic := 'X'; -- reset
         outclk_0 : out std_logic;        -- clk
         locked   : out std_logic       -- export
      );
   end component PLL;
begin
   CLK_10MHz: PLL
   port map(refclk => CLOCK_50, rst => not KEY(0), 
            outclk_0 => clk_out, locked => locked);
   
   process(clk_out, KEY(0))
   begin
      if KEY(0) = '0' then
         ticks <= (others => '0');
      elsif rising_edge(clk_out) then
         if ticks = to_unsigned(5000000 - 1,ticks'length) then
            ticks <= (others => '0');
         else
            ticks <= ticks + 1;
         end if;
      end if;
   end process;
   
   process(clk_out, KEY(0))
   begin
      if KEY(0) = '0' then
         shift_reg <= "0000000100100011010001010110011110001001";
      elsif rising_edge(clk_out) then
         if ticks = to_unsigned(5000000 - 1,ticks'length) then
            shift_reg(39 downto 36) <= shift_reg(35 downto 32);
            shift_reg(35 downto 32) <= shift_reg(31 downto 28);
            shift_reg(31 downto 28) <= shift_reg(27 downto 24);
            shift_reg(27 downto 24) <= shift_reg(23 downto 20);
            shift_reg(23 downto 20) <= shift_reg(19 downto 16);
            shift_reg(19 downto 16) <= shift_reg(15 downto 12);
            shift_reg(15 downto 12) <= shift_reg(11 downto 8);
            shift_reg(11 downto 8) <= shift_reg(7 downto 4);
            shift_reg(7 downto 4) <= shift_reg(3 downto 0);
            shift_reg(3 downto 0) <= shift_reg(39 downto 36);
         end if;
      end if;
   end process;
   
   HEX_0: entity work.sseg_rom(sseg_rom_rtl) 
   port map(addr => shift_reg(19 downto 16), data_out => HEX0);
   
   HEX_1: entity work.sseg_rom(sseg_rom_rtl) 
   port map(addr => shift_reg(23 downto 20), data_out => HEX1);
   
   HEX_2: entity work.sseg_rom(sseg_rom_rtl) 
   port map(addr => shift_reg(27 downto 24), data_out => HEX2);
   
   HEX_3: entity work.sseg_rom(sseg_rom_rtl) 
   port map(addr => shift_reg(31 downto 28), data_out => HEX3);
   
   HEX_4: entity work.sseg_rom(sseg_rom_rtl) 
   port map(addr => shift_reg(35 downto 32), data_out => HEX4);
   
   HEX_5: entity work.sseg_rom(sseg_rom_rtl) 
   port map(addr => shift_reg(39 downto 36), data_out => HEX5);
end sseg_top_rtl;