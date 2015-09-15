`timescale 1ns / 1ps

module ModeRst(
	output reg [1:0] light,
	output reg [4:0] lightTime,
	output reg feedback,
	output reg [1:0]currentState,
	input set,
	input enb,
	input rst,
	input clk
    );
	parameter RED = 2'b00;
	parameter YELLOW = 2'b01;
	parameter GREEN = 2'b10;
	parameter UNDEFINED = 2'b11;

	wire div;
	
	FreqDiv_1s freqDiv(div,clk);
	
	always@(posedge div) begin
		feedback <= 1'b0;
		if(!enb) begin
			light <= GREEN;
			lightTime <= 5'd16;
		end
		if(set && enb) begin

			case(light) 
				GREEN: begin
					currentState <= GREEN;
					if(lightTime == 5'd1) begin
						light <= YELLOW;
						lightTime <= 5'd3;
						feedback <= 1'b1;
					end
					else
						lightTime <= lightTime - 5'd1;
				end
				
				YELLOW: begin
					currentState <= YELLOW;
					if(lightTime == 5'd1) begin
						light <= RED;
						lightTime <= 5'd16;
						feedback <= 1'b1;
					end
					else
						lightTime <= lightTime - 5'd1;
				end
					
				RED: begin
					currentState <= RED;
					if(lightTime == 5'd1) begin
						light <= GREEN;
						lightTime <= 5'd16;
						feedback <= 1'b1;
					end
					else
						lightTime <= lightTime - 5'd1;
				end
			endcase

		end
	end
endmodule
