module SR_to_JK_tb;

// Parameters
parameter PERIOD = 10; // Time period for clock (in time units)
parameter SIM_TIME = 100; // Simulation time (in time units)

// Inputs
reg S, R, CLK;

// Outputs
wire J, K;

// Instantiate the SR_to_JK module
SR_to_JK uut (
    .S(S),
    .R(R),
    .CLK(CLK),
    .J(J),
    .K(K)
);

// Clock generation
always #((PERIOD / 2)) CLK = ~CLK;

// Stimulus
initial begin
    $dumpfile("SR_to_JK_tb.vcd");
    $dumpvars(0, SR_to_JK_tb);

    // Test case 1: Set condition
    S = 1'b1; R = 1'b0;
    #20; // Wait for 2 clock cycles
    // Test case 2: Reset condition
    S = 1'b0; R = 1'b1;
    #20; // Wait for 2 clock cycles
    // Test case 3: Invalid condition
    S = 1'b1; R = 1'b1;
    #20; // Wait for 2 clock cycles
    // Test case 4: Hold state
    S = 1'b0; R = 1'b0;
    #20; // Wait for 2 clock cycles

    $finish;
end

endmodule
