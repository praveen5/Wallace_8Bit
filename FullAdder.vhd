library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port (
		A : IN std_logic;
		B : IN std_logic;
		Cin : IN std_logic;

		Cout : OUT std_logic;
		Sum : OUT std_logic
	);
end FullAdder;



architecture FullAdder_arc of FullAdder is
begin
	Cout <=(A and B) or (Cin and (A or B));
	Sum <= ((not A) and (not B) and Cin) or ((not A) and B and (not Cin)) or (A and B and Cin) or (A and (not B) and (not Cin));

end FullAdder_arc;

