`timescale 1ns / 1ps

module priority_arbiter_tb;

// Parameters
parameter N = 4; // Number of request inputs

// Inputs
reg [N-1:0] request;

// Outputs
wire grant;

// Instantiate the DUT
priority_arbiter dut(
    .request(request),
    .grant(grant)
);

// Clock generation
initial begin
    $dumpfile("priority_arbiter_tb.vcd");
    $dumpvars(0, priority_arbiter_tb);

    // Apply test vectors
    request = 0;
    #10 request = 4'b0001;
    #10 request = 4'b0010;
    #10 request = 4'b0100;
    #10 request = 4'b1000;
    #10 request = 4'b1010;
    #10 request = 4'b0110;
    #10 request = 4'b1100;
    #10 request = 4'b1111;
    #10 request = 4'b0000;
    #10 $finish;
end

endmodule
