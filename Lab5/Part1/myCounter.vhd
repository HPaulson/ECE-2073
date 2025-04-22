-- myCounter.vhd (Lab5, Part1)
-- This implements your Lab4 counter in VHDL...
-- The KEY(0) pushbutton is used to clock the counter
-- The current (3-bit) state Q is outputted on LEDR[2..0]
-- The switch SW[0] resets the state Q to 000 (active high)
-- Engineer: Your name
-- Date: March 2022


library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity myCounter is port(
  SW:   in  std_logic_vector(0 downto 0); -- SW(0) = reset
  KEY:  in  std_logic_vector(0 downto 0); -- KEY(0) = clock, falling edge
  LEDR: out std_logic_vector(2 downto 0)  -- LEDR = Q2-Q0
);
end entity;

architecture behav of myCounter is
signal D,Q: std_logic_vector(2 downto 0); -- state
begin
----------------------------------------------------------------------------------
-- Your code starts after the comments:											--
-- Assign your Q to LEDR;														--
-- Use a process and a CASE statement to model the behavior of your counter;	--
-- Your process is sensitive to the clock signal only;							--
-- Inside process, use "if KEY(0)'event and KEY(0) = '0' then" for clock edge;	--
-- When reset is '1', your Q is set to the first state;							--
-- Make sure the unused states go to some state in the sequence, so the counter	--
-- does not hang up.															--
---------------------------------------------------------------------------------- 

D(2) <= ((NOT Q(1)) AND (NOT Q(2)));
D(1) <= (Q(0) OR ((NOT Q(1)) AND Q(2)));
D(0) <= (Q(1) AND (NOT Q(2)));

	PROCESS (KEY, D)
		BEGIN 
			if KEY(0)'event and KEY(0) = '0' then
				if SW(0) = '1' then Q <= "000";
				else Q <= D;
				END IF;
			END IF;
			LEDR  <= Q;
	END PROCESS;
END architecture;