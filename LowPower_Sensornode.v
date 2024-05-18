module low_power_sensor_node (
    input wire clk,         // System clock
    input wire reset_n,     // Reset signal (active low)
    input wire sensor_data, // Data from sensor
    output wire tx_data,    // Data to transmit wirelessly
    output reg sleep       // Sleep mode control signal
);

// Parameters
parameter DATA_WIDTH = 8; // Data width for sensor data and transmission

// Internal signals
reg [DATA_WIDTH-1:0] sensor_data_reg; // Register for sensor data
reg [DATA_WIDTH-1:0] tx_data_reg;     // Register for transmitted data

// Counter for sleep mode control
reg [15:0] sleep_counter = 0;

// State machine states
parameter IDLE_STATE = 2'b00;
parameter TRANSMIT_STATE = 2'b01;

// State machine and control logic
reg [1:0] state = IDLE_STATE;

always @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        state <= IDLE_STATE;
        sleep_counter <= 0;
    end else begin
        case (state)
            IDLE_STATE: begin
                // Process sensor data
                sensor_data_reg <= sensor_data;
                
                // Check if transmission is needed
                if (sensor_data_reg != 0) begin
                    tx_data_reg <= sensor_data_reg;
                    state <= TRANSMIT_STATE;
                    sleep_counter <= 0;
                end else begin
                    // Enter sleep mode if no data to transmit
                    sleep_counter <= sleep_counter + 1;
                    if (sleep_counter >= 65535) begin
                        sleep <= 1; // Enter sleep mode
                        sleep_counter <= 0;
                    end
                end
            end
            TRANSMIT_STATE: begin
                // Transmit data wirelessly
                tx_data_reg <= sensor_data_reg;
                state <= IDLE_STATE;
            end
        endcase
    end
end

// Continuous assignment for tx_data
assign tx_data = tx_data_reg;

endmodule
