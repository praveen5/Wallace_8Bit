library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port (
		I0 : IN std_logic;
		I1 : IN std_logic;
		sel : IN std_logic;
		O : OUT std_logic
	);
end mux;

architecture mux_arc of mux is


begin

O <= (sel and I1) or ((not sel) and I0);

end mux_arc;