module encoder_4to2 (
  input [3:0] data_in,
  output [1:0] encoded_output
);

assign encoded_output[0] = (data_in[0] | data_in[1]) ? 1'b1 : 1'b0;
assign encoded_output[1] = (data_in[2] | data_in[3]) ? 1'b1 : 1'b0;

endmodule
