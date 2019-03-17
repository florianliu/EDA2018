--solved by rangekatsha
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
--USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity float_point_adder is port(
	data1, data2: in std_logic_vector(31 downto 0);
	output_data: out std_logic_vector(31 downto 0));
end float_point_adder;

architecture behavioral of float_point_adder is 
	signal ae,be,ce: std_logic_vector(7 downto 0);
	signal am,bm: std_logic_vector(25 downto 0);
	signal cm: std_logic_vector(25 downto 0);
	signal ge,le,de: std_logic_vector(7 downto 0);
	signal sc: std_logic_vector(4 downto 0);
	signal gm,lm,alm,nm: std_logic_vector(25 downto 0);
	signal amm,bmm,cmm: std_logic_vector(25 downto 0);
	signal a,b: std_logic;
	signal agtb,rnd: std_logic;
	signal tmp: std_logic_vector(24 downto 0);
	signal tmpe: std_logic_vector(7 downto 0);
	signal tmpa,tmpb: std_logic_vector(25 downto 0);
	component pq port(
		a: in std_logic_vector(24 downto 0);
		b: out std_logic_vector(4 downto 0));
	end component;
	component comple port(
		a: in std_logic_vector(24 downto 0);
		enable: in std_logic;
		bb: out std_logic_vector(24 downto 0));
	end component;
begin
	ae <= data1(30 downto 23);
	be <= data2(30 downto 23);
	am(22 downto 0) <= data1(22 downto 0);
	bm(22 downto 0) <= data2(22 downto 0);
	am(23) <= '1';
	bm(23) <= '1';
	am(24) <= '0';
   bm(24) <= '0';
	am(25) <= data1(31);
	bm(25) <= data2(31);
	
	agtb <= '1' when ae >= be else
			 '0';
	ge <= ae when ae >= be else
			be;
	le <= be when ae >= be else
			ae;
	gm <= am when ae >= be else
			bm;
	lm <= bm when ae >= be else
			am;
	
	de <= ge - le;
	
	alm <= lm(25) & to_stdlogicVector( to_bitvector(lm(24 downto 0)) SRL conv_integer(de) );
	
	tmpa <= am when ae >= be else
			  alm;
	tmpb <= alm when ae >= be else
				bm;
	
	comp0_a: comple port map(a => tmpa(24 downto 0), enable => data1(31), bb => amm(24 downto 0));
	comp0_b: comple port map(a => tmpb(24 downto 0), enable => data2(31), bb => bmm(24 downto 0));
	amm(25) <= am(25);
	bmm(25) <= bm(25);
	
	cm <= amm + bmm;
	output_data(31) <= cm(25);
	comp0_out: comple port map(a => cm(24 downto 0), enable => cm(25), bb => cmm(24 downto 0));
	cmm(25) <= cm(25);
	
	comp1: pq port map(a => cmm(24 downto 0), b => sc);
	
	tmp <= to_stdlogicVector( to_bitvector(cmm(24 downto 0)) SRL 1 ) when sc > 23 else
			 to_stdlogicVector( to_bitvector(cmm(24 downto 0)) SLL conv_integer(23 - conv_integer(sc)) ) when sc < 23 else 
			 cmm(24 downto 0);
	
	tmpe <= ge + '1' when sc > 23 else 
			 ge - 23 + sc when sc < 23 else
			  ge;
	output_data(30 downto 23) <= tmpe;
	output_data(22 downto 0) <= tmp(22 downto 0); 
end behavioral;