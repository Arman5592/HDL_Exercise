----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:59:14 12/27/2020 
-- Design Name: 
-- Module Name:    washing_machine - Behavioral 
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

entity washing_machine is
	port(A	:	out	std_logic_vector(4 downto 0);
		Fin	:	out	std_logic;
		washmode	:	in	std_logic;
		R	:	in	std_logic;
		ttt :	out	std_logic_vector(3 downto 0);
		CLOCK	:	in	std_logic);
end washing_machine;

architecture Behavioral of washing_machine is
	component counter
		port(Q	:	inout	std_logic_vector(3 downto 0);
			reset :	in	std_logic;
			CLK	:	in	std_logic);
	end component;
	component	DFF
		port(CLK	:	in	std_logic;
		  D	:	in std_logic;
		  reset	:	in	std_logic;
		  Q	:	out	std_logic);
		end component;
	
	
	signal CLOCK_out	: std_logic;
	signal Q	: std_logic_vector(3 downto 0);
	
	signal cnt: integer:=0;
   signal temp : std_logic := '1';
	
	signal	finish	:	std_logic;
	signal	b_clk	:	std_logic;
begin
	process(CLOCK)
		begin
			
			if(CLOCK'event and CLOCK='1') then cnt <=cnt+1;
			if (cnt = 24000000) then temp <= NOT temp; cnt<=0;
			end if;
			end if;
		CLOCK_out <= temp;
	end process;
	 
	b_clk <= CLOCK_out and (not finish);
	binary_counter	:	counter port map(Q,R,b_clk);
	my_DFF			:	DFF port map(CLOCK_out,finish,R,Fin);	
	
	
	process(Q,washmode)
		begin
			if(washmode='0') then	
				--yani halate cold hastim.
				if(Q="1111" or Q="1110") then A<="00001";
				elsif (Q="1101" or Q="1100" or Q="1011") then A<="00100";
				elsif (Q="1010" or Q="1001") then A<="01000";
				elsif (Q="1000" or Q="0111") then A<="10000";
				else A<="00000";
				end if;
				
				if(Q="0110") then finish<='1';
				else finish<='0';
				end if;
			else
				--yani halate warm hastim.
				if(Q="1111" or Q="1110") then A<="00001";
				elsif (Q="1101" or Q="1100" or Q="1011") then A<="00010";
				elsif (Q="1010" or Q="1001" or Q="1000") then A<="00100";
				elsif (Q="0111" or Q="0110") then A<="01000";
				elsif (Q="0101" or Q="0100") then A<="10000";
				else A<="00000";
				end if;
				
				if(Q="0011") then finish<='1';
				else finish<='0';
				end if;
			end if;
		end process;
	
	--badesh bayad finish piadesazi beshe
	--badesh bayad reset piadesazi beshe
	ttt <= Q;
end Behavioral;

