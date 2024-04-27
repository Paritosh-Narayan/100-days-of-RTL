//////////////////////////////////////////////////////////////////////////////////
module wallace_multiplier_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in nanoseconds

// Signals
reg [15:0] a;
reg [15:0] b;
wire [31:0] result;

// Instantiate the DUT
wallace_multiplier dut (
    .a(a),
    .b(b),
    .result(result)
);

// Clock generation
reg clk = 0;
always #((CLK_PERIOD)/2) clk = ~clk;

// Test stimulus
initial begin
    // Test case 1: Multiply 5 by 7
    a = 5;
    b = 7;
    #100;

    // Test case 2: Multiply 12 by 9
    a = 12;
    b = 9;
    #100;

    // Add more test cases here if needed

    // Stop simulation
    $stop;
end

endmodule
