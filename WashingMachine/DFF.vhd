----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:22:08 12/28/2020 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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



entity DFF is
	port(CLK	:	in	std_logic;
		  D	:	in std_logic;
		  reset	:	in	std_logic;
		  Q	:	out	std_logic);
end DFF;

architecture Behavioral of DFF is

begin
	D_FLIP_FLOP	:	process (CLK, reset)
		begin
			if(reset = '1') then
				Q <= '0';
			elsif(CLK'event and CLK='1') then
				Q <= D;
			end if;
		end process;

end Behavioral;

