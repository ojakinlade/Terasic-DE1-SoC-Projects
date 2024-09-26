library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity frame_counter is
   generic(HMAX: integer := 640;
           VMAX: integer := 480);
   Port(clk        : in std_logic;
        rst_n      : in std_logic;
        inc        : in std_logic;
        sync_clr   : in std_logic;
        h_count    : out std_logic_vector(10 downto 0);
        v_count    : out std_logic_vector(10 downto 0);
        frame_start: out std_logic;
        frame_end  : out std_logic);
end frame_counter;

architecture frame_counter_rtl of frame_counter is
   signal h_count_reg : unsigned(10 downto 0);
   signal h_count_next: unsigned(10 downto 0);
   signal v_count_reg : unsigned(10 downto 0);
   signal v_count_next: unsigned(10 downto 0);
begin
   registers: process(clk, rst_n)
   begin
      if rst_n = '0' then
         h_count_reg <= (others => '0');
         v_count_reg <= (others => '0');
      elsif rising_edge(clk) then
         if(sync_clr = '1') then
            h_count_reg <= (others => '0');
            v_count_reg <= (others => '0'); 
         else
            h_count_reg <= h_count_next;
            v_count_reg <= v_count_next;
         end if;
      end if;
   end process;
    
   -- next state logic of horizontal counter
   process(h_count_reg, inc)
   begin
      if(inc = '1') then
         if h_count_reg = (HMAX - 1) then
            h_count_next <= (others => '0');
         else
            h_count_next <= h_count_reg + 1;
         end if;
      else
         h_count_next <= h_count_reg;
      end if;
   end process;
    
   -- next state logic of vertical counter
   process(h_count_reg, v_count_reg, inc)
   begin
      if(inc = '1') and h_count_reg = (HMAX - 1) then
         if v_count_reg = (VMAX - 1) then
            v_count_next <= (others => '0');
         else
            v_count_next <= v_count_reg + 1;
         end if;
      else
         v_count_next <= v_count_reg;
      end if;
   end process;
    
   frame_start <= '1' when v_count_reg = 0 and h_count_reg = 0 else '0';
   frame_end <= '1' when v_count_reg = (VMAX - 1) and h_count_reg = (HMAX - 1) else '0';
    
   -- outputs
   h_count <= std_logic_vector(h_count_reg);
   v_count <= std_logic_vector(v_count_reg);
end frame_counter_rtl;
