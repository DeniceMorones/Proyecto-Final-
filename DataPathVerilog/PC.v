module PC (
    input clk,
    input [31:0] dirIn,
    output reg [31:0] dirOut  
);

 initial begin
  dirOut = 32'b0; 
 end
     
 always @(posedge clk) begin
  dirOut <= dirIn;
 end

endmodule

