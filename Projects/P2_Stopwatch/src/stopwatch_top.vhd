library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;

entity stopwatch_top is
   port(CLOCK_50: in std_logic;
        KEY : in std_logic_vector(3 downto 0);
        HEX0: out std_logic_vector(6 downto 0);
        HEX1: out std_logic_vector(6 downto 0);
        HEX2: out std_logic_vector(6 downto 0);
        HEX3: out std_logic_vector(6 downto 0));
end stopwatch_top;

architecture stopwatch_top_rtl of stopwatch_top is
   type digit_type is array(0 to 3) of std_logic_vector(3 downto 0);
   signal digit: digit_type;
   signal en: std_logic := '1';
   signal prevPressed: std_logic := '0';
begin
   BUTTON_PRESS: process(CLOCK_50, KEY(0))
   begin
      if(KEY(0) = '0') then
         en <= '1';
      elsif rising_edge(CLOCK_50) then
         if KEY(1) = '0' and prevPressed = '0' then
            en <= '0';
            prevPressed <= '1';
         elsif KEY(1) = '1' then
            prevPressed <= '0';
         end if;  
      end if;
   end process;
   
   -- counter for 'hundredth' digit
   counter_1: entity work.sseg_counter(sseg_counter_rtl)
   generic map(PLACE_VALUE => 1)
   port map(rst_n => KEY(0), clk => CLOCK_50, en => en, sseg_out => digit(0));
   
   ROM_1: entity work.sseg_rom(sseg_rom_rtl)
   port map(addr => digit(0), data_out => HEX0);
   
   -- counter for 'tenth' digit
   counter_2: entity work.sseg_counter(sseg_counter_rtl)
   generic map(PLACE_VALUE => 10)
   port map(rst_n => KEY(0), clk => CLOCK_50, en => en, sseg_out => digit(1));
   
   ROM_2: entity work.sseg_rom(sseg_rom_rtl)
   port map(addr => digit(1), data_out => HEX1);
   
   -- counter for 'unit' digit
   counter_3: entity work.sseg_counter(sseg_counter_rtl)
   generic map(PLACE_VALUE => 100)
   port map(rst_n => KEY(0), clk => CLOCK_50, en => en, sseg_out => digit(2));
   
   ROM_3: entity work.sseg_rom(sseg_rom_rtl)
   port map(addr => digit(2), data_out => HEX2);
   
   -- counter for 'tens' digit
   counter_4: entity work.sseg_counter(sseg_counter_rtl)
   generic map(PLACE_VALUE => 1000)
   port map(rst_n => KEY(0), clk => CLOCK_50, en => en, sseg_out => digit(3));
   
   ROM_4: entity work.sseg_rom(sseg_rom_rtl)
   port map(addr => digit(3), data_out => HEX3);
end stopwatch_top_rtl;