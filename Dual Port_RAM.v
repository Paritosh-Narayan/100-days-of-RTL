module dual_port_ram (
    input clk,                     // Clock
    input we_a, we_b,              // Write enable for port A and port B
    input [4:0] addr_a, addr_b,    // 5-bit address for port A and port B (32 locations)
    input [31:0] data_in_a, data_in_b, // 32-bit data input for port A and port B
    output reg [31:0] data_out_a, data_out_b // 32-bit data output for port A and port B
);

    // Declare the RAM variable (32 locations of 32 bits each)
    reg [31:0] ram [31:0];

    // Port A operation
    always @(posedge clk) begin
        if (we_a) begin
            ram[addr_a] <= data_in_a;    // Write operation
        end
        data_out_a <= ram[addr_a];        // Read operation
    end

    // Port B operation
    always @(posedge clk) begin
        if (we_b) begin
            ram[addr_b] <= data_in_b;    // Write operation
        end
        data_out_b <= ram[addr_b];        // Read operation
    end

endmodule
