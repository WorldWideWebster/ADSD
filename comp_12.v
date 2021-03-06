/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 3 
*
*	comp_12.v				
* 
*	12 bit comparator
*	
*	Inputs A, B are fed 
*	into comparator, which outputs
*	E[qual], G[reater than], or L[less than]
*	with A being the primary input, and B being
*	the numebr compared against
*
**************************************************/



module comp_12(E, G, L, A, B, Cin);
	output reg E, G, L;
	input [11:0] A, B;
	input Cin;
	reg [2:0] w = 3'b000;

	always @* begin
		if(Cin == 1) begin
			w = 3'b001;
		end
		else if(A > B) begin
			w = 3'b001;
		end
		else if(A == B) begin
			w = 3'b010;
		end
		else begin
			w = 3'b100;		
		end
		L = w[2];
		E = w[1];
		G = w[0];
	end
endmodule
