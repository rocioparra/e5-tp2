LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Needed for shifts

ENTITY shifter IS 
    PORT
    (
			input       :  IN  STD_LOGIC_VECTOR(15 downto 0);
			ctrl        :  IN  STD_LOGIC_VECTOR(1 downto 0);
			sys_clk  	:  IN  STD_LOGIC;
			output    	:  OUT STD_LOGIC_VECTOR(15 downto 0)
    );
END shifter;

ARCHITECTURE behaviour OF shifter IS    
begin
    process(sys_clk)
    begin
        if(rising_edge(sys_clk)) then
			case ctrl is
				when "01" =>
					output <= std_logic_vector(shift_right(unsigned(input), 1));
				when "10" =>
					output <= std_logic_vector(shift_left(unsigned(input), 1));
				when others =>
					output <= input;
			end case;
        end if;
    end process;

END behaviour;