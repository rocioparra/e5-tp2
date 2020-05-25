library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uIHandlerROM_tb is
end entity uIHandlerROM_tb;


architecture testbench of uIHandlerROM_tb is

	component uIHandler
	Port 
	( 
		sys_clk :  IN  STD_LOGIC;
		Instruction :  IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
		uI_mem :  IN  STD_LOGIC_VECTOR(27 DOWNTO 0);
		KMx :  OUT  STD_LOGIC;
		MR :  OUT  STD_LOGIC;
		MW :  OUT  STD_LOGIC;
		hold :  OUT  STD_LOGIC;
		A :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ALUC :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
		C :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
		DAdd :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
		sh :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		T :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
     );
	end component;
	component uIROM
	Port
	(
		address		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (27 DOWNTO 0)
	);
	end component;
	
	signal instruction_in: STD_LOGIC_VECTOR(13 downto 0);
	signal ui_mem : STD_LOGIC_VECTOR(27 DOWNTO 0);
	signal sys_clk: STD_LOGIC;
	--signal hold,KMx,MR,MW: STD_LOGIC;
	--signal A : STD_LOGIC_VECTOR(4 DOWNTO 0);
	--signal B,C : STD_LOGIC_VECTOR(5	DOWNTO 0);
	--signal T : STD_LOGIC_VECTOR(6 DOWNTO 0);
	--signal ALUC : STD_LOGIC_VECTOR(3 DOWNTO 0);
	--signal DAdd : STD_LOGIC_VECTOR(9 DOWNTO 0);
	--signal sh : STD_LOGIC_VECTOR(1 DOWNTO 0);
	
	type t_instArray is array (0 to 4) of std_logic_vector(13 downto 0);
	signal instArray : t_instArray;
	signal simulationEnded 	: boolean := false;

begin
	instArray <=(("10000000000000"),  -- JMP 0
				 ("01001000000000"),  -- MOM 0X200,W
				 ("00100000001000"),  -- MOV 0X00,0X08
				 ("00011101000100"),  -- ADK W,0x88
				 ("00000100000000")); -- SET CY
	memoria: uIROM port map (clock => sys_clk, q=>ui_mem, address=>instruction_in(13 downto 7));
	uicontrol: uIHandler port map (sys_clk => sys_clk, Instruction=>instruction_in, uI_mem=>ui_mem);
   -- Clock process definitions
	clock_process :process
	begin
		sys_clk <= '0';
		wait for 1 ns;
		sys_clk <= '1';
		wait for 1 ns;
		if simulationEnded then
			wait;
		end if;
	end process;

	stim_proc: process
	begin      
		instruction_in <= "10000000000000";
		for i in 0 to 4 loop
			wait until falling_edge(sys_clk);
			instruction_in <= instArray(i);
			for j in 0 to 3 loop --Para ver el pipeline entero de la instruccion
				wait until falling_edge(sys_clk);
			end loop;
		end loop;
		simulationEnded <= true;
   		wait;
	end process;
end testbench;
