module tb_ripple_carry_adder;

  // Inputs
  reg [3:0] A;
  reg [3:0] B;
  reg Cin;

  // Outputs
  wire [3:0] Sum;
  wire Cout;

  // Instantiate the ripple_carry_adder module
  ripple_carry_adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    $monitor("Time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b", $time, A, B, Cin, Sum, Cout);

    // Test case 1
    A = 4'b0110;
    B = 4'b1011;
    Cin = 0;
    #10;

    // Test case 2
    A = 4'b1101;
    B = 4'b0111;
    Cin = 1;
    #10;

    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule
