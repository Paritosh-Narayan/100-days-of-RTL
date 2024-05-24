module tb_LampHandball;

// Inputs
reg clk;
reg reset;
reg [4:0] button;

// Outputs
wire [4:0] lamp;

// Instantiate the LampHandball module
LampHandball uut (
    .clk(clk),
    .reset(reset),
    .button(button),
    .lamp(lamp)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units period clock
end

// Test sequence
initial begin
    // Initialize Inputs
    reset = 0;
    button = 5'b00000;
    
    // Apply reset
    #10;
    reset = 1;
    #10;
    reset = 0;

    // Test button presses
    #10; button[0] = 1; // Toggle lamp 0
    #10; button[0] = 0;
    #10; button[1] = 1; // Toggle lamp 1
    #10; button[1] = 0;
    #10; button[2] = 1; // Toggle lamp 2
    #10; button[2] = 0;
    #10; button[3] = 1; // Toggle lamp 3
    #10; button[3] = 0;
    #10; button[4] = 1; // Toggle lamp 4
    #10; button[4] = 0;

    // Toggle each lamp again to turn them off
    #10; button[0] = 1;
    #10; button[0] = 0;
    #10; button[1] = 1;
    #10; button[1] = 0;
    #10; button[2] = 1;
    #10; button[2] = 0;
    #10; button[3] = 1;
    #10; button[3] = 0;
    #10; button[4] = 1;
    #10; button[4] = 0;

    // Reset the lamps
    #10; reset = 1;
    #10; reset = 0;

    // End of test
    #20;
    $stop;
end

endmodule

