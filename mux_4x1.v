module mux_4to1 (
  input wire [3:0] data_in,   // 4-bit input data
  input wire [1:0] sel,       // 2-bit select input
  output wire out_mux         // Output of the multiplexer
);

  assign out_mux = (sel == 2'b00) ? data_in[0] :
                  (sel == 2'b01) ? data_in[1] :
                  (sel == 2'b10) ? data_in[2] :
                  (sel == 2'b11) ? data_in[3] :
                                  1'bz;  // Default output (floating state)

endmodule
