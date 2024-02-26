module clock_divider(
    input wire clk,     // Input clock
    output reg clk_div2,  // Divided clock by 2
    output reg clk_div3   // Divided clock by 3
);

reg [1:0] count; // Counter to keep track of divisions

always @(posedge clk) begin
    // Clock divider by 2
    if (count == 2'b01) begin
        clk_div2 <= ~clk_div2; // Toggle output clock every other clock cycle
    end
    
    // Clock divider by 3
    if (count == 2'b10) begin
        clk_div3 <= ~clk_div3; // Toggle output clock every third clock cycle
        count <= 2'b00; // Reset counter after reaching division by 3
    end
    else begin
        count <= count + 1; // Increment counter
    end
end

endmodule
