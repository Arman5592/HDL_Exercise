----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:58:44 12/27/2020 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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


entity counter is
	port(Q	:	inout	std_logic_vector(3 downto 0);
			reset :	in	std_logic;
			CLK	:	in	std_logic);
end counter;

architecture Behavioral of counter is
	component TFF
		port(CLK	:	in	std_logic;
			  T	:	in	std_logic;
			  reset	:	in std_logic;
			  Q	:	inout std_logic);
	end component;
	
	
begin
	T0 : TFF port map(CLK,'1',reset,Q(0));
	T1 : TFF port map(Q(0),'1',reset,Q(1));
	T2 : TFF port map(Q(1),'1',reset,Q(2));
	T3 : TFF port map(Q(2),'1',reset,Q(3));
	
	
end Behavioral;

