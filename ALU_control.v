module ALU_control(ALUop,ALUcon);
input [1:0] ALUop;
output reg [2:0]ALUcon;

always@(*)
begin 
case(ALUop)
	2'b10: ALUcon = 3'b001;
	2'b11: ALUcon = 3'b011;
	2'b00: ALUcon = 3'b101;
	2'b01: ALUcon = 3'b110;
	endcase
end
endmodule