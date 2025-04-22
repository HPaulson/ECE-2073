-- Decode7seg.vhd 
-- Template for ECE 2043 Lab3, Part2
-- This implements a 7-Segment Decoder: the behavior waHEX0
-- Assume the 7-segment displays are active low 
-- Engineer: Hunter Paulson
-- Mar. 2025

library ieee;
use ieee.std_logic_1164.all;

entity Decode7seg is
port( SW   : in  bit_vector(3 downto 0);  -- 4-bit Switch input defining the binarHEX0 number to display
      LEDR : out bit_vector(3 downto 0);  -- 4-bit LED outputs to echo the state of the switches
      HEX0 : out bit_vector(0 to 6) );    -- 7-bit bit-pattern controlling the LEDs' of the 7 Seg display
end;

architecture Decode7segA of Decode7seg is
begin
   LEDR <= SW; -- Echo the status of the switch inputs to the LED outputs 
-- 
-- Work out the behavior of 7-segment decoder below
-- Replace x and y with approriate signals/code
-- Add lines for the binary codes to diaplay 1-F on y; one line for each pair
-- Refer to your Lab 2.1 truth table for the codes
-- End the last line (for displaying F) with a semicolon. 
   
   with SW select
   HEX0	<= 	"0000001" when "0000",     	-- to diaplay the value 0
					"1001111" when "0001",     	-- to diaplay the value 1
					"0010010" when "0010",     	-- to display the value 2
					"0000110" when "0011",     	-- to diaplay the value 3
					"1001100" when "0100",     	-- to display the value 4
					"0100100" when "0101",     	-- to display the value 5
					"0100000" when "0110",     	-- to display the value 6
					"0001111" when "0111",     	-- to display the value 7
					"0000000" when "1000",     	-- to display the value 8
					"0000100" when "1001",     	-- to display the value 9
					"0001000" when "1010",     	-- to display the value A
					"1100000" when "1011",     	-- to display the value B
					"0110001" when "1100",     	-- to display the value C
					"1000010" when "1101",     	-- to display the value D
					"0110000" when "1110",     	-- to display the value E
					"0111000" when "1111",     	-- to display the value F
					"0000000" when others;

end architecture Decode7segA;
