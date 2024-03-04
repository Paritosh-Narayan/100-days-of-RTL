`timescale 1ns / 1ps // Specify simulation time scale

module testbench;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in simulation time units
    
    // Signals
    reg clk;
    reg rst;
    reg shift_direction;
    reg data_in;
    wire data_out;
    
    // Instantiate the bidirectional shift register
    bidirectional_shift_register uut (
        .clk(clk),
        .rst(rst),
        .shift_direction(shift_direction),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;
    
    // Stimulus
    initial begin
        $dumpfile("dump.vcd"); // Output VCD file for waveform viewing
        $dumpvars(0, testbench); // Dump all signals
        
        // Reset sequence
        rst = 1;
        shift_direction = 0;
        data_in = 0;
        #20;
        rst = 0;
        
        // Shift left sequence
        shift_direction = 0;
        data_in = 1;
        #100;
        
        // Shift right sequence
        shift_direction = 1;
        data_in = 0;
        #100;
        
        // End simulation
        $finish;
    end
    
    // Monitor data_out
    always @(posedge clk) begin
        $display("data_out = %b", data_out);
    end
    
endmodule
