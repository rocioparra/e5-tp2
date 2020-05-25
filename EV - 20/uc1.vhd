LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY uc1 IS 
    PORT
    (
		M			:  IN STD_LOGIC_VECTOR(1 downto 0);
		B_in		:  IN STD_LOGIC_VECTOR(5 downto 0);
		T_in		:  IN STD_LOGIC_VECTOR(6 downto 0);
		C_in		:  IN STD_LOGIC_VECTOR(5 downto 0);
		hold  	:  IN  STD_LOGIC;
		sys_clk  :  IN  STD_LOGIC;
		MW			:  OUT  STD_LOGIC;
		MR			:  OUT  STD_LOGIC;
		T			:  OUT STD_LOGIC_VECTOR(6 downto 0);
		C			:  OUT STD_LOGIC_VECTOR(5 downto 0)
    );
END uc1;

ARCHITECTURE behaviour OF uc1 IS    
begin
	
	T <= T_in;
	C <= C_in;
	MW <= M(0);
	MR <= M(1);
	
    process(sys_clk)
    begin
        if(rising_edge(sys_clk) ) then
				if(hold = '0') then
					
				else
					T <= T_in;
					C <= "100010"; --35= HW_not_operate
				end if;
        end if;
    end process;

END behaviour;