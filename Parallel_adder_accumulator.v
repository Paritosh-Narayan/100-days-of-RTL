

module ParallelAdder (
    input [3:0] A,    // 4-bit input A
    input [3:0] B,    // 4-bit input B
    output [3:0] Sum, // 4-bit output Sum
    output CarryOut   // Carry Out
);
    assign {CarryOut, Sum} = A + B; // Perform 4-bit addition
endmodule

module Accumulator (
    input clk,        // Clock signal
    input reset,      // Reset signal
    input [3:0] In,   // 4-bit input to accumulate
    output reg [3:0] Accum, // 4-bit accumulated value
    output reg CarryOut // Carry Out from accumulation
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Accum <= 4'b0000; // Reset accumulated value to 0
            CarryOut <= 1'b0; // Reset carry out to 0
        end else begin
            {CarryOut, Accum} <= Accum + In; // Accumulate input value
        end
    end
endmodule

module TopModule (
    input clk,          // Clock signal
    input reset,        // Reset signal
    input [3:0] A,      // 4-bit input A
    input [3:0] B,      // 4-bit input B
    output [3:0] Sum,   // 4-bit sum output from adder
    output CarryOutAdder, // Carry out from adder
    output [3:0] Accum, // 4-bit accumulated value
    output CarryOutAccum // Carry out from accumulator
);

    // Instantiate Parallel Adder
    ParallelAdder adder (
        .A(A),
        .B(B),
        .Sum(Sum),
        .CarryOut(CarryOutAdder)
    );

    // Instantiate Accumulator
    Accumulator accum (
        .clk(clk),
        .reset(reset),
        .In(Sum),
        .Accum(Accum),
        .CarryOut(CarryOutAccum)
    );

endmodule
