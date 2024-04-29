`timescale 1ns/1ns
module TB_DPTR();
reg [31:0] TB_InstruccionTR;
wire TB_TR_ZF;

DataPathT_R DPTR1(.InstruccionTR(TB_InstruccionTR),.TR_ZF(TB_TR_ZF));
integer file;
integer i;

initial
	begin
		$readmemb("DataTB.txt", DPTR1.BR1.MEM);
		#100;
        file = $fopen("instrucciones_r.txt", "r");
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