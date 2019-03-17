--solved by rangekatsha
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_tb is
--  Port ( );
end test_tb;

architecture Behavioral of test_tb is
component test
Port (     a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC_VECTOR (5 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0));
end component;

           signal a : std_logic_vector(7 downto 0):="00000000";
           signal b,clk : std_logic:='1';
           signal en : std_logic_vector(5 downto 0);
           signal seg : std_logic_vector (7 downto 0);               
begin
ha:test port map
(
a=>a,clk=>clk,b=>b,en=>en,seg=>seg
);

a<="00010000";
b<='0';

haha:process
begin
  wait for 1 ns;
  clk<='1';
  wait for 1 ns;
  clk<='0';
 end process;


end Behavioral;
