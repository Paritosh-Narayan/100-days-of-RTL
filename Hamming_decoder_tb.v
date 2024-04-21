`timescale 1ns / 1ps

module testbench;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Signals
reg [6:0] encoded_data;
wire [3:0] decoded_data;
wire [2:0] syndrome;

// Instantiate the Hamming decoder module
hamming_decoder UUT(
    .encoded_data(encoded_data),
    .decoded_data(decoded_data),
    .syndrome(syndrome)
);

// Clock generation
reg clk = 0;
always #((CLK_PERIOD)/2) clk = ~clk;

// Stimulus
initial begin
    $monitor("Time=%t, Encoded Data=%b, Decoded Data=%b, Syndrome=%b", $time, encoded_data, decoded_data, syndrome);
    
    // Test Case 1: No error
    encoded_data = 7'b1011000; // Data: 1011, No error
    #10;
    
    // Test Case 2: Single-bit error
    encoded_data = 7'b1001000; // Data: 1011, Error in bit 0
    #10;
    
    // Test Case 3: Single-bit error
    encoded_data = 7'b1111000; // Data: 1011, Error in bit 3
    #10;
    
    // Test Case 4: Double-bit error
    encoded_data = 7'b1111010; // Data: 1011, Errors in bits 3 and 5
    #10;
    
    // Add more test cases as needed
    
    $finish;
end

// Clock driver
always #((CLK_PERIOD)/2) clk = ~clk;

endmodule
