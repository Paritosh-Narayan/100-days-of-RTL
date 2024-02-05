module siso ( clk , rst , a , q);
input a;
input clk ,rst;
output q;
reg q;
always @ ( posedge clk ,posedge rst)
begin 
if (rst == 1'b1)
q<= 1'b0;
else 
q<=a;
end
endmodule
