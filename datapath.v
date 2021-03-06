/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 3
*
*	datapath.v				
* 
*	datapath 12 bit adder + 12 bit comparator
*	A, B, C = inputs
*	A and B are added, 
*	Output S and Carry are generated, and fed 
*	into comparator with input C, which outputs
*	E[qual], G[reater than], or L[less than]
*	with A+B being the primary input, and C being
*	the numebr compared against
*	
**************************************************/
module datapath(E, G, L, A, B, C);
	output E, L, G;
	input [11:0] A, B, C;
	wire Carry;
	wire [11:0] S;


	adder_12 adder(S, Carry, A, B);
	comp_12 comp(E, G, L, S, C, Carry);

endmodule
