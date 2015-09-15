`timescale 1ns / 1ps

module Enabler(
	output reg[3:0] an,
	input clk
	);

	wire div;
	FreqDiv_1ms fd_1ms(div,clk);
	
	reg[1:0]count = 0;
	
	always @(posedge div) begin
		count <= count + 1;
	end

	always @(count) begin
		case(count)
			2'd0: an = 4'b1110;
			2'd1: an = 4'b1101;
			2'd2: an = 4'b1011;
			2'd3: an = 4'b0111;
			default:an = 4'b1111; //使所有灯都熄灭
		endcase
	end
endmodule

