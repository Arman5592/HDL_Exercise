----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:40 08/01/2020 
-- Design Name: 
-- Module Name:    test1 - Behavioral 
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

entity test1 is
    Port ( ABC : in  STD_LOGIC_VECTOR(2 downto 0);
		     my_output : out STD_LOGIC_VECTOR(6 downto 0)
			 );
end test1;

architecture Behavioral of test1 is
begin
	with ABC select
		my_output <= "1111110" when "000",
						 "0110000" when "001",
						 "1101101" when "010",
						 "1111001" when "011",
						 "0110011" when "100",
						 "1011011" when "101",
						 "1011111" when "110",
						 "1110000" when "111",
						 "0000000" when others;

end Behavioral;

