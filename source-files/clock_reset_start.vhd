use std.textio.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity clock_reset_start is
  port (
    start  : out   std_logic := '0';
    reset  : out   std_logic := '0';
    clock  : inout std_logic := '0'
    );
end clock_reset_start;


architecture rtl of clock_reset_start is

  constant Period : time := 400 ns;

begin

  reset_gen : process
  begin
    reset <= '1' after Period/4, '0' after (Period * 3)/4;
    start <=  '1' after (Period * 5)/4, '0' after (Period * 7)/4;
    wait;
  end process reset_gen;

  clock_generator : process(clock)
  begin
    clock <= not clock after Period/2;
  end process;

end rtl;