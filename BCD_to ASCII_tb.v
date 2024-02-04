`timescale 1ns/1ns

module testbench;

  reg [3:0] bcd_input;
  wire [7:0] ascii_output;

  // Instantiate the BCD to ASCII converter
  bcd_to_ascii_converter uut (
    .bcd_input(bcd_input),
    .ascii_output(ascii_output)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    $monitor("Time=%0t bcd_input=%b ascii_output=%b", $time, bcd_input, ascii_output);

    // Test vector
    bcd_input = 4'b0000; #10;
    bcd_input = 4'b0001; #10;
    bcd_input = 4'b0010; #10;
    bcd_input = 4'b0100; #10;
    bcd_input = 4'b1001; #10;

    // Add more test cases as needed

    $finish;
  end

endmodule
