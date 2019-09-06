module SAPCOMPUTER(clk, reset, OUTPUTDATA);
	input wire clk, reset;
	output wire [7:0] OUTPUTDATA;

	wire CP, EP;
	wire [7:0] W;

	wire LM;
	wire [7:0] MARData;

	wire CE;

	wire LI, EI;
	wire [3:0] IRData;

	wire LA, EA;
	wire [7:0] ALUDataA;

	wire LB;
	wire [7:0] ALUDataB;

	wire SU, EU;
	wire LO;

	PROGRAMCOUNTER myPROGRAMCOUNTER(.clk(clk), .reset(reset), .CP(CP), .EP(EP), .W(W));
	MAR myMAR(.W(W), .clk(clk), .LM(LM), .MARData(MARData));
	RAM myRAM(.Address(MARData), .CE(CE), .W(W));
	IR myIR(.clk(clk), .LI(LI), .EI(EI), .W(W), .IRData(IRData), .WData(W));
	SAPCONTROLLER mySAPCONTROLLER(.clk(clk), .reset(reset), .IRData(IRData), .CP(CP), .EP(EP), .LM(LM), .CE(CE), .LI(LI), .EI(EI), .LA(LA), .EA(EA), .SU(SU), .EU(EU), .LB(LB), .LO(LO));
	REGISTERA myREGISTERA(.clk(clk), .LA(LA), .EA(EA), .W(W), .REGAData(W), .ALUDataA(ALUDataA));
	REGISTERB myREGISTERB(.clk(clk), .LB(LB), .W(W), .ALUDataB(ALUDataB));
	ADDERSUBTRACTOR myADDERSUBTRACTOR(.ALUDataA(ALUDataA), .ALUDataB(ALUDataB), .SU(SU), .EU(EU), .ALUResult(W));
	OUTPUTREG myOUTPUTREG(.clk(clk), .LO(LO), .W(W), .OUTPUTDATA(OUTPUTDATA));
endmodule
