/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 1
*
*	comparator_4.v				
* 
*	4 chained 1 bit comparators
*	
*	based on schematic for MC14585B	
*		http://onsemi.com
**************************************************/

module comparator_4(Lo, Eo, Go, A, B, Li, Ei, Gi);
	input [3:0] A; input [3:0] B; 	//4 bit inputs 
	input Li, Gi, Ei;		//A<B, A=B, A>B inputs
	output Lo, Go, Eo;		//A<B, A=B, A>B outputs from chip
	wire [3:0]L; wire [3:0]E; wire [3:0]G;	//A<B, A=B, A>B outputs from individual comparators
	wire s0, s1, s2, s3, s4, s5, s6, s7, s8;

	// Set up individual 1 bit converters	
	comparator_1 comp0(A[0], B[0], L[0], E[0], G[0]);
	comparator_1 comp1(A[1], B[1], L[1], E[1], G[1]);
	comparator_1 comp2(A[2], B[2], L[2], E[2], G[2]);
	comparator_1 comp3(A[3], B[3], L[3], E[3], G[3]);

	// Gate logic from schematic
	
	or X1(s3, E[3], L[2]);
	or X2(s2, E[3], E[2], L[1]);
	or X3(s1, E[3], E[2], E[1], L[0]);
	or X4(s0, E[3], E[2], E[1], E[0], ~Li);
	nor X5(s4, E[3], E[2], E[1], E[0], ~Ei);
	nand X6(s5, L[3], s0, s1, s2, s3);
	nor X7(Go, s5, s4);
	
	
	assign Eo = s4;
	assign Lo = s5;

endmodule
