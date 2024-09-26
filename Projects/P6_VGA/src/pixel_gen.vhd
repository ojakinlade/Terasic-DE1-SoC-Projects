library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pixel_gen is
   port(h_count: in std_logic_vector(10 downto 0);
        v_count: in std_logic_vector(10 downto 0);
        rgb    : out std_logic_vector(11 downto 0));
end pixel_gen;

architecture pixel_gen_rtl of pixel_gen is
   signal x, y   : unsigned(10 downto 0);
   signal r, g, b: std_logic_vector(3 downto 0);
begin
   x <= unsigned(h_count);
   y <= unsigned(v_count);

   process(x, y)
   begin
      if y < 360 then
         if x < 80 then     -- White
            r <= "1111";
            g <= "1111";
            b <= "1111";
         elsif x < 160 then -- Yellow
            r <= "1111";
            g <= "1111";
            b <= "0000";
         elsif x < 240 then -- Cyan
            r <= "0000";
            g <= "1111";
            b <= "1111";
         elsif x < 320 then -- Green
            r <= "0000";
            g <= "1111";
            b <= "0000";
         elsif x < 400 then -- Magneta
            r <= "1111";
            g <= "0000";
            b <= "1111"; 
         elsif x < 480 then -- Red
            r <= "1111";
            g <= "0000";
            b <= "0000"; 
         elsif x < 560 then -- Blue
            r <= "0000";
            g <= "0000";
            b <= "1111"; 
         else               -- Black 
            r <= "0000";
            g <= "0000";
            b <= "0000";    
         end if;
     else
         if x < 120 or x > 200 then -- black
            r <= "0000";
            g <= "0000";
            b <= "0000";    
         else                        -- white
            r <= "1111";
            g <= "1111";
            b <= "1111";
         end if;    
     end if;   
   end process;

   rgb <= std_logic_vector(r & g & b);
end pixel_gen_rtl;
