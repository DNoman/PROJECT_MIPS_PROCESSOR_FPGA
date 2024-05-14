module mux_2_to1_32bit (
   input [31:0] in0, 
   input [31:0] in1, 
   input sel,        
   output reg [31:0] out  
);

   always @(*) begin
      if (sel)
         out <= in0;
      else
         out <= in1;
   end

endmodule