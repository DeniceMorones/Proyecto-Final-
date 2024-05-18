`timescale 1ns/1ns

module TB_DataPath();
    DataPath DUT();
    integer file;
    integer i;

    initial begin
        $readmemb("DataTB.txt", DUV.RB.MEM);
        #100;
        file = $fopen("instructions.txt", "r");
        if (file != 0) begin
            i = 0;
            while (!$feof(file)) begin
                $fscanf(file, "%b", TB_InstruccionTR);
                #100;
                i = i + 1;
            end
            $fclose(file);
        end else begin
            $display("No se pudo abrir el archivo de instrucciones.");
        end
    end
endmodule