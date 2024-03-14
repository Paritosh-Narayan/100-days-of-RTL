module even_counter(
    input clk,
    input reset,
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0;  // Reset counter to 0
    else if (count == 4'b1110) // If count reaches 14 (1110 in binary)
        count <= 4'b0;  // Reset counter to 0
    else if (count[0] == 1) // If least significant bit is 1
        count <= count + 1;  // Increment counter
end

endmodule
