`timescale 1ns/1ns

module DataPath();

    reg clk;
    reg reset;

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
    wire [3:0] outOp;
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

    PC counter(
        .clk(clk),
        .reset(reset),
        .dirIn(PC_next),
        .dirOut(PC_out)
    );

    ADD add4(
        .operando1(PC_out),
        .operando2(32'd4),
        .resultado(PC_plus4)
    );

				ADD add_branch (
        .operando1(PC_plus4),
        .operando2(shiftedOffset),
        .resultado(Branch_address)
    );

    Mux2_1_32 mux1 (
        .sel(Branch & ZF),
        .Op1(PC_plus4),
        .Op2(Branch_address),
        .outOp(PC_next)
    );

    InstructionMemory inst_memory(
        .direccion(PC_out),
        .instruccion(Instruction)
    );

    ShiftLeft2_26_28 shiftLeft1(
        .in(Instruction[25:0]),
        .out(shiftedAddress)
    );

    ControlUnit UDC(
        .op(Instruction[31:26]),
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
        .outOp(C4)
    );

    BancoDeRegistro BR1(
        .RA1(Instruction[25:21]),
        .RA2(Instruction[20:16]),
        .Dir(C4),
        .Di(Write_data),
        .RegWrite(RegWrite),
        .DR1(Read_data1),
        .DR2(Read_data2)
    );

				SignExtend signExtend(
								.in(Instruction[15:0]), 
								.out(ExtendedOffset)
				)

    Mux2_1_32 mux3 (
        .sel(ALUSrc),
        .Op1(Read_data2),
        .Op2(ExtendedOffset),
        .outOp(ALU_operand2)
    );

    ALU_Control AluC(
        .Func(Instruction[5:0]),
        .InOp(ALUOp),
        .outOp(outOp)
    );

    ALU Alu1(
        .operador1(Read_data1),
        .operador2(ALU_operand2),
        .selector(outOp),
        .resultado(ALU_result),
        .ZF(ZF)
    );

    Mem DataMem(
        .Ewr(MemWrite),
        .Dir(ALU_result),
        .Din(Read_data2),
        .Dout(Mem_data)
    );

    Mux2_1_32 mux4 (
        .sel(MemToReg),
        .Op1(ALU_result),
        .Op2(Mem_data),
        .outOp(Write_data)
    );

    

    assign Jump_address = {PC_out[31:28], shiftedAddress};

    initial begin
        clk = 1'b0;
        reset = 1'b1;
        #50 reset = 1'b0;
        forever #100 clk = ~clk;
    end

endmodule