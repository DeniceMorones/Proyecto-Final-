`timescale 1ns / 1ns 

module TB_PC();
 reg clk;
 wire [31:0] dirIn;

 PC DUT(.clk(clk), .dirIn(dirIn));

 always begin
  #100 clk = ~clk;  
 end

 initial begin
  clk=1;
  #100;
  
  $stop;
 end

endmodule
