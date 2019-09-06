module PROGRAMCOUNTER(clk, reset, CP, EP, W);
	input clk, reset, CP, EP;
	output [7:0]W;
	reg [4:0] count;

	always @(negedge clk, negedge reset)
		if (reset == 0)
			count <= 4'b0;
		else begin
			if (CP)
				count <= count + 1;
		end

	assign W = (EP == 1) ? {4'b0, count} : 8'bz;
endmodule
