module bidirectional_shift_register (
    input clk,
    input rst,
    input shift_direction,
    input data_in,
    output reg data_out
);

reg [7:0] register;

always @(posedge clk or posedge rst) begin
    if (rst)
        register <= 8'b00000000; // Reset the register
    else if (shift_direction) // Shift Right
        register <= {1'b0, register[7:1]};
    else // Shift Left
        register <= {register[6:0], 1'b0};
end

always @* begin
    if (shift_direction)
        data_out = register[0];
    else
        data_out = register[7];
end

endmodule
