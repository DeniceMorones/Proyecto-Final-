`timescale 1ns/1ns

module TB_ALUControl();
	reg [5:0] funct;
	reg [2:0] ALUOp;
	wire [3:0] ALUSel;

	ALUControl DUT(.funct(funct), .ALUOp(ALUOp), .ALUSel(ALUSel));

	initial begin
		ALUOp=3'b000;
		#100;
		ALUOp=3'b001;
		#100;
		ALUOp=3'b011;
		#100;
		ALUOp=3'b110;
		#100;
		ALUOp=3'b111;
		#100;
		funct=6'b100000;
		ALUOp=3'b010;
		#100;
		funct=6'b100010;
		ALUOp=3'b010;
		#100;
		funct=6'b100101;
		ALUOp=3'b010;
		#100;
		funct=6'b100100;
		ALUOp=3'b010;
		#100;
		funct=6'b101010;
		ALUOp=3'b010;
		#100;
		funct=6'b000000;
		ALUOp=3'b010;
		#100;
		
		$stop;
	end
endmodule