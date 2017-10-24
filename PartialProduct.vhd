library ieee;
use ieee.std_logic_1164.all;
entity PartialProduct is
	port (
		A : IN std_logic_vector(7 downto 0);
		B: IN std_logic;
		C: OUT std_logic_vector(7 downto 0)
	);
end PartialProduct;

architecture PartialProduct_arc of PartialProduct is

begin
	C(7)<=(A(7) and B);
	C(6)<=(A(6) and B);
	C(5)<=(A(5) and B);
	C(3)<=(A(3) and B);
	C(2)<=(A(2) and B);
	C(1)<=(A(1) and B);
	C(4)<=(A(4) and B);
	C(0)<=(A(0) and B);	

end PartialProduct_arc;