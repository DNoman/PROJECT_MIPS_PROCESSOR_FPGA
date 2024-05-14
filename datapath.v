module datapath (I,opcode,RegW,Regdst,MemR,MemW,MemtoReg,ALUSrc,clk,alu_result,reg1,reg2,ReadData,out);
input [31:0] I;
input [2:0]opcode;
input Regdst, RegW, ALUSrc, MemW, MemR, MemtoReg;
input clk ;
output [31:0]alu_result;
output [31:0]reg1,reg2;
output [31:0]ReadData;
output [31:0]out;

wire gnd;
wire [31:0] outreg1, outreg2;
wire [4:0] mux11;
wire [31:0] mux33, mux22;
wire [31:0] ex32;
wire [31:0] ALUout, SRAMout;


assign ReadData = mux33;
assign ex32 = {{16{I[15]}}, I[15:0]}; 
assign alu_result = ALUout;
assign reg1 = outreg1;
assign reg2 = outreg2;



mux_2_to_1_5bit mux1 (
.in0(I[15:11]),
.in1(I[20:16]),
.sel(Regdst),
.out(mux11)
);

register_file register1 (
.ReadAddress1 (I[25:21]),
.ReadAddress2 (I[20:16]),
.WriteAddress (mux11),
.WriteData (mux33),
.ReadData1 (outreg1),
.ReadData2 (outreg2),
.ReadWriteEn (RegW),
.clk(clk)
);

mux_2_to1_32bit mux2 (
.in0(ex32),
.in1(outreg2),
.sel(ALUSrc),
.out(mux22)
);

ALU ALU1 (
.q(ALUout),
.a(outreg1),
.b(mux22),
.opcode(opcode),
.ovf(gnd)
);

SRAM SRAM1 (
.clk(clk),
.Address(ALUout),
.WriteData(outreg2),
.ReadData(SRAMout),
.WriteEn(MemW),
.ReadEn(MemR),
.out(out)
);

mux_2_to1_32bit mux3 (
.in0(SRAMout),
.in1(ALUout),
.sel(MemtoReg),
.out(mux33)
);

endmodule