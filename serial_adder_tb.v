`timescale 1ns / 1ps

module SerialAdder_TB;

    // Inputs
    reg clk;
    reg reset;
    reg start;
    reg [7:0] operand1;
    reg [7:0] operand2;

    // Outputs
    wire [8:0] sum;

    // Instantiate the SerialAdder module
    SerialAdder dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .operand1(operand1),
        .operand2(operand2),
        .sum(sum)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        clk = 0;
        reset = 1;
        start = 0;
        operand1 = 8'b00000000;
        operand2 = 8'b00000000;
        
        #10 reset = 0;
        #10 start = 1;
        #10 operand1 = 8'b00000001;
        #10 operand2 = 8'b00000001;
        #100 $finish;
    end

    // Monitor
    always @(posedge clk) begin
        $display("Time=%0t, Operand1=%b, Operand2=%b, Sum=%b", $time, operand1, operand2, sum);
    end

endmodule
