module ALUControl(
	input [5:0] funct,
	input [2:0] ALUOp,
	output reg [3:0]ALUSel
);

 always @(*) begin
  case (ALUOp)
   3'b000: ALUSel = 4'b0010; // add (para lw, sw, addi)
   3'b001: ALUSel = 4'b0001; // ori
   3'b011: ALUSel = 4'b0000; // andi
   3'b110: ALUSel = 4'b0110; // beq (resta)
   3'b111: ALUSel = 4'b0111; // slti
   3'b010: begin // tipo R
    case (funct)
     6'b100000: ALUSel = 4'b0010; // add
     6'b100010: ALUSel = 4'b0110; // sub
     6'b100101: ALUSel = 4'b0001; // or
     6'b100100: ALUSel = 4'b0000; // and
     6'b101010: ALUSel = 4'b0111; // slt
     6'b000000: ALUSel = 4'b0000; // nop (se trata como un and)
     default: ALUSel = 4'b0000;
    endcase
   end
   default: ALUSel = 4'b0000;
  endcase
 end
endmodule