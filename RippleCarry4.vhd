library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Wallace8_Components.all;

entity RippleCarry4 is
	port (
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);

		Cout0 : OUT std_logic;
		Cout1 : OUT std_logic;

		Sum0 : OUT std_logic_vector(3 downto 0);
		Sum1 : OUT std_logic_vector(3 downto 0)

	);
end RippleCarry4;

architecture RippleCarry4_arc of RippleCarry4 is
	signal C0,C1 : std_logic_vector(3 downto 0);
	signal H: std_logic:='1';
	signal L: std_logic:='0';
begin

F7 : FullAdder port map (A(0),B(0),L,C0(0),Sum0(0));
F8 : FullAdder port map (A(1),B(1),C0(0),C0(1),Sum0(1));
F9 : FullAdder port map (A(2),B(2),C0(1),C0(2),Sum0(2));
F10 : FullAdder port map (A(3),B(3),C0(2),C0(3),Sum0(3));


F11 : FullAdder port map (A(0),B(0),H,C1(0),Sum1(0));
F12 : FullAdder port map (A(1),B(1),C1(0),C1(1),Sum1(1));
F13 : FullAdder port map (A(2),B(2),C1(1),C1(2),Sum1(2));
F14 : FullAdder port map (A(3),B(3),C1(2),C1(3),Sum1(3));

Cout0<=C0(3);
Cout1<=C1(3);

end RippleCarry4_arc;