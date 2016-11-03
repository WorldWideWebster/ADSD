/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 3 
*
*	adder_12.v				
* 
*	12 bit adder
*	
*	A, B, C = inputs
*	A and B are added, then output as S + Carry
*
**************************************************/





module adder_12(S, Cout, A, B);
	output reg[11:0] S;	// Sum
	output reg Cout;		// Carry Out
	input [11:0] A, B;	// Inputs
	reg [12:0] w;	

	always@* begin
		w = A + B;
		S = w[11:0];
		Cout = w[12];
	end
	
endmodule
	