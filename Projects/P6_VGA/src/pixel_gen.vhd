library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pixel_gen is
   port(pixel_x: in std_logic_vector(9 downto 0);
        pixel_y: in std_logic_vector(9 downto 0);
        rgb_out    : out std_logic_vector(23 downto 0));
end pixel_gen;

architecture pixel_gen_rtl of pixel_gen is
   signal x, y   : unsigned(9 downto 0);
   signal r, g, b: std_logic_vector(7 downto 0);
begin
   x <= unsigned(pixel_x);
   y <= unsigned(pixel_y);

   process(x, y)
   begin
      if y < 360 then
         if x < 90 then     -- White
            r <= x"ff";
            g <= x"ff";
            b <= x"ff";
         elsif x < 180 then -- Yellow
            r <= x"ff";
            g <= x"ff";
            b <= x"00";
         elsif x < 270 then -- Cyan
            r <= x"00";
            g <= x"ff";
            b <= x"ff";
         elsif x < 360 then -- Green
            r <= x"00";
            g <= x"ff";
            b <= x"00";
         elsif x < 450 then -- Magneta
            r <= x"ff";
            g <= x"00";
            b <= x"ff"; 
         elsif x < 540 then -- Red
            r <= x"ff";
            g <= x"00";
            b <= x"00"; 
         elsif x < 640 then -- Blue
            r <= x"00";
            g <= x"00";
            b <= x"ff";  
         else
            r <= x"00";
            g <= x"00";
            b <= x"00";
         end if;
      elsif y < 480 then
         if x < 135 or x > 225 then -- black
            r <= x"00";
            g <= x"00";
            b <= x"00";    
         else      -- white
            r <= x"ff";
            g <= x"ff";
            b <= x"ff";
         end if; 
      else
         r <= x"00";
         g <= x"00";
         b <= x"00"; 
     end if;   
   end process;

   rgb_out <= std_logic_vector(r & g & b);
end pixel_gen_rtl;
