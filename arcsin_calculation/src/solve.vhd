----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/11/24 10:55:57
-- Design Name: 
-- Module Name: solve - Behavioral
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
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity solve is
    Port (  a : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in std_logic;
           rst : in std_logic;
           --control : in STD_LOGIC_VECTOR (3 downto 0);
           flag : out std_logic;
           do: out std_logic;
           ans : out STD_LOGIC_VECTOR (8 downto 0));
end solve;

architecture Behavioral of solve is
    --signal div_clk : std_logic := '0';
    --signal div_cnt : std_logic_vector(14 downto 0) := "000000000000000";
    signal angle1, angle2, angle3, angle4, angle5, angle6, angle7, angle8, angle9 : std_logic_vector(17 downto 0);
    signal last_angle : std_logic_vector(17 downto 0);
    signal val_of_angle : std_logic_vector(10 downto 0);
    signal x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9 : std_logic_vector(15 downto 0);
    signal tryx0, tryy0, tryx1, tryy1, tryx2, tryy2, tryx3, tryy3, tryx4, tryy4, tryx5, tryy5, tryx6, tryy6, tryx7, tryy7, tryx8, tryy8, tryx9, tryy9: std_logic_vector(15 downto 0);
    signal tmpx, tmpy: std_logic_vector(15 downto 0);
    signal tmp : std_logic_vector(15 downto 0);
    signal tmpvalid : std_logic;
    signal u1, u2, u3, u4, u5, u6, u7, u8, u9: std_logic_vector(15 downto 0);
    signal uu1, uu2, uu3, uu4, uu5, uu6, uu7, uu8, uu9: std_logic_vector(15 downto 0);
    signal cur_ans : std_logic_vector(17 downto 0) := "000000000000000000";
    type state_type is (init, do1, do2, do3, do4, do5, do6, do7, do8, do9, do10, finish);
    signal cur_state, nxt_state : state_type;
    signal control : std_logic_vector(3 downto 0);
    signal div_cnt : integer range 0 to 150;
    signal div_clk : std_logic := '0';
    signal f1, f2, f3, f4, f5, f6, f7, f8, f9: std_logic;
    signal done: std_logic;
