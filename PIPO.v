module pipo_shift_register(
    input clk,      // Clock input
    input reset,    // Reset input
    input [3:0] parallel_in,  // Parallel input
    input shift,    // Shift input
    output reg [3:0] parallel_out  // Parallel output
);

// Initialize the parallel output
always @(posedge clk or posedge reset) begin
    if (reset)
        parallel_out <= 4'b0000;  // Reset the output to 0
    else
        parallel_out <= parallel_in;  // Load parallel input to output
end

// Shift operation
always @(posedge clk) begin
    if (shift)
        parallel_out <= {parallel_out[2:0], 1'b0};  // Shift left by 1 bit
end

endmodule
