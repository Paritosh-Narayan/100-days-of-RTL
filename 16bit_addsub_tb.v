`timescale 1ns / 1ps

module adder_subtractor_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg [15:0] A, B;
    reg cin, subtract;
    wire [15:0] sum;
    wire cout;

    // Instantiate the adder_subtractor module
    adder_subtractor DUT (
        .A(A),
        .B(B),
        .cin(cin),
        .subtract(subtract),
        .sum(sum),
        .cout(cout)
    );

    // Clock generation
    reg clk = 0;
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Test stimulus
    initial begin
        // Test case 1: Addition
        A = 8;
        B = 4;
        cin = 0;
        subtract = 0;
        #10;
        $display("Test Case 1: Addition");
        $display("A = %d, B = %d, cin = %d, subtract = %d, sum = %d, cout = %d", A, B, cin, subtract, sum, cout);

        // Test case 2: Subtraction
        A = 8;
        B = 4;
        cin = 0;
        subtract = 1;
        #10;
        $display("Test Case 2: Subtraction");
        $display("A = %d, B = %d, cin = %d, subtract = %d, sum = %d, cout = %d", A, B, cin, subtract, sum, cout);

        // Test case 3: Subtraction with borrow
        A = 4;
        B = 8;
        cin = 1;
        subtract = 1;
        #10;
        $display("Test Case 3: Subtraction with borrow");
        $display("A = %d, B = %d, cin = %d, subtract = %d, sum = %d, cout = %d", A, B, cin, subtract, sum, cout);

        // Add more test cases as needed
        
        #10;
        $finish;
    end

endmodule
