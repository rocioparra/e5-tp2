LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY uI1 IS 
    PORT
    (
		uI_mem 		:  IN  STD_LOGIC_VECTOR(29 downto 0);
		instruction :  IN  STD_LOGIC_VECTOR(13 downto 0);
		sys_clk  	:  IN  STD_LOGIC;
		d_addr_in	:  IN  STD_LOGIC_VECTOR(9 downto 0);
		hold 		:  IN  STD_LOGIC;
		ALUC		:  OUT STD_LOGIC_VECTOR(3 downto 0):="1111";
		sh			:  OUT STD_LOGIC_VECTOR(1 downto 0):="00";
		KMx			:  OUT STD_LOGIC:='0';
		M			:  OUT STD_LOGIC_VECTOR(1 downto 0):="00";
		B			:  OUT STD_LOGIC_VECTOR(5 downto 0):="000000";
		T			:  OUT STD_LOGIC_VECTOR(6 downto 0):="0000000";
		C			:  OUT STD_LOGIC_VECTOR(5 downto 0):="100011";
		A			:  OUT STD_LOGIC_VECTOR(4 downto 0):="00000";
		Dadd		:  OUT STD_LOGIC_VECTOR(9 downto 0):="0000000000";
		I			:  OUT STD_LOGIC_VECTOR(1 downto 0):="00"
    );
END uI1;

ARCHITECTURE behaviour OF uI1 IS   
	
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk) and (hold = '0')) then
		   I 		<= uI_mem(29 downto 28);
			ALUC 	<= uI_mem(27 downto 24);
			SH 		<= uI_mem(23 downto 22);
			KMx 	<= uI_mem(21);
			M		<= uI_mem(20 downto 19);
			B		<= uI_mem(18 downto 13);
			T		<= uI_mem(6 downto 0); --últimos bits en la rom
			if(instruction(13 downto 10) = "0010") then
				C 	<= instruction(10 downto 5);
			elsif(instruction(13 downto 10) = "0011") then --para estos casos el primer uno no era válido
				C 	<= '0' & instruction(9 downto 5);
			elsif(instruction(13 downto 10) = "0110") then --Contemplando el caso de ADW
				C 	<= instruction(10 downto 5);
			else
				C	<= uI_mem(12 downto 7);
			end if;
			A 		<= instruction(4 downto 0);
			Dadd 	<= d_addr_in;
        end if;
    end process;

END behaviour;