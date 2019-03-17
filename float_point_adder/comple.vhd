--solved by rangekatsha
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

entity comple is port(
	a: in std_logic_vector(24 downto 0);
	enable: in std_logic;
	bb: out std_logic_vector(24 downto 0));
end comple;

architecture behavioral of comple is 
	signal b: std_logic_vector(24 downto 0);
begin
	b(24) <= not a(24) when enable = '1' else
				a(24);
	b(23) <= not a(23) when enable = '1' else
				a(23);
	b(22) <= not a(22) when enable = '1' else
				a(22);
	b(21) <= not a(21) when enable = '1' else
				a(21);
	b(20) <= not a(20) when enable = '1' else
				a(20);
	b(19) <= not a(19) when enable = '1' else
				a(19);
	b(18) <= not a(18) when enable = '1' else
				a(18);		
	b(17) <= not a(17) when enable = '1' else
				a(17);	
	b(16) <= not a(16) when enable = '1' else
				a(16);	
	b(15) <= not a(15) when enable = '1' else
				a(15);	
	b(14) <= not a(14) when enable = '1' else
				a(14);	
	b(13) <= not a(13) when enable = '1' else
				a(13);	
	b(12) <= not a(12) when enable = '1' else
				a(12);	
	b(11) <= not a(11) when enable = '1' else
				a(11);	
	b(10) <= not a(10) when enable = '1' else
				a(10);	
	b(9) <= not a(9) when enable = '1' else
				a(9);	
	b(8) <= not a(8) when enable = '1' else
				a(8);	
	b(7) <= not a(7) when enable = '1' else
				a(7);	
	b(6) <= not a(6) when enable = '1' else
				a(6);	
	b(5) <= not a(5) when enable = '1' else
				a(5);	
	b(4) <= not a(4) when enable = '1' else
				a(4);	
	b(3) <= not a(3) when enable = '1' else
				a(3);	
	b(2) <= not a(2) when enable = '1' else
				a(2);	
	b(1) <= not a(1) when enable = '1' else
				a(1);	
	b(0) <= not a(0) when enable = '1' else
				a(0);	
	bb <= b + '1' when enable = '1' else
		  b;
end behavioral;