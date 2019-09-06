module ADDERSUBTRACTOR(ALUDataA, ALUDataB, SU, EU, ALUResult);
	input [7:0] ALUDataA, ALUDataB;
	input SU, EU;
	output [7:0] ALUResult;

	reg [7:0] TEMPALU;

	always @(*)
		if (SU)
			TEMPALU = ALUDataA - ALUDataB;
		else
			TEMPALU = ALUDataA + ALUDataB;

	assign ALUResult = (EU == 1) ? TEMPALU : 8'bz;

endmodule
