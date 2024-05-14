module SRAM(clk,Address,WriteData,ReadData,WriteEn,ReadEn,out);
input WriteEn,ReadEn,clk;
input [31:0] WriteData;
input [31:0] Address;
output reg [31:0] ReadData;
reg [31:0] array [31:0];
output reg [31:0] out;

initial
begin
array[15] = 9;
end



always@(posedge clk)
begin
	if(WriteEn && !ReadEn) begin
	array [Address] = WriteData;
	out = array[Address];
	end
	else if(ReadEn && !WriteEn) begin
	ReadData <= array[Address];
	end
	else begin
	ReadData <= 32'bz;
	end
end
endmodule