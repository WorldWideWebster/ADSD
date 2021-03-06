

/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 1
*
*	adder1_tb.v				
* 
*	test bench for 1 bit adder
*	
**************************************************/
module alu16_tb;
	reg [15:0]A; reg [15:0]B; reg [1:0] Select; reg Cin;
	wire [15:0]S; wire Cout;


	alu_16 alu(S, Cout, A, B, Cin, Select);

	integer bits = 16;
	integer i, j, k = 2'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, alu16_tb);

		// Generate test numbers for A and B
		Select = 2'b10;
		A = 16'b1;
		B = 16'b1;
		Cin = 0;
		for(i= 0; i < bits; i = i +1) begin
			A = 2**i;	# 10;
			for(j = 0; j < bits; j = j +1) begin
				B = 2**j;	#10;
				for(k = 0; k < bits; k = k +1) begin
					Cin = k % 2;	#10;
				end
			end
		end
	end

	initial		// Output to console 
		$monitor("At time %2t, A = %d B = %d Cin = %b S = %d Cout = %b",
				$time, A, B, Cin, S, Cout);
				

endmodule
