module piso_shift_register_tb;

// Parameters
parameter WIDTH = 8;  // Number of bits in the shift register

// Inputs
reg clk;
reg rst;
reg parallel_in;

// Outputs
wire serial_out;

// Instantiate the PISO shift register module
piso_shift_register dut (
    .clk(clk),
    .rst(rst),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
);

// Clock generation
always #5 clk = ~clk;

// Initial stimulus
initial begin
    clk = 0;
    rst = 1;
    parallel_in = 0;
    #10 rst = 0;  // De-assert reset after 10 time units
    
    // Test with some input values
    #20 parallel_in = 8'b10101010;  // Test with input 10101010
    #10 parallel_in = 8'b11001100;  // Test with input 11001100
    #10 parallel_in = 8'b11110000;  // Test with input 11110000
    
    // Add more tests as needed
    
    // End simulation
    #100 $finish;
end

// Display the serial output
always @(posedge clk) begin
    $display("Serial Out: %b", serial_out);
end

endmodule
