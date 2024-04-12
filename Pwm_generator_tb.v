`timescale 1ns/1ps // Define timescale

module testbench;

    // Inputs
    reg clk;           // Clock input
    reg rst;           // Reset input
    reg [7:0] duty_cycle;  // Duty cycle input
    
    // Outputs
    wire pwm_out;      // PWM output
    
    // Instantiate the PWM generator module
    pwm_generator pwm_gen(
        .clk(clk),
        .rst(rst),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end
    
    // Declare loop variable
    integer i;
    
    // Initial values
    initial begin
        clk = 0;        // Initialize clock
        rst = 1;        // Assert reset
        duty_cycle = 8'b00000000;  // Initialize duty cycle to 0%
        
        // Wait for 10 time units
        #10;
        
        // De-assert reset
        rst = 0;
        
        // Wait for 100 time units for simulation
        #100;
        
        // Test different duty cycles
        for (i = 0; i <= 255; i = i + 10) begin
            duty_cycle = i;
            #50; // Wait for 50 time units
        end
        
        // End simulation
        $finish;
    end
    
endmodule
