
module dram (
    input wire clk,
    input wire rst_n,
    input wire [11:0] address,
    input wire [7:0] data_in,
    input wire we,
    output wire [7:0] data_out
);

// Define your DRAM parameters
parameter MEM_DEPTH = 4096; // Example: 4K depth
parameter MEM_WIDTH = 8;    // Example: 8-bit data width

// Declare memory array
reg [MEM_WIDTH-1:0] memory [MEM_DEPTH-1:0];

// Write operation
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // Reset behavior
        // Optionally, you may initialize memory contents here
    end else if (we) begin
        // Write operation
        memory[address] <= data_in;
    end
end

// Read operation
assign data_out = (we) ? 8'bzzzz_zzzz : memory[address];

endmodule
