module ROM (clk, en, addr, data);
  input clk, en;
  input [4:0] addr;
  output reg [3:0] data;

  always @(posedge clk) begin
    if (en) begin
      case (addr)
        5'b00000: data = 4'b0110;
        5'b00001: data = 4'b1010;
        5'b00010: data = 4'b1110;
        5'b00011: data = 4'b0110;
        5'b00100: data = 4'b1111;
        5'b00101: data = 4'b1010;
        5'b00110: data = 4'b1100;
        5'b00111: data = 4'b0000;
        5'b01000: data = 4'b1011;
        5'b01001: data = 4'b0010;
        5'b01010: data = 4'b1110;
        5'b01011: data = 4'b0010;
        5'b01100: data = 4'b0100;
        5'b01101: data = 4'b1010;
        5'b01110: data = 4'b1100;
        5'b01111: data = 4'b0110;
        default: data = 4'b0000;
      endcase
    end
  end
endmodule
