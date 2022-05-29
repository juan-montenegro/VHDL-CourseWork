library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity full_adder is
	generic (n:integer:=8);
	port
	(
		A, B: in signed (n-1 downto 0); CIN: in std_logic;
		SUM: out signed (n-1 downto 0); COUT: out std_logic
	);
end full_adder;

architecture rtl of full_adder is 
	component FA1bit
		port
		(
			A,B,Cin: in std_logic;
			S,Cout: out std_logic
		);
	end component;
	signal CAR: std_logic_vector(n downto 0);
	begin 
		CAR(0) <= CIN;
		GK: for k in n-1 downto 0 generate 
			FA: FA1bit port map (A(k), B(k), CAR(k), SUM(k), CAR(k+1));
		end generate GK;
		COUT <= CAR(n);
end rtl;			