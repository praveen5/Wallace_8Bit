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


	SUM(6) <= (C1 and Sum2_1(3)) or ((not C1) and Sum2_0(3));
	SUM(5) <= (C1 and Sum2_1(2)) or ((not C1) and Sum2_0(2));
	SUM(4) <= (C1 and Sum2_1(1)) or ((not C1) and Sum2_0(1));
	SUM(3) <= (C1 and Sum2_1(0)) or ((not C1) and Sum2_0(0));


	C2_3 <= (C1 and C2_1) or ((not C1) and C2_0);

	SUM(10) <= (C2_3 and Sum3_1(3)) or ((not C2_3) and Sum3_0(3));
	SUM(9) <= (C2_3 and Sum3_1(2)) or ((not C2_3) and Sum3_0(2));
	SUM(8) <= (C2_3 and Sum3_1(1)) or ((not C2_3) and Sum3_0(1));
	SUM(7) <= (C2_3 and Sum3_1(0)) or ((not C2_3) and Sum3_0(0));
	


	Cout <= (C2_3 and C3_1) or ((not C2_3) and C3_0);
end CarrySelectAdder_arc;