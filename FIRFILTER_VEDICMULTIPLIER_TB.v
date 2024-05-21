module tb_fir_filter_vedic;

    // Testbench signals
    reg clk;
    reg rst;
    reg signed [3:0] x;  // 4-bit input sample
    wire signed [7:0] y;  // 8-bit output

    // Instantiate the FIR filter with Vedic multiplier
    fir_filter_vedic uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Stimulus
    initial begin
        // Initialize signals
        rst = 1;
        x = 0;

        // Reset the design
        #10;
        rst = 0;

        // Apply test vectors
        #10 x = 4'b0001; // Input sample 1
        #10 x = 4'b0010; // Input sample 2
        #10 x = 4'b0011; // Input sample 3
        #10 x = 4'b0100; // Input sample 4
        #10 x = 4'b0101; // Input sample 5
        #10 x = 4'b0110; // Input sample 6
        #10 x = 4'b0111; // Input sample 7
        #10 x = 4'b1000; // Input sample 8

        // Wait for some time to observe the output
        #100;

        // End simulation
        $stop;
    end

    // Monitor the inputs and output
    initial begin
        $monitor("At time %t, input = %d, output = %d", $time, x, y);
    end

endmodule
