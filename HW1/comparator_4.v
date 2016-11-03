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

module comparator_4(A, B, AlBi, AeBi, AgBi, AlBo, AeBo, AgBo);
	input A[3:0], B[3:0]; 		//4 bit inputs 
	input Li, Gi, Ei;		//A<B, A=B, A>B inputs
	output Lo, Go, Eo;		//A<B, A=B, A>B outputs from chip
	output L[3:0], E[3:0], G[3:0]	//A<B, A=B, A>B outputs from individual comparators
	wire s0, s1, s2, s3, s4, s5;

	// Set up individual 1 bit converters
	for(i = 0; i <3; i = i +1)
		comparator_1(A[i], B[i], L[i], G[i], E[i]);
	end

	or X1(s3, E[3], L[2]);
	or X2(s2, E[3], E[2], L[1]);
	or X3(s1, E[3], E[2], E[1], L[0]);
	or X4(s0, E[3], E[2], E[1], E[0], Li);
	nor X5(s4, E[3], E[2], E[1], E[0], Ei);
	nand X6(s5, L[3], s0, s1, s2, s3);
	nor X7(Go, s5, s4);
	
	assign Eo = s4;
	assign Lo = s5;
	
	
	

endmodule
