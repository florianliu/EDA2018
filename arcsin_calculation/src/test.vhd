----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/11/27 16:01:57
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
    port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC_VECTOR (5 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0));
end test;

architecture Behavioral of test is
component push_test
    port ( rst : out STD_LOGIC;
           c : in std_logic;
           b : in STD_LOGIC;
           clk : in STD_LOGIC); 
end component;

component solve 
    port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in std_logic;
           rst : in std_logic;
           flag : out std_logic;
           ans : out STD_LOGIC_VECTOR (8 downto 0);
           do : out std_logic);
end component;

component display_test
    port (
           ans : in std_logic_vector(8 downto 0);
           clk, flag, do : in std_logic;
           en: out std_logic_vector(5 downto 0);
           seg : out std_logic_vector(7 downto 0));
end component;  
signal rst, flag, do : std_logic;
signal ans : std_logic_vector(8 downto 0);
begin
i1: push_test
    port map( rst => rst, b => b, clk => clk, c => '1');
i2: solve
    port map( a => a, clk => clk, rst => rst, flag => flag, ans => ans, do => do);
i3: display_test
    port map( ans => ans, clk => clk, flag => flag, do => do, en => en, seg => seg);
end Behavioral;