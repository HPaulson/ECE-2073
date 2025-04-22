-- Walking_One.vhd (Lab5, Part3)
-- This implements a walking one pattern on 10 LEDRs
-- KEY(0) is used to clock the FSM
-- The current (10-bit) state Q is outputted on LEDR[9..0]
-- Switch SW[1] resets the state Q to S0 or S9 depending on the direction SE(0)
-- Switch SW[0] acts as the direction input: 1=> walk left; 0 => right
-- Engineer: 
-- Date: March 2022

library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity Walking_One is
  port (  
  KEY:  in  std_logic_vector(0 downto 0); -- KEY(0) is your clock, falling edge
  SW:   in  std_logic_vector(1 downto 0); -- SW(1) = reset,
                                          -- SW(0): 1=> walk left; 0 => right
  LEDR: out std_logic_vector (9 downto 0)
 ); --Walking 1 output
end entity;


architecture behav of Walking_One is
signal Q: std_logic_vector (9 downto 0);	--State signal
 
constant STATE0: std_logic_vector(9 downto 0) := "0000000001";
constant STATE1: std_logic_vector(9 downto 0) := "0000000010";
constant STATE2: std_logic_vector(9 downto 0) := "0000000100";
constant STATE3: std_logic_vector(9 downto 0) := "0000001000";
constant STATE4: std_logic_vector(9 downto 0) := "0000010000";
constant STATE5: std_logic_vector(9 downto 0) := "0000100000";
constant STATE6: std_logic_vector(9 downto 0) := "0001000000";
constant STATE7: std_logic_vector(9 downto 0) := "0010000000";
constant STATE8: std_logic_vector(9 downto 0) := "0100000000";
constant STATE9: std_logic_vector(9 downto 0) := "1000000000";


begin
-- Your code starts below
-- Check the comments on the top for the FSM behavior
	
	LEDR(9 downto 0) <= Q;
	
	PROCESS(SW,KEY,Q)
		BEGIN
			if KEY(0)'event and KEY(0) = '0' then
				if SW(1) = '1' then
					IF SW(0) = '1' then Q <= STATE0;
					ELSE Q <= STATE9;
					end if;
				else
					CASE Q is
						WHEN STATE0 =>
							if SW(0) = '1' then
								Q <= STATE1;
							else
								Q <= STATE9;
							END IF;
						WHEN STATE1 =>
							if SW(0) = '1' then
								Q <= STATE2;
							else
								Q <= STATE0;
							END IF;
						WHEN STATE2 =>
							if SW(0) = '1' then
								Q <= STATE3;
							else
								Q <= STATE1;
							END IF;	
						WHEN STATE3 =>
							if SW(0) = '1' then
								Q <= STATE4;
							else
								Q <= STATE2;
							END IF;	
						WHEN STATE4 =>
							if SW(0) = '1' then
								Q <= STATE5;
							else
								Q <= STATE3;
							END IF;	
						WHEN STATE5 =>
							if SW(0) = '1' then
								Q <= STATE6;
							else
								Q <= STATE4;
							END IF;
						WHEN STATE6 =>
							if SW(0) = '1' then
								Q <= STATE7;
							else
								Q <= STATE5;
							END IF;
						WHEN STATE7 =>
							if SW(0) = '1' then
								Q <= STATE8;
							else
								Q <= STATE6;
							END IF;
						WHEN STATE8 =>
							if SW(0) = '1' then
								Q <= STATE9;
							else
								Q <= STATE7;
							END IF;
						WHEN OTHERS =>
							if SW(0) = '1' then
								Q <= STATE0;
							else
								Q <= STATE8;
							END IF;
					END CASE;
				END IF;
			END IF; 
	END PROCESS;
end architecture;