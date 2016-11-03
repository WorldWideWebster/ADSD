/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 2
*
*	alu_16.v				
* 
*	16 bit ALU
*	 
**************************************************/

module alu_16(S, Cout, A, B, Cin, Select);
	input [15:0]A, B; 
	input [1:0]Select;
	input Cin;		
	output [15:0]S; output Cout;		
	wire [15:0]SubS, X, AddS;

	
	adder_16 add1(AddS, Cout, A, B, Cin);
	adder_16 add2SubS, Cout, A, ~B, 1);
	xor(X, A, B);

	case(Select)
		1: assign S = X;		// A XOR B
		2: assign S = AddS;		// A + B
		3: assign S = SubS;		// A - B
		default: assign S = ~A;		//not A
	endcase

endmodule
