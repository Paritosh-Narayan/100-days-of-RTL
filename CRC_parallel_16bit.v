module crc16_parallel (
    input [15:0] data_in,
    input clk,
    input reset,
    output wire [15:0] crc_out
);

reg [15:0] crc_reg;
parameter polynomial = 16'h8005; // CRC-16 polynomial: x^16 + x^15 + x^2 + 1

always @(posedge clk or posedge reset) begin
    if (reset)
        crc_reg <= 16'h0000;
    else begin
        // Calculate next CRC value
        crc_reg[15] <= crc_reg[14] ^ crc_reg[0] ^ data_in[15];
        crc_reg[14:0] <= {crc_reg[13:0], crc_reg[0]} ^ (crc_reg[15] ? polynomial : 0);
    end
end

assign crc_out = crc_reg;

endmodule
