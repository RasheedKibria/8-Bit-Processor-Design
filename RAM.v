module RAM(Address, CE, W);
	input [7:0] Address;
	input CE;
	output [7:0] W;

	reg [7:0] RAMDATA [0:15];
	integer i;

	initial begin
		for (i = 8; i < 16; i = i + 1)
			RAMDATA[i] = 8'b0;

		RAMDATA[0] = 8'b0000_0101; // LDA 5H //
		RAMDATA[1] = 8'b0001_0110; // ADD 6H //
		RAMDATA[2] = 8'b0010_0111; // SUB 7H //
		RAMDATA[3] = 8'b0011_1111; // OUT //
		RAMDATA[4] = 8'b0100_1111; // HLT //
		RAMDATA[5] = 8'd10;
		RAMDATA[6] = 8'd12;
		RAMDATA[7] = 8'd15;
	end

	assign W = (CE == 0) ? RAMDATA[Address] : 8'bz;
endmodule
