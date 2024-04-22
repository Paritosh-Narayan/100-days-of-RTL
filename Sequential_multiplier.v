module sequential_multiplier(
    input clk,
    input reset,
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] result
);

reg [15:0] product;
reg [3:0] count;

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        product <= 16'b0;
        count <= 4'b0;
        result <= 16'b0;
    end else begin
        if (count < 8) begin
            product <= {a, 8'b0} * {b, 8'b0};
            result <= result + product;
            count <= count + 1;
        end
    end
end

endmodule
