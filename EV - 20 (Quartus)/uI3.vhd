LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY uI3 IS 
    PORT
    (
		T_in		:  IN STD_LOGIC_VECTOR(6 downto 0);
		C_in		:  IN STD_LOGIC_VECTOR(5 downto 0);
		sys_clk  	:  IN  STD_LOGIC;
		T			:  OUT STD_LOGIC_VECTOR(6 downto 0):="0000000";
		C			:  OUT STD_LOGIC_VECTOR(5 downto 0):="100011"
    );
END uI3;

ARCHITECTURE behaviour OF uI3 IS    
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
			T <= T_in;
			C <= C_in;
        end if;
    end process;

END behaviour;