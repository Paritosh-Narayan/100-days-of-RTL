
module sipo_tb;

  // Inputs
  reg clk;
  reg rst;
  reg a;

  // Outputs
  wire [3:0] q;

  // Instantiate the sipo module
  sipo my_sipo (
    .a(a),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initial block for stimulus generation
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    a = 0;

    // Apply reset
    #10 rst = 0;

    // Test case 1
    #10 a = 1;
    #10 a = 0;
    #10 a = 1;

    // Test case 2
    #10 rst = 1;
    #10 a = 0;
    #10 a = 1;
    #10 a = 0;

    // Add more test cases as needed

    // Finish simulation
    #10 $finish;
  end

endmodule

module sipo (a, clk, rst, q);
  input clk, rst, a;
  output [3:0] q;
  reg [3:0] temp;

  always @(posedge clk or posedge rst) begin
    if (rst == 1'b1)
      temp <= 4'b0000;
    else
      temp <= {temp[2:0], a};
  end

  assign q = temp;

endmodule
