----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:48:48 08/29/2020 
-- Design Name: 
-- Module Name:    full_adder - fa 
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

entity full_adder is
	port(A, B, cin : in std_logic;
		  sum, cout : out std_logic);
end full_adder;

architecture fa of full_adder is
	component half_adder is
		port(A, B : in std_logic;
			  sum, cout: out std_logic);
	end component;
	
	signal ha1_sum : std_logic;
	signal ha1_cout : std_logic;
	signal ha2_cout : std_logic;
	
begin
	ha1 : half_adder port map (A => A, B => B, sum => ha1_sum, cout => ha1_cout);
	ha2 : half_adder port map (A => ha1_sum, B => cin, sum => sum, cout => ha2_cout);
	cout <= ha1_cout or ha2_cout;

end fa;

