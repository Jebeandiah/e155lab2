//Author: Ben Lertwachara - blertwachara@hmc.edu
//Date: 9/9/2026
//Functionality: Uses sequential logic counter 
//incremented by clk to flash an led every 20_000_000
//(adjustable) cycles

module scanner #(
parameter MAX_COUNT = 6_000_000,
parameter COUNTER_WIDTH = 23
) (input logic clk, reset, enable,
output logic [3:0] one_hot_col);
logic [COUNTER_WIDTH-1:0] counter;
//typedef enum logic[1:0] {COL0, COL1, COL2, COL3} scanning_col;
counter #(MAX_COUNT, COUNTER_WIDTH) scanning_counter(clk, reset,enable, counter);
always_comb
begin
	if(counter<= (MAX_COUNT/4))
		one_hot_col = 4'b1000;
	else if(counter<=MAX_COUNT/2)
		one_hot_col = 4'b0100;
	else if(counter<=(MAX_COUNT/4)*3)
		one_hot_col = 4'b0010;
	else
		one_hot_col = 4'b0001;

end
		
endmodule