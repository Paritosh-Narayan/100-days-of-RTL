module tb_crc_encoder;

    // Inputs
    reg [7:0] data_in;
    reg clk;
    reg rst_n;

    // Outputs
    wire [7:0] crc_out;

    // Instantiate the CRC encoder
    crc_encoder crc_inst (
        .data_in(data_in),
        .clk(clk),
        .rst_n(rst_n),
        .crc_out(crc_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        rst_n = 1;
        #10 rst_n = 0;
        #10 rst_n = 1;
    end

    // Test input data
    initial begin
        data_in = 8'hFF; // Example input data
        #20 $display("CRC Output: %h", crc_out);
        // Add more test cases here if needed
        // Wait for simulation to finish
        #100 $finish;
    end

endmodule
