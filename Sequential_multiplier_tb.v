module testbench;

  reg clk;
  reg reset;
  reg [7:0] a;
  reg [7:0] b;
  wire [15:0] result;

  // Instantiate the sequential_multiplier module
  sequential_multiplier uut (
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .result(result)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Reset generation
  initial begin
    reset = 1;
    #10 reset = 0;
  end

  // Test case
  initial begin
    $monitor("Time=%0t, a=%h, b=%h, result=%h", $time, a, b, result);
    a = 8'h3; // Example input values
    b = 8'h5;
    #50;
    $finish;
  end

endmodule
