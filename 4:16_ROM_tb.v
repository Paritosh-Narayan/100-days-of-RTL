`timescale 1ns / 1ps

module ROM_tb;

  reg clk, en;
  reg [4:0] addr;
  wire [3:0] data;

  // Instantiate the ROM module
  ROM uut (
    .clk(clk),
    .en(en),
    .addr(addr),
    .data(data)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    en = 1;
    addr = 5'b00000;

    // Test case 1
    #10 addr = 5'b00001;
    #10 addr = 5'b00010;
    #10 addr = 5'b00100;
    #10 addr = 5'b00101;
    #10 addr = 5'b01000;

    // Test case 2
    #10 addr = 5'b01001;
    #10 addr = 5'b01010;
    #10 addr = 5'b01011;
    #10 addr = 5'b01100;
    #10 addr = 5'b01101;

    // Finish simulation
    #10 $finish;
  end

  // Display output
  always @(posedge clk) begin
    $display("Time=%0t, addr=%b, data=%b", $time, addr, data);
  end

endmodule
