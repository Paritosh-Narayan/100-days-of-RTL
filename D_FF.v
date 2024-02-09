module d_flip_flop(
    input wire clk,    // Clock input
    input wire reset,  // Reset input
    input wire d,      // Data input
    output reg q       // Output
);

    // Always block to update the flip-flop on rising edge of the clock
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 1'b0;  // Reset condition, output is set to 0
        end else begin
            q <= d;      // Set output equal to input data
        end
    end

endmodule
