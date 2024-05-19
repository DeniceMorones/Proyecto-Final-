`timescale 1ns / 1ns 
module TB_SignExtend();
 reg [15:0] in;
 wire [31:0] out;

 SignExtend DUT(.in(in), .out(out));

 initial begin
  in = 16'd15;
  #100;   

  in = 16'd20;
  #100; 

  in = 16'd25;
  #100; 

  in = 16'd30;
  #100;             
             
  $stop;             
 end

endmodule