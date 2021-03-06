


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

	integer bits = 16;
	integer i, j, k = 2'b0;
	initial begin
	
		$dumpfile("test.vcd");		// create log file
		$dumpvars(0, alu64_tb);

		// Generate test numbers for A and B
		SelectO = 2'b10;
		SelectM = 3'b001;
		//16 bit add no carry
		Cin = 0;
		A = {16{1'b1}};
		B = 16'b1001;
		#10
		//16 bit add with carry	
		Cin = 1;
		#10
		//16 bit sub
		SelectO = 2'b11;
		B = 16'b11111;
		#10
		//16 bit xor
		B = {8{2'b01}};
		SelectO = 2'b01;
		#10
		//32 bit add no carry
		SelectM = 3'b011;
		Cin = 0;
		A = {32{1'b1}};
		B = 32'b1001;
		#10	
		//16 bit add with carry
		Cin = 1;
		#10
		//32 bit sub
		SelectO = 2'b11;
		B = 32'b11111;
		#10
		//32 bit xor
		B = {16{2'b01}};
		SelectO = 2'b01;	
		#10
		//64 bit add no carry
		SelectM = 3'b111;
		Cin = 0;
		A = {64{1'b1}};
		B = 64'b1001;
		#10	
		//64 bit add with carry
		Cin = 1;
		#10
		//64 bit sub
		SelectO = 2'b11;
		B = 64'b11111;
		#10
		//64 bit xor
		B = {32{2'b01}};
		SelectO = 2'b01;
	end

	initial		// Output to console 
		$monitor("At time %2t, A = %b B = %b Cin = %b S = %b Cout = %b",
			$time, A, B, Cin, S, Cout);
				

endmodule