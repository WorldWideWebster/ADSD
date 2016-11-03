/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 3
*
*	datapath_tb.v				
* 
*	test bench for datapath
*	
**************************************************/
module datapath_tb;
	reg [11:0]A, B, C;
	wire L, E, G;

	datapath data(E, G, L, A, B, C);

	integer bits = 12;
	integer i, j, k = 2'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, datapath_tb);

		// Generate test numbers for A and B
		
		A = 12'b0;
		B = 12'b0;
		C = {12{1'b0}};

		for(i= 0; i <= bits; i = i +1) begin
			A = 2**i;	# 10;
			for(j = 0; j <= bits; j = j +1) begin
				B = 2**j;	#10;
				for(k = 0; k <= bits; k = k +1) begin
					C = 2**k;	#10;
				end

			end
		end
	end

	initial		// Output to console 
		$monitor("At time %2t, A = %b B = %b C = %b L = %b E = %b G = %b",
				$time, A, B, C, L, E, G);

endmodule
