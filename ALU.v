module ALU(q,a,b,opcode,ovf);
input [2:0]opcode;
input signed [31:0]a,b;
reg [32:0]tmp;
output reg ovf;
output reg signed [31:0]q;

always@(*)
begin 
	case(opcode)
		3'b000: q = ~a;
		3'b001: q = a & b;
		3'b010: q = a ^ b;
		3'b011: q = a | b;
		3'b100: begin
		q = a - 1;
		ovf = (q[31] != a[31]);
		end
		3'b101: begin
		q = a + b;
		tmp = {1'b0,a} + {1'b0,b};
		ovf = tmp[32];
		end
		3'b110: begin
		q = a - b;
		tmp = {1'b0,a} - {1'b0,b};
		ovf = tmp[32];
		end
		3'b111: begin
		q = a + 1;
		ovf = (q[31] != a[31]);
		end
	endcase
end
endmodule