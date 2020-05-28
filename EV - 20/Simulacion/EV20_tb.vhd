library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity EV20_tb is
end entity EV20_tb;


ARCHITECTURE testbench OF EV20_tb IS 
	component EV20
	PORT
	(
		sys_clk :  IN  STD_LOGIC
	);
	end component;
	signal sys_clk: STD_LOGIC;
	
begin
	ev20Block: EV20 port map (sys_clk => sys_clk);
	clock_process :process
	begin
		sys_clk <= '1';
		wait for 10 ps;
		sys_clk <= '0';
		wait for 10 ps;
	end process;
	
end testbench;
