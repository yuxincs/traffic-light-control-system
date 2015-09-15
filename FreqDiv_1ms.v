`timescale 1ns / 1ps

module FreqDiv_1ms(
	output reg div,
	input clk
    );

	reg[16:0] count = 0;
	
	always @(posedge clk) begin
		if(count[16] == 1) begin
			count <= 0;
			div = ~div;
		end
		else
			count <= count + 1;
	end

endmodule

