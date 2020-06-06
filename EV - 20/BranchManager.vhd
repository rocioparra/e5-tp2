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
-- CREATED		"Sat Jun 06 20:23:49 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY BranchManager IS 
	PORT
	(
		resetN :  IN  STD_LOGIC;
		hold :  IN  STD_LOGIC;
		sys_clk :  IN  STD_LOGIC;
		Curr_Addr :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		Instr_label :  IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
		Jmp_Addr :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		Addr_Out :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END BranchManager;

ARCHITECTURE bdf_type OF BranchManager IS 

COMPONENT adaptsizes
	PORT(Curr_addr_in : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 SP_in : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 TOS_in : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Curr_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 SP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 TOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT signextension
	PORT(input : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sum11b
	PORT(dataa : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT checkbraret
	PORT(instr_id : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 BRA : OUT STD_LOGIC;
		 RET : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT mux_11b
	PORT(SEL : IN STD_LOGIC;
		 INA : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 INB : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 ADDR_OUT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sp_cnt
	PORT(CLRN : IN STD_LOGIC;
		 UP_DOWN : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 SP : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 TOS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT stack
	PORT(wren : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 rdaddress : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 wraddress : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT inc_11b
	PORT(ADDR_IN : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 ADDR_OUT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	BRA :  STD_LOGIC;
SIGNAL	Bra_Addr :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	q :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	RET :  STD_LOGIC;
SIGNAL	Ret_Addr :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	sys_clkN :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_Adaptador : adaptsizes
PORT MAP(Curr_addr_in => Curr_Addr,
		 SP_in => SYNTHESIZED_WIRE_0,
		 TOS_in => SYNTHESIZED_WIRE_1,
		 Curr_addr => SYNTHESIZED_WIRE_8,
		 SP => SYNTHESIZED_WIRE_10,
		 TOS => SYNTHESIZED_WIRE_9);


b2v_inst : signextension
PORT MAP(input => Jmp_Addr,
		 output => SYNTHESIZED_WIRE_5);


sys_clkN <= NOT(sys_clk);



SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_2 AND sys_clkN;


SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_3 <= NOT(hold);



b2v_inst2 : sum11b
PORT MAP(dataa => SYNTHESIZED_WIRE_5,
		 datab => Curr_Addr,
		 result => Bra_Addr);


b2v_inst3 : checkbraret
PORT MAP(instr_id => Instr_label,
		 BRA => BRA,
		 RET => RET);


b2v_inst4 : mux_11b
PORT MAP(SEL => RET,
		 INA => Ret_Addr,
		 INB => Bra_Addr,
		 ADDR_OUT => SYNTHESIZED_WIRE_6);


b2v_inst5 : mux_11b
PORT MAP(SEL => BRA,
		 INA => Jmp_Addr,
		 INB => SYNTHESIZED_WIRE_6,
		 ADDR_OUT => Addr_Out);


b2v_inst6 : sp_cnt
PORT MAP(CLRN => resetN,
		 UP_DOWN => BRA,
		 CLK => SYNTHESIZED_WIRE_7,
		 SP => SYNTHESIZED_WIRE_1,
		 TOS => SYNTHESIZED_WIRE_0);


SYNTHESIZED_WIRE_2 <= RET OR BRA;


b2v_Memoria : stack
PORT MAP(wren => BRA,
		 clock => sys_clkN,
		 data => SYNTHESIZED_WIRE_8,
		 rdaddress => SYNTHESIZED_WIRE_9,
		 wraddress => SYNTHESIZED_WIRE_10,
		 q => q);


b2v_Sumador : inc_11b
PORT MAP(ADDR_IN => q(10 DOWNTO 0),
		 ADDR_OUT => Ret_Addr);


END bdf_type;