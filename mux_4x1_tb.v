`timescale 1ns/1ns  // Specify simulation time units

module tb_mux_2to1;

  // Inputs
  reg [1:0] data;
  reg sel;

  // Output
  wire out;

  // Instantiate the 2:1 multiplexer module
  mux_2to1 uut (
    .data(data),
    .sel(sel),
    .out(out)
  );

  // Initial block for stimulus generation
  initial begin
    $monitor("Time=%0t data=%b sel=%b out=%b", $time, data, sel, out);

    // Test case 1: Select input data[0]
    data = 2'b10; sel = 0;
    #10;

    // Test case 2: Select input data[1]
    data = 2'b01; sel = 1;
    #10;

    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule
