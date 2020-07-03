LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY LatchK IS 
    PORT
    (
		input       :  IN  STD_LOGIC_VECTOR(15 downto 0);
		sys_clk  	:  IN  STD_LOGIC;
		hold  		:  IN  STD_LOGIC;
		output    	:  OUT STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000"
    );
END LatchK;

ARCHITECTURE behaviour OF LatchK IS    
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
				if( hold = '0') then
					output <= input;
				end if;
        end if;
    end process;

END behaviour;