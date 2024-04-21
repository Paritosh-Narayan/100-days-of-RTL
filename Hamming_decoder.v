module hamming_decoder(
    input [6:0] encoded_data,
    output reg [3:0] decoded_data,
    output reg [2:0] syndrome
);

always @(*) begin
    // Syndrome calculation
    syndrome[0] = encoded_data[0] ^ encoded_data[2] ^ encoded_data[4] ^ encoded_data[6];
    syndrome[1] = encoded_data[1] ^ encoded_data[2] ^ encoded_data[5] ^ encoded_data[6];
    syndrome[2] = encoded_data[3] ^ encoded_data[4] ^ encoded_data[5] ^ encoded_data[6];
    
    // Decoding
    case(syndrome)
        3'b000: decoded_data = {encoded_data[2], encoded_data[4], encoded_data[5], encoded_data[6]};
        3'b001: decoded_data = {~encoded_data[0], encoded_data[1], encoded_data[5], encoded_data[6]};
        3'b010: decoded_data = {encoded_data[0], ~encoded_data[1], encoded_data[3], encoded_data[6]};
        3'b011: decoded_data = {encoded_data[0], encoded_data[2], ~encoded_data[3], encoded_data[6]};
        3'b100: decoded_data = {encoded_data[3], encoded_data[4], ~encoded_data[5], encoded_data[6]};
        3'b101: decoded_data = {encoded_data[0], encoded_data[2], encoded_data[4], ~encoded_data[6]};
        3'b110: decoded_data = {encoded_data[1], encoded_data[3], encoded_data[5], ~encoded_data[6]};
        3'b111: decoded_data = {~encoded_data[0], encoded_data[1], encoded_data[3], encoded_data[6]};
        default: decoded_data = 4'b0000; // If more than 1 error, just return 0
    endcase
end

endmodule
