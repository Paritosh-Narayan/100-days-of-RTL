module tb_dual_port_ram();

    reg clk;
    reg we_a, we_b;
    reg [4:0] addr_a, addr_b;
    reg [31:0] data_in_a, data_in_b;
    wire [31:0] data_out_a, data_out_b;

    // Instantiate the Dual Port RAM
    dual_port_ram uut (
        .clk(clk),
        .we_a(we_a),
        .we_b(we_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        we_a = 0;
        we_b = 0;
        addr_a = 0;
        addr_b = 0;
        data_in_a = 0;
        data_in_b = 0;

        // Write data to address 0 from port A
        #10;
        addr_a = 5'b00000;
        data_in_a = 32'hA5A5A5A5;
        we_a = 1;
        #10;
        we_a = 0;

        // Write data to address 1 from port B
        addr_b = 5'b00001;
        data_in_b = 32'h5A5A5A5A;
        we_b = 1;
        #10;
        we_b = 0;

        // Read data from address 0 from port A
        addr_a = 5'b00000;
        #10;

        // Read data from address 1 from port B
        addr_b = 5'b00001;
        #10;

        // Write data to the same address from both ports (testing write conflict)
        addr_a = 5'b00010;
        data_in_a = 32'h12345678;
        we_a = 1;
        addr_b = 5'b00010;
        data_in_b = 32'h87654321;
        we_b = 1;
        #10;
        we_a = 0;
        we_b = 0;

        // Read data from address 2 from both ports
        addr_a = 5'b00010;
        addr_b = 5'b00010;
        #10;

        // End of test
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("Time: %0t | we_a: %b, addr_a: %h, data_in_a: %h, data_out_a: %h | we_b: %b, addr_b: %h, data_in_b: %h, data_out_b: %h",
                 $time, we_a, addr_a, data_in_a, data_out_a, we_b, addr_b, data_in_b, data_out_b);
    end

endmodule
