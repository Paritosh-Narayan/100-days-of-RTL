
module vending_machine_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Inputs
reg clk;
reg rst;
reg [1:0] item_select;
reg coin_insert;
reg item_dispense;

// Outputs
wire [6:0] display;
wire [1:0] item_dispensed;

// Instantiate the vending machine module
vending_machine vending_machine_inst(
    .clk(clk),
    .rst(rst),
    .item_select(item_select),
    .coin_insert(coin_insert),
    .item_dispense(item_dispense),
    .display(display),
    .item_dispensed(item_dispensed)
);

// Clock generation
always #CLK_PERIOD clk = ~clk;

// Initial stimulus
initial begin
    clk = 0;
    rst = 1;
    item_select = 0;
    coin_insert = 0;
    item_dispense = 0;

    #20 rst = 0; // Release reset after 20 ns
    // Test scenario: Select item 1, insert coins to purchase it
    #10 item_select = 2'b01;
    #50 coin_insert = 1; // Insert 50 coins (50 cents)
    #100 coin_insert = 1; // Insert 100 coins (1 dollar)
    #100 item_dispense = 1; // Dispense item
    // Test scenario: Select item 2, insert coins to purchase it
    #10 item_select = 2'b10;
    #50 coin_insert = 1; // Insert 50 coins (50 cents)
    #100 coin_insert = 1; // Insert 100 coins (1 dollar)
    #100 item_dispense = 1; // Dispense item

    // Add more test scenarios as needed
    #100 $finish; // End simulation
end

endmodule
