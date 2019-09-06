module REGISTERB(clk, LB, W, ALUDataB);
	input clk, LB;
	input [7:0] W;
	output reg [7:0] ALUDataB;

	always @(negedge clk)
		if (LB == 0)
			ALUDataB <= W;
endmodule
