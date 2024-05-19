module Generate_threetimesmultiptable_tb(
   // Inputs to the module 
  reg clk; 
  reg reset; 
 
  // Outputs from the module 
  wire [7:0] result; 
  wire [3:0] index; 
 
  // Instantiate the ThreeTimesTable module 
  ThreeTimesTable uut ( 
    .clk(clk), 
    .reset(reset), 
    .result(result), 
    .index(index) 
  ); 
 
  // Clock generation process 
  initial begin 
    clk = 0; // Initialize clock to low 
    forever #5 clk = ~clk; // Toggle clock every 5 time units 
  end 
 
  // Test stimulus process 
  initial begin 
    // Monitor output on each clock cycle 
    $monitor("Time=%t, 3 * %d = %d", $time, index, result); 
 
    // Initialize the simulation with a reset 
    reset = 1; // Apply reset 
    #10;       // Wait for 10 time units 
    reset = 0; // Release reset 
 
    // Wait for 100 time units to observe the outputs 
    #100; 
 
    // Stop the simulation 
    $stop; 
  end 
endmodule
