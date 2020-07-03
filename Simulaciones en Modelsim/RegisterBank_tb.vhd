library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterBank_tb is
end entity RegisterBank_tb;


architecture testbench of RegisterBank_tb is

	component RegisterBank
	PORT
    (
		A		:  IN  STD_LOGIC_VECTOR(4 downto 0);
		B		:  IN  STD_LOGIC_VECTOR(5 downto 0);
		C		:  IN  STD_LOGIC_VECTOR(5 downto 0);
		From_C  :  IN  STD_LOGIC_VECTOR(15 downto 0);
		sys_clk	:  IN  STD_LOGIC;
		To_A  	:  OUT  STD_LOGIC_VECTOR(15 downto 0);
		To_B  	:  OUT  STD_LOGIC_VECTOR(15 downto 0);
		W    	:  OUT STD_LOGIC_VECTOR(15 downto 0)
    );
	end component;
	signal W,To_A,To_B,From_C: STD_LOGIC_VECTOR(15 downto 0);
	signal C,B: STD_LOGIC_VECTOR(5 downto 0);
	signal A: STD_LOGIC_VECTOR(4 downto 0);
	signal sys_clk: STD_LOGIC;
	signal simulationEnded 	: boolean := false;

begin
	dut: RegisterBank port map (sys_clk => sys_clk, A=>A, B=>B, C=>C, From_C =>From_C, To_A=>To_A, To_B => To_B, W=>W);
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
    	from_C <= "0000000010000000";
		B <= "000000";
		A <= "00000";
		C <= "000000";
		for i in 0 to 35 loop
			wait until falling_edge(sys_clk);
			C <= std_logic_vector(unsigned(C)+1);
			if i > 4 then
				A <= std_logic_vector(unsigned(A)+1);
				B <= std_logic_vector(unsigned(B)+1);
			end if; 
		end loop;
		simulationEnded <= true;
   		wait;
	end process;
	
END testbench;