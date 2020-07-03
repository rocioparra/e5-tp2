LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY PCReg IS 
    PORT
    (
		input       :  IN  STD_LOGIC_VECTOR(10 downto 0);
		pre_load  	:  IN  STD_LOGIC;
		hold  		:  IN  STD_LOGIC;
		sys_clk  	:  IN  STD_LOGIC;
		PC    		:	  OUT STD_LOGIC_VECTOR(10 downto 0)
    );
END PCReg;

ARCHITECTURE behaviour OF PCReg IS    
	SIGNAL auxPC	: STD_LOGIC_VECTOR (10 DOWNTO 0) := "00000000000";
begin
	PC <=auxPC;
    process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
			if (pre_load='1') then
				auxPC <= input;
			elsif (hold = '0') then
				auxPC <= std_logic_vector(unsigned(auxPC)+1);
			end if;
        end if;
    end process;

END behaviour;