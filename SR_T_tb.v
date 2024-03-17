module testbench;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in time units

  // Inputs
  reg S, R, CLK;

  // Outputs
  wire Q;

  // Instantiate the SR-D flip-flop module
  SR_D_FF DUT (
    .S(S),
    .R(R),
    .CLK(CLK),
    .Q(Q)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) CLK = ~CLK;

  // Initial stimulus
  initial begin
    // Initialize inputs
    S = 0;
    R = 0;
    CLK = 0;

    // Apply stimulus
    #5 S = 1;
    #10 S = 0;
    #10 R = 1;
    #10 R = 0;
    #10 S = 1;
    #10 R = 1;
    #10 S = 0;
    #10 R = 0;

    // Add additional test cases as needed

    // Stop simulation
    #10;
    $finish;
  end

  // Display output
  always @(posedge CLK) begin
    $display("At time %t: S=%b, R=%b, Q=%b", $time, S, R, Q);
  end

endmodule
