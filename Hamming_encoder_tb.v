
module testbench();

reg [3:0] data_in;
wire [7:0] encoded_data;

// Instantiate the Hamming encoder module
hamming_encoder dut(
    .data_in(data_in),
    .encoded_data(encoded_data)
);

// Stimulus generation
initial begin
    // Test various input data values
    data_in = 4'b0000; // Input data: 0000
    #10; // Wait for 10 time units
    data_in = 4'b1010; // Input data: 1010
    #10; // Wait for 10 time units
    data_in = 4'b1101; // Input data: 1101
    #10; // Wait for 10 time units
    $stop; // Stop simulation
end

// Display outputs
always @(posedge data_in) begin
    $display("Input: %b, Encoded Output: %b", data_in, encoded_data);
end

endmodule
