`timescale 1ns/1ps
module CONTROLLER_testbench();
reg [5:0]I;
wire Regdst, RegW, ALUSrc,MemW,MemR,MemtoReg;
wire [1:0] ALUop;
reg reset;

CONTROLLER con1(.I(I), .Regdst(Regdst),.RegW(RegW), .ALUSrc(ALUSrc), .MemW(MemW) 
,.MemR(MemR),.MemtoReg(MemtoReg),.ALUop(ALUop),.reset(reset) );

initial
begin
	I = 0;
	reset = 1;
	#5 reset = 0;
	#10 I = 1;
	#10 I = 3;
	#10 I = 5;
	#10 I = 7;
	#10 I = 2;
	#10 I = 4;
	#10;
end
endmodule