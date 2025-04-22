--------------------------------------------------------------------------------
-- File: Lab3P3.vhd 
-- Function: using a counter input, cycle through traffic lights pattens LR LY LG RR RY RG
-- Engineer: 
-- Last modified: Feb. 2022
-- TBD: 

library ieee;
use ieee.std_logic_1164.all;

entity Lab3P3 is

port( 
	count: in std_logic_vector ( 3 downto 0 );			-- 4-bit binary value input to give 16 cycles
	lights: out std_logic_vector ( 5 downto 0 ) );		-- Traffic Lights: LR LY LG RR RY RG	
end;

architecture behav of Lab3P3 is
					   
begin
	process (count)
	begin
		case count is
--Start describe your traffic patterns below
			when "0000" =>
				lights <= "100001";			 
			when "0001" =>
				lights <= "100001";			 
			when "0010" =>
				lights <= "100001";			
			when "0011" =>
				lights <= "100001";			  
			when "0100" =>
				lights <= "100010";			  
			when "0101" =>
				lights <= "100010";
			when "0110" =>
				lights <= "100100";			  
			when "0111" =>
				lights <= "100100";
			when "1000" =>
				lights <= "001100";
			when "1001" =>
				lights <= "001100";			
			when "1010" =>
				lights <= "001100";			
			when "1011" =>
				lights <= "001100";			 
			when "1100" =>
				lights <= "010100";			  
			when "1101" =>
				lights <= "010100";			  
			when "1110" =>
				lights <= "100100";			 
			when OTHERS =>
				lights <= "100100";			  
-- Continue below for all the possible count values and lights patterns

		end case;
	end process;
end behav;

