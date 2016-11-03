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
	input [15:0]A; input [15:0]B; 
	input [1:0]Select;
	input Cin;		
	output reg [15:0]S; output reg Cout;		
	wire [15:0] SubS; wire[ 15:0] X; wire [16:0] AddS;

	
	//adder_16 add1(AddS, Cout, A, B, Cin);
	//adder_16 add2(SubS, Cout, A, ~B, 1);
	assign X = A ^ B;
	assign AddS = A + B + Cin;
	assign SubS = A - B;
	
	always@*
	case(Select)
		// XOR
		2'b01: 	begin
			S = X;
			Cout = 0;
			end
		// ADD
		2'b10:  begin
			S = AddS[15:0];
			Cout = AddS[16];
			end
		// SUBTRACT
		2'b11:  begin
			S = SubS;
			Cout = 0;
			end
	endcase

endmodule
