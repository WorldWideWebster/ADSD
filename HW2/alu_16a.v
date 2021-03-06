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
	wire [15:0]S; output Cout;		
	wire [15:0]SubS, X, AddS;

	
	adder_16 add1(AddS, Cout, A, B, Cin);
	adder_16 add2(SubS, Cout, A, ~B, 1);
	xor(X, A, B);
	always @(Select) 
		case (Select)
			2'b01: assign S = X;
			2'b10: assign S = AddS;
			2'b11: assign S = SubS;
		endcase


endmodule
