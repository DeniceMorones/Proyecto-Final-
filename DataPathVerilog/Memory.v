module Memory(
	input Ewr,
	input [31:0] Dir,
	input [31:0] Din,
	output reg [31:0] Dout
);

reg [31:0] MEM [0:255];

always @(*) begin
		if(Ewr) begin
			MEM[Dir] = Din;
		end
		else begin
				Dout = MEM[Dir];
		end
	end
endmodule
