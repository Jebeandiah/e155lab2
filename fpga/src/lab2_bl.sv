//Author: Ben Lertwachara - blertwachara@hmc.edu
//Date: 9/9/2026
//Functionality: Takes input from onboard dip switches
// and uses to control on board leds with combinational
// logic. Also implements heartbeat and seven seg modules, 
// generating the clock for the heartbeat module
// and outputting the 7seg signals and flashing led signal

module lab2_bl(
	input 	logic	[3:0] s_1, [3:0] s_2,
	output 	logic [6:0] seg, [1:0] active_display
);
	logic int_osc;
	logic [18-1:0] multiplexing_count;
	logic [3:0] s;
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	counter #(399_999, 18) multiplexing_counter(int_osc, 1'b1,1'b1, multiplexing_count);
	
	
	assign active_display = (multiplexing_count > 399_999/2) ? 2'b10 : 2'b01;
	always_comb begin
		s = active_display[0] ? s_1 : s_2;	
		end
	sevenseg sevseg(s, seg);

endmodule




