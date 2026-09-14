//Author: Ben Lertwachara - blertwachara@hmc.edu
//Date: 9/9/2026
//Functionality: Uses sequential logic counter 
//incremented by clk to flash an led every 20_000_000
//(adjustable) cycles

module counter #(
parameter MAX_COUNT = 200_000,
parameter COUNTER_WIDTH = 25
) (input logic clk, reset, enable,
output logic[COUNTER_WIDTH-1:0] counter);
	
	// Simple clock divider
	always_ff @(posedge clk)
	begin
		if(reset == 0) 
			counter <=0;
		else if(counter == MAX_COUNT-1) 
			counter <= 0;
		else if(enable == 1)
			counter <= counter+1'b1;
	end
		
endmodule