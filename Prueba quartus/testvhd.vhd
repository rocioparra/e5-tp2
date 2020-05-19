LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY TEST IS 
    PORT
    (
        input       :  IN STD_LOGIC;
	sys_clk     :  IN STD_LOGIC;

        -- Señales para el CONV
        output    :  OUT  STD_LOGIC
    );
END TEST;

ARCHITECTURE behaviour OF TEST IS    
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
            output <= input;
        end if;
    end process;

END behaviour;