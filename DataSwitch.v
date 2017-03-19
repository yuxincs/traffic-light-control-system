`timescale 1ns / 1ps

module DataSwitch(
    output reg[1:0] light,
    output reg[4:0] lightTime,
    input [5:0]enb,
    input[1:0] light1,
    input[4:0] lightTime1,
    input[1:0] light2,
    input[4:0] lightTime2,
    input[1:0] light3,
    input[4:0] lightTime3,
    input[1:0] light4,
    input[4:0] lightTime4,
    input[1:0] lightRst,
    input[4:0] lightTimeRst,
    input[1:0] lightOnline,
    input[4:0] lightTimeOnline,
    input clk
    );
    parameter RED = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN = 2'b10;
    parameter UNDEFINED = 2'b11;
    
    always@(clk) begin
        case(enb)
            6'b100000: begin
                light <= light1;
                lightTime <= lightTime1;
            end
            6'b010000: begin
                light <= light2;
                lightTime <= lightTime2;
            end
            6'b001000: begin
                light <= light3;
                lightTime <= lightTime3;
            end
            6'b000100: begin
                light <= light4;
                lightTime <= lightTime4;
            end
            6'b000010: begin
                light <= lightRst;
                lightTime <= lightTimeRst;
            end
            6'b000001: begin
                light <= lightOnline;
                lightTime <= lightTimeOnline;
            end
            default: begin
                light <= UNDEFINED;
                lightTime <= 5'd0;
            end
        endcase
    end

endmodule
