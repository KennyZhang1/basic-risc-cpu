-- Copyright (C) 2020  Intel Corporation. All rights reserved.
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
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Sat Apr 29 20:35:37 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CPU IS 
	PORT
	(
		memstrobe :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		start :  IN  STD_LOGIC;
		done :  IN  STD_LOGIC;
		Data_Bus :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		r :  OUT  STD_LOGIC;
		w :  OUT  STD_LOGIC;
		Addr_Bus :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END CPU;

ARCHITECTURE bdf_type OF CPU IS 

COMPONENT controlunit
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 done : IN STD_LOGIC;
		 c3_2_downto_0 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 cpu_bus : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 opcode : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 r_memory : OUT STD_LOGIC;
		 w_memory : OUT STD_LOGIC;
		 mdwr : OUT STD_LOGIC;
		 irin : OUT STD_LOGIC;
		 c1out : OUT STD_LOGIC;
		 c2out : OUT STD_LOGIC;
		 gra : OUT STD_LOGIC;
		 grb : OUT STD_LOGIC;
		 grc : OUT STD_LOGIC;
		 main : OUT STD_LOGIC;
		 mdbus : OUT STD_LOGIC;
		 mdrd : OUT STD_LOGIC;
		 mdout : OUT STD_LOGIC;
		 pcin : OUT STD_LOGIC;
		 pcout : OUT STD_LOGIC;
		 ain : OUT STD_LOGIC;
		 cin : OUT STD_LOGIC;
		 cout : OUT STD_LOGIC;
		 add_op : OUT STD_LOGIC;
		 sub_op : OUT STD_LOGIC;
		 neg_op : OUT STD_LOGIC;
		 and_op : OUT STD_LOGIC;
		 or_op : OUT STD_LOGIC;
		 not_op : OUT STD_LOGIC;
		 shr_op : OUT STD_LOGIC;
		 shra_op : OUT STD_LOGIC;
		 shl_op : OUT STD_LOGIC;
		 shc_op : OUT STD_LOGIC;
		 ceqb_op : OUT STD_LOGIC;
		 incr4_op : OUT STD_LOGIC;
		 baout : OUT STD_LOGIC;
		 rin : OUT STD_LOGIC;
		 rout : OUT STD_LOGIC;
		 xor_op : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT memory_interface
	PORT(Reset : IN STD_LOGIC;
		 Clock : IN STD_LOGIC;
		 memstrobe : IN STD_LOGIC;
		 MAin : IN STD_LOGIC;
		 MDwr : IN STD_LOGIC;
		 MDbus : IN STD_LOGIC;
		 MDrd : IN STD_LOGIC;
		 MDout : IN STD_LOGIC;
		 cpu_bus : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Data_Bus : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Addr_Bus : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT datapath
	PORT(reset : IN STD_LOGIC;
		 rin : IN STD_LOGIC;
		 rout : IN STD_LOGIC;
		 baout : IN STD_LOGIC;
		 ain : IN STD_LOGIC;
		 cout : IN STD_LOGIC;
		 cin : IN STD_LOGIC;
		 add_op : IN STD_LOGIC;
		 sub_op : IN STD_LOGIC;
		 neg_op : IN STD_LOGIC;
		 and_op : IN STD_LOGIC;
		 or_op : IN STD_LOGIC;
		 not_op : IN STD_LOGIC;
		 shr_op : IN STD_LOGIC;
		 shra_op : IN STD_LOGIC;
		 shc_op : IN STD_LOGIC;
		 shl_op : IN STD_LOGIC;
		 ceqb_op : IN STD_LOGIC;
		 incr4_op : IN STD_LOGIC;
		 pcin : IN STD_LOGIC;
		 pcout : IN STD_LOGIC;
		 irin : IN STD_LOGIC;
		 c2out : IN STD_LOGIC;
		 gra : IN STD_LOGIC;
		 c1out : IN STD_LOGIC;
		 grb : IN STD_LOGIC;
		 grc : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 xor_op : IN STD_LOGIC;
		 cpu_bus : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 c3_2_downto_0 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 opcode : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	gdfx_temp0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC;


BEGIN 



b2v_ControlUnit : controlunit
PORT MAP(reset => reset,
		 clock => clock,
		 start => start,
		 done => done,
		 c3_2_downto_0 => SYNTHESIZED_WIRE_0,
		 cpu_bus => gdfx_temp0,
		 opcode => SYNTHESIZED_WIRE_1,
		 r_memory => r,
		 w_memory => w,
		 mdwr => SYNTHESIZED_WIRE_3,
		 irin => SYNTHESIZED_WIRE_27,
		 c1out => SYNTHESIZED_WIRE_30,
		 c2out => SYNTHESIZED_WIRE_28,
		 gra => SYNTHESIZED_WIRE_29,
		 grb => SYNTHESIZED_WIRE_31,
		 grc => SYNTHESIZED_WIRE_32,
		 main => SYNTHESIZED_WIRE_2,
		 mdbus => SYNTHESIZED_WIRE_4,
		 mdrd => SYNTHESIZED_WIRE_5,
		 mdout => SYNTHESIZED_WIRE_6,
		 pcin => SYNTHESIZED_WIRE_25,
		 pcout => SYNTHESIZED_WIRE_26,
		 ain => SYNTHESIZED_WIRE_10,
		 cin => SYNTHESIZED_WIRE_12,
		 cout => SYNTHESIZED_WIRE_11,
		 add_op => SYNTHESIZED_WIRE_13,
		 sub_op => SYNTHESIZED_WIRE_14,
		 neg_op => SYNTHESIZED_WIRE_15,
		 and_op => SYNTHESIZED_WIRE_16,
		 or_op => SYNTHESIZED_WIRE_17,
		 not_op => SYNTHESIZED_WIRE_18,
		 shr_op => SYNTHESIZED_WIRE_19,
		 shra_op => SYNTHESIZED_WIRE_20,
		 shl_op => SYNTHESIZED_WIRE_22,
		 shc_op => SYNTHESIZED_WIRE_21,
		 ceqb_op => SYNTHESIZED_WIRE_23,
		 incr4_op => SYNTHESIZED_WIRE_24,
		 baout => SYNTHESIZED_WIRE_9,
		 rin => SYNTHESIZED_WIRE_7,
		 rout => SYNTHESIZED_WIRE_8,
		 xor_op => SYNTHESIZED_WIRE_33);


b2v_CPUMemoryInterface : memory_interface
PORT MAP(Reset => reset,
		 Clock => clock,
		 memstrobe => memstrobe,
		 MAin => SYNTHESIZED_WIRE_2,
		 MDwr => SYNTHESIZED_WIRE_3,
		 MDbus => SYNTHESIZED_WIRE_4,
		 MDrd => SYNTHESIZED_WIRE_5,
		 MDout => SYNTHESIZED_WIRE_6,
		 cpu_bus => gdfx_temp0,
		 Data_Bus => Data_Bus,
		 Addr_Bus => Addr_Bus);


b2v_Datapath : datapath
PORT MAP(reset => reset,
		 rin => SYNTHESIZED_WIRE_7,
		 rout => SYNTHESIZED_WIRE_8,
		 baout => SYNTHESIZED_WIRE_9,
		 ain => SYNTHESIZED_WIRE_10,
		 cout => SYNTHESIZED_WIRE_11,
		 cin => SYNTHESIZED_WIRE_12,
		 add_op => SYNTHESIZED_WIRE_13,
		 sub_op => SYNTHESIZED_WIRE_14,
		 neg_op => SYNTHESIZED_WIRE_15,
		 and_op => SYNTHESIZED_WIRE_16,
		 or_op => SYNTHESIZED_WIRE_17,
		 not_op => SYNTHESIZED_WIRE_18,
		 shr_op => SYNTHESIZED_WIRE_19,
		 shra_op => SYNTHESIZED_WIRE_20,
		 shc_op => SYNTHESIZED_WIRE_21,
		 shl_op => SYNTHESIZED_WIRE_22,
		 ceqb_op => SYNTHESIZED_WIRE_23,
		 incr4_op => SYNTHESIZED_WIRE_24,
		 pcin => SYNTHESIZED_WIRE_25,
		 pcout => SYNTHESIZED_WIRE_26,
		 irin => SYNTHESIZED_WIRE_27,
		 c2out => SYNTHESIZED_WIRE_28,
		 gra => SYNTHESIZED_WIRE_29,
		 c1out => SYNTHESIZED_WIRE_30,
		 grb => SYNTHESIZED_WIRE_31,
		 grc => SYNTHESIZED_WIRE_32,
		 clock => clock,
		 xor_op => SYNTHESIZED_WIRE_33,
		 cpu_bus => gdfx_temp0,
		 c3_2_downto_0 => SYNTHESIZED_WIRE_0,
		 opcode => SYNTHESIZED_WIRE_1);


END bdf_type;