`timescale 1ns / 1ns 
module PC_TB();

    // cables y registros para las se�ales de entrada y salida
    reg clk;                   // se�al de reloj
    reg reset;                 // se�al de reset
    wire [7:0] direccion;      // direcci�n de la memoria de instrucciones

    
    PC DUV(
        .clk(clk),
        .reset(reset),
        .direccion(direccion)
    );

    
    always begin
        #100 clk = ~clk;  
    end

    
    initial begin
		clk=1;
        // inicializa la se�al de reset
        reset = 1;
        #100;

        // desactiva la se�al de reset
        reset = 0;
        #100;

        $stop;
    end

endmodule
