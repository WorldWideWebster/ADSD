/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 1
*
*	1_comparator.v				
*
*	A single 1 bit comparator comprised of 2 inverters 
*	and 3 NAND gates
*	
*	2 inputs: 	A and B
*	3 outputs:	
**************************************************/

module comparator_1(A, B, L, E, G);
	input A, B;	// 2 bits to be compared
	output L, E, G;	// 3 possible outputs
	wire s1, s2;	// connecting wires for inverters

	not X1 (s1, A);	// create inverter
	not X2 (s2, B);
	nand X3 (L, s1, B);
	nand X4 (G, s2, A);
	nand X5 (E, L, G);


endmodule
