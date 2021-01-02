----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:51:04 12/28/2020 
-- Design Name: 
-- Module Name:    TFF - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TFF is
	port(CLK	:	in	std_logic;
		  T	:	in std_logic;
		  reset	:	in std_logic;
		  Q	:	inout	std_logic := '0');
end TFF;

architecture Behavioral of TFF is
	
begin
	T_FLIP_FLOP	:	process (CLK, reset)
		begin
			if(reset = '1') then
				Q <= '0';
			elsif(CLK'event and CLK='1') then
				if (T='1') then
					Q <= not Q;
				end if;
			end if;
		end process;

end Behavioral;

