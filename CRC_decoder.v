module crc_decoder (
    input wire [n-1:0] data_in, // Input data with CRC bits
    input wire [n-1:0] crc_in,  // Received CRC bits
    output reg error_flag       // Error flag indicating CRC mismatch
);

parameter n = 8;  // Define the size of the data and CRC
parameter poly = 8'h2F; // Define the CRC polynomial

reg [n-1:0] remainder; // Remainder after CRC division
integer i; // Loop variable

always @* begin
    // Perform CRC division
    remainder = data_in ^ crc_in; // XOR data with received CRC bits

    // Perform CRC check
    for (i = 0; i < n; i = i + 1) begin
        if (remainder[n-1] == 1) begin
            remainder = {remainder[n-2:0], 1'b0} ^ poly; // If MSB is 1, perform XOR with polynomial
        end else begin
            remainder = {remainder[n-2:0], 1'b0}; // Shift remainder left by 1
        end
    end

    // If remainder is all zeros, no error
    if (remainder == 0) begin
        error_flag = 0;
    end else begin
        error_flag = 1; // Set error flag if remainder is not zero
    end
end

endmodule
