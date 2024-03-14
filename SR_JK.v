
module SR_to_JK (
    input S, R, CLK,
    output reg J, K
);

always @(posedge CLK) begin
    if (S && !R)
        {J, K} <= {1'b1, 1'b0}; // Set condition
    else if (!S && R)
        {J, K} <= {1'b0, 1'b1}; // Reset condition
    else if (S && R)
        {J, K} <= {1'b1, 1'b1}; // Invalid condition
    else
        {J, K} <= {1'b0, 1'b0}; // Hold state
end

endmodule
