module BCD_counter(
    input wire clk,   // Clock input
    input wire reset, // Reset input
    output reg [3:0] bcd_out // BCD output
);

reg [3:0] count; // Binary counter

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000; // Reset the counter to 0
    end else begin
        // Increment the counter
        if (count == 4'b1001) begin
            count <= 4'b0000; // Reset to 0 when it reaches 9
        end else begin
            count <= count + 1; // Increment by 1
        end
    end
end

// BCD conversion
always @* begin
    case(count)
        4'b0000: bcd_out = 4'b0000;
        4'b0001: bcd_out = 4'b0001;
        4'b0010: bcd_out = 4'b0010;
        4'b0011: bcd_out = 4'b0011;
        4'b0100: bcd_out = 4'b0100;
        4'b0101: bcd_out = 4'b0101;
        4'b0110: bcd_out = 4'b0110;
        4'b0111: bcd_out = 4'b0111;
        4'b1000: bcd_out = 4'b1000;
        4'b1001: bcd_out = 4'b1001;
        default: bcd_out = 4'b0000; // Reset to 0 for invalid count
    endcase
end

endmodule
