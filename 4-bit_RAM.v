module ram (clk,we,a,di,dataout);
input clk;
input we;
input [4:0] a;
input [3:0] di;
output [3:0] dataout;
reg [3:0] ram [31:0];
always@(posedge clk) begin
if (we)
ram [a] <=di;
end
assign dataout = ram[a];
endmodule
