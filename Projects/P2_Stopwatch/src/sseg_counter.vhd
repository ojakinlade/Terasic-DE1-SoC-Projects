library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sseg_counter is
   generic(PLACE_VALUE: integer := 1);
   port(clk: in std_logic;
        rst_n: in std_logic;
        en: in std_logic;
        sseg_out: out std_logic_vector(3 downto 0));
end sseg_counter;

architecture sseg_counter_rtl of sseg_counter is
   signal ticks: unsigned(26 downto 0);
   signal digit: unsigned(3 downto 0);
   signal clk_out: std_logic;
   Signal locked: std_logic;
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
   port map(refclk => clk, rst => not rst_n, 
            outclk_0 => clk_out, locked => locked);
   
   sseg_out <= std_logic_vector(digit);
   
   process(clk_out, rst_n)
   begin
      if rst_n = '0' then
         ticks <= (others => '0');
         digit <= (others => '0');
      elsif rising_edge(clk_out) then
         if en = '1' then
            if ticks = to_unsigned(PLACE_VALUE * 100000 - 1,ticks'length) then
               ticks <= (others => '0');
               if digit = to_unsigned(9,digit'length) then
                  digit <= (others => '0');
               else
                  digit <= digit + 1;
               end if;
            else
               ticks <= ticks + 1;
            end if;
         end if;
      end if;
   end process;
end sseg_counter_rtl;