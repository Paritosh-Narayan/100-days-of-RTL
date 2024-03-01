module barrel_shifter(
    input [7:0] data_in,      // Input data
    input [2:0] shift_amount, // Shift amount
    input direction,          // Direction of shift (0=left, 1=right)
    output reg [7:0] data_out // Output data
);

always @(*) begin
    case(shift_amount)
        3'b000: data_out = data_in; // No shift
        3'b001: data_out = (direction) ? {1'b0, data_in[7:1]} : {data_in[6:0], 1'b0}; // Shift by 1
        3'b010: data_out = (direction) ? {2'b00, data_in[7:2]} : {data_in[5:0], 2'b00}; // Shift by 2
        3'b011: data_out = (direction) ? {3'b000, data_in[7:3]} : {data_in[4:0], 3'b000}; // Shift by 3
        3'b100: data_out = (direction) ? {4'b0000, data_in[7:4]} : {data_in[3:0], 4'b0000}; // Shift by 4
        3'b101: data_out = (direction) ? {5'b00000, data_in[7:5]} : {data_in[2:0], 5'b00000}; // Shift by 5
        3'b110: data_out = (direction) ? {6'b000000, data_in[7:6]} : {data_in[1:0], 6'b000000}; // Shift by 6
        3'b111: data_out = (direction) ? {7'b0000000, data_in[7]} : {data_in[0], 7'b0000000}; // Shift by 7
        default: data_out = 8'b0; // Default case
    endcase
end

endmodule
