library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sseg_rom is
  port(addr: in std_logic_vector(3 downto 0);
       data_out: out std_logic_vector(6 downto 0));
end sseg_rom;

architecture sseg_rom_rtl of sseg_rom is
   type rom_type is array(0 to 9) of std_logic_vector(6 downto 0);
   ------------------------------"6543210"
   signal rom: rom_type := (0 => "1111001",-- I
                            1 => "0101011",-- n 
                            2 => "0000111",-- t
                            3 => "0000110",-- E
                            4 => "1000111",-- L
                            5 => "1111111",-- 
                            6 => "0001110",-- F
                            7 => "0001100",-- P
                            8 => "1000010",-- G
                            9 => "0001000" -- A
                           );
begin
   data_out <= rom(to_integer(unsigned(addr)));
end sseg_rom_rtl;
