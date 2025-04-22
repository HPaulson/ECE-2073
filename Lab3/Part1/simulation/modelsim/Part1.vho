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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "02/25/2025 10:38:12"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Lab3P1 IS
    PORT (
	INP : IN std_logic_vector(3 DOWNTO 0);
	CNTL : IN std_logic_vector(1 DOWNTO 0);
	OUTP : BUFFER std_logic
	);
END Lab3P1;

-- Design Ports Information
-- OUTP	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- INP[0]	=>  Location: PIN_AB30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- INP[1]	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- INP[2]	=>  Location: PIN_AB28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- INP[3]	=>  Location: PIN_AC30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CNTL[0]	=>  Location: PIN_AC29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CNTL[1]	=>  Location: PIN_AA30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Lab3P1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_INP : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_CNTL : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_OUTP : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CNTL[1]~input_o\ : std_logic;
SIGNAL \INP[2]~input_o\ : std_logic;
SIGNAL \CNTL[0]~input_o\ : std_logic;
SIGNAL \INP[1]~input_o\ : std_logic;
SIGNAL \INP[3]~input_o\ : std_logic;
SIGNAL \INP[0]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_CNTL[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_CNTL[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_INP[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_INP[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_INP[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_INP[0]~input_o\ : std_logic;

BEGIN

ww_INP <= INP;
ww_CNTL <= CNTL;
OUTP <= ww_OUTP;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_CNTL[1]~input_o\ <= NOT \CNTL[1]~input_o\;
\ALT_INV_CNTL[0]~input_o\ <= NOT \CNTL[0]~input_o\;
\ALT_INV_INP[3]~input_o\ <= NOT \INP[3]~input_o\;
\ALT_INV_INP[2]~input_o\ <= NOT \INP[2]~input_o\;
\ALT_INV_INP[1]~input_o\ <= NOT \INP[1]~input_o\;
\ALT_INV_INP[0]~input_o\ <= NOT \INP[0]~input_o\;

-- Location: IOOBUF_X89_Y11_N45
\OUTP~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_OUTP);

-- Location: IOIBUF_X89_Y21_N21
\CNTL[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CNTL(1),
	o => \CNTL[1]~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\INP[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_INP(2),
	o => \INP[2]~input_o\);

-- Location: IOIBUF_X89_Y20_N95
\CNTL[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CNTL(0),
	o => \CNTL[0]~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\INP[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_INP(1),
	o => \INP[1]~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\INP[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_INP(3),
	o => \INP[3]~input_o\);

-- Location: IOIBUF_X89_Y21_N4
\INP[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_INP(0),
	o => \INP[0]~input_o\);

-- Location: LABCELL_X88_Y21_N0
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \INP[3]~input_o\ & ( \INP[0]~input_o\ & ( (!\CNTL[1]~input_o\ & (((!\CNTL[0]~input_o\) # (\INP[1]~input_o\)))) # (\CNTL[1]~input_o\ & (((\CNTL[0]~input_o\)) # (\INP[2]~input_o\))) ) ) ) # ( !\INP[3]~input_o\ & ( \INP[0]~input_o\ & ( 
-- (!\CNTL[1]~input_o\ & (((!\CNTL[0]~input_o\) # (\INP[1]~input_o\)))) # (\CNTL[1]~input_o\ & (\INP[2]~input_o\ & (!\CNTL[0]~input_o\))) ) ) ) # ( \INP[3]~input_o\ & ( !\INP[0]~input_o\ & ( (!\CNTL[1]~input_o\ & (((\CNTL[0]~input_o\ & \INP[1]~input_o\)))) # 
-- (\CNTL[1]~input_o\ & (((\CNTL[0]~input_o\)) # (\INP[2]~input_o\))) ) ) ) # ( !\INP[3]~input_o\ & ( !\INP[0]~input_o\ & ( (!\CNTL[1]~input_o\ & (((\CNTL[0]~input_o\ & \INP[1]~input_o\)))) # (\CNTL[1]~input_o\ & (\INP[2]~input_o\ & (!\CNTL[0]~input_o\))) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000011010000101010001111110110000101110101011010110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_CNTL[1]~input_o\,
	datab => \ALT_INV_INP[2]~input_o\,
	datac => \ALT_INV_CNTL[0]~input_o\,
	datad => \ALT_INV_INP[1]~input_o\,
	datae => \ALT_INV_INP[3]~input_o\,
	dataf => \ALT_INV_INP[0]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X68_Y36_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


