module crc_encoder (
    input wire [7:0] data_in, // 8-bit input data
    input wire clk,            // Clock input
    input wire rst_n,          // Active low reset
    output reg [7:0] crc_out   // 8-bit output CRC
);

reg [7:0] crc_reg;
reg [7:0] crc_poly = 8'hED; // CRC polynomial

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        crc_reg <= 8'h00; // Reset CRC register
    end else begin
        crc_reg <= {crc_reg[6:0], crc_reg[7]} ^ (data_in ^ crc_reg[7] ? crc_poly : 8'h00);
        // Update CRC register based on polynomial division
    end
end

always @* begin
    crc_out = crc_reg; // Assign crc_reg to crc_out
end

endmodule
