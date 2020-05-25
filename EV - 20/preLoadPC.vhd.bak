LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY preLoadPC IS 
    PORT
    (
		W       	:  IN  STD_LOGIC_VECTOR(15 downto 0);
		b13,b12,b11 :  IN  STD_LOGIC;
		carry_out 	:  IN  STD_LOGIC;
		sys_clk  	:  IN  STD_LOGIC;
		preLoad  	:  OUT  STD_LOGIC
    );
END preLoadPC;

ARCHITECTURE behaviour OF preLoadPC IS    
begin
	process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
			if( b13 = '1') then --Todas las señales de jump tienen b13 en 1.
				if( b11 = '0' and b12 = '0') then --En este caso se trata de un salto incondicional
					preLoad <= '1';
				elsif ( b11 = '0' and b12 = '1') then --JZE
					if(W   = "0000000000000000") then
						preLoad <= '1';
					else
						preLoad <= '0';
					end if;
				elsif ( b11 = '1' and b12 = '0') then --JNE
					if(W(15)   = '1') then
						preLoad <= '1';
					else
						preLoad <= '0';
					end if;
				elsif ( b11 = '1' and b12 = '1') then --JCY
					if(carry_out = '1') then
						preLoad <= '1';
					else
						preLoad <= '0';
					end if;
				end if;
			else
				preLoad <='0';
			end if;
        end if;
    end process;

END behaviour;