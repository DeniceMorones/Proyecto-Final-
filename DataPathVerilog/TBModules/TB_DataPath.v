`timescale 1ns/1ns

module TB_DataPath();
    reg clk;

    // Instanciación del módulo DataPath
    DataPath DUT(.clk(clk));

    initial begin
        clk = 1'b0; // Inicialización del reloj
        forever #100 clk = ~clk; // Alternar el reloj cada 100 unidades de tiempo
    end

    initial begin
        // Cargar datos en la memoria de registros
        $readmemb("DataTB.txt", DUT.RB.MEM);
        
        // Cargar instrucciones en la memoria de instrucciones
        $readmemb("instructions.txt", DUT.instructionMem.memory);

        $finish;
    end
endmodule