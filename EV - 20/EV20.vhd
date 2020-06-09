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
-- CREATED		"Tue Jun 09 01:24:19 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY EV20 IS 
	PORT
	(
		sys_clk :  IN  STD_LOGIC;
		resetN :  IN  STD_LOGIC
	);
END EV20;

ARCHITECTURE bdf_type OF EV20 IS 

COMPONENT branchmanager
	PORT(resetN : IN STD_LOGIC;
		 hold : IN STD_LOGIC;
		 sys_clk : IN STD_LOGIC;
		 Curr_Addr : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 Instr_label : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 Jmp_Addr : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 Addr_Out : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

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

COMPONENT indexmanager
	PORT(DAddr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 I : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 R0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 R1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 DAddrOut : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT instrreg
	PORT(hold : IN STD_LOGIC;
		 sys_clk : IN STD_LOGIC;
		 from_mem : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 instrOut : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT;

COMPONENT kmux
	PORT(sel : IN STD_LOGIC;
		 X : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
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
		 input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT loadpc
	PORT(carry_out : IN STD_LOGIC;
		 Instr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 W : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 load : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT pc
	PORT(CLK : IN STD_LOGIC;
		 LOAD : IN STD_LOGIC;
		 HOLD : IN STD_LOGIC;
		 ADDR_IN : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 ADDR_NEXT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 ADDR_OUT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT program
	PORT(clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
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
		 R0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 R1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 To_A : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 To_B : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 W : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uihandler
	PORT(sys_clk : IN STD_LOGIC;
		 d_addr_in : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 Instruction : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 uI_mem : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
		 MW : OUT STD_LOGIC;
		 MR : OUT STD_LOGIC;
		 KMx : OUT STD_LOGIC;
		 hold : OUT STD_LOGIC;
		 hold_jump : OUT STD_LOGIC;
		 A : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ALUC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 DAdd : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 I : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 sh : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 T : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uirom
	PORT(clock : IN STD_LOGIC;
		 clken : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	A :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	ALUC :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	B :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	C :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	carry :  STD_LOGIC;
SIGNAL	DAdd :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	DAddr_final :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	From_C :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	hold :  STD_LOGIC;
SIGNAL	hold_jump :  STD_LOGIC;
SIGNAL	I :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	Instruction :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	kMuxc :  STD_LOGIC;
SIGNAL	load :  STD_LOGIC;
SIGNAL	MR :  STD_LOGIC;
SIGNAL	MW :  STD_LOGIC;
SIGNAL	PCAdd :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	preInstr :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	R0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	R1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	To_A :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	uIFromROM :  STD_LOGIC_VECTOR(29 DOWNTO 0);
SIGNAL	W :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 



b2v_BranchBlock : branchmanager
PORT MAP(resetN => resetN,
		 hold => SYNTHESIZED_WIRE_12,
		 sys_clk => sys_clk,
		 Curr_Addr => SYNTHESIZED_WIRE_1,
		 Instr_label => Instruction(21 DOWNTO 15),
		 Jmp_Addr => Instruction(18 DOWNTO 8),
		 Addr_Out => SYNTHESIZED_WIRE_8);


b2v_CarryBlock : cyblock
PORT MAP(carry_out => SYNTHESIZED_WIRE_2,
		 sys_clk => sys_clk,
		 ALU_C => ALUC,
		 carry_in => carry);


b2v_DataRAM : data
PORT MAP(wren => MW,
		 clock => sys_clk,
		 address => DAddr_final,
		 data => W,
		 q => SYNTHESIZED_WIRE_10);


b2v_Index : indexmanager
PORT MAP(DAddr => DAdd,
		 I => I,
		 R0 => R0,
		 R1 => R1,
		 DAddrOut => DAddr_final);


b2v_InsReg : instrreg
PORT MAP(hold => hold,
		 sys_clk => sys_clk,
		 from_mem => preInstr,
		 instrOut => Instruction);


SYNTHESIZED_WIRE_11 <= NOT(hold);



SYNTHESIZED_WIRE_9 <= NOT(sys_clk);



SYNTHESIZED_WIRE_12 <= hold_jump OR hold;


b2v_KMux : kmux
PORT MAP(sel => kMuxc,
		 X => SYNTHESIZED_WIRE_3,
		 Y => SYNTHESIZED_WIRE_4,
		 output => To_A);


b2v_LAS : latchalushift
PORT MAP(carry_in => carry,
		 sys_clk => sys_clk,
		 A => To_A,
		 ALU_C => ALUC,
		 B => SYNTHESIZED_WIRE_5,
		 sh => SYNTHESIZED_WIRE_6,
		 Carry_out => SYNTHESIZED_WIRE_2,
		 From_C => From_C);


b2v_LatchK : latchk
PORT MAP(sys_clk => sys_clk,
		 hold => hold,
		 input => Instruction(15 DOWNTO 0),
		 output => SYNTHESIZED_WIRE_4);


b2v_loadBlock : loadpc
PORT MAP(carry_out => carry,
		 Instr => Instruction(21 DOWNTO 15),
		 W => W,
		 load => load);


b2v_PC : pc
PORT MAP(CLK => sys_clk,
		 LOAD => load,
		 HOLD => SYNTHESIZED_WIRE_12,
		 ADDR_IN => SYNTHESIZED_WIRE_8,
		 ADDR_NEXT => PCAdd,
		 ADDR_OUT => SYNTHESIZED_WIRE_1);


b2v_ProgRAM : program
PORT MAP(clock => SYNTHESIZED_WIRE_9,
		 address => PCAdd,
		 q => preInstr);


b2v_RegBank : registerbank
PORT MAP(sys_clk => sys_clk,
		 M_read => MR,
		 A => A,
		 B => B,
		 C => C,
		 From_C => From_C,
		 To_W => SYNTHESIZED_WIRE_10,
		 R0 => R0,
		 R1 => R1,
		 To_A => SYNTHESIZED_WIRE_3,
		 To_B => SYNTHESIZED_WIRE_5,
		 W => W);


b2v_uIControl : uihandler
PORT MAP(sys_clk => sys_clk,
		 d_addr_in => Instruction(15 DOWNTO 6),
		 Instruction => Instruction(21 DOWNTO 8),
		 uI_mem => uIFromROM,
		 MW => MW,
		 MR => MR,
		 KMx => kMuxc,
		 hold => hold,
		 hold_jump => hold_jump,
		 A => A,
		 ALUC => ALUC,
		 B => B,
		 C => C,
		 DAdd => DAdd,
		 I => I,
		 sh => SYNTHESIZED_WIRE_6);


b2v_uIROM : uirom
PORT MAP(clock => sys_clk,
		 clken => SYNTHESIZED_WIRE_11,
		 address => preInstr(21 DOWNTO 15),
		 q => uIFromROM);


END bdf_type;