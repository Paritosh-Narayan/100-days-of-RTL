module universal_shift_register(
    input wire clk,           // Clock input
    input wire reset,         // Reset input
    input wire shift_left,    // Shift left control input
    input wire shift_right,   // Shift right control input
    input wire parallel_load, // Parallel load control input
    input wire [7:0] data_in, // Input data
    input wire enable,        // Enable input
    output reg [7:0] data_out // Output data
);

// Internal register to hold the shifted data
reg [7:0] shift_register;

// Parallel load operation
always @(posedge clk, posedge reset) begin
    if (reset) begin
        shift_register <= 8'b0; // Reset the register
    end else if (parallel_load) begin
        shift_register <= data_in; // Load input data into the register
    end
end

// Shift left or right operation
always @(posedge clk, posedge reset) begin
    if (reset) begin
        data_out <= 8'b0; // Reset the output on reset
    end else if (enable) begin
        if (shift_left) begin
            // Shift left by 1 bit
            data_out <= {shift_register[6:0], shift_register[7]};
        end else if (shift_right) begin
            // Shift right by 1 bit
            data_out <= {shift_register[0], shift_register[7:1]};
        end else begin
            // No shift, output the current content
            data_out <= shift_register;
        end
    end
end

endmodule

