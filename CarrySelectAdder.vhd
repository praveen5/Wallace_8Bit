library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Wallace8_Components.all;

entity CarrySelectAdder is
	port (
		A : IN std_logic_vector(10 downto 0);
		B : IN std_logic_vector(10 downto 0);

		Cout : OUT std_logic;
		SUM : OUT std_logic_vector(10 downto 0)
	);
end CarrySelectAdder;

architecture CarrySelectAdder_arc of CarrySelectAdder is

	signal C1, C2_0, C2_1, C2_3, C3_0, C3_1 : std_logic;
	signal Sum1: std_logic_vector(2 downto 0);
	signal Sum2_0, Sum2_1, Sum3_0, Sum3_1 : std_logic_vector(3 downto 0);

begin

	RC1 : RippleCarry3 port map (A(2 downto 0), B(2 downto 0), C1, Sum1);
	RC2 : RippleCarry4 port map (A(6 downto 3), B(6 downto 3), C2_0, C2_1, Sum2_0, Sum2_1);
	RC3 : RippleCarry4 port map (A(10 downto 7), B(10 downto 7), C3_0, C3_1, Sum3_0, Sum3_1);

	SUM(2 downto 0) <= Sum1;

	M1 : mux port map (Sum2_0(3),Sum2_1(3),C1,SUM(6));
	M2 : mux port map (Sum2_0(2),Sum2_1(2),C1,SUM(5));
	M3 : mux port map (Sum2_0(1),Sum2_1(1),C1,SUM(4));
	M4 : mux port map (Sum2_0(0),Sum2_1(0),C1,SUM(3));
	
	M5 : mux port map (C2_0,C2_1,C1,C2_3);

	M6 : mux port map (Sum3_0(3),Sum3_1(3),C2_3,SUM(10));
	M7 : mux port map (Sum3_0(2),Sum3_1(2),C2_3,SUM(9));
	M8 : mux port map (Sum3_0(1),Sum3_1(1),C2_3,SUM(8));
	M9 : mux port map (Sum3_0(0),Sum3_1(0),C2_3,SUM(7));
	
	M10 : mux port map (C3_0,C3_1,C2_3,Cout);
	

end CarrySelectAdder_arc;