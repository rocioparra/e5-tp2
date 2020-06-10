LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY KMux IS 
    PORT
    (
			X       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
			Y       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
			sel  			:  IN  STD_LOGIC;
			output    	:  OUT STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000"
    );
END KMux;


ARCHITECTURE behaviour OF KMux IS   

begin

	output <= X when (sel='0') else Y;


END behaviour;