LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY uc1 IS 
    PORT
    (
		ALU_in	:  IN STD_LOGIC_VECTOR(3 downto 0);
		M			:  IN STD_LOGIC_VECTOR(1 downto 0);
		B_in		:  IN STD_LOGIC_VECTOR(5 downto 0);
		T_in		:  IN STD_LOGIC_VECTOR(6 downto 0);
		C_in		:  IN STD_LOGIC_VECTOR(5 downto 0);
		hold  	:  IN  STD_LOGIC;
		sys_clk  :  IN  STD_LOGIC;
		MW			:  OUT  STD_LOGIC;
		MR			:  OUT  STD_LOGIC;
		ALU_Out	:  OUT STD_LOGIC_VECTOR(3 downto 0);
		T			:  OUT STD_LOGIC_VECTOR(6 downto 0);
		C			:  OUT STD_LOGIC_VECTOR(5 downto 0)
    );
END uc1;

ARCHITECTURE behaviour OF uc1 IS    
begin
	
	T <= T_in when hold ='0' else "0000000";
	C <= C_in when hold ='0' else "100011";
	ALU_out <= ALU_in when hold ='0' else "1111"; --NOP
	MW <= M(0) when hold = '0' else '0'; 
	MR <= M(1) when hold = '0' else '0';
	

END behaviour;