LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY XYMux IS 
    PORT
    (
			X       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
			Y       		:  IN  STD_LOGIC_VECTOR(7 downto 0);
			sel  			:  IN  STD_LOGIC;
			output    	:  OUT STD_LOGIC_VECTOR(15 downto 0)
    );
END XYMux;


ARCHITECTURE behaviour OF XYMux IS   

begin

	output <= X when (sel='1') else std_logic_vector(resize(unsigned(Y),output'length));


END behaviour;