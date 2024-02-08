
module t_flip_flop_comb(
    input t, // Toggle input
    input clk, // Clock input
    output reg q // Output
);

reg q_next;

// Determine next state based on the T input and current state
always @(*) begin
    if (t)
        q_next = ~q; // Toggle the output if T input is high
    else
        q_next = q; // Maintain the current state if T input is low
end

// Clocked process to update the output
always @(posedge clk) begin
    q <= q_next;
end

endmodule
