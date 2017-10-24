library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
	port (
		A : IN std_logic;
		B : IN std_logic;

		Cout : OUT std_logic;
		Sum : OUT std_logic
	);
end HalfAdder;

architecture Halfadder_arc of Halfadder is

begin
	Cout<= A and B;
	Sum <= (A and (not B)) or ((not A) and B);

end Halfadder_arc;