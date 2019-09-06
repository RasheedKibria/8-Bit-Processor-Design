module IR(clk, LI, EI, W, IRData, WData);
	input clk, LI, EI;
	input [7:0] W;
	output [3:0] IRData;
	output [7:0] WData;

	reg [7:0] IRTEMP;

	always @(negedge clk)
		if (LI == 0)
			IRTEMP <= W;

	assign WData = (EI == 0) ? {4'b0, IRTEMP[3:0]} : 8'bz;
	assign IRData = IRTEMP[7:4];
endmodule