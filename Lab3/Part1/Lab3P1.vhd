-- Lab3P1.vhd provided for students
-- Function: 1 bit 4-1 MUX
-- Engineer: X. Wang
-- Feb. 2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Lab3P1 is
port(	INP: 	in std_logic_vector (3 downto 0); 
		CNTL: in std_logic_vector (1 downto 0); 
		OUTP:	out std_logic);
end;

architecture Behav of Lab3P1 is
begin
	with CNTL select
		 OUTP <= 	INP(0) when "00",
					INP(1) when "01",
					INP(2) when "10",
					INP(3) when "11",
					'Z' when others;
end Behav;
