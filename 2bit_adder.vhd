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
	port (a_0,a_1,b_0,b_1 : in std_logic;
			out_0,out_1,out_2 : out std_logic);
end entity;


architecture Behavioral of test1 is
	component full_adder is
		port(A, B, cin : in std_logic;
		     sum, cout : out std_logic);
	end component;
	
	signal fa0_cout : std_logic;
begin
	fa0 : full_adder port map(a_0, b_0, '0', out_0, fa0_cout);
	fa1 : full_adder port map(a_1, b_1, fa0_cout, out_1, out_2);
end Behavioral;

