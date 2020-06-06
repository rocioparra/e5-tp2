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
-- CREATED		"Sat Jun 06 13:35:27 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Latch11b IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		PRN :  IN  STD_LOGIC;
		ADDR_IN :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		ADDR_OUT :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END Latch11b;

ARCHITECTURE bdf_type OF Latch11b IS 

COMPONENT \74174_prn\
	PORT(1D : IN STD_LOGIC;
		 2D : IN STD_LOGIC;
		 3D : IN STD_LOGIC;
		 4D : IN STD_LOGIC;
		 5D : IN STD_LOGIC;
		 6D : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 1Q : OUT STD_LOGIC;
		 2Q : OUT STD_LOGIC;
		 3Q : OUT STD_LOGIC;
		 4Q : OUT STD_LOGIC;
		 5Q : OUT STD_LOGIC;
		 6Q : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	ADDR_OUT_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(10 DOWNTO 0);


BEGIN 



PROCESS(CLK,PRN)
BEGIN
IF (PRN = '0') THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(6) <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(6) <= ADDR_IN(6);
END IF;
END PROCESS;


PROCESS(CLK,PRN)
BEGIN
IF (PRN = '0') THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(7) <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(7) <= ADDR_IN(7);
END IF;
END PROCESS;


PROCESS(CLK,PRN)
BEGIN
IF (PRN = '0') THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(8) <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(8) <= ADDR_IN(8);
END IF;
END PROCESS;


PROCESS(CLK,PRN)
BEGIN
IF (PRN = '0') THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(9) <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(9) <= ADDR_IN(9);
END IF;
END PROCESS;


PROCESS(CLK,PRN)
BEGIN
IF (PRN = '0') THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(10) <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	ADDR_OUT_ALTERA_SYNTHESIZED(10) <= ADDR_IN(10);
END IF;
END PROCESS;


b2v_inst : \74174_prn\
PORT MAP(1D => ADDR_IN(0),
		 2D => ADDR_IN(1),
		 3D => ADDR_IN(2),
		 4D => ADDR_IN(3),
		 5D => ADDR_IN(4),
		 6D => ADDR_IN(5),
		 CLK => CLK,
		 PRN => PRN,
		 1Q => ADDR_OUT_ALTERA_SYNTHESIZED(0),
		 2Q => ADDR_OUT_ALTERA_SYNTHESIZED(1),
		 3Q => ADDR_OUT_ALTERA_SYNTHESIZED(2),
		 4Q => ADDR_OUT_ALTERA_SYNTHESIZED(3),
		 5Q => ADDR_OUT_ALTERA_SYNTHESIZED(4),
		 6Q => ADDR_OUT_ALTERA_SYNTHESIZED(5));

ADDR_OUT <= ADDR_OUT_ALTERA_SYNTHESIZED;

END bdf_type;