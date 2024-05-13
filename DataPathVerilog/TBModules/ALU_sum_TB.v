`timescale 1ns / 1ns 
module ADD_TB();

    //cables y registros para las señales de entrada y salida
    reg [31:0] operando1, operando2;
    wire [31:0] resultado;

    
    ADD DUV(
        .operando1(operando1),
        .operando2(operando2),
        .resultado(resultado)
    );

    
    initial begin
        // asignacion valores a los operandos
        operando1 = 32'h00000001; 
        operando2 = 32'h00000002;
        #100;

        
        // cambiar los operandos
        operando1 = 32'hFFFFFFFF; 
        operando2 = 32'h00000001;
        #100;


        $stop;
    end

endmodule

