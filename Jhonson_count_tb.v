
`timescale 1ns / 1ps

module johnson_counter_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Signals
reg clk;
wire [3:0] out;

// Instantiate the Johnson counter module
johnson_counter dut (
    .clk(clk),
    .out(out)
);

// Clock generation
always #((CLK_PERIOD)/2) clk = ~clk;

// Stimulus
initial begin
    // Initialize clock
    clk = 0;
    // Wait for a few clock cycles
    #10;
    // Display initial state
    $display("Initial State: out = %b", out);
    // Generate clock and observe output for 20 clock cycles
    repeat (20) begin
        #1;
        $display("At time %t: out = %b", $time, out);
    end
    // End simulation
    $finish;
end

endmodule
