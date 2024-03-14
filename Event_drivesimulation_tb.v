`timescale 1ns/1ns // Define timescale

module event_simulation_tb;

// Parameters
parameter PERIOD = 10; // Time period for clock
parameter HALF_PERIOD = PERIOD / 2; // Half the clock period

// Inputs
reg a, b;
// Output
wire c;

// Instantiate the design under test (DUT)
event_simulation DUT (
    .a(a),
    .b(b),
    .c(c)
);

// Clock generation
reg clk = 0;
always #HALF_PERIOD clk = ~clk;

// Stimulus generation
initial begin
    // Initialize inputs
    a = 0;
    b = 0;
    
    // Apply stimulus
    #5 a = 1; b = 0; // First scenario: a=1, b=0
    #5 a = 0; b = 1; // Second scenario: a=0, b=1
    #5 a = 1; b = 1; // Third scenario: a=1, b=1
    #5 a = 0; b = 0; // Fourth scenario: a=0, b=0
    #10 $finish; // Finish simulation
end

// Monitor the outputs
always @(posedge clk) begin
    $display("Time %0t: a=%b, b=%b, c=%b", $time, a, b, c);
end

endmodule


