module OUTPUTREG(clk, LO, W, OUTPUTDATA);
	input clk, LO;
	input [7:0] W;
	output reg [7:0] OUTPUTDATA;

	always @(negedge clk)
		if (LO == 0)
			OUTPUTDATA <= W;

endmodule