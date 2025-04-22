-- Traffic light controller  template for Lab6 Parts 2-4
-- 
-- Part 2: Models the intersection of a farm road (left lights) and a highway (right lights): 
-- 		   RG lasts 7 cycles; each of the others lasts 2 cycles
-- Part 3: Introduce a sensor input (treadle) for the farm road. The farm green light is  
--		   granted for 2 cycles only when sensor is active (high)
-- Part 4: Give farm green light 7 cycles if sensor still active after two cycles 
-- Save a copy of the program for each part as you progressively refine the controller
-- Read the Lab6 descrition for more details. 

-- Engineer:
-- Date: April 2022

library IEEE;  
use IEEE.std_logic_1164.all;

entity TrafficControl is port(
    clock: in  std_logic;                    -- Clock input from the physical traffic lights station
	lights: out std_logic_vector(5 downto 0); -- Physical traffic light ouput: left RYG, right RYG, active HIGH
	treadle: in std_logic
	);
end entity;

architecture behav of TrafficControl is

 -- Define constants for traffic light bit patterns 
 
 
constant RG: std_logic_vector(5 downto 0)  := "100001";	--active high
constant RY: std_logic_vector(5 downto 0)  := "100010";
constant GR: std_logic_vector(5 downto 0)  := "001100";
constant YR: std_logic_vector(5 downto 0)  := "010100";
constant RR: std_logic_vector(5 downto 0)  := "100100";

-- Define constants for counter values for Parts 2-4
-- These will be concatenated with various lights patterns for different states
-- For example: C0&RG to indicate the 1st cycle for RG, C1&RG for the 2nd RG cycle, etc.

constant C0: std_logic_vector(2 downto 0) := "000";
constant C1: std_logic_vector(2 downto 0) := "001"; -- Continue below...for parts 2-4
constant C2: std_logic_vector(2 downto 0) := "010";
constant C3: std_logic_vector(2 downto 0) := "011";
constant C4: std_logic_vector(2 downto 0) := "100";
constant C5: std_logic_vector(2 downto 0) := "101";
constant C6: std_logic_vector(2 downto 0) := "110";
constant C7: std_logic_vector(2 downto 0) := "111"; -- unused

signal Q: std_logic_vector(8 downto 0) := C0&RG;-- IState vector used internally; nitialized to 1st cycle of RG
signal toggle: std_logic := '0';
begin

lights <= Q(5 downto 0);
-- Assign the last six bits of the state vector to the lights output below


-- Write a process sensitive to clock only 
-- In the process, use a CASE statement to model lights sequence, and IF statements for the sensor (treadle) input. 


PROCESS(clock)
BEGIN
	if (RISING_EDGE(clock)) then
		CASE Q is
			WHEN C0&RG =>
				Q <= C1&RG;
			WHEN C1&RG =>
				Q <= C2&RG;
			WHEN C2&RG =>
				Q <= C3&RG;
			WHEN C3&RG =>
				Q <= C4&RG;
			WHEN C4&RG =>
				Q <= C5&RG;
			WHEN C5&RG =>
				Q <= C6&RG;
				
			WHEN C6&RG =>
				IF treadle = '1' then
					Q <= C0&RY;
				ELSE Q <= C6&RG;
				END IF;
				
			WHEN C0&RY =>
				Q <= C1&RY;
			WHEN C1&RY =>
				Q <= C0&RR;
				
			WHEN C0&RR =>
				Q <= C1&RR;
			WHEN C1&RR =>
				IF toggle = '0' then
					toggle <= '1';
					Q <= C0&GR;
				ELSE
					toggle <= '0';
					Q <= C0&RG;
				END IF;
				
			WHEN C0&GR =>
				Q <= C1&GR;
			WHEN C1&GR =>
				IF treadle = '0' then
					Q <= C0&YR;
				ELSE Q <= C2&GR;
				END IF;
				
			-- Only if the farm road still has cars after 2 cycles
			WHEN C2&GR =>
				Q <= C3&GR;
			WHEN C3&GR =>
				Q <= C4&GR;
			WHEN C4&GR =>
				Q <= C5&GR;
			WHEN C5&GR =>
				Q <= C6&GR;
			WHEN C6&GR =>
				Q <= C0&YR;
			---
			
			WHEN C0&YR =>
				Q <= C1&YR;
			WHEN C1&YR =>
				Q <= C0&RR;
			WHEN OTHERS =>
				Q <= C0&RG;
		END CASE;
	end if;
END PROCESS;


end Behav;


