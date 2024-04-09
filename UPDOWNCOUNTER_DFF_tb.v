
module tb_up_down_counter;

    // Inputs
    reg clk;
    reg rst;
    reg up_down;

    // Outputs
    wire [3:0] count;

    // Instantiate the up_down_counter module
    up_down_counter uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        rst = 1;
        up_down = 0;
        #10 rst = 0;
        #100 $finish;
    end

    // Stimulus
    initial begin
        $monitor("Time=%0t, Count=%b", $time, count);
        #20 up_down = 1;
        #100 up_down = 0;
        #100 $finish;
    end

endmodule
