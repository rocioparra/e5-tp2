LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY loadPC IS 
    PORT
    (
		W       	:  IN  STD_LOGIC_VECTOR(15 downto 0);
		Instr 	:  IN  STD_LOGIC_VECTOR(6 downto 0);
		carry_out 	:  IN  STD_LOGIC;
		load  	:  OUT  STD_LOGIC
    );
END loadPC;

ARCHITECTURE behaviour OF loadPC IS    
begin
	load <= '1' when 	(  (Instr(6 downto 4) = "100") 									or 	--Jump incondicional
                        (Instr(6 downto 4) = "101" and W="0000000000000000") 	or		--JZE
								(Instr(6 downto 4) = "110" and W(15) = '1') 				or		--JNE
								(Instr(6 downto 4) = "111" and carry_out = '1')) 		or		--JCY
								(Instr(6 downto 3) = "0111") 									or		--BSR
								(Instr(6 downto 0) = "0000011") 								else 	--RTI
				  '0';
END behaviour;