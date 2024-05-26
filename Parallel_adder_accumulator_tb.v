
module tb_TopModule;

  // Inputs
  reg clk;
  reg reset;
  reg [3:0] A;
  reg [3:0] B;

  // Outputs
  wire [3:0] Sum;
  wire CarryOutAdder;
  wire [3:0] Accum;
  wire CarryOutAccum;

  // Instantiate the TopModule
  TopModule uut (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .Sum(Sum),
    .CarryOutAdder(CarryOutAdder),
    .Accum(Accum),
    .CarryOutAccum(CarryOutAccum)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units clock period
  end

  // Test sequence
  initial begin
    // Initialize Inputs
    reset = 0;
    A = 4'b0000;
    B = 4'b0000;

    // Apply reset
    #10;
    reset = 1;
    #10;
    reset = 0;

    // Test various inputs
    #10; A = 4'b0001; B = 4'b0010; // A = 1, B = 2
    #10; A = 4'b0100; B = 4'b0101; // A = 4, B = 5
    #10; A = 4'b0011; B = 4'b0001; // A = 3, B = 1
    #10; A = 4'b0111; B = 4'b0001; // A = 7, B = 1
    #10; A = 4'b1111; B = 4'b0001; // A = 15, B = 1 (check carry out)

    // Check accumulator functionality
    #10; A = 4'b0010; B = 4'b0010; // A = 2, B = 2
    #10; A = 4'b0011; B = 4'b0011; // A = 3, B = 3

    // Apply reset to check accumulator reset functionality
    #10; reset = 1;
    #10; reset = 0;

    // End of test
    #20;
    $stop;
  end

endmodule
