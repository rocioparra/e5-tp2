LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY ALU IS 
    PORT
    (
		sys_clk :  IN  STD_LOGIC;
		preLoad :  IN  STD_LOGIC;
		hold :  IN  STD_LOGIC;
		addrIn :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		addrOut :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0):="00000000000"
    );
END ALU;

ARCHITECTURE behaviour OF ALU IS    
	signal ffOut,addrAux : std_logic_vector(10 downto 0):="00000000000";	
begin
    addrOut<= addrAux;
	addrAux <= 	ffOut 									when hold = '1' else
				std_logic_vector(unsigned(ffOut)+1) 	when preLoad = '0' and hold = '0' else 
				addrIn;
	process(sys_clk)
	begin
		if(rising_edge(sys_clk)) then 
			ffOut <= addrAux;
		end if;
	end process;

END behaviour;