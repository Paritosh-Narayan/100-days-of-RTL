`timescale 1ns / 1ns

module tb_up_down_counter;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns
    
    // Inputs
    reg clk;
    reg rst_n;
    reg up_down;
    
    // Outputs
    wire [3:0] count;
    
    // Instantiate the up_down_counter module
    up_down_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .up_down(up_down),
        .count(count)
    );
    
    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;
    
    // Initializations
    initial begin
        clk = 0;
        rst_n = 0;
        up_down = 0;
        
        // Reset active for 20ns
        #20 rst_n = 1;
        
        // Up counting
        #10 up_down = 1;
        
        // Down counting
        #50 up_down = 0;
        
        // End simulation
        #50 $finish;
    end
    
    // Display counter value
    always @(posedge clk) begin
        $display("Count = %b", count);
    end

endmodule
