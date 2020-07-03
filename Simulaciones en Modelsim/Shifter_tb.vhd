library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter_tb is
end entity shifter_tb;


architecture testbench of shifter_tb is

	component shifter
	Port 
	( 
			sys_clk: in STD_LOGIC; -- 
          	input: in STD_LOGIC_VECTOR(15 downto 0); --  
			ctrl: in STD_LOGIC_VECTOR(1 downto 0); --  
          	output: out STD_LOGIC_VECTOR(15 downto 0) -- 
     	);
	end component;
	signal input,output: STD_LOGIC_VECTOR(15 downto 0);
	signal sys_clk: STD_LOGIC;
	signal ctrl: STD_LOGIC_VECTOR(1 downto 0);
	

begin
	dut: shifter port map (sys_clk => sys_clk, input=>input, ctrl =>ctrl, output => output);
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
    		input <= "0000000000000010";
			ctrl <= "00";
			wait for 20 ns;    
    		ctrl <= "01";
			wait for 20 ns;    
			ctrl <= "10";
			wait for 20 ns;    
			ctrl <= "11";
			wait for 20 ns;    
   		wait;
	end process;
end testbench;
