`timescale 1ns / 1ns 

module TB_Memory();
 reg Ewr; 
 reg [31:0] Dir;
 reg [31:0] Din; 
 wire [31:0] Dout;
   
 Memory DUT(.Ewr(Ewr), .Dir(Dir), .Din(Din), .Dout(Dout));

 initial begin
  Ewr = 1'b1;
  Dir = 32'd20;
  Din = 32'd111;
  #100;

  Dir = 32'd21;
  Din = 32'd333;
  #100;

  Dir = 32'd22;
  Din = 32'd222;
  #100;

  $stop;
 end

endmodule