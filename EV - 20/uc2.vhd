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
	constant WR : integer := 0;
	constant WW : integer := 1;
	constant RR : integer := 2;
	constant RW : integer := 3;
	constant CR : integer := 4;
	constant CW : integer := 5;
	constant J  : integer := 6;
begin
    hold <= '1' when((T3(CR) and (T4(CW) or T5(CW)))='1'	or	
	
					 (T3(WR) and (T4(WW) or T5(WW)))='1' 	or
					 
					 (T3(RR)='1' and T4(RW)='1' and ((A2=C4(4 downto 0)) or (B2=C4)) ) 	or
					 
					 (T3(RR)='1' and T5(RW)='1' and ((A2=C5(4 downto 0)) or (B2=C5)) ) ) 		else 	
		    '0';

END behaviour;