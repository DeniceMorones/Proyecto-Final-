`timescale 1ns / 1ns 

module TB_ALU();
 reg [31:0] op1;
 reg [31:0] op2;
 reg [3:0] sel;
 wire [31:0] res;
 wire ZF;
 
 ALU DUT(.op1(op1), .op2(op2), .sel(sel), .res(res), .ZF(ZF));
 
 initial begin
  op1 = 32'd10; 
  op2 = 32'd11;
  sel = 4'b0000;
  #100;
  op1 = 32'd12; 
  op2 = 32'd13;
  sel = 4'b0001;
  #100;
  op1 = 32'd10; 
  op2 = 32'd11;
  sel = 4'b0010;
  #100;
  op1 = 32'd12; 
  op2 = 32'd13;
  sel = 4'b0110;
  #100;
  op1 = 32'd10; 
  op2 = 32'd11;
  sel = 4'b0111;
  #100;
  op1 = 32'd12; 
  op2 = 32'd13;
  sel = 4'b1100;
  #100;
  
  $stop;
 end

endmodule

