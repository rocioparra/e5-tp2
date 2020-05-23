LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY uc2 IS 
    PORT
    (
		instruction	:  IN STD_LOGIC_VECTOR(13 downto 0);
		B_pre_ui1	:  IN STD_LOGIC_VECTOR(5 downto 0);
		T_pre_ui1	:  IN STD_LOGIC_VECTOR(6 downto 0);		
		C_pre_ui2	:  IN STD_LOGIC_VECTOR(5 downto 0);
		T_pre_ui2	:  IN STD_LOGIC_VECTOR(6 downto 0);
		C_pre_ui3	:  IN STD_LOGIC_VECTOR(5 downto 0);
		T_pre_ui3	:  IN STD_LOGIC_VECTOR(6 downto 0);
		C_out_ui3	:  IN STD_LOGIC_VECTOR(5 downto 0);
		T_out_ui3	:  IN STD_LOGIC_VECTOR(6 downto 0);
		sys_clk  	:  IN  STD_LOGIC;
		hold  		:  OUT  STD_LOGIC
    );
END uc2;

ARCHITECTURE behaviour OF uc2 IS    
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
				hold <= '0';
        end if;
    end process;

END behaviour;