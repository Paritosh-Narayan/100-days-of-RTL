module bcd_to_7seg(
    input [3:0] bcd_in,
    output reg [6:0] seg_out
);

always @(*) begin
    case(bcd_in)
        4'b0000: seg_out = 7'b1000000; // 0
        4'b0001: seg_out = 7'b1111001; // 1
        4'b0010: seg_out = 7'b0100100; // 2
        4'b0011: seg_out = 7'b0110000; // 3
        4'b0100: seg_out = 7'b0011001; // 4
        4'b0101: seg_out = 7'b0010010; // 5
        4'b0110: seg_out = 7'b0000010; // 6
        4'b0111: seg_out = 7'b1111000; // 7
        4'b1000: seg_out = 7'b0000000; // 8
        4'b1001: seg_out = 7'b0010000; // 9
        default: seg_out = 7'b1111111; // All segments off (error condition)
    endcase
end

endmodule
