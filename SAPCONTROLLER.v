module SAPCONTROLLER(clk, reset, IRData, CP, EP, LM, CE, LI, EI, LA, EA, SU, EU, LB, LO);
	input [3:0] IRData;
	input clk, reset;
	output CP, EP, LM, CE, LI, EI, LA, EA, SU, EU, LB, LO;
	reg [3:0] y, Y;
	parameter [3:0] S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111, S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, S11 = 4'b1011, S12 = 4'b1100;
	
	always @(negedge reset, posedge clk)
		if (reset == 0)
			y <= S0;
		else
			y <= Y;


	always @(IRData, y)
	begin
		case(y)
			S0: begin
				if (IRData == 4'd4)
					Y = S0;
				else
					Y = S1;
			end

			S1: Y = S2;

			S2: Y = S3;

			S3: begin
				case (IRData)
					4'd0: Y = S4;
					4'd1: Y = S6;
					4'd2: Y = S9;
					4'd3: Y = S12;
					4'd4: Y = S0;
				endcase
			end

			S4: Y = S5;

			S5: Y = S1;

			S6: Y = S7;

			S7: Y = S8;

			S8: Y = S1;

			S9: Y = S10;

			S10: Y = S11;

			S11: Y = S1;

			S12: Y = S1;
		endcase
	end
	

	assign CP = (y == S2);
	assign EP = (y == S1);
	assign LM = ~((y == S1) | (y == S4) | (y == S6) | (y == S9));
	assign CE = ~((y == S3) | (y == S5) | (y == S7) | (y == S10));
	assign LI = ~(y == S3);
	assign EI = ~((y == S4) | (y == S6) | (y == S9));
	assign LA = ~((y == S5) | (y == S8) | (y == S11));
	assign EA = (y == S12);
	assign SU = (y == S11);
	assign EU = ((y == S8) | (y == S11));
	assign LB = ~((y == S7) | (y == S10));
	assign LO = ~(y == S12);
endmodule
