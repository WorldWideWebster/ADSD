/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 2
*
*	comparator_8.v				
* 
*	16 bit full adder
*	
**************************************************/

module adder_16(S, Cout, A, B, Cin);
	input [15:0]A; input [15:0]B; input Cin;		
	output [15:0]S; output Cout;		
	wire [15:0]C;

	adder_1 add0(S[0], C[1], A[0], B[0], Cin);
	adder_1 add1(S[1], C[2], A[1], B[1], C[1]);
	adder_1 add2(S[2], C[3], A[2], B[2], C[2]);
	adder_1 add3(S[3], C[4], A[3], B[3], C[3]);
	adder_1 add4(S[4], C[5], A[4], B[4], C[4]);
	adder_1 add5(S[5], C[6], A[5], B[5], C[5]);
	adder_1 add6(S[6], C[7], A[6], B[6], C[6]);
	adder_1 add7(S[7], C[8], A[7], B[7], C[7]);
	adder_1 add8(S[8], C[9], A[8], B[8], C[8]);
	adder_1 add9(S[9], C[10], A[9], B[9], C[9]);
	adder_1 add10(S[10], C[11], A[10], B[10], C[10]);
	adder_1 add11(S[11], C[12], A[11], B[11], C[11]);
	adder_1 add12(S[12], C[13], A[12], B[12], C[12]);
	adder_1 add13(S[13], C[14], A[13], B[13], C[13]);
	adder_1 add14(S[14], C[15], A[14], B[14], C[14]);
	adder_1 add15(S[15], Cout, A[15], B[15], C[15]);


endmodule
