
/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 1
*
*	adder1_tb.v				
* 
*	test bench for 1 bit adder
*	
*	based on schematic for MC14585B	
*		http://onsemi.com
**************************************************/
module adder1_tb;
	reg A; reg B; reg Cin;
	reg Xout;
	wire S, Cout;

	adder_1 add1(S, Cout, A, B, Cin);

	integer bits = 2;
	integer i, j, k = 2'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, adder1_tb);

		// Generate test numbers for A and B
		
		A = 0;
		B = 0;
		Cin = 0;
		for(i= 0; i < bits; i = i +1) begin
			A = i;	# 10;
			for(j = 0; j < bits; j = j +1) begin
				B = j;	#10;
				for(k = 0; k < bits; k = k +1) begin
					Cin = k;	#10;
				end
			end
		end
	end

	initial		// Output to console 
		$monitor("At time %2t, A = %u B = %u Cin = %d S = %d Cout = %d",
				$time, A, B, Cin, S, Cout);
				

endmodule