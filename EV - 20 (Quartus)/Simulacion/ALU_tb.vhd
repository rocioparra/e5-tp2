library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_tb is
end entity ALU_tb;


architecture testbench of ALU_tb is

	component ALU
	Port 
	( 
		a       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
		b       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
		ctrl        	:  IN  STD_LOGIC_VECTOR(3 downto 0);
		cy_in  			:  IN  STD_LOGIC;
		sys_clk  		:  IN  STD_LOGIC;
		cy_out  		:  OUT  STD_LOGIC;
		output    		:  OUT STD_LOGIC_VECTOR(15 downto 0)
     );
	end component;
	signal a,b,output: STD_LOGIC_VECTOR(15 downto 0);
	signal sys_clk,cy_in,cy_out: STD_LOGIC;
	signal ctrl: STD_LOGIC_VECTOR(3 downto 0);
	
	signal to_ctrl: STD_LOGIC_VECTOR(3 downto 0);
	signal simulationEnded 	: boolean := false;

begin
	dut: ALU port map (sys_clk => sys_clk, a=>a, b=>b, ctrl =>ctrl,cy_in=>cy_in,cy_out=>cy_out, output => output);
   -- Clock process definitions
	clock_process :process
	begin
		sys_clk <= '0';
		wait for 10 ns;
		sys_clk <= '1';
		wait for 10 ns;
		if simulationEnded then
			wait;
		end if;
	end process;

	stim_proc: process
	begin        
    	a <= "1111111111111111";
		b <= "1000000000000000";
		ctrl <= "0000";
		cy_in <= '1';
		for i in 0 to 15 loop
			wait until falling_edge(sys_clk);
			ctrl <= std_logic_vector(unsigned(ctrl)+1);
		end loop;
		simulationEnded <= true;
   		wait;
	end process;
end testbench;
