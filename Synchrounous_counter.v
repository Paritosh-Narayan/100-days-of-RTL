module synchronous_counter (
    input wire clk,         // Clock input
    input wire rst,         // Reset input
    input wire load,        // Load input
    input wire [3:0] data,  // Data input for loading
    output reg [3:0] count  // 4-bit output count
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000;  // Reset the counter to 0
    end else begin
        if (load) begin
            count <= data;  // Load the counter with data input
        end else begin
            count <= count + 1;  // Increment the counter
        end
    end
end

endmodule
