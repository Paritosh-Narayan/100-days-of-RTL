module piso_shift_register(
    input wire clk,       // Clock input
    input wire rst,       // Reset input
    input wire parallel_in,  // Parallel input data
    output reg serial_out  // Serial output data
);

parameter WIDTH = 8;  // Number of bits in the shift register

reg [WIDTH-1:0] data;  // Internal storage for parallel data

always @(posedge clk or posedge rst) begin
    if (rst) begin
        data <= 0;  // Reset the register
        serial_out <= 0;  // Reset serial output
    end else begin
        // Shift left and insert parallel_in at the rightmost bit
        data <= {data[WIDTH-2:0], parallel_in};
        // Output the rightmost bit
        serial_out <= data[WIDTH-1];
    end
end

endmodule
