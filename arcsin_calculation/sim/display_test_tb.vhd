library ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

entity display_test_tb is
end display_test_tb;

architecture behavior of display_test_tb is
component display_test
port (      ans : in std_logic_vector(8 downto 0);
            clk, flag, done : in std_logic;
            en : out std_logic_vector(5 downto 0);
            seg : out std_logic_vector(7 downto 0)
);
end component;

           signal ans : std_logic_vector(8 downto 0):="000000000";
           signal clk, flag, done : std_logic:='1';
           signal en : STD_LOGIC_VECTOR (5 downto 0);
           signal seg : std_logic_vector (7 downto 0);               
begin
ha:display_test port map
(
ans=>ans,clk=>clk,flag=>flag,done=>done,en=>en,seg=>seg
);

ans<="000001011";
done<='1';
clk_gen:process
begin
  wait for 1 ns;
  clk<='1';
  wait for 1 ns;
  clk<='0';
 end process;

flag<='1';

end behavior;
