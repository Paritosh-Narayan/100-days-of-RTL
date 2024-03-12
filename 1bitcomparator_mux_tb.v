
module tb_comparator_mux;

    // Parameters
    parameter DATA_WIDTH = 4;
    
    // Inputs
    reg [DATA_WIDTH-1:0] data_input;
    reg [DATA_WIDTH-1:0] compare_value;
    reg control;
    
    // Outputs
    wire [DATA_WIDTH-1:0] mux_output;
    
    // Instantiate the module under test
    comparator_mux dut (
        .data_input(data_input),
        .compare_value(compare_value),
        .control(control),
        .mux_output(mux_output)
    );
    
    // Stimulus
    initial begin
        // Initialize inputs
        data_input = 4'b0000;
        compare_value = 4'b0101;
        control = 1'b0; // Select multiplexer mode
        
        // Apply stimulus
        #10;
        data_input = 4'b1010;
        #10;
        data_input = 4'b1100;
        #10;
        data_input = 4'b0110;
        #10;
        
        // Switch to comparator mode
        control = 1'b1;
        #10;
        
        // Change compare_value
        compare_value = 4'b1100;
        #10;
        compare_value = 4'b0110;
        #10;
        compare_value = 4'b1010;
        #10;
        
        // End simulation
        $finish;
    end
    
    // Display output
    always @(posedge $time)
        $display("data_input = %b, compare_value = %b, control = %b, mux_output = %b", 
            data_input, compare_value, control, mux_output);
        
endmodul
