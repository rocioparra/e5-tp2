LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY shifter IS 
    PORT
    (
			input       :  IN  STD_LOGIC_VECTOR(15 downto 0);
			ctrl        :  IN  STD_LOGIC_VECTOR(1 downto 0);
			output    	:  OUT STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000"
    );
END shifter;

ARCHITECTURE behaviour OF shifter IS    
begin
	output <= 	std_logic_vector(shift_right(unsigned(input), 1)) when ctrl ="01" else
				std_logic_vector(shift_left(unsigned(input), 1)) when ctrl = "10" else 
				input;

END behaviour;