/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 2
*
*	alu_64.v				
* 
*	64 bit ALU
*	 
**************************************************/

module alu_64(S, Cout, A, B, Cin, SelectM, SelectO);
	input [63:0]A; input [63:0]B; 
	input [1:0]SelectO; input [2:0] SelectM;
	input Cin;		
	output [63:0]S; output Cout;		
	wire [3:0] Carry;


	/*always@(*)
	if(SelectM[0]) begin	
	// 16 Bit ALU select
		alu_16 alu1(S[15:0], Carry[0], A[15:0], B[15:0], Cin, SelectO);
		if(SelectM[1]) begin
	// 32 Bit ALU select
			alu_16 alu2(S[16:31], Carry[1], A[16:31], B[16:31], Carry[0], SelectO);
			if(SelectM[2]) begin
	// 64 Bit ALU select
				alu_16 alu3(S[32:47], Carry[2], A[32:47], B[32:47], Carry[1], SelectO);
				alu_16 alu4(S[48:64], Carry[3], A[48:64], B[48:64], Carry[2], SelectO);
			end
		end
	end
*/
	alu_16 alu1(S[15:0], Carry[0], A[15:0], B[15:0], Cin, SelectO);
	alu_16 alu2(S[31:16], Carry[1], A[31:16], B[31:16], Carry[0], SelectO);
	alu_16 alu3(S[47:32], Carry[2], A[47:32], B[47:32], Carry[1], SelectO);
	alu_16 alu4(S[63:48], Carry[3], A[63:48], B[63:48], Carry[2], SelectO); 

/*
	always@(*)
	case(SelectM)
		3'b001: begin alu_16 alu1(S[15:0], Carry[0], A[15:0], B[15:0], Cin, SelectO); end
		3'b010:	begin 
			alu_16 alu1(S[15:0], Carry[0], A[15:0], B[15:0], Cin, SelectO);
			alu_16 alu2(S[31:16], Carry[1], A[31:16], B[31:16], Carry[0], SelectO);
			end
		3'b100: begin 
			alu_16 alu1(S[15:0], Carry[0], A[15:0], B[15:0], Cin, SelectO);
			alu_16 alu2(S[31:16], Carry[1], A[31:16], B[31:16], Carry[0], SelectO);
			alu_16 alu3(S[47:32], Carry[2], A[47:32], B[47:32], Carry[1], SelectO);
			alu_16 alu4(S[63:48], Carry[3], A[63:48], B[63:48], Carry[2], SelectO); 
			end
	endcase
	
*/	
	always@(*)
	case(SelectM)
		3'b001: begin  alu5=alu1; end
		/*3'b010:	begin 
			alu_16 alu1(S[15:0], Carry[0], A[15:0], B[15:0], Cin, SelectO);
			alu_16 alu2(S[31:16], Carry[1], A[31:16], B[31:16], Carry[0], SelectO);
			end
		3'b100: begin 
			alu_16 alu1(S[15:0], Carry[0], A[15:0], B[15:0], Cin, SelectO);
			alu_16 alu2(S[31:16], Carry[1], A[31:16], B[31:16], Carry[0], SelectO);
			alu_16 alu3(S[47:32], Carry[2], A[47:32], B[47:32], Carry[1], SelectO);
			alu_16 alu4(S[63:48], Carry[3], A[63:48], B[63:48], Carry[2], SelectO); 
			end*/
	endcase

	
endmodule
