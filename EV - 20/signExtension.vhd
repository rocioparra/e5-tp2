LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY signExtension IS 
    PORT
    (
			input       :  IN  STD_LOGIC_VECTOR(10 downto 0);
			output    	:  OUT STD_LOGIC_VECTOR(10 downto 0):= "00000000000"
    );
END signExtension;

ARCHITECTURE behaviour OF signExtension IS    
begin
	output <= input(9) & input(9 downto 0);
END behaviour;