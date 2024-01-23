module mux_16x1 (
  input [15:0] data_inputs,   // 16 data inputs
  input [3:0]  select_line,   // 4-bit select line
  output reg   output_data    // Output data
);

always @* begin
  case (select_line)
    4'b0000: output_data = data_inputs[0];
    4'b0001: output_data = data_inputs[1];
    4'b0010: output_data = data_inputs[2];
    4'b0011: output_data = data_inputs[3];
    4'b0100: output_data = data_inputs[4];
    4'b0101: output_data = data_inputs[5];
    4'b0110: output_data = data_inputs[6];
    4'b0111: output_data = data_inputs[7];
    4'b1000: output_data = data_inputs[8];
    4'b1001: output_data = data_inputs[9];
    4'b1010: output_data = data_inputs[10];
    4'b1011: output_data = data_inputs[11];
    4'b1100: output_data = data_inputs[12];
    4'b1101: output_data = data_inputs[13];
    4'b1110: output_data = data_inputs[14];
    4'b1111: output_data = data_inputs[15];
    default: output_data = 0; // Default case
  endcase
end

endmodule
