module demux_1x4 (
  input wire data_input,
  input wire control_input,
  output reg out_0,
  output reg out_1,
  output reg out_2,
  output reg out_3
);

  always @(posedge control_input) begin
    out_0 <= (control_input) ? data_input : 1'b0;
    out_1 <= (control_input) ? 1'b0 : data_input;
    out_2 <= 1'b0;
    out_3 <= 1'b0;
  end

endmodule
