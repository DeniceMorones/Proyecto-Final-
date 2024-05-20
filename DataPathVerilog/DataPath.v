`timescale 1ns/1ns

module DataPath(
    input wire clk
);

    wire RegDst;
    wire Jump;
    wire Branch;
    wire MemRead;
    wire MemToReg;
    wire [2:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;

    wire [31:0] Instruction;
    wire [3:0] ALUSel;
    wire ZF;

    wire [31:0] PC_out;
    wire [31:0] PC_next;
    wire [31:0] PC_plus4;
    wire [31:0] Branch_address;
    wire [31:0] Jump_address;
    wire [31:0] ALU_result;
    wire [31:0] Mem_data;
    wire [31:0] Write_data;
    wire [31:0] Read_data1;
    wire [31:0] Read_data2;
    wire [31:0] ALU_operand2;
    wire [27:0] shiftedAddress;
	wire [31:0] shiftedOffset;
	wire [31:0] ExtendedOffset;
    wire [4:0] Mux2_Out;
    wire [31:0] Mux4_Out;

    PC counter(
        .clk(clk),
        .dirIn(PC_next),
        .dirOut(PC_out)
    );

    ADD add4(
        .op1(PC_out),
        .op2(32'd4),
        .res(PC_plus4)
    );

    ShiftLeft2_26_28 shiftLeft1(
        .in(Instruction[25:0]),
        .out(shiftedAddress)
    );

    assign Jump_address = {PC_plus4[31:28], shiftedAddress};

    ADD add_branch (
        .op1(PC_plus4),
        .op2(shiftedOffset),
        .res(Branch_address)
    );

    Mux2_1_32 mux4 (
        .sel(Branch & ZF),
        .Op1(PC_plus4),
        .Op2(Branch_address),
        .outOp(Mux4_Out)
    );

    Mux2_1_32 mux5 (
        .sel(Jump),
        .Op1(Mux4_Out),
        .Op2(Jump_address),
        .outOp(PC_next)
    );

    InstructionMemory instructionMem(
        .address(PC_out),
        .instruction(Instruction)
    );

    ControlUnit UDC(
        .opcode(Instruction[31:26]),
        .funct(Instruction[5:0]),
        .RegDst(RegDst),
        .Jump(Jump),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemToReg(MemToReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
    );

    Mux2_1_5 mux2 (
        .sel(RegDst),
        .Op1(Instruction[20:16]),
        .Op2(Instruction[15:11]),
        .outOp(Mux2_Out)
    );

    RegisterBank RB(
        .RA1(Instruction[25:21]),
        .RA2(Instruction[20:16]),
        .Dir(Mux2_Out),
        .Di(Write_data),
        .RegWrite(RegWrite),
        .DR1(Read_data1),
        .DR2(Read_data2)
    );

    SignExtend signExtend(
		.in(Instruction[15:0]), 
		.out(ExtendedOffset)
	);

    ShiftLeft2_32 shiftLeft2(
        .in(ExtendedOffset),
        .out(shiftedOffset)
    );

    Mux2_1_32 mux3(
        .sel(ALUSrc),
        .Op1(Read_data2),
        .Op2(ExtendedOffset),
        .outOp(ALU_operand2)
    );

    ALUControl AluCtrl(
        .funct(Instruction[5:0]),
        .ALUOp(ALUOp),
        .ALUSel(ALUSel)
    );

    ALU Alu(
        .op1(Read_data1),
        .op2(ALU_operand2),
        .sel(ALUSel),
        .res(ALU_result),
        .ZF(ZF)
    );

    Memory DataMem(
	.clk(clk),
        .Ewr(MemWrite),
        .Dir(ALU_result),
        .Din(Read_data2),
        .Dout(Mem_data)
    );

    Mux2_1_32 mux1(
        .sel(MemToReg),
        .Op1(ALU_result),
        .Op2(Mem_data),
        .outOp(Write_data)
    );

endmodule
