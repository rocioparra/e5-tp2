LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY myMux IS 
    PORT
    (
		input       :  IN  STD_LOGIC_VECTOR(1 downto 0);
		sel		  	:  IN  STD_LOGIC;
		output 	 	:  OUT  STD_LOGIC
    );
END myMux;

ARCHITECTURE behaviour OF myMux IS    
begin
    output <= input(1) when sel='1' else input(0);

END behaviour;