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
		M_read	:  IN  STD_LOGIC; -- 1 cuando se trae de memoria al registro
		To_W	:  IN  STD_LOGIC_VECTOR(15 downto 0); -- El dato de memoria que trae
		To_A  	:  OUT  STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000";
		To_B  	:  OUT  STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000";
		W    	:  OUT STD_LOGIC_VECTOR(15 downto 0)
    );
END RegisterBank;


ARCHITECTURE behaviour OF RegisterBank IS   
	type t_Memory is array (0 to 34) of std_logic_vector(15 downto 0);
	signal reg_map : t_Memory := (others=>(others=>'0'));
begin
	W  <= reg_map(34);
	To_A <= reg_map(to_integer(unsigned(A))) when to_integer(unsigned(A))<35 else "0000000000000000";
	To_B <= reg_map(to_integer(unsigned(B))) when to_integer(unsigned(B))<35 else "0000000000000000";
	process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
			if (M_read = '1') then
				reg_map(34) <= To_W;
			elsif( to_integer(unsigned(C)) < 35 ) then
				reg_map(to_integer(unsigned(C))) <= From_C;
			end if;
				--if((M_read = '1') and (to_integer(unsigned(C)) /= 34)) then --Esto hay que verificarlo: Para escribir desde memoria y c al mismo tiempo a registros
				--	reg_map(to_integer(unsigned(C))) <= From_C;
				--end if;
			--end if;	
		end if;
	end process;

END behaviour;