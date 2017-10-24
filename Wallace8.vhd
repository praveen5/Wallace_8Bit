library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Wallace8_Components.all;

entity Wallace8 is
	port (
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		P : OUT std_logic_vector(15 downto 0)
	);
end Wallace8;



architecture Wallace8_arc of Wallace8 is

	signal partial_product1 : std_logic_vector(7 downto 0);
	signal partial_product2 : std_logic_vector(7 downto 0);
	signal partial_product3 : std_logic_vector(7 downto 0);
	signal partial_product8 : std_logic_vector(7 downto 0);
	signal partial_product4 : std_logic_vector(7 downto 0);
	signal partial_product5 : std_logic_vector(7 downto 0);
	signal partial_product6 : std_logic_vector(7 downto 0);
	signal partial_product7 : std_logic_vector(7 downto 0);
	
	signal out1_0: std_logic;
	signal out1_1: std_logic;
	signal out1_2: std_logic_vector(1 downto 0);
	signal out1_3: std_logic_vector(2 downto 0);
	signal out1_4: std_logic_vector(2 downto 0);
	signal out1_5: std_logic_vector(3 downto 0);
	signal out1_6: std_logic_vector(4 downto 0);
	signal out1_7: std_logic_vector(5 downto 0);
	signal out1_8: std_logic_vector(5 downto 0);
	signal out1_9: std_logic_vector(5 downto 0);
	signal out1_10: std_logic_vector(3 downto 0);
	signal out1_11: std_logic_vector(3 downto 0);
	signal out1_12: std_logic_vector(3 downto 0);
	signal out1_13: std_logic_vector(1 downto 0);
	signal out1_14: std_logic;

	signal out2_0: std_logic;
	signal out2_1: std_logic;
	signal out2_2: std_logic;
	signal out2_3: std_logic_vector(1 downto 0);
	signal out2_4: std_logic_vector(1 downto 0);
	signal out2_5: std_logic_vector(2 downto 0);
	signal out2_6: std_logic_vector(2 downto 0);
	signal out2_7: std_logic_vector(3 downto 0);
	signal out2_8: std_logic_vector(3 downto 0);
	signal out2_9: std_logic_vector(3 downto 0);
	signal out2_10: std_logic_vector(3 downto 0);
	signal out2_11: std_logic_vector(2 downto 0);
	signal out2_12: std_logic_vector(2 downto 0);
	signal out2_13: std_logic_vector(1 downto 0);
	signal out2_14: std_logic_vector(1 downto 0);

	signal out3_0: std_logic;
	signal out3_1: std_logic;
	signal out3_2: std_logic;
	signal out3_3: std_logic;
	signal out3_4: std_logic_vector(1 downto 0);
	signal out3_5: std_logic_vector(1 downto 0);
	signal out3_6: std_logic_vector(1 downto 0);
	signal out3_7: std_logic_vector(2 downto 0);
	signal out3_8: std_logic_vector(2 downto 0);
	signal out3_9: std_logic_vector(2 downto 0);
	signal out3_10: std_logic_vector(2 downto 0);
	signal out3_11: std_logic_vector(2 downto 0);
	signal out3_12: std_logic_vector(2 downto 0);
	signal out3_13: std_logic_vector(2 downto 0);
	signal out3_14: std_logic_vector(1 downto 0);

	signal out4_0: std_logic;
	signal out4_1: std_logic;
	signal out4_2: std_logic;
	signal out4_3: std_logic;
	signal out4_4: std_logic;
	signal out4_5: std_logic_vector(1 downto 0);
	signal out4_6: std_logic_vector(1 downto 0);
	signal out4_7: std_logic_vector(1 downto 0);
	signal out4_8: std_logic_vector(1 downto 0);
	signal out4_9: std_logic_vector(1 downto 0);
	signal out4_10: std_logic_vector(1 downto 0);
	signal out4_11: std_logic_vector(1 downto 0);
	signal out4_12: std_logic_vector(1 downto 0);
	signal out4_13: std_logic_vector(1 downto 0);
	signal out4_14: std_logic_vector(1 downto 0);

	signal c, Carry: std_logic;
	signal To_Sum1, To_Sum2, SUM : std_logic_vector(10 downto 0);


begin

	P1: PartialProduct port map (A,B(0),partial_product1);
	P2: PartialProduct port map (A,B(1),partial_product2);
	P3: PartialProduct port map (A,B(2),partial_product3);
	P4: PartialProduct port map (A,B(3),partial_product4);
	P5: PartialProduct port map (A,B(4),partial_product5);
	P6: PartialProduct port map (A,B(5),partial_product6);
	P7: PartialProduct port map (A,B(6),partial_product7);
	P8: PartialProduct port map (A,B(7),partial_product8);


