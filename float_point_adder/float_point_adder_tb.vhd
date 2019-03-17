--solved by rangekatsha
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity float_point_adder_tb is
--  Port ( );
end float_point_adder_tb;

architecture Behavioral of float_point_adder_tb is
component float_point_adder port(
	data1, data2: in std_logic_vector(31 downto 0);
	output_data: out std_logic_vector(31 downto 0));
end component;
signal data1, data2, output_data: std_logic_vector(31 downto 0);
begin
    test: float_point_adder port map(data1 => data1, data2 => data2, output_data => output_data);
    process
    begin
        data1 <= "00011011010101111110000011111010";
        data2 <= "00011011010101111110000011111010";
        wait for 5ns;
        data1 <= "00011011010101111110000011111010";
        data2 <= "10010011010101111110000011111010";
        wait for 5ns;
        data1 <= "01000100000000000000000000000000";
        data2 <= "01000100011111000000000000000000";
        wait for 5ns;
        data1 <= "11000000000000000000000000000000";
        data2 <= "11000000011111000000000000000000";
    end process;
end Behavioral;
