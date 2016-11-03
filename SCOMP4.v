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

module scomp_4(Lo, Eo, Go, A, B, Li, Ei, Gi);
	input [3:0]A; input [3:0]B; 	//4 bit inputs 
	reg [3:0]A_; reg [3:0]B_;
	input Li, Gi, Ei;		//A<B, A=B, A>B inputs
	output Lo, Go, Eo;		//A<B, A=B, A>B outputs from chip
	wire s0;
	
	always@(A or B)
	begin
		if(A[3]) begin
			A_ = (~A + 4'b0001);
		end
		else begin A_ = A;
		end

		if(B[3]) begin
			B_ = (~B + 4'b0001);
		end
		else begin B_= B;
		end
			
	end	
				
	comparator_4 comp1(Lo, Go, Eo, B_, A_, Li, Ei, Gi);


endmodule
