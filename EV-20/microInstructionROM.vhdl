LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY ALU IS 
    PORT
    (
		instruction	:  IN  STD_LOGIC_VECTOR(13 downto 0);
		sys_clk		:  IN  STD_LOGIC;
		micro_instr	:  OUT STD_LOGIC_VECTOR(31 downto 0)
    );
END ALU;

ARCHITECTURE behaviour OF ALU IS  
	signal B_bus, C_bus, tipo: std_logic_vector(5 downto 0);  
	signal A_bus: std_logic_vector(4 downto 0); 
	signal aluc : std_logic_vector(3 downto 0);
	signal sh : std_logic_vector(1 downto 0);
	signal KMx,MR,MW : std_logic;
	
begin
	micro_instr(31 downto 28) <=aluc;
	micro_instr(27 downto 26) <=sh;
	micro_instr(25) <=KMx;
	micro_instr(24) <=MR;
	micro_instr(23) <=MW;
	micro_instr(22 downto 17) <= B_bus;
	micro_instr(16 downto 11) <= C_bus;
	micro_instr(10 downto 5) <= tipo;
	micro_instr(4 downto 0) <= A_bus;
	sh <= '0';
	process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
			MW = '1' when (instruction(13 downto 10) = "0100") else '0';
			MR = '1' when (instruction(13 downto 10) = "0101") else '0';
			KMx = '1' when (instruction(13 downto 10) = "0001") else '0';
        end if;
    end process;

END behaviour;