
`timescale 1ns / 1ps

module tank_level_indicator_tb;

    // Parameters
    parameter CLOCK_PERIOD = 10; // Clock period in nanoseconds
    parameter SIM_TIME = 100;    // Simulation time in nanoseconds

    // Signals
    reg clock = 0;               // Clock signal
    reg tank_sensor = 0;         // Tank sensor input
    wire led;                    // LED output

    // Instantiate the module
    tank_level_indicator dut(
        .tank_sensor(tank_sensor),
        .led(led)
    );

    // Clock generation
    always #((CLOCK_PERIOD / 2)) clock <= ~clock;

    // Stimulus
    initial begin
        $display("Time \t Tank Sensor \t LED");
        $monitor("%d \t %b \t\t %b", $time, tank_sensor, led);
        repeat(SIM_TIME / CLOCK_PERIOD) begin
            #1;  // Wait for a rising clock edge
            tank_sensor <= ~tank_sensor; // Toggle tank sensor every clock cycle
        end
        $finish;
    end

endmodule
