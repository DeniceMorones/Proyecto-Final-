`timescale 1ns/1ns

module TB_DataPath();
    reg clk;
    integer file, r, i;
    reg [31:0] temp_data;

    // Instanciación del módulo DataPath
    DataPath DUT(.clk(clk));

    initial begin
        clk = 1'b0; // Inicialización del reloj
        forever #100 clk = ~clk; // Alternar el reloj cada 100 unidades de tiempo
    end

    initial begin
        
        // Cargar datos en el banco de registros
        $readmemb("registerBankData.txt", DUT.RB.MEM);

        /*
        file = $fopen("registerBankData.txt", "r");
        if (file == 0) begin
            $display("Error: no se pudo abrir el archivo DataTB.txt");
            $finish;
        end

        i = 0;
        while (!$feof(file)) begin
            r = $fscanf(file, "%b\n", temp_data);
            DUT.RB.MEM[i] = temp_data;
            i = i + 1;
        end
        $fclose(file);
        */

        // Cargar datos en la memoria
        $readmemb("memoryData.txt", DUT.DataMem.MEM);
        
        // Cargar instrucciones en la memoria de instrucciones
        $readmemb("instructions.txt", DUT.instructionMem.memory);
    end
endmodule