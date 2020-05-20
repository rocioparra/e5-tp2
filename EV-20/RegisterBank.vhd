LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY RegisterBank IS 
    PORT
    (
		A		:  IN  STD_LOGIC_VECTOR(4 downto 0);
		B		:  IN  STD_LOGIC_VECTOR(5 downto 0);
		C		:  IN  STD_LOGIC_VECTOR(5 downto 0);
		From_C  :  IN  STD_LOGIC_VECTOR(15 downto 0);
		sys_clk	:  IN  STD_LOGIC;
		To_A  	:  OUT  STD_LOGIC_VECTOR(15 downto 0);
		To_B  	:  OUT  STD_LOGIC_VECTOR(15 downto 0);
		W    	:  OUT STD_LOGIC_VECTOR(15 downto 0)
    );
END RegisterBank;


ARCHITECTURE behaviour OF RegisterBank IS   
	type t_Memory is array (0 to 34) of std_logic_vector(15 downto 0);
	signal reg_map : t_Memory;
begin
	W  <= reg_map(34);
	process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
			if( to_integer(unsigned(C)) < 35 ) then
				reg_map(to_integer(unsigned(C))) <= From_C;
			end if;	
			To_A <= reg_map(to_integer(unsigned(A)));
			To_B <= reg_map(to_integer(unsigned(B)));
		end if;
	end process;

END behaviour;