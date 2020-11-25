----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:56:41 09/11/2020 
-- Design Name: 
-- Module Name:    asd2 - Behavioral 
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

entity asd2 is
	port(seven_seg	:	out	std_logic_vector (6 downto 0);
		  CLOCK	:	in std_logic);
		  
		  
end asd2;

architecture Behavioral of asd2 is
	component TFF
		port(CLK	:	in	std_logic;
			  T	:	in	std_logic;
			  Q	:	inout std_logic);
	end component;
	
	signal counter: integer:=0;
   signal temp : std_logic := '1';
	signal CLOCK_out	: std_logic;
	signal Q : std_logic_vector ( 3 downto 0);
	 
begin
	process(CLOCK)
		begin
			
			if(CLOCK'event and CLOCK='1') then counter <=counter+1;
			if (counter = 24000000) then temp <= NOT temp; counter<=0;
			end if;
			end if;
		CLOCK_out <= temp;
	end process;
	
	
	T0 : TFF port map(CLOCK_out,'1',Q(0));
	T1 : TFF port map(Q(0),'1',Q(1));
	T2 : TFF port map(Q(1),'1',Q(2));
	T3 : TFF port map(Q(2),'1',Q(3));
		
	with Q select
		seven_seg <= "1111110" when "1111",
						 "0110000" when "1110",
						 "1101101" when "1101",
						 "1111001" when "1100",
						 "0110011" when "1011",
						 "1011011" when "1010",
						 "1011111" when "1001",
						 "1110000" when "1000",
						 "1111111" when "0111",
						 "1111011" when "0110",
						 "1110111" when "0101", --10
						 "0011111" when "0100", --11
						 "0001101" when "0011", --12
						 "0111101" when "0010", --13
						 "1001111" when "0001", --14 
						 "1000111" when "0000", --15
						 "0000000" when others;
	
end Behavioral;

