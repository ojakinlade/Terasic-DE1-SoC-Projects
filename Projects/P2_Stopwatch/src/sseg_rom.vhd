library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sseg_rom is
  port(addr: in std_logic_vector(3 downto 0);
       data_out: out std_logic_vector(6 downto 0));
end sseg_rom;

architecture sseg_rom_rtl of sseg_rom is
   type rom_type is array(0 to 15) of std_logic_vector(6 downto 0);
   ------------------------------"6543210"
   signal rom: rom_type := (0 => "1000000",
                            1 => "1111001",
                            2 => "0100100",
                            3 => "0110000",
                            4 => "0011001",
                            5 => "0010010",
                            6 => "0000010",
                            7 => "1111000",
                            8 => "0000000",
                            9 => "0010000",
                            10 => "0001000",
                            11 => "0000011",
                            12 => "1000110",
                            13 => "0100001",
                            14 => "0000110",
                            15 => "0001110");
begin
   data_out <= rom(to_integer(unsigned(addr)));
end sseg_rom_rtl;
