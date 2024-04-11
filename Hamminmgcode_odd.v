module hamming_encoder_odd_parity (
    input [3:0] data_in,
    output reg [7:0] encoded_data
);

always @(*) begin
    encoded_data[0] = data_in[0];
    encoded_data[1] = data_in[1];
    encoded_data[2] = data_in[2];
    encoded_data[3] = data_in[0] ^ data_in[1] ^ data_in[2];
    encoded_data[4] = data_in[3];
    encoded_data[5] = data_in[0] ^ data_in[1] ^ data_in[3];
    encoded_data[6] = data_in[1] ^ data_in[2] ^ data_in[3];
    encoded_data[7] = data_in[0] ^ data_in[2] ^ data_in[3] ^ encoded_data[3] ^ encoded_data[5] ^ encoded_data[6];
end

endmodule
