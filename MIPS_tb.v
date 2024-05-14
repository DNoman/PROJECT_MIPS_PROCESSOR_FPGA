`timescale 1ns/1ns
module MIPS_tb;

reg clk, reset;
reg [31:0] In;
wire [31:0] alu_result, reg1, reg2, ReadData;
wire [31:26] Op;
wire [31:0]out;

MIPS uut(
  .clk(clk),
  .reset(reset),
  .In(In),
  .Op(Op),
  .alu_result(alu_result),
  .reg1(reg1),
  .reg2(reg2),
  .ReadData(ReadData),
  .out(out)
);

initial begin
	reset = 1;
   clk = 0;
	#10;
   reset = 0;
   //In = 32'b000001_00010_00011_00001_0000_0000_000; //add
	//#50;
	In = 32'b000100_00010_00001_00000_0000_0000_000; //sw
	//#50;
	//In = 32'b000010_00010_00001_00000_0000_0000_000; //lw
   #15 $stop; 
end

always begin
  #5 clk = ~clk;
end

endmodule