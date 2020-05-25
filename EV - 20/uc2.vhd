LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY uc2 IS 
    PORT
    (
		A2				:  IN STD_LOGIC_VECTOR(4 downto 0);
		B2				:  IN STD_LOGIC_VECTOR(5 downto 0);
		T2				:  IN STD_LOGIC_VECTOR(6 downto 0);		
		C3				:  IN STD_LOGIC_VECTOR(5 downto 0);
		T3				:  IN STD_LOGIC_VECTOR(6 downto 0);
		C4				:  IN STD_LOGIC_VECTOR(5 downto 0);
		T4				:	IN STD_LOGIC_VECTOR(6 downto 0);
		C5				:  IN STD_LOGIC_VECTOR(5 downto 0);
		T5				:  IN STD_LOGIC_VECTOR(6 downto 0);
		hold  		:  OUT  STD_LOGIC
    );
END uc2;

ARCHITECTURE behaviour OF uc2 IS    
begin
    hold <= '0';

END behaviour;