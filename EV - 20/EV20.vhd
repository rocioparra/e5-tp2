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
-- CREATED		"Thu May 28 15:01:25 2020"

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
		 MR : OUT STD_LOGIC;
		 MW : OUT STD_LOGIC;
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
		 address : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(27 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	A :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	B :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	C :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	DAdd :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	hold :  STD_LOGIC;
SIGNAL	Instruction :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	MR :  STD_LOGIC;
SIGNAL	MW :  STD_LOGIC;
SIGNAL	preInstr :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(27 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;


BEGIN 



b2v_CarryBlock : cyblock
PORT MAP(carry_out => SYNTHESIZED_WIRE_0,
		 sys_clk => sys_clk,
		 ALU_C => SYNTHESIZED_WIRE_21,
		 carry_in => SYNTHESIZED_WIRE_23);


b2v_DataRAM : data
PORT MAP(wren => MW,
		 clock => sys_clk,
		 address => DAdd,
		 data => SYNTHESIZED_WIRE_22,
		 q => SYNTHESIZED_WIRE_18);


b2v_InsReg : instrreg
PORT MAP(hold => hold,
		 sys_clk => sys_clk,
		 from_mem => preInstr,
		 instrOut => Instruction);


SYNTHESIZED_WIRE_3 <= NOT(hold);



SYNTHESIZED_WIRE_15 <= NOT(sys_clk);



SYNTHESIZED_WIRE_20 <= SYNTHESIZED_WIRE_3 AND sys_clk;


b2v_KMux : kmux
PORT MAP(sel => SYNTHESIZED_WIRE_4,
		 X => SYNTHESIZED_WIRE_5,
		 Y => SYNTHESIZED_WIRE_6,
		 output => SYNTHESIZED_WIRE_8);


b2v_LAS : latchalushift
PORT MAP(carry_in => SYNTHESIZED_WIRE_23,
		 sys_clk => sys_clk,
		 A => SYNTHESIZED_WIRE_8,
		 ALU_C => SYNTHESIZED_WIRE_21,
		 B => SYNTHESIZED_WIRE_10,
		 sh => SYNTHESIZED_WIRE_11,
		 Carry_out => SYNTHESIZED_WIRE_0,
		 From_C => SYNTHESIZED_WIRE_17);


b2v_LatchK : latchk
PORT MAP(sys_clk => sys_clk,
		 hold => hold,
		 input => Instruction(7 DOWNTO 0),
		 output => SYNTHESIZED_WIRE_6);


b2v_PCReg : pcreg
PORT MAP(pre_load => SYNTHESIZED_WIRE_12,
		 hold => hold,
		 sys_clk => sys_clk,
		 input => Instruction(10 DOWNTO 0),
		 PC => SYNTHESIZED_WIRE_16);


b2v_pLoadPC : preloadpc
PORT MAP(carry_out => SYNTHESIZED_WIRE_23,
		 Instr => Instruction(13 DOWNTO 11),
		 W => SYNTHESIZED_WIRE_22,
		 preLoad => SYNTHESIZED_WIRE_12);


b2v_ProgRAM : program
PORT MAP(clock => SYNTHESIZED_WIRE_15,
		 address => SYNTHESIZED_WIRE_16,
		 q => preInstr);


b2v_RegBank : registerbank
PORT MAP(sys_clk => sys_clk,
		 M_read => MR,
		 A => A,
		 B => B,
		 C => C,
		 From_C => SYNTHESIZED_WIRE_17,
		 To_W => SYNTHESIZED_WIRE_18,
		 To_A => SYNTHESIZED_WIRE_5,
		 To_B => SYNTHESIZED_WIRE_10,
		 W => SYNTHESIZED_WIRE_22);


b2v_uIControl : uihandler
PORT MAP(sys_clk => sys_clk,
		 Instruction => Instruction,
		 uI_mem => SYNTHESIZED_WIRE_19,
		 MR => MR,
		 MW => MW,
		 KMx => SYNTHESIZED_WIRE_4,
		 hold => hold,
		 A => A,
		 ALUC => SYNTHESIZED_WIRE_21,
		 B => B,
		 C => C,
		 DAdd => DAdd,
		 sh => SYNTHESIZED_WIRE_11);


b2v_uIROM : uirom
PORT MAP(clock => SYNTHESIZED_WIRE_20,
		 address => preInstr(13 DOWNTO 7),
		 q => SYNTHESIZED_WIRE_19);


END bdf_type;