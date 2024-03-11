timescale 1ns / 1ps

module bcd_to_7seg_tb;

    reg [3:0] bcd_in;
    wire [6:0] seg_out;

    bcd_to_7seg dut(
        .bcd_in(bcd_in),
        .seg_out(seg_out)
    );

    integer i;

    initial begin
        $dumpfile("bcd_to_7seg_tb.vcd");
        $dumpvars(0, bcd_to_7seg_tb);

        // Test all BCD values from 0 to 9
        for (i = 0; i < 10; i = i + 1) begin
            bcd_in = i;
            #10; // Wait for 10 time units
        end

        // Additional test cases if needed
        // You can add more test cases here to validate edge cases or specific scenarios

        $finish;
    end

endmodule
