--solved by rangekatsha
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity traffic_light_tb is 
end traffic_light_tb;

architecture behavioral of traffic_light_tb is
    signal clk : std_logic := '0';
    signal rst_n : std_logic;
    
    constant t : time := 0.2 ns;

    component traffic_light port(
        clk, rst_n: in std_logic;
        s1_r, s1_y, s1_g: out std_logic;
        s2l_r, s2l_y, s2l_g: out std_logic;
        s2s_r, s2s_y, s2s_g: out std_logic;
        s3_r, s3_y, s3_g: out std_logic);
    end component;

begin
    comp1: traffic_light port map(
        clk => clk, rst_n => rst_n
    );

    process
    begin
        wait for t / 2;
        clk <= '1';
        wait for t / 2;
        clk <= '0';
    end process;

    process
    begin
        rst_n <= '0';
        wait for 3 ns;
        rst_n <= '1';
        wait for 20 ns;
        rst_n <= '0';
        wait for 3 ns;
        rst_n <= '1';
        wait;
    end process;
end behavioral;