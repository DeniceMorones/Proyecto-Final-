`timescale 1ns / 1ns 
module TB_ShiftLeft();
 reg [31:0] in;
 wire [31:0] out;

 ShiftLeft2_32 DUT(.in(in), .out(out));

 initial begin
  in = 32'b1;
  #100;               
             
  $stop;             
 end

endmodule

