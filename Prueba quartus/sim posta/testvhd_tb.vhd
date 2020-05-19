library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;


entity test_tb is
end entity test_tb;


architecture testbench of test_tb is

	component TEST
	Port 
	( 
		sys_clk: in STD_LOGIC; -- 
          	input: in STD_LOGIC; --  
          	output: out STD_LOGIC -- 
     	);
	end component;
	signal input,sys_clk,output: STD_LOGIC;

	signal simulationEnded 	: boolean := false;
begin
	dut: TEST port map (sys_clk => sys_clk, input=>input, output => output);
   -- Clock process definitions
	clock_process :process
	begin
     		sys_clk <= '0';
     		wait for 10 ns;
     		sys_clk <= '1';
     		wait for 10 ns;
		sys_clk <= '0';
     		wait for 10 ns;
     		sys_clk <= '1';
     		wait for 10 ns;
		wait;
	end process;

	stim_proc: process
	begin        
    		input <= '1';
   		wait for 15 ns;    
    		input <= '0';
   		wait;
	end process;
end testbench;