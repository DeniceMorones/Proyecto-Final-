module InstructionMemory (
    input wire [7:0] direccion,
    output reg [31:0] instruccion
);

    // Contiene 256 direcciones
    reg [7:0] memory [0:255];

    // lectura de las instrucciones
    initial begin
        $readmemb("instrucciones_r.txt", memory);
    end

    // lee la instruccion segun la direccion
    always @(*) begin
    instruccion[31:24] = memory[direccion];	
	instruccion[23:16] = memory[direccion+8'd1];
	instruccion[15:8] = memory[direccion+8'd2];
	instruccion[7:0] = memory[direccion+8'd3];
    end

endmodule