-- *********************************** STAGE I *********************************************

	out1_0<=partial_product1(0);

	S11 : Halfadder port map(partial_product1(1),partial_product2(0),out1_2(0),out1_1);
	S12 : FullAdder port map(partial_product1(2),partial_product2(1),partial_product3(0),out1_3(0),out1_2(1)); 
	S13 : FullAdder port map(partial_product1(3),partial_product2(2),partial_product3(1),out1_4(0),out1_3(1));
	out1_3(2)<=partial_product4(0);

	S14_1 : FullAdder port map(partial_product1(4),partial_product2(3),partial_product3(2),out1_5(0),out1_4(1));
	S14_2 : Halfadder port map(partial_product4(1),partial_product5(0),out1_5(1),out1_4(2));

	S15_1 : FullAdder port map(partial_product1(5),partial_product2(4),partial_product3(3),out1_6(0),out1_5(2));
	S15_2 : FullAdder port map(partial_product4(2),partial_product5(1),partial_product6(0),out1_6(1),out1_5(3));

	S16_1 : FullAdder port map(partial_product1(6),partial_product2(5),partial_product3(4),out1_7(0),out1_6(2));
	S16_2 : FullAdder port map(partial_product4(3),partial_product5(2),partial_product6(1),out1_7(1),out1_6(3));
	out1_6(4)<=partial_product7(0);

	S17_1 : FullAdder port map(partial_product1(7),partial_product2(6),partial_product3(5),out1_8(0),out1_7(2));
	S17_2 : FullAdder port map(partial_product4(4),partial_product5(3),partial_product6(2),out1_8(1),out1_7(3));
	out1_7(4)<=partial_product7(1);
	out1_7(5)<=partial_product8(0);

	S18_2 : FullAdder port map(partial_product4(5),partial_product5(4),partial_product6(3),out1_9(1),out1_8(3));
	S18_1 : Halfadder port map(partial_product2(7),partial_product3(6),out1_9(0),out1_8(2));
	out1_8(4)<=partial_product7(2);
	out1_8(5)<=partial_product8(1);

	S19 : FullAdder port map(partial_product4(6),partial_product5(5),partial_product6(4),out1_10(0),out1_9(3));
	out1_9(2)<=partial_product3(7);
	out1_9(4)<=partial_product7(3);
	out1_9(5)<=partial_product8(2);

	S110 : FullAdder port map(partial_product4(7),partial_product5(6),partial_product6(5),out1_11(0),out1_10(1));
	out1_10(2)<=partial_product7(4);
	out1_10(3)<=partial_product8(3);

	S111 : Halfadder port map(partial_product5(7),partial_product6(6),out1_12(0),out1_11(1));
	out1_11(2)<=partial_product7(5);
	out1_11(3)<=partial_product8(4);	

	out1_12(1)<=partial_product6(7); out1_12(2)<=partial_product7(6); out1_12(3)<=partial_product8(5);

	out1_13(0)<=partial_product7(7); out1_13(1)<=partial_product8(6);

	out1_14<=partial_product8(7);

-- *********************************** STAGE II *********************************************

	out2_0<=out1_0;
	out2_1<=out1_1;

	S22 : Halfadder port map (out1_2(0),out1_2(1), out2_3(0),out2_2);
	S23 : FullAdder port map (out1_3(0),out1_3(1),out1_3(2),out2_4(0),out2_3(1));
	S24 : FullAdder port map (out1_4(0),out1_4(1),out1_4(2),out2_5(0),out2_4(1));
	S25 : FullAdder port map (out1_5(0),out1_5(1),out1_5(2),out2_6(0),out2_5(1));
	out2_5(2)<=out1_5(3);
	S26_1 : FullAdder port map (out1_6(0),out1_6(1),out1_6(2),out2_7(0),out2_6(1));
	S26_2 : Halfadder port map(out1_6(3),out1_6(4),out2_7(1),out2_6(2));

	S27_1 : FullAdder port map (out1_7(0),out1_7(1),out1_7(2),out2_8(0),out2_7(2));
	S27_2 : FullAdder port map (out1_7(3),out1_7(4),out1_7(5),out2_8(1),out2_7(3));

	S28_1 : FullAdder port map (out1_8(0),out1_8(1),out1_8(2),out2_9(0),out2_8(2));
	S28_2 : FullAdder port map (out1_8(3),out1_8(4),out1_8(5),out2_9(1),out2_8(3));

	S29_1 : FullAdder port map (out1_9(0),out1_9(1),out1_9(2),out2_10(0),out2_9(2));
	S29_2 : FullAdder port map (out1_9(3),out1_9(4),out1_9(5),out2_10(1),out2_9(3));

	S210 : FullAdder port map (out1_10(0),out1_10(1),out1_10(2),out2_11(0),out2_10(2));
	out2_10(3)<=out1_10(3);

	S211 : FullAdder port map (out1_11(0),out1_11(1),out1_11(2),out2_12(0),out2_11(1));
	out2_11(2)<=out1_11(3);

	S212 : FullAdder port map (out1_12(0),out1_12(1),out1_12(2),out2_13(0),out2_12(1));
	out2_12(2)<=out1_12(3);

	S213 : Halfadder port map(out1_13(0),out1_13(1),out2_14(0),out2_13(1));
	out2_14(1)<=out1_14;

