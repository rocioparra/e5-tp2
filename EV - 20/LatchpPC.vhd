LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY LatchpPC IS 
    PORT
    (
		input       :  IN  STD_LOGIC_VECTOR(10 downto 0);
		sys_clk  	:  IN  STD_LOGIC;
		output    	:  OUT STD_LOGIC_VECTOR(10 downto 0):= "00000000000"
    );
END LatchpPC;

ARCHITECTURE behaviour OF LatchpPC IS    
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
					output <= input;
        end if;
    end process;

END behaviour;