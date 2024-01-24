module demux_1x8 (
  input wire in,
  input wire sel2, sel1, sel0,
  output reg out0, out1, out2, out3, out4, out5, out6, out7
);

always @ (in or sel2 or sel1 or sel0)
  case ({sel2, sel1, sel0})
    3'b000: begin out0 = in; out1 = 0; out2 = 0; out3 = 0; out4 = 0; out5 = 0; out6 = 0; out7 = 0; end
    3'b001: begin out0 = 0; out1 = in; out2 = 0; out3 = 0; out4 = 0; out5 = 0; out6 = 0; out7 = 0; end
    3'b010: begin out0 = 0; out1 = 0; out2 = in; out3 = 0; out4 = 0; out5 = 0; out6 = 0; out7 = 0; end
    3'b011: begin out0 = 0; out1 = 0; out2 = 0; out3 = in; out4 = 0; out5 = 0; out6 = 0; out7 = 0; end
    3'b100: begin out0 = 0; out1 = 0; out2 = 0; out3 = 0; out4 = in; out5 = 0; out6 = 0; out7 = 0; end
    3'b101: begin out0 = 0; out1 = 0; out2 = 0; out3 = 0; out4 = 0; out5 = in; out6 = 0; out7 = 0; end
    3'b110: begin out0 = 0; out1 = 0; out2 = 0; out3 = 0; out4 = 0; out5 = 0; out6 = in; out7 = 0; end
    3'b111: begin out0 = 0; out1 = 0; out2 = 0; out3 = 0; out4 = 0; out5 = 0; out6 = 0; out7 = in; end
    default: begin out0 = 0; out1 = 0; out2 = 0; out3 = 0; out4 = 0; out5 = 0; out6 = 0; out7 = 0; end
  endcase

endmodule
