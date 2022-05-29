library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity twocompsum is 
	generic (n:integer:=8);
	port 
	(
		A, B: in  std_logic_vector(7 downto 0);
		CTRL: in  std_logic;
		SUM : out std_logic_vector(7 downto 0); 	
		OVF : out std_logic
	);
end twocompsum;

architecture rtl of twocompsum is 
	component sub_adder
		port
		(
			A, B: in  signed(7 downto 0); CTRL: in  std_logic;
			SUM : out std_logic_vector(7 downto 0); OVF: out std_logic
		);
	end component;
	signal 	SA, SB: signed(n-1 downto 0);
	begin
		SA <= signed(A);
		SB <= signed(B);
		FA: sub_adder  port map(SA, SB, CTRL, SUM, OVF);
end rtl;