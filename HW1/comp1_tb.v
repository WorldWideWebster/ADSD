/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 1
*
*	comp1_tb.v				
* 
*	test bench for 1 bit comparator
*	
*	based on schematic for MC14585B	
*		http://onsemi.com
**************************************************/
module comp1_tb;
	reg A; reg B;
	wire L, E, G;

	comparator_1 comp1(A, B, L, E, G);
	integer i, j = 4'b0;
	initial begin
	
		$dumpfile("test.vcd");
		$dumpvars(0, comp1_tb);

		A = 0;
		B = 0;
		for(i= 0; i < 2; i = i +1) begin
			A = i;	# 10;
			for(j = 0; j < 2; j = j +1) begin
				B = j;	#10;
			end
		end
	end

	initial
		$monitor("At time %2t, A = %u B = %u L = %d E = %d G = %d",
				$time, A, B, ~L, ~E, ~G);
				

endmodule
