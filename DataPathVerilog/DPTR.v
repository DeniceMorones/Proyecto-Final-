// 1. Declarar el modulo y sus I/O
module DataPathT_R(
	input [31:0] InstruccionTR,
	output TR_ZF	
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).

wire TB_MemToReg;
wire TB_MemToWrite;
wire [2:0] TB_ALUOp;
wire TB_RegWrite;

wire [7:0] direccion;
wire [31:0] instruccion;

wire [31:0] C1;
wire [31:0] C2;
wire [31:0] C3;
wire [3:0] C4;
wire [31:0] C5;
wire [31:0] C6;

Unidad_de_Control UDC(.op(InstruccionTR[31:26]),.MemToReg(TB_MemToReg),.MemToWrite(TB_MemToWrite),
	.ALUOp(TB_ALUOp),.RegWrite(TB_RegWrite));

BancoDeRegistro BR1(.RA1(InstruccionTR[25:21]),.RA2(InstruccionTR[20:16]),.Di(C6),.Dir(InstruccionTR[15:11]),
.RegWrite(TB_RegWrite),.DR1(C2),.DR2(C1));

ALU_Control AluC(.Func(InstruccionTR[5:0]),.InOp(TB_ALUOp),.outOp(C4));

_ALU Alu1 (.operador1(C2),.operador2(C1),.selector(C4),.resultado(C3),.ZF(TR_ZF));

Mem Mem1 (.Ewr(MemToWrite),.Dir(C3),.Din(C1),.Dout(C5));

Mux2_1_32 mux1_2 (.MemToReg(TB_MemToReg),.Op1(C5),.Op2(C3),.outOp(C6));

Mux2_1_32 mux1_2_2 (.MemToReg(TB_MemToReg),.Op1(C5),.Op2(C3),.outOp(C6));

Mux2_1_32 mux1_2_3 (.MemToReg(TB_MemToReg),.Op1(C5),.Op2(C3),.outOp(C6));

Mux2_1_32 mux1_2_4 (.MemToReg(TB_MemToReg),.Op1(C5),.Op2(C3),.outOp(C6));

InstructionMemory inst_memory(.direccion(direccion), .instruccion(instruccion));

PC cnt(.clk(clk),.reset(reset),.direccion(direccion));

ADD add_ins(.operando1(C2), .operando2(C1), .resultado(C6));

//3. Elementos de Procesamiento (Lógicos y aritméticos)

endmodule