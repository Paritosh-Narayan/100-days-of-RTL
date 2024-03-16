module sr_to_d_flip_flop(
    input s, r, clk,
    output reg q
);

reg d;

// D flip-flop behavior
always @(posedge clk) begin
    if (s & !r) // Set condition
        d <= 1'b1;
    else if (!s & r) // Reset condition
        d <= 1'b0;
    else // Hold condition
        d <= q;
end

// Output Q
always @(posedge clk) begin
    q <= d;
end

endmodule
