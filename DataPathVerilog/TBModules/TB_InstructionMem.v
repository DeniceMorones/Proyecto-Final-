`timescale 1ns / 1ns 
module InstructionMemory_TB();

    //cables y registros para las señales de entrada y salida
    reg [7:0] direccion;          //entrada para la dirección de la memoria
    wire [31:0] instruccion;       //salida para la instrucción leída

   
InstructionMemory DUV(.direccion(direccion),.instruccion(instruccion));

    
    initial begin
        //valores iniciales a la dirección de la memoria
        direccion = 8'h00;
        #100;

        // cambiar la dirección de la memoria
        direccion = 8'h01; 
        #100;

        $stop;
    end

endmodule

