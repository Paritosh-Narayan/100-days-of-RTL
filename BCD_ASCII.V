

module bcd_to_ascii_converter (
    input [3:0] bcd_input,
    output reg [7:0] ascii_output
);

always @(bcd_input) begin
    case(bcd_input)
        4'b0000: ascii_output = 8'b00110000; // '0' in ASCII
        4'b0001: ascii_output = 8'b00110001; // '1' in ASCII
        4'b0010: ascii_output = 8'b00110010; // '2' in ASCII
        4'b0011: ascii_output = 8'b00110011; // '3' in ASCII
        4'b0100: ascii_output = 8'b00110100; // '4' in ASCII
        4'b0101: ascii_output = 8'b00110101; // '5' in ASCII
        4'b0110: ascii_output = 8'b00110110; // '6' in ASCII
        4'b0111: ascii_output = 8'b00110111; // '7' in ASCII
        4'b1000: ascii_output = 8'b00111000; // '8' in ASCII
        4'b1001: ascii_output = 8'b00111001; // '9' in ASCII
        default: ascii_output = 8'b00000000; // Invalid BCD input, output 0
    endcase
end

endmodule
