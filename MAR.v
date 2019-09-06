module MAR(W, clk, LM, MARData);
	input [7:0] W;
	input clk, LM;
	output reg [7:0]MARData;

	
	always @(negedge clk)
		if (~LM)
			MARData <= W;
endmodule