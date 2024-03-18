module EdgeDetector_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Signals
    reg clk = 0;            // Clock signal
    reg reset_n = 1;        // Reset signal
    reg data_in = 0;        // Input data signal
    wire edge_detected;     // Output edge_detected signal

    // Instantiate the edge detector module
    EdgeDetector UUT (
        .clk(clk),
        .reset_n(reset_n),
        .data_in(data_in),
        .edge_detected(edge_detected)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Stimulus
    initial begin
        // Reset
        reset_n = 0;
        #50; // Hold reset for 50 time units
        reset_n = 1;

        // Test scenario
        #10 data_in = 1; // Edge detected
        #20 data_in = 0;
        #20 data_in = 1; // Edge detected
        #30 data_in = 1;
        #30 data_in = 0; // Edge detected

        #100 $finish; // Finish simulation after 100 time units
    end

    // Display simulation results
    initial begin
        $dumpfile("EdgeDetector_tb.vcd");
        $dumpvars(0, EdgeDetector_tb);
        $display("Simulation started...");
    end

endmodule
