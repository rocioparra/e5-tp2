-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
-- CREATED		"Tue Jun 02 02:11:49 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY EV20 IS 
	PORT
	(
		sys_clk :  IN  STD_LOGIC
	);
END EV20;

ARCHITECTURE bdf_type OF EV20 IS 

COMPONENT cyblock
	PORT(carry_out : IN STD_LOGIC;
		 sys_clk : IN STD_LOGIC;
		 ALU_C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 carry_in : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT data
	PORT(wren : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT instrreg
	PORT(hold : IN STD_LOGIC;
		 sys_clk : IN STD_LOGIC;
		 from_mem : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 instrOut : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
	);
END COMPONENT;

COMPONENT kmux
	PORT(sel : IN STD_LOGIC;
		 X : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT latchalushift
	PORT(carry_in : IN STD_LOGIC;
		 sys_clk : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 ALU_C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 sh : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Carry_out : OUT STD_LOGIC;
		 From_C : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT latchk
	PORT(sys_clk : IN STD_LOGIC;
		 hold : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pcreg
	PORT(pre_load : IN STD_LOGIC;
		 hold : IN STD_LOGIC;
		 sys_clk : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 PC : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT preloadpc
	PORT(carry_out : IN STD_LOGIC;
		 Instr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 W : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 preLoad : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT program
	PORT(clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
	);
END COMPONENT;

COMPONENT registerbank
	PORT(sys_clk : IN STD_LOGIC;
		 M_read : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 From_C : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 To_W : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 To_A : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 To_B : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 W : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uihandler
	PORT(sys_clk : IN STD_LOGIC;
		 Instruction : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 uI_mem : IN STD_LOGIC_VECTOR(27 DOWNTO 0);
		 MW : OUT STD_LOGIC;
		 MR : OUT STD_LOGIC;
		 KMx : OUT STD_LOGIC;
		 hold : OUT STD_LOGIC;
		 A : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ALUC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 DAdd : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 sh : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 T : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uirom
	PORT(clock : IN STD_LOGIC;
		 clken : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(27 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	A :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	ALUC :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	B :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	C :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	carry :  STD_LOGIC;
SIGNAL	DAdd :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	From_C :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	hold :  STD_LOGIC;
SIGNAL	Instruction :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	kMuxc :  STD_LOGIC;
SIGNAL	MR :  STD_LOGIC;
SIGNAL	MW :  STD_LOGIC;
SIGNAL	PC :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	preInstr :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	preLoad :  STD_LOGIC;
SIGNAL	To_A :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	To_B :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	uIFromROM :  STD_LOGIC_VECTOR(27 DOWNTO 0);
SIGNAL	W :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;


BEGIN 



b2v_CarryBlock : cyblock
PORT MAP(carry_out => SYNTHESIZED_WIRE_0,
		 sys_clk => sys_clk,
		 ALU_C => ALUC,
		 carry_in => carry);


b2v_DataRAM : data
PORT MAP(wren => MW,
		 clock => sys_clk,
		 address => DAdd,
		 data => W,
		 q => SYNTHESIZED_WIRE_5);


b2v_InsReg : instrreg
PORT MAP(hold => hold,
		 sys_clk => sys_clk,
		 from_mem => preInstr,
		 instrOut => Instruction);


SYNTHESIZED_WIRE_6 <= NOT(hold);



SYNTHESIZED_WIRE_4 <= NOT(sys_clk);



b2v_KMux : kmux
PORT MAP(sel => kMuxc,
		 X => SYNTHESIZED_WIRE_1,
		 Y => SYNTHESIZED_WIRE_2,
		 output => To_A);


b2v_LAS : latchalushift
PORT MAP(carry_in => carry,
		 sys_clk => sys_clk,
		 A => To_A,
		 ALU_C => ALUC,
		 B => To_B,
		 sh => SYNTHESIZED_WIRE_3,
		 Carry_out => SYNTHESIZED_WIRE_0,
		 From_C => From_C);


b2v_LatchK : latchk
PORT MAP(sys_clk => sys_clk,
		 hold => hold,
		 input => Instruction(7 DOWNTO 0),
		 output => SYNTHESIZED_WIRE_2);


b2v_PCReg : pcreg
PORT MAP(pre_load => preLoad,
		 hold => hold,
		 sys_clk => sys_clk,
		 input => Instruction(10 DOWNTO 0),
		 PC => PC);


b2v_pLoadPC : preloadpc
PORT MAP(carry_out => carry,
		 Instr => Instruction(13 DOWNTO 11),
		 W => W,
		 preLoad => preLoad);


b2v_ProgRAM : program
PORT MAP(clock => SYNTHESIZED_WIRE_4,
		 address => PC,
		 q => preInstr);


b2v_RegBank : registerbank
PORT MAP(sys_clk => sys_clk,
		 M_read => MR,
		 A => A,
		 B => B,
		 C => C,
		 From_C => From_C,
		 To_W => SYNTHESIZED_WIRE_5,
		 To_A => SYNTHESIZED_WIRE_1,
		 To_B => To_B,
		 W => W);


b2v_uIControl : uihandler
PORT MAP(sys_clk => sys_clk,
		 Instruction => Instruction,
		 uI_mem => uIFromROM,
		 MW => MW,
		 MR => MR,
		 KMx => kMuxc,
		 hold => hold,
		 A => A,
		 ALUC => ALUC,
		 B => B,
		 C => C,
		 DAdd => DAdd,
		 sh => SYNTHESIZED_WIRE_3);


b2v_uIROM : uirom
PORT MAP(clock => sys_clk,
		 clken => SYNTHESIZED_WIRE_6,
		 address => preInstr(13 DOWNTO 7),
		 q => uIFromROM);


END bdf_type;