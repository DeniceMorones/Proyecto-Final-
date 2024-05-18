`timescale 1ns/1ns

module TB_ADD();
 reg [31:0] op1;
 reg [31:0] op2;
 wire [31:0] res;
  
 ADD DUT(.op1(op1), .op2(op2), .res(res));

 initial begin
   op1 = 32'd0;
   op2 = 32'd1;
   #100;
   op1 = 32'd333;
   op2 = 32'd555;
   #100;
   op1 = 32'd18;
   op2 = 32'd78;
   #100;
   op1 = 32'd47;
   op2 = 32'd289;
   #100;
   
   $stop;
 end

endmodule
