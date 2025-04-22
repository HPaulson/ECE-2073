-- myFSM.vhd (Lab5, Part2)
-- This implements your Lab4 Finite State Machine in VHDL...
-- The KEY(0) Pushbutton is used to clock the FSM
-- The current (2-bit) state Q is outputted on LEDR[2..1]
-- The FSM output z is outputted on LEDR[0]
-- Switch SW[0] resets the state Q to 000 (active high)
-- Switch SW[1] acts as the input x
-- Engineer: Your name
-- Date: March 2022

library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity myFSM is port(
  SW:   in  std_logic_vector(1 downto 0); -- SW(1) for input x;  SW(0) for reset
  KEY:  in  std_logic_vector(0 downto 0); -- KEY(0) is your clock, falling edge
  LEDR: out std_logic_vector(3 downto 0)  -- LEDR(2 downto 1) = Q, LEDR(0) = z
);
end entity;

architecture behav of myFSM is
signal Q,D: std_logic_vector(2 downto 0); -- state
---------------------------------------------------------------------------------------
-- Your code starts after the comments:												 --
-- Assign the current state Q to the LEDR(2) and LEDR(1) outputs					 --
-- Use a process and a CASE statement to model the behavior of your FSM			     --
-- Your process is sensitive to the clock signal KEY(0) and input x	(i.e. SW(1))	 --
-- Inside your process, use "if KEY(0)'event and KEY(0) = '0' then" for clock edge	 --
-- When reset (i.e. SW(0)) is '1', your Q is set to the first state				   --
--------------------------------------------------------------------------------------- 
	constant STATE0: STD_LOGIC_VECTOR(2 downto 0) := "000";
	constant STATE1: STD_LOGIC_VECTOR(2 downto 0) := "001";
	constant STATE2: STD_LOGIC_VECTOR(2 downto 0) := "010";
	constant STATE3: STD_LOGIC_VECTOR(2 downto 0) := "011";
	constant STATE4: STD_LOGIC_VECTOR(2 downto 0) := "100";
	constant STATE5: STD_LOGIC_VECTOR(2 downto 0) := "101";
begin
	LEDR(3 downto 1) <= Q;
	
	PROCESS(KEY(0),SW(1))
		BEGIN
			if KEY(0)'event and KEY(0) = '0' then
				if SW(0) = '1' then
					D <= STATE0;
				else
					Q <= D;
					CASE Q is
						WHEN STATE0 =>
							if SW(1) = '1' then
								Q <= STATE1;
							else
								Q <= STATE0;
							END IF;
							LEDR(0) <= '0';
						WHEN STATE1 =>
							if SW(1) = '1' then
								Q <= STATE1;
							else
								Q <= STATE2;
							END IF;
							LEDR(0) <= '0';
						WHEN STATE2 =>
							if SW(1) = '1' then
								Q <= STATE3;
							else
								Q <= STATE0;
							END IF;	
							LEDR(0) <= '0';
						WHEN STATE3 =>
							if SW(1) = '1' then
								Q <= STATE1;
							else
								Q <= STATE4;
							END IF;	
							LEDR(0) <= '0';
						WHEN STATE4 =>
							if SW(1) = '1' then
								Q <= STATE5;
							else
								Q <= STATE2;
							END IF;	
							LEDR(0) <= '0';
						WHEN STATE5 =>
							if SW(1) = '1' then
								Q <= STATE0;
								LEDR(0) <= '1';
							else
								Q <= STATE2;
								LEDR(0) <= '0';
							END IF;
						WHEN OTHERS =>
							Q <= STATE0;
							LEDR(0) <= '0';
					END CASE;
				END IF;
			END IF; 
	END PROCESS;
end architecture;
