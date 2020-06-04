LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY ALU IS 
    PORT
    (
			a       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
			b       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
			ctrl        :  IN  STD_LOGIC_VECTOR(3 downto 0);
			cy_in  		:  IN  STD_LOGIC;
			cy_out  		:  OUT  STD_LOGIC := '0';
			output    	:  OUT STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000"
    );
END ALU;

ARCHITECTURE behaviour OF ALU IS    
	signal out_aux : std_logic_vector(16 downto 0);	
begin
    output    <= out_aux(15 downto 0); 
	cy_out 	  <= out_aux(16); 
	out_aux <= 	'0' & a 						when ctrl = "0000" else
				'0' & b 						when ctrl = "0001" else 
				'0' & (not a) 					when ctrl = "0010" else 
				'0' & (not b) 					when ctrl = "0011" else 
				('0' & a) + ('0' & b) 			when ctrl = "0100" else 
				('0' & a) + ('0' & b) + cy_in 	when ctrl = "0101" else 
				'0' & (a or b) 					when ctrl = "0110" else 
				'0' & (a and b) 				when ctrl = "0111" else 
				"00000000000000000" 			when ctrl = "1000" else 
				"00000000000000001"  			when ctrl = "1001" else 
				"01111111111111111" 	 		when ctrl = "1010" else 
				"00000000000000000"  			when ctrl = "1011" else 
				"10000000000000000"  			when ctrl = "1100" else 
				"10000000000000000"  			when (unsigned(ctrl) > 12) and cy_in='1' else 
				"00000000000000000";

END behaviour;