begin
    process (clk)
    begin
        if clk'event and clk = '1' then
            if rst = '0' then
                div_cnt <= 0;
            else 
                if div_cnt = 100 then
                    div_clk <= not div_clk;
                    div_cnt <= 0;
                else 
                    div_cnt <= div_cnt + 1;
                end if;
            end if;
       end if;
    end process;
    
    -- next state 
    process (cur_state)
    begin
    --if clk'event and clk = '1' then
        case cur_state is 
            when init =>
                nxt_state <= do1;
            when do1 =>
                nxt_state <= do2;
            when do2 =>
                nxt_state <= do3;
            when do3 =>
                nxt_state <= do4;
            when do4 =>
                nxt_state <= do5;
            when do5 => 
                nxt_state <= do6;
            when do6 => 
                nxt_state <= do7;
            when do7 => 
                nxt_state <= do8;
            when do8 => 
                nxt_state <= do9;
            when do9 =>
                nxt_state <= finish;
            when finish =>
                nxt_state <= do1;
            when others =>
                nxt_state <= init;
        end case; 
    --end if;
    end process;
    
    process(clk)
    begin
        if clk'event and clk = '1' then
        if cur_state = init then
            done <= '0';
        else
            if done = '0' then
                if cur_state = finish then
                    done <= '1';    
                end if;
            end if;
        end if;
        end if;
    end process;
    
    process (div_clk)
    begin
        if rst = '0' then
            cur_state <= init;
        else
            if div_clk'event and div_clk = '1' then
                 cur_state <= nxt_state;
            end if;
        end if;
    end process;
    
    --generate control signal
    control(3) <= '1' when cur_state = do8 or cur_state = do9 or cur_state = finish else '0';
    control(2) <= '1' when cur_state = do4 or cur_state = do5 or cur_state = do6 or cur_state = do7 else '0';
    control(1) <= '1' when cur_state = do2 or cur_state = do3 or cur_state = do6 or cur_state = do7 or cur_state = finish else '0';
    control(0) <= '1' when cur_state = do1 or cur_state = do3 or cur_state = do5 or cur_state = do7 or cur_state = do9 else '0';
        
    
    flag <= a(7);-- record positive of negative;
    tmpy <= '0' & a(6 downto 0) & "00000000";
    
    process(a)
    begin
        --if clk'event and clk = '1' then
        case a(6 downto 0) is
            when "0000000" =>
                tmpx <= "0010000000000000";
            when "0000001" =>
                tmpx <= "0001111111111011";
            when "0000010" =>
                tmpx <= "0001111111101111";
            when "0000011" =>
                tmpx <= "0001111111011011";
            when "0000100" =>
                tmpx <= "0001111110111111";
            when "0000101" =>
                tmpx <= "0001111110011011";
            when "0000110" =>
                tmpx <= "0001111101101110";
            when "0000111" =>
                tmpx <= "0001111100111001";
            when "0001000" =>
                tmpx <= "0001111011111011";
            when "0001001" =>
                tmpx <= "0001111010110101";
            when "0001010" =>
                tmpx <= "0001111001100101";
            when "0001011" =>
                tmpx <= "0001111000001100";
            when "0001100" =>
                tmpx <= "0001110110101010";
            when "0001101" =>
                tmpx <= "0001110100111101";
            when "0001110" =>
                tmpx <= "0001110011000110";
            when "0001111" =>
                tmpx <= "0001110001000100";
            when "0010000" =>
                tmpx <= "0001101110110110";
            when "0010001" =>
                tmpx <= "0001101100011100";
            when "0010010" =>
                tmpx <= "0001101001110101";
            when "0010011" =>
                tmpx <= "0001100110111111";
            when "0010100" =>
                tmpx <= "0001100011111010";
            when "0010101" =>
                tmpx <= "0001100000100101";
            when "0010110" =>
                tmpx <= "0001011100111100";
            when "0010111" =>
                tmpx <= "0001011000111111";
            when "0011000" =>
                tmpx <= "0001010100101010";
            when "0011001" =>
                tmpx <= "0001001111111001";
            when "0011010" =>
                tmpx <= "0001001010100111";
            when "0011011" =>
                tmpx <= "0001000100101100";
            when "0011100" =>
                tmpx <= "0000111101111101";
            when "0011101" =>
                tmpx <= "0000110110000111";
            when "0011110" =>
                tmpx <= "0000101100100010";
            when "0011111" =>
                tmpx <= "0000011111101111";
            when others =>
                tmpx <= "0000000000000000";
        end case;
        --end if;
    end process;
    
    angle1 <= "000110010010000111";
    angle2 <= "000011101101011000";
    angle3 <= "000001111101011011";
    angle4 <= "000000111111101010";
    angle5 <= "000000011111111101";
    angle6 <= "000000001111111111";
    angle7 <= "000000000111111111";
    angle8 <= "000000000011111111";
    angle9 <= "000000000001111111";
    
    --calculate based on control signal
    process(clk)
    begin
        if clk'event and clk = '1' then
        case control is
        when "0000" =>
            x0 <= tmpx;
            y0 <= tmpy;
            f1 <= '0';
            f2 <= '0';
            f3 <= '0';
            f4 <= '0';
            f5 <= '0';
            f6 <= '0';
            f7 <= '0';
            f8 <= '0';
            f9 <= '0';
            cur_ans <= "000000000000000000";
        when "0001" =>
            --angle <= "000110010010000111";
            if y0 > x0 then
                tryx1 <= x0 + y0;-- right shift
                tryy1 <= y0 - x0;
                if f1 = '0' then
                    cur_ans <= cur_ans + angle1;
                    f1 <= '1';
                end if;
            else
                tryx1 <= x0;
                tryy1 <= y0;
            end if;
                --cur_ans <= cur_ans + angle;
        when "0010" => 
            y1 <= tryy1;
            x1 <= tryx1;
            u1 <= y1(15) & '0' & y1(14 downto 1);
            uu1 <= x1(15) & '0' & x1(14 downto 1);
            if y1 > uu1 then
                tryx2 <= x1 + u1;
                tryy2 <= y1 - uu1; 
                if f2 = '0' then
                    cur_ans <= cur_ans + angle2;
                    f2 <= '1';
                end if;
            else
                tryy2 <= y1;
                tryx2 <= x1;
            end if;
        when "0011" =>
            x2 <= tryx2;
            y2 <= tryy2;
            u2 <= y2(15) & "00" & y2(14 downto 2);
            uu2 <= x2(15) & "00" & x2(14 downto 2);
            if y2 > uu2 then
                tryx3 <= x2 + u2;
                tryy3 <= y2 - uu2; 
                if f3 = '0' then
                    cur_ans <= cur_ans + angle3;
                    f3 <= '1';
                end if;
            else
                tryx3 <= x2;
                tryy3 <= y2;
            end if;
        when "0100" =>
            x3 <= tryx3;
            y3 <= tryy3;
            u3 <= y3(15) & to_stdlogicVector( to_bitvector(y3(14 downto 0)) SRL 3 );
            uu3 <= x3(15) & to_stdlogicVector( to_bitvector(x3(14 downto 0)) SRL 3 );
            if y3 > uu3 then
                tryx4 <= x3 + u3;
                tryy4 <= y3 - uu3;    
                if f4 = '0' then
                    cur_ans <= cur_ans + angle4;
                    f4 <= '1';
                end if;
            else
                tryy4 <= y3;
                tryx4 <= x3;
            end if;
        when "0101" =>
            x4 <= tryx4;
            y4 <= tryy4;
            u4 <= y4(15) & to_stdlogicVector( to_bitvector(y4(14 downto 0)) SRL 4 );
            uu4 <= x4(15) & to_stdlogicVector( to_bitvector(x4(14 downto 0)) SRL 4 );
            if y4 > uu4 then
                tryx5 <= x4 + u4;
                tryy5 <= y4 - uu4;
                if f5 = '0' then
                    cur_ans <= cur_ans + angle5;
                    f5 <= '1';
                end if;
            else
                tryx5 <= x4;
                tryy5 <= y4;
            end if;
        when "0110" =>
            x5 <= tryx5;
            y5 <= tryy5;
            u5 <= y5(15) & to_stdlogicVector( to_bitvector(y5(14 downto 0)) SRL 5 );
            uu5 <= x5(15) & to_stdlogicVector( to_bitvector(x5(14 downto 0)) SRL 5 );
            if y5 > uu5 then
                tryx6 <= x5 + u5;
                tryy6 <= y5 - uu5;
                if f6 = '0' then
                    cur_ans <= cur_ans + angle6;
                    f6 <= '1';
                end if;
            else 
                tryx6 <= x5;
                tryy6 <= y5;
            end if;
        when "0111" =>
            x6 <= tryx6;
            y6 <= tryy6;
            u6 <= y6(15) & to_stdlogicVector( to_bitvector(y6(14 downto 0)) SRL 6 );
            uu6 <= x6(15) & to_stdlogicVector( to_bitvector(x6(14 downto 0)) SRL 6 );
            if y6 > uu6 then
                tryx7 <= x6 + u6;
                tryy7 <= y6 - uu6;
                if f7 = '0' then
                    cur_ans <= cur_ans + angle7;
                    f7 <= '1';
                end if;
            else 
                tryx7 <= x6;
                tryy7 <= y6;
            end if;
        when "1000" =>
            x7 <= tryx7;
            y7 <= tryy7;
            u7 <= y7(15) & to_stdlogicVector( to_bitvector(y7(14 downto 0)) SRL 7 );
            uu7 <= x7(15) & to_stdlogicVector( to_bitvector(x7(14 downto 0)) SRL 7 );
            if y7 > uu7 then
                tryx8 <= x7 + u7;
                tryy8 <= y7 - uu7;
                if f8 = '0' then 
                    cur_ans <= cur_ans + angle8;
                    f8 <= '1';
                end if;
            else 
                tryx8 <= x7;
                tryy8 <= y7;
            end if;
        when "1001" =>
            x8 <= tryx8;
            y8 <= tryy8;
            u8 <= y8(15) & to_stdlogicVector( to_bitvector(y8(14 downto 0)) SRL 8 );
            uu8 <= x8(15) & to_stdlogicVector( to_bitvector(x8(14 downto 0)) SRL 8 );
            if y8 > uu8 then
                tryx9 <= x8 + u8;
                tryy9 <= y8 - uu8;
                if f9 = '0' then
                    cur_ans <= cur_ans + angle9;
                    f9 <= '1';
                end if;
            else 
                tryx9 <= x8;
                tryy9 <= y8;
            end if;
        when "1010" =>
            ans <= cur_ans(17 downto 9);
        when others =>
            ans <= "000000000";
        end case;
        end if;
    end process;
    
    do <= done;
end Behavioral;
