`timescale 1ns / 1ns 
module PC_TB();

    // cables y registros para las señales de entrada y salida
    reg clk;                   // señal de reloj
    reg reset;                 // señal de reset
    wire [7:0] direccion;      // dirección de la memoria de instrucciones

    
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
        // inicializa la señal de reset
        reset = 1;
        #100;

        // desactiva la señal de reset
        reset = 0;
        #100;

        $stop;
    end

endmodule
