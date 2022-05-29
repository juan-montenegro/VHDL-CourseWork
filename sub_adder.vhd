library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sub_adder is
	generic (n:integer:=8);
	port
	(
		A, B: in  signed(7 downto 0); CTRL: in  std_logic;
		SUM : out signed(7 downto 0); OVF: out std_logic
	);

end sub_adder;
architecture rtl of sub_adder is
	component full_adder
		port
		(
			A,B: in  signed (n-1 downto 0); CIN : in  std_logic;
			SUM: out signed (n-1 downto 0); COUT: out std_logic
		);
	end component;
	signal subs: signed (n-1 downto 0);
	begin
		GS: for k in n-1 downto 0 generate 
			subs(k) <= B(k) xor CTRL;
		end generate GS;
		FA: full_adder port map(A, subs, CTRL, SUM, OVF);
end rtl;