`timescale 1ns / 1ps


module LightTrans(
	output reg MR,MY,MG,CR,CY,CG,
	input [1:0] light,
	input flicker,
	input clk
    );
	parameter RED = 2'b00;
	parameter YELLOW = 2'b01;
	parameter GREEN = 2'b10;
	parameter UNDEFINED = 2'b11;
	
	reg[2:0] light1;
	reg[2:0] light2;
	reg[2:0] light3;
	
	wire div;
	
	FreqDiv_1s fd_flicker(div,clk);
	
	always@(div) begin
		if(flicker) begin
			if(div) begin
				light1 <= 3'b100;
				light2 <= 3'b001;
				light3 <= 3'b010;
			end
			else begin
				light1 <= 3'b000;
				light2 <= 3'b000;
				light3 <= 3'b000;
			end
		end
		else begin
			light1 <= 3'b100;
			light2 <= 3'b001;
			light3 <= 3'b010;
		end
	end
	
	always@(light or div) begin
		case(light)
			RED: begin
				{MR,MY,MG} <= light1;
				{CR,CY,CG} <= light2;
			end
			GREEN: begin
				{MR,MY,MG} <= light2;
				{CR,CY,CG} <= light1;
			end
			YELLOW: begin
				{MR,MY,MG} <= light3;
				{CR,CY,CG} <= light3;
			end			
			UNDEFINED: begin
				{MR,MY,MG} <= 3'b000;
				{CR,CY,CG} <= 3'b000;
			end
		endcase
	end
endmodule
