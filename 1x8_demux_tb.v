`timescale 1ns/1ps

module tb_demux_1x8;

  // Parameters
  parameter PERIOD = 10;

  // Signals
  reg in;
  reg sel2, sel1, sel0;
  wire out0, out1, out2, out3, out4, out5, out6, out7;

  // Instantiate the 1x8 demux
  demux_1x8 uut (
    .in(in),
    .sel2(sel2),
    .sel1(sel1),
    .sel0(sel0),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .out4(out4),
    .out5(out5),
    .out6(out6),
    .out7(out7)
  );

  // Initial block
  initial begin
    // Test case 1
    in = 1;
    sel2 = 0; sel1 = 0; sel0 = 0;
    #PERIOD;

    // Test case 2
    in = 1;
    sel2 = 1; sel1 = 0; sel0 = 0;
    #PERIOD;

    // Test case 3
    in = 1;
    sel2 = 0; sel1 = 1; sel0 = 0;
    #PERIOD;

    // Test case 4
    in = 1;
    sel2 = 1; sel1 = 1; sel0 = 0;
    #PERIOD;

    // Test case 5
    in = 1;
    sel2 = 0; sel1 = 0; sel0 = 1;
    #PERIOD;

    // Test case 6
    in = 1;
    sel2 = 1; sel1 = 0; sel0 = 1;
    #PERIOD;

    // Test case 7
    in = 1;
    sel2 = 0; sel1 = 1; sel0 = 1;
    #PERIOD;

    // Test case 8
    in = 1;
    sel2 = 1; sel1 = 1; sel0 = 1;
    #PERIOD;

    // End simulation
    $finish;
  end
