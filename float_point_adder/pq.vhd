--solved by rangekatsha
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

entity pq is port(
	a: in std_logic_vector(24 downto 0);
	b: out std_logic_vector(4 downto 0));
end pq;

architecture behavioral of pq is 
begin
	b <= "11000" when a(24) = '1' else
		 "10111" when a(23) = '1' else
		 "10110" when a(22) = '1' else
		 "10101" when a(21) = '1' else
		 "10100" when a(20) = '1' else
		 "10011" when a(19) = '1' else
		 "10010" when a(18) = '1' else
		 "10001" when a(17) = '1' else
		 "10000" when a(16) = '1' else
		 "01111" when a(15) = '1' else
		 "01110" when a(14) = '1' else
		 "01101" when a(13) = '1' else
		 "01100" when a(12) = '1' else
		 "01011" when a(11) = '1' else
		 "01010" when a(10) = '1' else
		 "01001" when a(9) = '1' else
		 "01000" when a(8) = '1' else
		 "00111" when a(7) = '1' else
		 "00110" when a(6) = '1' else
		 "00101" when a(5) = '1' else
		 "00100" when a(4) = '1' else
		 "00011" when a(3) = '1' else
		 "00010" when a(2) = '1' else
		 "00001" when a(1) = '1' else 
		 "00000" when a(0) = '1';
end behavioral;