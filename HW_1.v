//	Sean Webster
//	ADSD Homework 1
	
module MyInverter (
	MyInput, 
	MyOutput
	);

	input 	MyInput;
	output 	MyOutput;

	assign MyOutput = ~ MyInput;

endmodule

