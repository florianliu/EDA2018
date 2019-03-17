-- solved by rangekatsha
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity traffic_light is port(
    clk, rst_n: in std_logic;
    s1_r, s1_y, s1_g: out std_logic;
    s2l_r, s2l_y, s2l_g: out std_logic;
    s2s_r, s2s_y, s2s_g: out std_logic;
    s3_r, s3_y, s3_g: out std_logic
);
end traffic_light;

architecture behavioral of traffic_light is
    signal cur_state: std_logic_vector(2 downto 0) := "000";
    signal nxt_state: std_logic_vector(2 downto 0);
    signal cnt: integer range 0 to 150;
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            if rst_n = '0' then
                cnt <= 0;
            else
                if cnt = 150 then 
                    cnt <= 1;
                else cnt <= cnt + 1;
                end if;
            end if;
        end if;
    end process;

    process(cur_state, cnt)
    begin
        case cur_state is
            when "000" =>
                nxt_state <= "001";
            when "001" =>
                if cnt = 40 then
                    nxt_state <= "010";
                else nxt_state <= "001";
                end if;
            when "010" =>
                if cnt = 50 then
                    nxt_state <= "011";
                else nxt_state <= "010";
                end if;
            when "011" =>
                if cnt = 90 then
                    nxt_state <= "100";
                else nxt_state <= "011";
                end if;
            when "100" =>
                if cnt = 100 then
                    nxt_state <= "101";
                else nxt_state <= "100";
                end if;
            when "101" =>
                if cnt = 140 then
                    nxt_state <= "110";
                else nxt_state <= "101";
                end if;
            when "110" =>
                if cnt = 150 then 
                    nxt_state <= "001";
                else nxt_state <= "110";
                end if;
            when others => 
                nxt_state <= "000";
        end case;
    end process;
    
    process(clk)
    begin
        if clk'event and clk = '1' then
            if rst_n = '0' then
                cur_state <= "000";
            else cur_state <= nxt_state;
            end if;
        end if;
    end process;
    
    s1_g <= '1' when cur_state = "001" else '0';
    s1_y <= '1' when cur_state = "010" else '0';
    s1_r <= '0' when cur_state = "001" or cur_state = "010" else '1';
    
    s2l_g <= '1' when cur_state = "011" else '0';
    s2l_y <= '1' when cur_state = "100" else '0';
    s2l_r <= '0' when cur_state = "011" or cur_state = "100" else '1';

    s2s_g <= '1' when cur_state = "101" else '0';
    s2s_y <= '1' when cur_state = "110" else '0';
    s2s_r <= '0' when cur_state = "101" or cur_state = "110" else '1';

    s3_g <= '1' when cur_state = "101" else '0';
    s3_y <= '1' when cur_state = "110" else '0';
    s3_r <= '0' when cur_state = "101" or cur_state = "110" else '1';

end behavioral;