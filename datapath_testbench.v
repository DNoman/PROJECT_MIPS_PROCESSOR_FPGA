`timescale 1ns/1ps

module datapath_testbench;

  // Inputs
  reg [31:0] I;
  reg [2:0] opcode;
  reg RegW, Regdst, MemR, MemW, MemtoReg, ALUSrc;
  reg clk;
  wire [31:0] alu_result;
  wire [31:0]reg1,reg2;
  wire [31:0]ReadData;
  wire [31:0] out;

  // Instantiate datapath module
  datapath dp(
    .I(I),
    .opcode(opcode),
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

  // Clock generation
always #5 clk = ~clk;
  // Testbench stimulus
  initial begin
    // Test case 1
	 clk = 0;
    I = 32'b000000_00010_00001_00000_00000000000;
	 Regdst = 0;
	 RegW = 1;
	 MemR = 0;
    MemW = 1;
	 ALUSrc = 1;
	 opcode = 3'b101;
	 MemtoReg = 1;
    #150 $stop;

  end

endmodule