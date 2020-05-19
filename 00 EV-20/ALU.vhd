LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY ALU IS 
    PORT
    (
			a       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
			b       		:  IN  STD_LOGIC_VECTOR(15 downto 0);
			ctrl        :  IN  STD_LOGIC_VECTOR(3 downto 0);
			cy_in  		:  IN  STD_LOGIC;
			sys_clk  	:  IN  STD_LOGIC;
			cy_out  		:  OUT  STD_LOGIC;
			output    	:  OUT STD_LOGIC_VECTOR(15 downto 0)
    );
END ALU;

ARCHITECTURE behaviour OF ALU IS    
	signal out_aux : std_logic_vector(16 downto 0);	
begin
    output    <= out_aux(15 downto 0); 
	cy_out 	  <= out_aux(16); 
	process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
				case ctrl is
					when "0000" =>
						out_aux <= '0' & a;
					when "0001" =>
						out_aux <= '0' & b;
					when "0010" =>
						out_aux <= '0' & (not a);
					when "0011" =>
						out_aux <= '0' & (not b);
					when "0100" =>
						out_aux <= ('0' & a) + ('0' & b);
					when "0101" =>
						out_aux	<= ('0' & a) + ('0' & b) + cy_in;
					when "0110" =>
						out_aux <= '0' & (a or b);
					when "0111" =>
						out_aux <= '0' & (a and b);
					when "1000" =>
						out_aux <= "00000000000000000";
					when "1001" =>
						out_aux <= "00000000000000001";
					when "1010" =>
						out_aux <= "11111111111111111";
					when "1011" =>
						out_aux(16) <= '0';
					when "1100" =>
						out_aux(16) <= '1';
					when others =>
				end case;
        end if;
    end process;

END behaviour;