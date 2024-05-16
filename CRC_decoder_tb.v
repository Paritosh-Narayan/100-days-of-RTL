module tb_crc_decoder;

// Parameters
parameter n = 8;  // Define the size of the data and CRC
parameter poly = 8'h2F; // Define the CRC polynomial

// Signals
reg [n-1:0] data_in; // Input data with CRC bits
reg [n-1:0] crc_in;  // Received CRC bits
wire error_flag;     // Error flag indicating CRC mismatch

// Instantiate CRC decoder module
crc_decoder dut (
    .data_in(data_in),
    .crc_in(crc_in),
    .error_flag(error_flag)
);

// Stimulus generation
initial begin
    // Test case 1: No error
    data_in = 8'b11010110; // Example data
    crc_in = 8'b00110111;  // CRC for the data (random example)
    #10; // Wait for a few time units
    
    // Test case 2: Error
    data_in = 8'b11010110; // Example data
    crc_in = 8'b00110110;  // CRC with one bit error
    #10; // Wait for a few time units

    // Add more test cases as needed
    // Ensure to change the data and CRC values accordingly
    // Add delays between test cases
end

endmodule
