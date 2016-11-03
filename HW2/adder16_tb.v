
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
module adder16_tb;
	reg [15:0]A; reg [15:0]B; reg Cin;
	wire [15:0]S; wire Cout;

	adder_16 add16(S, Cout, A, B, Cin);

	integer bits = 16;
	integer i, j, k = 2'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, adder16_tb);

		// Generate test numbers for A and B
		
		A = 16'b0;
		B = 16'b0;
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
