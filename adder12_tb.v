/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 3
*
*	adder12_tb.v				
* 
*	test bench for 12 bit adder
*	
**************************************************/
module adder12_tb;
	reg [11:0]A; reg [11:0]B; reg Cin;
	wire [11:0]S; wire Cout;

	adder_12 add12(S, Cout, A, B);

	integer bits = 12;
	integer i, j, k = 2'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, adder12_tb);

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
	end

	initial		// Output to console 
		$monitor("At time %2t, A = %b B = %b Cin = %b S = %b Cout = %b",
				$time, A, B, Cin, S, Cout);
				

endmodule
