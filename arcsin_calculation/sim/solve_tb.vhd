----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/11/25 20:22:13
-- Design Name: 
-- Module Name: solve_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity solve_tb is
--  Port ( );
end solve_tb;

architecture Behavioral of solve_tb is
    component solve 
    Port (  a : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in std_logic;
           rst : in std_logic;
           --control : in STD_LOGIC_VECTOR (3 downto 0);
           flag : out std_logic;
           ans : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    signal a : std_logic_vector(7 downto 0);
    signal clk, rst, flag : std_logic;
    signal ans : std_logic_vector(8 downto 0);
begin
    rs : solve port map(a => a, clk => clk, rst => rst, flag => flag, ans => ans);
    process
    begin
        clk <= '0';
        wait for 1 ns;
        clk <= '1';
        wait for 1ns;
    end process;
    
    process 
    begin
        rst <= '0';
        wait for 1.5ns;
        rst <= '1';
        wait;
    end process;
    a <= "00001000";
end Behavioral;
