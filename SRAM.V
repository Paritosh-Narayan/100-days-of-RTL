
module SRAM (
    input wire CLK,       // Clock input
    input wire [9:0] ADDR,// Address input (10-bit address for 1K memory)
    input wire WE,        // Write Enable input
    input wire [7:0] DIN, // Data input
    output reg [7:0] DOUT // Data output
);

// Internal memory array
reg [7:0] memory [0:1023];

always @(posedge CLK) begin
    if (WE) // Write operation
        memory[ADDR] <= DIN;
    else    // Read operation
        DOUT <= memory[ADDR];
end

endmodule
