
module Generate_threetimesmultiptable(
    input clk,   // to synchronize the clock input
    input reset, // to restart the table genefration 
    
    output reg [7:0] result , //8 -bit output for multiplication result
    output reg [3:0] index    //4-bit multiplier for current index
    );
    reg [3:0] counter;   //4-bit counter used as a multplier
    
    //Process block triggered at the rising edge of the clock
    always @(posedge clk ) begin
     if (reset)  begin
              //reseting the counter ,result, and index to zero
              counter =4'b0000; //intialise counter with 4-bit  width for maintaining consistency
              result <=8'b00000000 ; //reset the result to zero
              index <=4'b0000 ; // reset index to zero
            end else if (counter < 10) begin // on each clock cycle increment the counter and calculate the new result
            
        counter <= counter +1 ; // increment counter
        result <= counter *3 ; // ca;lculate three times case
        index <= counter ; // update the index to a current counter value
        
      end  
     end  
 endmodule
    
