`timescale 1ns / 1ps

module Controller(
	output reg[5:0] enb,
	input Cm,Cc,
	input rst,set,
	input online,
	input feedback1,feedback2,feedback3,feedback4,feedbackRst,feedbackOnline,
	input clk
    );
	reg isWorking = 1'b0;
	 
	always @(clk) begin
		if(feedback1 == 1'b1 || feedback2 == 1'b1 || feedback3 == 1'b1 || feedback4 == 1'b1 || feedbackRst == 1'b1 || feedbackOnline == 1'b1 || (set && !isWorking)) begin
		
			isWorking = 1'b1;
			if(online)
				enb <= 6'b000001;
			else  if(rst)begin
				enb <= 6'b000010;
			end
			else begin
				case({Cm,Cc})
					2'b11:	enb <= 6'b100000;
					2'b00:	enb <= 6'b010000;
					2'b10: 	enb <= 6'b001000;
					2'b01: 	enb <= 6'b000100;
				endcase
			end
		end
	end

endmodule
