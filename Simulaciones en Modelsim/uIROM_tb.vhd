library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uIROM_tb is
end entity uIROM_tb;


architecture testbench of uIROM_tb is
	component uIROM
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (27 DOWNTO 0)
	);
	end component;
	signal address: STD_LOGIC_VECTOR (6 DOWNTO 0);
	signal sys_clk: STD_LOGIC;
	signal q: STD_LOGIC_VECTOR (27 DOWNTO 0);
	signal simulationEnded 	: boolean := false;
begin
	dut: uIROM port map (clock => sys_clk, q=>q, address=>address);
   -- Clock process definitions
	clock_process :process
	begin
		sys_clk <= '0';
		wait for 1 ns;
		sys_clk <= '1';
		wait for 1 ns;
		if simulationEnded then
			wait;
		end if;
	end process;

	stim_proc: process
	begin        
    	address <= "0000000";
		for i in 0 to 127 loop
			wait until falling_edge(sys_clk);
			address <= std_logic_vector(unsigned(address)+1);
		end loop;
		simulationEnded <= true;
   		wait;
	end process;
	
END testbench;