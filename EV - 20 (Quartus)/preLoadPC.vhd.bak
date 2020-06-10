LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY preLoadPC IS 
    PORT
    (
		W       	:  IN  STD_LOGIC_VECTOR(15 downto 0);
		Instr 	:  IN  STD_LOGIC_VECTOR(2 downto 0);
		carry_out 	:  IN  STD_LOGIC;
		preLoad  	:  OUT  STD_LOGIC
    );
END preLoadPC;

ARCHITECTURE behaviour OF preLoadPC IS    
begin
	preLoad <= '1' when 	((Instr = "100") 									or 	--Jump incondicional
                        (Instr = "101" and W="0000000000000000") 	or		--JZE
								(Instr = "110" and W(15) = '1') 				or		--JNE
								(Instr = "111" and carry_out = '1')) 		else 	--JCY
				  '0';
END behaviour;