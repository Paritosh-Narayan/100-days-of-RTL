
module shift_register_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Signals
    reg clk;
    reg reset;
    reg enable;
    reg direction;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate the DUT
    shift_register dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .direction(direction),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        reset = 1;
        enable = 0;
        direction = 0;
        data_in = 8'b00000000; // Initial input data
        
        // Apply reset
        #10;
        reset = 0;
        
        // Testcase 1: Left shift
        #10;
        enable = 1;
        direction = 0;
        data_in = 8'b10101010; // Input data
        #50;
        // Verify output
        if (data_out !== 8'b00000000) $display("Test case 1 failed");
        
        // Testcase 2: Right shift
        #10;
        enable = 1;
        direction = 1;
        data_in = 8'b10101010; // Input data
        #50;
        // Verify output
        if (data_out !== 8'b01010101) $display("Test case 2 failed");

        // End simulation
        $finish;
    end

endmodule
