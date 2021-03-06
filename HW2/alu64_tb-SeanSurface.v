


/*************************************************
*	Sean Webster
*	ADSD - Summer 2016 - Martin Margala
*	Homework 2
*
*	alu64_tb.v				
* 
*	test bench for 64 bit ALU
*	
**************************************************/
module alu64_tb;
	reg [63:0]A; reg [63:0]B; reg [1:0] SelectO; reg [2:0] SelectM; reg Cin;
	wire [63:0]S; wire Cout;


	alu_64 alu(S, Cout, A, B, Cin, SelectM, SelectO);

	integer bits = 64;
	integer i, j, k = 2'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, alu64_tb);

		// Generate test numbers for A and B
		SelectO = 2'b10;
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
		$monitor("At time %2t, A = %b B = %b Cin = %b S = %b Cout = %b",
				$time, A, B, Cin, S, Cout);
				

endmodule