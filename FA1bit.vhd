library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FA1bit is 
port
	(
		A,B,Cin: in std_logic;
		S,Cout: out std_logic
	);
end FA1bit;

architecture adder of FA1bit is 
	begin
		S <= (A xor B) xor Cin;
		Cout <= (A and B) or (B and Cin) or (Cin and A);
end adder;