module BCD_to_Binary_Converter (
    input [3:0] bcd_input,       // 4-bit BCD input
    output reg [7:0] binary_output // 8-bit binary output
);

// Declare intermediate signals for each BCD digit
reg [3:0] digit0, digit1, digit2, digit3;

// Declare a binary representation for each BCD digit
reg [3:0] binary_values [9:0] = {4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100,
                                4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b1001};

// BCD to Binary conversion
always @* begin
    digit0 = binary_values[bcd_input[3]];
    digit1 = binary_values[bcd_input[2]];
    digit2 = binary_values[bcd_input[1]];
    digit3 = binary_values[bcd_input[0]];
end

// Combine the binary digits to form the 8-bit binary output
always @* begin
    binary_output = {digit3, digit2, digit1, digit0};
end

endmodule

