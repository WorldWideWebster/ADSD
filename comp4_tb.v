/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 1
*
*	comparator_4.v				
* 
*	test bench for 4 bit comparator
*	
*	based on schematic for MC14585B	
*		http://onsemi.com
**************************************************/
module comp4_tb;
	reg [3:0]A; reg [3:0]B;
	wire Lo, Eo, Go;

	comparator_4 comp4(Lo, Eo, Go, A, B, 0, 1, 0);

	
	integer i, j = 4'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, comp4_tb);

		// Generate test numbers for A and B
		A = 0;
		B = 0;
		for(i= 0; i < 8; i = i +1) begin
			A = i;	# 10;
			for(j = 0; j < 8; j = j +1) begin
				B = j;	#10;
			end
		end
	end

	initial		// Output to console 
		$monitor("At time %2t, A = %u B = %u L = %d E = %d G = %d",
				$time, A, B, Lo, Eo, Go);
				

endmodule
