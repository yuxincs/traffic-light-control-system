`timescale 1ns / 1ps

module ModeOnline(
	output reg [1:0] light,
	output reg [4:0] lightTime,
	output reg feedback,
	output reg [1:0]currentState,
	input set,
	input enb,
	input online,
	input clk,
	input green,
	input red,
	input yellow,
	input [1:0]lastState
    );
	parameter RED = 2'b00;
	parameter YELLOW = 2'b01;
	parameter GREEN = 2'b10;
	parameter UNDEFINED = 2'b11;

	wire div;
	
	reg [1:0]lightBuf = GREEN;
	
	FreqDiv_1s freqDiv(div,clk);
	
	always@(posedge clk)begin
		if(online) begin
			if(red) begin
				lightBuf <= RED;
				currentState <= RED;
			end
			else if(green) begin
				lightBuf <= GREEN;
				currentState <= GREEN;
			end
			else if(yellow) begin
				lightBuf <= YELLOW;
				currentState <= YELLOW;
			end
		end
	end
	
	always@(posedge clk) begin
		if(!enb) begin
			feedback <= 1'b0;
			light <= lastState;
		end
		else begin
			feedback <= 1'b1;
			light <= lightBuf;
			lightTime <= 5'd16;
		end
	end
	
endmodule
