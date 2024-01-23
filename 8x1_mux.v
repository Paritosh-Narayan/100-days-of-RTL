module mux_8x1 (
  input [7:0] data_inputs,   // 8 data inputs
  input [2:0] select_line,   // 3-bit select line
  output reg  output_data    // Output data
);

always @* begin
  case (select_line)
    3'b000: output_data = data_inputs[0];
    3'b001: output_data = data_inputs[1];
    3'b010: output_data = data_inputs[2];
    3'b011: output_data = data_inputs[3];
    3'b100: output_data = data_inputs[4];
    3'b101: output_data = data_inputs[5];
    3'b110: output_data = data_inputs[6];
    3'b111: output_data = data_inputs[7];
    default: output_data = 0; // Default case
  endcase
end

endmodule
