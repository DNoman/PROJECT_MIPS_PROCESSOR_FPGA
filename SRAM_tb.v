`timescale 1ns/1ps

module SRAM_tb;

  reg clk;
  reg [31:0] WriteData;
  reg [31:0] Address;
  reg WriteEn, ReadEn;
  wire [31:0] ReadData;
  // Instantiate the SRAM module
  SRAM uut (
    .clk(clk),
    .WriteData(WriteData),
    .Address(Address),
    .WriteEn(WriteEn),
    .ReadData(ReadData),
    .ReadEn(ReadEn)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    // Initialize signals
    WriteData = 32'h00000001;
    Address = 32'b00000000000000000000000000001111;
    WriteEn = 0;
    ReadEn = 0;

    // Perform write operation
    #10 WriteEn = 1;

    // Perform read operation
    #10;
	WriteEn = 0 ;
	 ReadEn = 1;


    // Additional test cases can be added here

    // End simulation
    #10 $stop;
  end

endmodule