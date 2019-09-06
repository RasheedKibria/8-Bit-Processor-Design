module REGISTERA(clk, LA, EA, W, REGAData, ALUDataA);
	input clk, LA, EA;
	input [7:0] W;
	output [7:0] REGAData, ALUDataA;
	
	reg [7:0] TEMPREGA;

	always @(negedge clk)
		if (LA == 0)
			TEMPREGA <= W;

	assign ALUDataA = TEMPREGA;
	assign REGAData = (EA == 1) ? TEMPREGA : 8'bz;

endmodule
