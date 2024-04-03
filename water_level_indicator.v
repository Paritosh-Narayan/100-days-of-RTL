module water_level_indicator(
    input [7:0] water_level_inputs, // 8-bit input representing water level sensors
    output reg [2:0] water_level_output // 3-bit output representing water level indicator
);

always @(*) begin
    case(water_level_inputs)
        8'b11111110: water_level_output = 3'b000; // Sensor 1 is active
        8'b11111101: water_level_output = 3'b001; // Sensor 2 is active
        8'b11111011: water_level_output = 3'b010; // Sensor 3 is active
        8'b11110111: water_level_output = 3'b011; // Sensor 4 is active
        8'b11101111: water_level_output = 3'b100; // Sensor 5 is active
        8'b11011111: water_level_output = 3'b101; // Sensor 6 is active
        8'b10111111: water_level_output = 3'b110; // Sensor 7 is active
        8'b01111111: water_level_output = 3'b111; // Sensor 8 is active
        default: water_level_output = 3'b000; // No sensor is active
    endcase
end

endmodule
