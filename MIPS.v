module MIPS(clk,reset,In,Op,alu_result,reg1,reg2,ReadData,out);
input clk,reset;
input [31:0]In;
output [31:26] Op;
output [31:0] alu_result;
output [31:0]reg1,reg2;
output [31:0]ReadData;
output [31:0] out;

wire Regdst, RegW, ALUSrc,MemW,MemR,MemtoReg;
wire [1:0] ALUop;
wire [2:0] ALUcon;

assign Op = In[31:26];

CONTROLLER con(
   .I(In[31:26]),
	.reset(reset),
	.Regdst(Regdst),
	.RegW(RegW),
	.ALUSrc(ALUSrc),
	.MemW(MemW),
	.MemR(MemR),
	.MemtoReg(MemtoReg),
	.ALUop(ALUop)
);

ALU_control alu(
	.ALUop(ALUop),
	.ALUcon(ALUcon)
);

  datapath dp(
    .I(In),
    .opcode(ALUcon),
    .RegW(RegW),
    .Regdst(Regdst),
    .MemR(MemR),
    .MemW(MemW),
    .MemtoReg(MemtoReg),
    .ALUSrc(ALUSrc),
    .clk(clk),
	 .alu_result(alu_result),
	 .reg1(reg1),
	 .reg2(reg2),
	 .ReadData(ReadData),
	 .out(out)
  );
endmodule