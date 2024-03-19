`timescale 1ns / 1ps

module MealyFSM_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Signals
reg clk = 0;
reg reset = 1;
reg x;
wire y1;
wire y2;

// Instantiate MealyFSM module
MealyFSM dut (
    .clk(clk),
    .reset(reset),
    .x(x),
    .y1(y1),
    .y2(y2)
);

// Clock generation
always #((CLK_PERIOD/2)) clk = ~clk;

// Test stimulus
initial begin
    $monitor("Time=%0t: x=%b, y1=%b, y2=%b", $time, x, y1, y2);
    #5 reset = 0; // Deassert reset
    #10 x = 0;
    #20 x = 1;
    #20 x = 0;
    #20 x = 1;
    #20 x = 1;
    #20 x = 0;
    #20 $finish;
end

endmodule
