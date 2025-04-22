-- ECE 2043-Lab6P1: Basic traffic light controller: Each pattern lasts only one cycle
-- The Clock signal from the physical traffic lights act as a clock
-- Engineer: Hunter Paulson
-- Date: April 2022

library IEEE;  
use IEEE.std_logic_1164.all;

entity BasicControl is port(
    clock: in  std_logic;                    -- Clock input from the physical traffic lights station
	lights: out std_logic_vector(5 downto 0) -- Physical traffic light ouput: left RYG, right RYG, active HIGH
);
end entity;

architecture behav of BasicControl is

 -- Define constants for traffic light bit patterns 
 -- Note the last bit is an extra bit to distinguish between the two RR patterns
 
constant RG: std_logic_vector(6 downto 0)  := "1000010";	--active high
constant RY: std_logic_vector(6 downto 0)  := "1000100";
constant GR: std_logic_vector(6 downto 0)  := "0011000";
constant YR: std_logic_vector(6 downto 0)  := "0101000";
constant RR0: std_logic_vector(6 downto 0) := "1001000";
constant RR1: std_logic_vector(6 downto 0) := "1001001";

signal Q: std_logic_vector(6 downto 0); -- State vector used internally


begin

-- Assign the first six bits of the state vector to the lights output below

lights <= Q(6 downto 1);	
-- Write a process that is sensitive to clock only 
-- In the process, use a CASE statement to model lights sequence. 

PROCESS(clock)
BEGIN
	if (RISING_EDGE(clock)) then
		CASE Q is
			WHEN RG =>
				Q <= RY;
			WHEN RY =>
				Q <= RR0;
			WHEN RR0 =>
				Q <= GR;
			WHEN GR =>
				Q <= YR;
			WHEN YR =>
				Q <= RR1;
			WHEN OTHERS =>
				Q <= RG;
		END CASE;
	end if;
END PROCESS;


end Behav;




