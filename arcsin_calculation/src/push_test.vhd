----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/11/26 18:35:15
-- Design Name: 
-- Module Name: push_test - Behavioral
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

entity push_test is
    Port ( rst : out STD_LOGIC := '0';
           c : in std_logic;
           b : in STD_LOGIC;
           clk : in STD_LOGIC);
end push_test;

architecture Behavioral of push_test is

begin
PROCESS(clk, b) 
  VARIABLE COUNT1 :INTEGER RANGE 0 TO 100000; 
BEGIN 
IF b = '1' THEN 
   IF RISING_EDGE(clk) THEN
    IF COUNT1<1000 THEN COUNT1:=COUNT1+1; 
    ELSE COUNT1:=COUNT1; END IF; 
    IF COUNT1<=999 THEN rst <='1'; 
    ELSE rst<='0'; END IF; 
  END IF; 
ELSE COUNT1:=0;
     rst<='1';
END IF; 
END PROCESS ;

end Behavioral;
