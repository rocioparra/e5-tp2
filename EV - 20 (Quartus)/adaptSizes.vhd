LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY adaptSizes IS 
    PORT
    (
	 Curr_addr_in   :  IN  STD_LOGIC_VECTOR(10 downto 0);
			TOS_in    		:  IN  STD_LOGIC_VECTOR(2 downto 0);
			SP_in    		:  IN  STD_LOGIC_VECTOR(2 downto 0);
			
			Curr_addr	   :  OUT  STD_LOGIC_VECTOR(15 downto 0);
			TOS	    		:  OUT  STD_LOGIC_VECTOR(3 downto 0);
			SP		    		:  OUT  STD_LOGIC_VECTOR(3 downto 0)
			
    );
END adaptSizes;

ARCHITECTURE behaviour OF adaptSizes IS    
begin
	TOS <= '0' & TOS_in;
	SP <= '0' & SP_in;
	Curr_addr <= "00000" & Curr_addr_in;
END behaviour;