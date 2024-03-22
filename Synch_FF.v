module Sync_FIFO (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    input wire write_en,   // Write enable signal
    input wire read_en,    // Read enable signal
    input wire [7:0] data_in,  // Input data
    output reg [7:0] data_out, // Output data
    output wire empty,     // Empty flag
    output wire full       // Full flag
);

parameter DEPTH = 16; // Depth of the FIFO

reg [7:0] fifo[0:DEPTH-1];
reg [4:0] write_ptr, read_ptr;
reg [4:0] count;

// Write process
always @(posedge clk) begin
    if (reset) begin
        write_ptr <= 0;
        read_ptr <= 0;
        count <= 0;
    end else begin
        if (write_en && ~full) begin
            fifo[write_ptr] <= data_in;
            write_ptr <= write_ptr + 1;
            count <= count + 1;
        end
    end
end

// Read process
always @(posedge clk) begin
    if (reset) begin
        write_ptr <= 0;
        read_ptr <= 0;
        count <= 0;
    end else begin
        if (read_en && ~empty) begin
            data_out <= fifo[read_ptr];
            read_ptr <= read_ptr + 1;
            count <= count - 1;
        end
    end
end

// Empty and Full flags
assign empty = (count == 0);
assign full = (count == DEPTH);

endmodule
