----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:04:16 11/23/2020 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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

