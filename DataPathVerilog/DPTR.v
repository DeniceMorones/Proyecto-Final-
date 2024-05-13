`timescale 1ns/1ns
// 1. Declarar el modulo y sus I/O
module DataPath();
//2. Definir Elementos /Componentes Internos (Cables, Registros).
reg clk;

wire RegDst;
wire Branch;
wire MemRead;
wire MemToReg;
wire [2:0] ALUOp;
wire MemWrite;
wire ALUSrc;
wire RegWrite;

wire Instruction;
wire [3:0] outOp;
wire ZF;

wire [7:0] C1;
wire [7:0] C2;
wire [7:0] C3;
wire [4:0] C4;
wire [31:0] C5;
wire [31:0] C6;
wire [31:0] C7;
wire [31:0] C8;
wire [31:0] C9;
wire [31:0] C10;

PC counter(.clk(clk), .dirIn(C1), .reset(1'b0), .dirOut(C2));

ADD add4(.operando1(C2), .resultado(C3));

Mux2_1_8 mux1 (.sel(Branch), .Op1(C3), .Op2(), .outOp(C1));

InstructionMemory inst_memory(.direccion(C2), .instruccion(Instruction));

ControlUnit UDC(.op(Instruction[31:26]), .RegDst(RegDst), .Branch(Branch), .MemRead(MemRead), .MemToReg(MemToReg), .ALUOp(ALUOp), .MemWrite(MemWrite), 
.ALUSrc(AluSrc), .RegWrite(RegWrite));

Mux2_1_5 mux2 (.sel(RegDst), .Op1(Instruction[20:16]), .Op2(Instruction[15:11]), .outOp(C4));

BancoDeRegistro BR1(.RA1(Instruction[25:21]), .RA2(Instruction[20:16]), .Dir(C4), .Di(C9), .RegWrite(RegWrite), .DR1(C5), .DR2(C6));

Mux2_1_32 mux3 (.sel(AluSrc), .Op1(C6), .Op2(), .outOp(C7));

ALU_Control AluC(.Func(Instruction[5:0]), .InOp(ALUOp), .outOp(outOp));

ALU Alu1(.operador1(C5), .operador2(C7), .selector(outOp), .resultado(C8), .ZF(ZF));

Mem DataMem (.Ewr(MemWrite), .Dir(C3), .Din(C1), .Dout(C8));

Mux2_1_32 mux4 (.sel(MemToReg), .Op1(C8), .Op2(C9), .outOp(C10));


//3. Elementos de Procesamiento (Lógicos y aritméticos)

initial begin
		clk = 1'b0;
		forever #100
		clk = ~clk;
end

initial begin
		c1 = 8'd0;
end

endmodule