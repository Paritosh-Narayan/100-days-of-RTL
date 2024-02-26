`timescale 1ns / 1ps

module clock_divider_tb;

    // Inputs
    reg clk;
    
    // Outputs
    wire clk_div2;
    wire clk_div3;
    
    // Instantiate the clock divider module
    clock_divider dut(
        .clk(clk),
        .clk_div2(clk_div2),
        .clk_div3(clk_div3)
    );
    
    // Clock generation
    always #5 clk = ~clk; // Generating a 10ns clock period (50% duty cycle)
    
    // Stimulus
    initial begin
        // Initialize clock
        clk = 0;
        
        // Wait for a few clock cycles
        #50;
        
        // Print initial output values
        $display("Time = %0t, clk_div2 = %b, clk_div3 = %b", $time, clk_div2, clk_div3);
        
        // Continue simulation
        #1000;
        
        // End simulation
        $finish;
    end

endmodule
