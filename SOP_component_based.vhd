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
entity triple_and is
	port(A,B,C : in std_logic;
		  ans : out std_logic);
end entity;

architecture and_arch of triple_and is
	begin
		ans <= A and B and C;
	end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity triple_or is
	port(A,B,C : in std_logic;
		  ans : out std_logic);
end entity;

architecture or_arch of triple_or is
	begin
		ans <= A or B or C;
	end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv1 is
	port(A : in std_logic;
		  ans : out std_logic);
end entity;

architecture inv1_arch of inv1 is
	begin
		ans <= not A;
	end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test1 is
    Port ( ABC : in  STD_LOGIC_VECTOR(2 downto 0);
		     ans : out STD_LOGIC
			 );
end test1;

architecture Behavioral of test1 is
	signal An, Bn, Cn, minterm0, minterm2, minterm6 : std_logic;
	
	component inv1
		port (A : in std_logic;
			   ans : out std_logic);
	end component;
	
	component triple_and
		port (A,B,C : in std_logic;
			   ans : out std_logic);
	end component;
	
	component triple_or
		port (A,B,C : in std_logic;
			   ans : out std_logic);
	end component;
	
begin
	not1 : inv1 port map (A => ABC(0), ans => An);
	not2 : inv1 port map (A => ABC(1), ans => Bn);
	not3 : inv1 port map (A => ABC(2), ans => Cn);
	
	and_1 : triple_and port map(A=> An, B=> Bn, C=> Cn, ans=> minterm0);
	and_2 : triple_and port map(A=> An, B=> ABC(1), C=> Cn, ans=> minterm2);
	and_3 : triple_and port map(A=> ABC(0), B=> ABC(1), C=> Cn, ans=> minterm6);
	
	or_1 : triple_or port map(A=>minterm0, B=>minterm2, C=>minterm6, ans=>ans);
	
end Behavioral;

