LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY uI2 IS 
    PORT
    (
		ALUC_in		:  IN STD_LOGIC_VECTOR(3 downto 0);
		sh_in		:  IN STD_LOGIC_VECTOR(1 downto 0);
		T_in		:  IN STD_LOGIC_VECTOR(6 downto 0);
		C_in		:  IN STD_LOGIC_VECTOR(5 downto 0);
		sys_clk  	:  IN  STD_LOGIC;
		ALUC		:  OUT STD_LOGIC_VECTOR(3 downto 0):="1111";
		sh			:  OUT STD_LOGIC_VECTOR(1 downto 0):="00";
		T			:  OUT STD_LOGIC_VECTOR(6 downto 0):="0000000";
		C			:  OUT STD_LOGIC_VECTOR(5 downto 0):="100011"
    );
END uI2;

ARCHITECTURE behaviour OF uI2 IS    
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
			ALUC <= ALUC_in;
			sh <= sh_in;
			T <= T_in;
			C <= C_in;
        end if;
    end process;

END behaviour;