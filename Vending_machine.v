module vending_machine(
    input clk,
    input rst,
    input [1:0] item_select,
    input coin_insert,
    input item_dispense,
    output reg [6:0] display,
    output reg [1:0] item_dispensed
);

// Parameter declarations
parameter PRICE_1 = 10; // Price of item 1 in cents
parameter PRICE_2 = 20; // Price of item 2 in cents
// Add more parameters for additional items if needed

// Internal registers
reg [7:0] balance; // Balance in cents
reg [7:0] item_price; // Price of selected item
reg [1:0] selected_item; // Selected item
reg [1:0] change; // Change to be returned

// State machine
reg [2:0] state;
parameter IDLE = 3'b000;
parameter SELECT_ITEM = 3'b001;
parameter INSERT_COIN = 3'b010;
parameter DISPENSE_ITEM = 3'b011;
parameter RETURN_CHANGE = 3'b100;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Reset values
        state <= IDLE;
        balance <= 0;
        selected_item <= 0;
        change <= 0;
        item_price <= 0;
        display <= 0;
        item_dispensed <= 0;
    end
    else begin
        // State machine
        case(state)
            IDLE: begin
                if (item_select != 0) begin
                    selected_item <= item_select;
                    state <= SELECT_ITEM;
                end
            end
            SELECT_ITEM: begin
                case(selected_item)
                    2'b01: item_price <= PRICE_1;
                    2'b10: item_price <= PRICE_2;
                    // Add cases for more items if needed
                endcase
                state <= INSERT_COIN;
            end
            INSERT_COIN: begin
                if (coin_insert) begin
                    balance <= balance + 1; // Assume each coin is worth 1 cent
                end
                if (balance >= item_price) begin
                    balance <= balance - item_price;
                    state <= DISPENSE_ITEM;
                end
            end
            DISPENSE_ITEM: begin
                item_dispensed <= selected_item;
                state <= RETURN_CHANGE;
            end
            RETURN_CHANGE: begin
                change <= balance;
                balance <= 0;
                state <= IDLE;
            end
        endcase
    end
end

// Display logic
always @(*) begin
    case(state)
        IDLE: display = 7'b0000000;
        SELECT_ITEM: display = {6'b000000, selected_item};
        INSERT_COIN, DISPENSE_ITEM: display = balance;
        RETURN_CHANGE: display = change;
    endcase
end

endmodule
