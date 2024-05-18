module _ALU(
 input [31:0] op1,
 input [31:0] op2,
 input [3:0] sel,
 output reg [31:0] res,
 output ZF
);

 wire [31:0] AND;
 wire [31:0] OR;
 wire [31:0] add;
 wire [31:0] substract;
 wire setOnLessThan;
 wire [31:0]NOR;
 
 assign AND = op1 & op2;
 assign OR = op1 | op2;
 assign add = op1+op2;
 assign substract = op1-op2;
 assign setOnLessThan = ((op1 < op2)? 31'b1:31'b0);
 assign NOR = ~(op1 | op2);

 always @(*) begin
  case(sel)
   4'b0000: res = AND;
   4'b0001: res = OR;
   4'b0010: res = add;
   4'b0110: res = substract;
   4'b0111: res = setOnLessThan;
   4'b1100: res = NOR;
   default: res = 31'd0;
  endcase
 end
 
 assign ZF= ~(res!=31'd0);

endmodule
