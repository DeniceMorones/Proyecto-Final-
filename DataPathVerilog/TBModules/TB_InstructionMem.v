`timescale 1ns / 1ns 

module TB_InstructionMem();
 reg [7:0] address;
 wire [31:0] instruction; 
   
 InstructionMem DUT(.address(address), .instruction(instruction));

 initial begin
  $readmemb("instructions.txt", DUT.memory);
 end

 initial begin
  address = 8'd0;
  #100;
  address = 8'd1; 
  #100;
  address = 8'd2; 
  #100;
  address = 8'd3;
  #100;
  address = 8'd4; 
  #100;
  address = 8'd5; 
  #100;

  $stop;
 end

endmodule