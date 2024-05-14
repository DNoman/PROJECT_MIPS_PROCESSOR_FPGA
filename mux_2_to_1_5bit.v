module mux_2_to_1_5bit (
   input [4:0] in0, 
   input [4:0] in1, 
   input sel,        
   output reg [4:0] out  
);

   always @(*) begin
      if (sel)
         out <= in0;
      else
         out <= in1;
   end

endmodule