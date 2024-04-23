
module convolutional_encoder(
    input clk,
    input reset,
    input [7:0] data_in,
    output reg [15:0] data_out
);

reg [2:0] state;
reg [2:0] next_state;
reg [1:0] shift_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= 3'b000;
        shift_reg <= 2'b00;
    end
    else begin
        state <= next_state;
        shift_reg <= {shift_reg[0], data_in[0]};
    end
end

always @* begin
    case(state)
        3'b000: next_state = 3'b100; // State 0
        3'b001: next_state = 3'b110; // State 1
        3'b010: next_state = 3'b111; // State 2
        3'b011: next_state = 3'b101; // State 3
        3'b100: next_state = 3'b000; // State 4
        3'b101: next_state = 3'b001; // State 5
        3'b110: next_state = 3'b011; // State 6
        3'b111: next_state = 3'b010; // State 7
        default: next_state = 3'b000;
    endcase
end

always @* begin
    case(state)
        3'b000: data_out = {shift_reg[1], shift_reg[0], data_in[0], data_in[0]}; // Output 00
        3'b001: data_out = {shift_reg[1], shift_reg[0], data_in[0], ~data_in[0]}; // Output 01
        3'b010: data_out = {shift_reg[1], shift_reg[0], ~data_in[0], data_in[0]}; // Output 10
        3'b011: data_out = {shift_reg[1], shift_reg[0], ~data_in[0], ~data_in[0]}; // Output 11
        3'b100: data_out = {~shift_reg[1], shift_reg[0], data_in[0], data_in[0]}; // Output 00
        3'b101: data_out = {~shift_reg[1], shift_reg[0], data_in[0], ~data_in[0]}; // Output 01
        3'b110: data_out = {~shift_reg[1], shift_reg[0], ~data_in[0], data_in[0]}; // Output 10
        3'b111: data_out = {~shift_reg[1], shift_reg[0], ~data_in[0], ~data_in[0]}; // Output 11
        default: data_out = 16'b0000000000000000;
    endcase
end

endmodule
