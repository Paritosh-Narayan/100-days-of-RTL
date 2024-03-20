
`timescale 1ns / 1ps

module Moore_FSM_tb;

    // Parameters
    parameter CLK_PERIOD = 10;  // Clock period in ns

    // Signals
    reg clk = 0;       // Clock signal
    reg reset = 1;     // Reset signal
    wire [1:0] out_state_tb;  // Output state from the FSM

    // Instantiate the Moore FSM module
    Moore_FSM uut (
        .clk(clk),
        .reset(reset),
        .out_state(out_state_tb)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Reset generation
    initial begin
        #20 reset = 0;  // Deassert reset after 20 ns
        #100 $finish;   // End simulation after 100 ns
    end

    // Monitor output state
    always @(posedge clk) begin
        $display("Output State: %b", out_state_tb);
    end

endmodule
