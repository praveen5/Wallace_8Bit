library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Wallace8_Components.all;

entity RippleCarry3 is
	port (
		A : IN std_logic_vector(2 downto 0);
		B : IN std_logic_vector(2 downto 0);

		Cout : OUT std_logic;

		Sum : OUT std_logic_vector(2 downto 0)

	);
end RippleCarry3;

architecture RippleCarry3_arc of RippleCarry3 is

	signal C0 : std_logic_vector(2 downto 0);

begin

F1 : Halfadder port map (A(0),B(0),C0(0),Sum(0));
F2 : FullAdder port map (A(1),B(1),C0(0),C0(1),Sum(1));
F3 : FullAdder port map (A(2),B(2),C0(1),C0(2),Sum(2));


Cout<=C0(2);

end RippleCarry3_arc;