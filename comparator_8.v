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

module comparator_8(Lo, Eo, Go, A, B, Li, Ei, Gi);
	input [7:0]A; input [7:0]B; 	//4 bit inputs 
	input Li, Gi, Ei;		//A<B, A=B, A>B inputs
	output Lo, Go, Eo;		//A<B, A=B, A>B outputs from chip
	wire s0, s1, s2;

	comparator_4 comp1(s0, s1, s2, A[3:0], B[3:0], Li, Ei, Gi);
	comparator_4 comp2(Lo, Eo, Go, A[7:4], B[7:4], s0, s1, s2);

endmodule
