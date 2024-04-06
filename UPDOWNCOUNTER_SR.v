module up_down_counter (
    input wire clk,      // Clock input
    input wire rst_n,    // Reset input (active low)
    input wire up_down,  // Up/Down control input
    output reg [3:0] count  // 4-bit counter output
);

// Internal signals
reg [3:0] next_count;

// Always block to handle counter logic
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        count <= 4'b0000;  // Reset to 0 when reset is active
    end else begin
        if (up_down) begin
            // Increment counter if up_down is high
            next_count <= count + 1;
        end else begin
            // Decrement counter if up_down is low
            next_count <= count - 1;
        end
    end
end

// Assign next_count to count
always @(*) begin
    count <= next_count;
end

endmodule
