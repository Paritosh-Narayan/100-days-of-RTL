module Async_FIFO (
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
reg [4:0] next_write_ptr, next_read_ptr;
reg [4:0] count;
reg wr_ptr_inc, rd_ptr_inc;
integer i;

// Write pointer logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        write_ptr <= 0;
        next_write_ptr <= 0;
    end else if (write_en && ~full) begin
        next_write_ptr <= write_ptr + 1;
    end
end

// Read pointer logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        read_ptr <= 0;
        next_read_ptr <= 0;
    end else if (read_en && ~empty) begin
        next_read_ptr <= read_ptr + 1;
    end
end

// Write pointer increment logic
always @* begin
    wr_ptr_inc = (write_en && ~full) ? 1'b1 : 1'b0;
end

// Read pointer increment logic
always @* begin
    rd_ptr_inc = (read_en && ~empty) ? 1'b1 : 1'b0;
end

// Count logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
    end else begin
        count <= count + wr_ptr_inc - rd_ptr_inc;
    end
end

// FIFO memory
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < DEPTH; i = i + 1) begin
            fifo[i] <= 8'h00; // Reset FIFO
        end
    end else if (write_en && ~full) begin
        fifo[write_ptr] <= data_in;
    end
end

// Read data from FIFO
always @(posedge clk) begin
    if (reset) begin
        data_out <= 8'h00; // Reset output data
    end else if (read_en && ~empty) begin
        data_out <= fifo[read_ptr];
    end
end

// Empty and Full flags
assign empty = (count == 0);
assign full = (count == DEPTH);

endmodule
