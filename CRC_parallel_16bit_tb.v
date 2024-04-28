module tb_crc16_parallel;

    // Inputs
    reg [15:0] data_in;
    reg clk;
    reg reset;
    
    // Outputs
    wire [15:0] crc_out;

    // Instantiate the module under test
    crc16_parallel dut (
        .data_in(data_in),
        .clk(clk),
        .reset(reset),
        .crc_out(crc_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Initial stimulus
    initial begin
        clk = 0;
        reset = 1; // Assert reset
        data_in = 16'h0000; // Input data
        #10 reset = 0; // Deassert reset after 10 time units
        
        // Test case 1: data_in = 16'h1234
        data_in = 16'h1234;
        #20;
        
        // Test case 2: data_in = 16'h5678
        data_in = 16'h5678;
        #20;
        
        // Add more test cases as needed
        
        $finish; // End simulation
    end

endmodule
