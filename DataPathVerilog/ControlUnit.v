module ControlUnit(
 input [5:0] opcode,
 input [5:0] funct,
 output reg RegDst,
 output reg Jump,
 output reg Branch,
 output reg MemRead,
 output reg MemToReg,
 output reg [2:0] ALUOp,
 output reg MemWrite,
 output reg ALUSrc,
 output reg RegWrite
);

 always @(*) begin
     RegDst = 0;
     Jump = 0;
     Branch = 0;
     MemRead = 0;
     MemToReg = 0;
     ALUOp = 3'b000;
     MemWrite = 0;
     ALUSrc = 0;
     RegWrite = 0;
     case (opcode)
         6'b000000: begin // tipo R
            if (funct == 6'b000000) begin // nop
            end else begin
                RegDst = 1;
                RegWrite = 1;
                ALUOp = 3'b010;
            end
        end
         6'b001000: begin // addi
             ALUSrc = 1;
             RegWrite = 1;
             ALUOp = 3'b000;
         end
         6'b001101: begin // ori
             ALUSrc = 1;
             RegWrite = 1;
             ALUOp = 3'b001;
         end
         6'b001100: begin // andi
             ALUSrc = 1;
             RegWrite = 1;
             ALUOp = 3'b011;
         end
         6'b001010: begin // slti
             ALUSrc = 1;
             RegWrite = 1;
             ALUOp = 3'b111;
         end
         6'b100011: begin // lw
             ALUSrc = 1;
             MemToReg = 1;
             RegWrite = 1;
             MemRead = 1;
             ALUOp = 3'b000;
         end
         6'b101011: begin // sw
             ALUSrc = 1;
             MemWrite = 1;
             ALUOp = 3'b000;
         end
         6'b000100: begin // beq
             Branch = 1;
             ALUOp = 3'b110;
         end
         6'b000010: begin // j
             Jump = 1;
         end
         default: begin
             // mantener todas las señales en 0
         end
     endcase
 end
endmodule