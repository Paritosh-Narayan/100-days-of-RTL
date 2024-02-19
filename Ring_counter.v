module ring_counter (
    input wire clk,  // Clock input
    input wire reset, // Reset input
    output reg [3:0] out // Output bits
);

// Initialize the output
initial begin
    out <= 4'b0001;
end

// Sequential logic to shift the bits
always @(posedge clk or posedge reset) begin
    if (reset) begin
        out <= 4'b0001; // Reset to initial state
    end else begin
        // Shift the bits
        out <= {out[2:0], out[3]};
    end
end

endmodule
