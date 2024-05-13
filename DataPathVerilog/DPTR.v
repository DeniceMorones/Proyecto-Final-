`timescale 1ns/1ns
// 1. Declarar el modulo y sus I/O
module DataPathT_R();
//2. Definir Elementos /Componentes Internos (Cables, Registros).
reg clk;

wire TB_MemToReg;
wire TB_MemToWrite;
wire [2:0] ALUOp;
wire RegWrite;
wire [3:0] outOp;
wire Instruction;

wire [7:0] C1;
wire [7:0] C2;
wire [7:0] C3;
wire [31:0] C4;
wire [31:0] C5;
wire [31:0] C6;
wire [31:0] C7;
wire [31:0] C8;

PC cnt(.clk(clk), .dirIn(C1), .reset(1'b0), .dirOut(C2));

ALU_suma add4(.operando1(C2), .resultado(C3));

Mux2_1_8 mux1 (.sel(Branch), .Op1(C3), .Op2(), .outOp(C1));

InstructionMemory inst_memory(.direccion(C2), .instruccion(Instruction));

ControlUnit UDC(.op(Instruction[31:26]), .MemToReg(TB_MemToReg),.MemToWrite(TB_MemToWrite),
.ALUOp(ALUOp),.RegWrite(RegWrite));

Mux2_1_5 mux2 (.sel(RegDst), .Op1(C3), .Op2(), .outOp(C1));

BancoDeRegistro BR1(.RA1(Instruction[25:21]), .RA2(Instruction[20:16]), .Di(C7), .Dir(Instruction[15:11]),
.RegWrite(RegWrite),.DR1(C4),.DR2(C5));

ALU_Control AluC(.Func(Instruction[5:0]), .InOp(ALUOp), .outOp(outOp));

ALU Alu1 (.operador1(C4),.operador2(C5),.selector(outOp),.resultado(C6), .ZF(TR_ZF));

Mem DataMem (.Ewr(MemToWrite),.Dir(C3),.Din(C1),.Dout(C5));


//3. Elementos de Procesamiento (Lógicos y aritméticos)

initial
	begin
		clk = 1'b0;
		forever #100
		clk = ~clk;
	end

endmodule