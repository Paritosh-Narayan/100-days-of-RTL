module tb_Square_Circuit;

  // Inputs
  reg [2:0] input_number;
  
  // Outputs
  wire [5:0] output_square;

  // Instantiate the Square_Circuit module
  Square_Circuit uut (
    .input_number(input_number),
    .output_square(output_square)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Apply inputs and observe outputs
    $monitor("Time=%0t Input=%b Output=%b", $time, input_number, output_square);

    // Test case 1
    input_number = 3'b000; // Input: 0
    #10;

    // Test case 2
    input_number = 3'b010; // Input: 2
    #10;

    // Test case 3
    input_number = 3'b101; // Input: 5
    #10;

    // Add more test cases as needed

    // Stop simulation
    $stop;
  end

endmodule
