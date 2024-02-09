module d_flip_flop_tb;

    // Define parameters
    parameter CLK_PERIOD = 10;  // Clock period in simulation ticks

    // Declare signals
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D flip-flop
    d_flip_flop DUT (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial stimulus
    initial begin
        clk = 0;
        reset = 1;
        d = 0;
        
        // Wait for a few clock cycles
        #10;
        
        // Release reset
        reset = 0;
        
        // Apply input data
        #5;
        d = 1;
        #10;
        d = 0;
        
        // Apply reset again
        #5;
        reset = 1;
        #5;
        reset = 0;
        
        // Apply data while reset is low
        #5;
        d = 1;
        #10;
        d = 0;
        
        // End simulation
        #10;
        $finish;
    end

endmodule
