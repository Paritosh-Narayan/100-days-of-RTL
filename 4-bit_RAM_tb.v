`timescale 1ns / 1ps

module tb_ram();
  reg clk;
  reg we;
  reg [4:0] a;
  reg [3:0] di;
  wire [3:0] dataout;

  // Instantiate the RAM module
  ram uut(
    .clk(clk),
    .we(we),
    .a(a),
    .di(di),
    .dataout(dataout)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Initial values
  initial begin
    clk = 0;
    we = 0;
    a = 0;
    di = 0;

    // Perform some write operations
    #10 we = 1; a = 3; di = 4; // Write value 4 to address 3
    #10 we = 1; a = 7; di = 8; // Write value 8 to address 7
    #10 we = 1; a = 12; di = 2; // Write value 2 to address 12

    // Perform some read operations
    #10 we = 0; a = 3; // Read from address 3
    #10 we = 0; a = 7; // Read from address 7
    #10 we = 0; a = 12; // Read from address 12
; // 
    #10 $finish; // Finish simulation after some time
  end

  // Display results
  always @(posedge clk) begin
    $display("Time %0t: Address %0d, Dataout %0d", $time, a, dataout);
  end
endmodule
