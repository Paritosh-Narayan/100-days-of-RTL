module mux_2to1 (
  input wire [1:0] data,   // Input data lines
  input wire sel,          // Selection signal
  output reg out           // Output signal
);

  always @* begin
    out = (sel == 1'b0) ? data[0] : data[1];
  end

endmodule
