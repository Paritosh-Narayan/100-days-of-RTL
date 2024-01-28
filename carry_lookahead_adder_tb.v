module tb_CarryLookAheadAdder;

  // Parameters
  parameter WIDTH = 4;

  // Inputs
  reg [WIDTH-1:0] A, B;
  reg Cin;

  // Outputs
  wire [WIDTH-1:0] Sum;
  wire Cout;

  // Instantiate the Carry Look-Ahead Adder
  CarryLookAheadAdder uut (
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
    $dumpfile("tb_CarryLookAheadAdder.vcd");
    $dumpvars(0, tb_CarryLookAheadAdder);

    // Test case 1
    A = 4'b0000;
    B = 4'b0000;
    Cin = 0;
    #10;

    // Test case 2
    A = 4'b1101;
    B = 4'b0011;
    Cin = 0;
    #10;

    // Test case 3
    A = 4'b1111;
    B = 4'b0001;
    Cin = 1;
    #10;

    // Add more test cases as needed

    $finish;
  end

endmodule
