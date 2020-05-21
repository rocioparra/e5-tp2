LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY InstrReg IS 
    PORT
    (
		from_mem    :  IN  STD_LOGIC_VECTOR(13 downto 0);
		hold  		:  IN  STD_LOGIC;
		sys_clk  	:  IN  STD_LOGIC;
		instrOut	:  OUT STD_LOGIC_VECTOR(13 downto 0)
    );
END InstrReg;

ARCHITECTURE behaviour OF InstrReg IS   
	
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk) and (hold = '0')) then
			instrOut<=from_mem;
        end if;
    end process;

END behaviour;