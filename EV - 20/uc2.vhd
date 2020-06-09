LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY uc2 IS 
    PORT
    (
		T1				:  IN STD_LOGIC_VECTOR(6 downto 0);	
		A2				:  IN STD_LOGIC_VECTOR(4 downto 0);
		B2				:  IN STD_LOGIC_VECTOR(5 downto 0);
		T2				:  IN STD_LOGIC_VECTOR(6 downto 0);		
		C3				:  IN STD_LOGIC_VECTOR(5 downto 0);
		T3				:  IN STD_LOGIC_VECTOR(6 downto 0);
		C4				:  IN STD_LOGIC_VECTOR(5 downto 0);
		T4				:	IN STD_LOGIC_VECTOR(6 downto 0);
		C5				:  IN STD_LOGIC_VECTOR(5 downto 0);
		T5				:  IN STD_LOGIC_VECTOR(6 downto 0);
		MR  			:  IN  STD_LOGIC;
		I				:  IN STD_LOGIC_VECTOR(1 downto 0);
		hold_jump  	:  OUT  STD_LOGIC;
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
	signal conflict : STD_LOGIC;	
begin
    hold <= '1' when((T2(WR) and (T4(WW) or T5(WW)))='1' 	or
					 
					 (MR and (T4(WW) or T5(WW)))='1' 	or
					 
					 (T2(RR)='1' and T4(RW)='1' and ((A2=C4(4 downto 0)) or (B2=C4)) ) 	or
					 
					 (T2(RR)='1' and T5(RW)='1' and ((A2=C5(4 downto 0)) or (B2=C5)) ) ) or
				
					 (I(1)='1' and ( (I(0)='1' and (C4="000001" OR C5="000001")) or (I(0)='0' and (C4="000000" OR C5="000000")) ))  else 	
					 
		    '0';
	conflict <= (T1(CR) and (T2(CW) or T4(CW) or T5(CW))) or (T1(WR) and (T2(WW) or T4(WW) or T5(WW)));
	hold_jump <= T1(J) and conflict;
			 
END behaviour;