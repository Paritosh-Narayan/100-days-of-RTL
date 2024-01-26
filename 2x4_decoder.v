module Decoder_2to4 (
  input [1:0] in,
  output [3:0] out
);

  assign out[0] = (in == 2'b00) ? 1'b1 : 1'b0;
  assign out[1] = (in == 2'b01) ? 1'b1 : 1'b0;
  assign out[2] = (in == 2'b10) ? 1'b1 : 1'b0;
  assign out[3] = (in == 2'b11) ? 1'b1 : 1'b0;

endmodule
