`timescale 1ns / 1ns

module testbench;

parameter N = 8; // Adjust N as needed for the desired number of bits

// Inputs
reg [N-1:0] A, B;
reg cin;

// Outputs
wire [N-1:0] sum;
wire cout;

// Instantiate the KoggeStoneAdder module
KoggeStoneAdder dut (
    .A(A),
    .B(B),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

// Stimulus
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

    // Initialize inputs
    A = 8'b10101010;
    B = 8'b01100110;
    cin = 1'b0;

    // Apply inputs
    #10 A = 8'b11001100;
    #10 B = 8'b00111100;
    #10 cin = 1'b1;

    // Add more test cases as needed

    #100 $finish;
end

endmodule
