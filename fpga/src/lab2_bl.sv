//Author: Ben Lertwachara - blertwachara@hmc.edu
//Date: 9/9/2026
//Functionality: Takes input from onboard dip switches
// and uses to control on board leds with combinational
// logic. Also implements heartbeat and seven seg modules, 
// generating the clock for the heartbeat module
// and outputting the 7seg signals and flashing led signal

module lab2_bl(
	input 	logic	[3:0] s_1, [3:0] s_2, [3:0] scan_row_in,
	output 	logic [6:0] seg, [1:0] active_display, [3:0] scan_led, [3:0] scan_col_out
);
	logic int_osc;
	logic [19-1:0] multiplexing_count;
	logic [3:0] s;
	//logic[3:0] one_hot_col;
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	counter #(400_000, 19) multiplexing_counter(int_osc, 1'b1,1'b1, multiplexing_count);
	scanner keypad_scanner(int_osc, 1'b1,1'b1,scan_col_out); 
	assign scan_led = scan_row_in;
	assign active_display = (multiplexing_count > 400_000/2) ? 2'b10 : 2'b01;
	always_comb begin
		s = active_display[0] ? s_1 : s_2;	
		end
	sevenseg sevseg(s, seg);

endmodule




