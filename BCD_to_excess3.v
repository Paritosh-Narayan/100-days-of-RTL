module bcd_to_excess3 (
    input wire [3:0] bcd_input,
    output reg [3:0] excess3_output
);

always @* begin
    case (bcd_input)
        4'b0000: excess3_output = 4'b0011;
        4'b0001: excess3_output = 4'b0100;
        4'b0010: excess3_output = 4'b0101;
        4'b0011: excess3_output = 4'b0110;
        4'b0100: excess3_output = 4'b0111;
        4'b0101: excess3_output = 4'b1000;
        4'b0110: excess3_output = 4'b1001;
        4'b0111: excess3_output = 4'b1010;
        4'b1000: excess3_output = 4'b1011;
        4'b1001: excess3_output = 4'b1100;
        4'b1010: excess3_output = 4'b1101;
        4'b1011: excess3_output = 4'b1110;
        4'b1100: excess3_output = 4'b1111;
        4'b1101: excess3_output = 4'b0000;
        4'b1110: excess3_output = 4'b0001;
        4'b1111: excess3_output = 4'b0010;
        default: excess3_output = 4'b0000; // Handle invalid BCD inputs
    endcase
end

endmodule