-- *********************************** STAGE III *********************************************

	out3_0<=out2_0;
	out3_1<=out2_1;
	out3_2<=out2_2;

	S33 : Halfadder port map (out2_3(0),out2_3(1), out3_4(0),out3_3);
	S34 : Halfadder port map (out2_4(0),out2_4(1), out3_5(0),out3_4(1));

	S35 : FullAdder port map (out2_5(0),out2_5(1),out2_5(2),out3_6(0),out3_5(1));
	S36 : FullAdder port map (out2_6(0),out2_6(1),out2_6(2),out3_7(0),out3_6(1));
	S37 : FullAdder port map (out2_7(0),out2_7(1),out2_7(2),out3_8(0),out3_7(1));
	out3_7(2)<=out2_7(3);
	S38 : FullAdder port map (out2_8(0),out2_8(1),out2_8(2),out3_9(0),out3_8(1));
	out3_8(2)<=out2_8(3);
	S39 : FullAdder port map (out2_9(0),out2_9(1),out2_9(2),out3_10(0),out3_9(1));
	out3_9(2)<=out2_9(3);
	S310 : FullAdder port map (out2_10(0),out2_10(1),out2_10(2),out3_11(0),out3_10(1));
	out3_10(2)<=out2_10(3);

	S311 : Halfadder port map (out2_11(0),out2_11(1), out3_12(0),out3_11(1));
	out3_11(2)<=out2_11(2);

	S312 : Halfadder port map (out2_12(0),out2_12(1), out3_13(0),out3_12(1));
	out3_12(2)<=out2_12(2);

	out3_13(1)<=out2_13(0); out3_13(2)<=out2_13(1);
	out3_14(0)<=out2_14(0); out3_14(1)<=out2_14(1);

-- *********************************** STAGE IV *********************************************

	out4_0<=out3_0;
	out4_1<=out3_1;
	out4_2<=out3_2;
	out4_3<=out3_3;

	S44 : Halfadder port map (out3_4(0),out3_4(1), out4_5(0),out4_4);
	S45 : Halfadder port map (out3_5(0),out3_5(1), out4_6(0),out4_5(1));
	S46 : Halfadder port map (out3_6(0),out3_6(1), out4_7(0),out4_6(1));

	S47 : FullAdder port map (out3_7(0),out3_7(1),out3_7(2),out4_8(0),out4_7(1));
	S48 : FullAdder port map (out3_8(0),out3_8(1),out3_8(2),out4_9(0),out4_8(1));
	S49 : FullAdder port map (out3_9(0),out3_9(1),out3_9(2),out4_10(0),out4_9(1));
	S410 : FullAdder port map (out3_10(0),out3_10(1),out3_10(2),out4_11(0),out4_10(1));
	S411 : FullAdder port map (out3_11(0),out3_11(1),out3_11(2),out4_12(0),out4_11(1));
	S412 : FullAdder port map (out3_12(0),out3_12(1),out3_12(2),out4_13(0),out4_12(1));
	S413 : FullAdder port map (out3_13(0),out3_13(1),out3_13(2),out4_14(0),out4_13(1));

	S414 : HalfAdder port map (out3_14(0),out3_14(1),c,out4_14(1));

	To_Sum1(10)<=c; To_Sum1(9)<=out4_14(0); To_Sum1(8)<=out4_13(0); 
	To_Sum1(7)<=out4_12(0); To_Sum1(6)<=out4_11(0); To_Sum1(5)<=out4_10(0); 
	To_Sum1(4)<=out4_9(0); To_Sum1(3)<=out4_8(0); To_Sum1(2)<=out4_7(0); 
	To_Sum1(1)<=out4_6(0); To_Sum1(0)<=out4_5(0); 

	To_Sum2(10)<='0'; To_Sum2(9)<=out4_14(1); To_Sum2(8)<=out4_13(1); 
	To_Sum2(7)<=out4_12(1); To_Sum2(6)<=out4_11(1); To_Sum2(5)<=out4_10(1); 
	To_Sum2(4)<=out4_9(1); To_Sum2(3)<=out4_8(1); To_Sum2(2)<=out4_7(1); 
	To_Sum2(1)<=out4_6(1); To_Sum2(0)<=out4_5(1); 
-- *********************************** Final Adder *********************************************
	CA : CarrySelectAdder port map (To_Sum1, To_Sum2, Carry, SUM);
	P(15 downto 5)<=SUM;
	P(4)<=out4_4; P(3)<=out4_3; P(2)<=out4_2; P(1)<=out4_1; P(0)<=out4_0;

end Wallace8_arc;