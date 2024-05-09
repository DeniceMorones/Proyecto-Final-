module InstructionMemory (
    input wire [7:0] direccion,
    output reg [31:0] instruccion
);

    // contiene 256 direcciones
    reg [7:0] memory [0:255];

    // inicializar 
    initial begin
        
    end

    
    always @* begin
        instruction = memory[address];
    end

endmodule

