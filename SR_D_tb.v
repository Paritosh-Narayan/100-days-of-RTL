`timescale 1ns / 1ps

module sr_to_d_flip_flop_tb;

reg s, r, clk;
wire q;

// Instantiate the DUT
sr_to_d_flip_flop uut(
    .s(s),
    .r(r),
    .clk(clk),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // Initialize inputs
    s = 0;
    r = 0;
    clk = 0;
    
    // Apply inputs and display outputs
    #10 s = 1; r = 0; // Set condition
    #10 s = 0; r = 1; // Reset condition
    #10 s = 0; r = 0; // Hold condition

    // Add more test cases here if needed

    // End simulation
    #10 $finish;
end

endmodule
