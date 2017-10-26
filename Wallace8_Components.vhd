library ieee;
use ieee.std_logic_1164.all;

package Wallace8_Components is

component mux is
	
	port (
		I0 : IN std_logic;
		I1 : IN std_logic;
		sel : IN std_logic;
		O : OUT std_logic
	);
	
end component;
component CarrySelectAdder is
port (
		A : IN std_logic_vector(10 downto 0);
		B : IN std_logic_vector(10 downto 0);
		Cout : OUT std_logic;
		SUM : OUT std_logic_vector(10 downto 0)
	);
end component;


component HalfAdder is
	
	port (
		A : IN std_logic;
		B : IN std_logic;

		Cout : OUT std_logic;
		Sum : OUT std_logic
	);
		
end component;

component FullAdder is
	
	port (
		A : IN std_logic;
		B : IN std_logic;
		Cin : IN std_logic;
		Cout : OUT std_logic;
		Sum : OUT std_logic
	);
		
end component;

component PartialProduct is
	port (
		A : IN std_logic_vector(7 downto 0);
		B: IN std_logic;
		C: OUT std_logic_vector(7 downto 0)
	);
end component;


component RippleCarry3 is
	port (
		A : IN std_logic_vector(2 downto 0);
		B : IN std_logic_vector(2 downto 0);

		Cout : OUT std_logic;

		Sum : OUT std_logic_vector(2 downto 0)

	);
end component;


component RippleCarry4 is
	port (
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);

		Cout0 : OUT std_logic;
		Cout1 : OUT std_logic;

		Sum0 : OUT std_logic_vector(3 downto 0);
		Sum1 : OUT std_logic_vector(3 downto 0)

	);
end component;



end package;