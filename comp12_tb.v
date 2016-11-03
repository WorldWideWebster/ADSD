/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 3
*
*	comp12_tb.v				
* 
*	test bench for 12 bit comparator
*	
**************************************************/
module comp12_tb;
	reg [11:0]A; reg [11:0]B; reg Cin;
	wire L, E, G;

	comp_12 add12(E, G, L, A, B, Cin);

	integer bits = 12;
	integer i, j, k = 2'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, comp12_tb);

		// Generate test numbers for A and B
		
		A = 12'b0;
		B = 12'b0;
		Cin = 0;
		for(i= 0; i <= bits; i = i +1) begin
			A = 2**i;	# 10;
			for(j = 0; j <= bits; j = j +1) begin
				B = 2**j;	#10;

			end
		end
		Cin = 1;
	end

	initial		// Output to console 
		$monitor("At time %2t, A = %b B = %b Cin = %b L = %b E = %b G = %b",
				$time, A, B, Cin, L, E, G);
				

endmodule