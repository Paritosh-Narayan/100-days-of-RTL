`timescale 1ns / 1ps

module fixed_point_division_tb;

// Parameters
parameter CLOCK_PERIOD = 10; // Clock period in ns

// Inputs
reg signed [31:0] dividend;
reg signed [15:0] divisor;

// Outputs
wire signed [31:0] quotient;

// Instantiate the module under test
fixed_point_division uut (
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient)
);

// Clock generation
reg clock = 0;
always #((CLOCK_PERIOD) / 2) clock = ~clock;

// Stimulus
initial begin
    // Initialize inputs
    dividend = 100; // Example dividend
    divisor = 5;    // Example divisor
    
    // Apply inputs and observe outputs
    #10;
    $display("Dividend = %d, Divisor = %d, Quotient = %d", dividend, divisor, quotient);
    
    // Additional tests can be added here
    
    // Finish simulation
    $finish;
end

// Clock driver
always #((CLOCK_PERIOD) / 2) clock = ~clock;

endmodule
