/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 2
*
*	adder_1.v				
* 
*	1 bit full adder
*	
**************************************************/

module adder_1(S, Cout, A, B, Cin);
	input A, B, Cin;		
	output S, Cout;
	wire s1, s2, s3;		

	xor(s1, A, B);
	xor(S, s1, Cin);
	and(s2, Cin, s1);
	and(s3, A, B);
	or(Cout, s2, s3);

endmodule
