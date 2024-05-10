module InstructionMemory (
    input wire [7:0] direccion,
    output reg [31:0] instruccion
);

    
    PC p1(.ZF(ZF), .sel(sel));

    // contiene 256 direcciones
    reg [7:0] memory [0:255];

 
    reg sel;

	//lectura de las instrucciones
    initial begin
        $readmemb("instrucciones_r.txt", memory);
    end

	//escribir o leer dependiendo del valor de sel
    always @(*) begin
        if (sel) begin
            memory[direccion] = instruccion;
        end else begin
            instruccion = memory[direccion];
        end
    end

endmodule

