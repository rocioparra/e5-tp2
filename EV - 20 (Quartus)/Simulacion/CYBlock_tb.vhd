library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cyblock_tb is
end entity cyblock_tb;


architecture testbench of cyblock_tb is

	component cyblock
	PORT
	(
		carry_out :  IN  STD_LOGIC;
		sys_clk :  IN  STD_LOGIC;
		ALU_C :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		carry_in :  OUT  STD_LOGIC
	);
	end component;
	signal alu_c: STD_LOGIC_VECTOR(3 downto 0);
	signal sys_clk, carry_out: STD_LOGIC;
begin
	dut: cyblock port map (sys_clk=>sys_clk, carry_out=>carry_out, ALU_C=>ALU_C);
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

	set_carry: process
	begin        
    		alu_c <= "1100";
		carry_out <= '0';
		wait until falling_edge(sys_clk);   
    		
		alu_c <= "1011";
		carry_out <= '1';
		wait until falling_edge(sys_clk);  

   		wait;
	end process;
end testbench;
