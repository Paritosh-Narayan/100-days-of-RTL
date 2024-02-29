module majority_circuit_tb;

// Parameters
parameter NUM_INPUTS = 5;

// Inputs
reg [NUM_INPUTS-1:0] input_vector;
// Outputs
wire majority_output;

// Instantiate the majority circuit
majority_circuit uut(
    .input_vector(input_vector),
    .majority_output(majority_output)
);

// Clock generation
initial begin
    $dumpfile("majority_circuit_tb.vcd");
    $dumpvars(0, majority_circuit_tb);

    // Initialize inputs
    input_vector = 5'b00000;

    // Apply test vectors
    #10 input_vector = 5'b00001; // Majority output should be 0
    #10 input_vector = 5'b00011; // Majority output should be 0
    #10 input_vector = 5'b00111; // Majority output should be 1
    #10 input_vector = 5'b01111; // Majority output should be 1
    #10 input_vector = 5'b11111; // Majority output should be 1

    // End simulation
    #10 $finish;
end

endmodule
