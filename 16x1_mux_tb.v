`timescale 1ns/1ns  // Set the timescale

module testbench_mux_16x1;

  // Inputs
  reg [15:0] data_inputs;
  reg [3:0] select_line;

  // Output
  wire output_data;

  // Instantiate the 16x1 multiplexer module
  mux_16x1 uut (
    .data_inputs(data_inputs),
    .select_line(select_line),
    .output_data(output_data)
  );

  // Initial block for stimulus generation
  initial begin
    // Initialize inputs
    data_inputs = 16'b0;
    select_line = 4'b0000;

    // Apply stimulus
    #10 data_inputs = 16'b1010101010101010;
    #10 select_line = 4'b0101;

    #10 data_inputs = 16'b1100110011001100;
    #10 select_line = 4'b1100;

    // Add more test cases as needed

    // Stop simulation
    #10 $finish;
  end

  // Display the results
  always @(posedge output_data) begin
    $display("Output Data: %b", output_data);
  end

endmodule
