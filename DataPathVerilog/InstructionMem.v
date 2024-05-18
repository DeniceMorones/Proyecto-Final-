module InstructionMemory (
 input wire [31:0] address,
 output reg [31:0] instruction
);

 reg [7:0] memory [0:255];
 
 always @(*) begin
  instruction[31:24] = memory[address];	
  instruction[23:16] = memory[address+8'd1];
  instruction[15:8] = memory[address+8'd2];
  instruction[7:0] = memory[address+8'd3];
 end

endmodule

