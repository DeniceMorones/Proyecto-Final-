`timescale 1ns / 1ns 
module Multiplexor_zf_TB();

    // señales de entrada y salida
    reg ZF;                 // señal de bandera cero
    reg [31:0] cero, uno;   // datos cero y uno
    wire [31:0] salida;     // salida

    multiplexor DUV(
        .ZF(ZF),
        .cero(cero),
        .uno(uno),
        .salida(salida)
    );

   
    initial begin
        ZF = 1'b0;          // bandera cero desactivada
        cero = 32'h00000001; // valor inicial para el dato cero
        uno = 32'h00000002;  // valor inicial para el dato uno
        #100;               

        ZF = 1'b1;          // se activa la bandera cero
        #100;              

        cero = 32'hFFFFFFFF; // cambio del valor del dato cero
        uno = 32'hFFFFFFFE;  // cambio del valor del dato uno
        #100;              

        $stop;             
    end

endmodule

