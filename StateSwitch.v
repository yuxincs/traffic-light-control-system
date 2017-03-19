`timescale 1ns / 1ps

module StateSwitch(
    output reg[1:0] state,
    input [5:0]enb,
    input[1:0] state1,
    input[1:0] state2,
    input[1:0] state3,
    input[1:0] state4,
    input[1:0] stateRst,
    input[1:0] stateOnline,
    input clk
    );
    parameter RED = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN = 2'b10;
    parameter UNDEFINED = 2'b11;
    
    always@(clk) begin
        case(enb)
            6'b100000: 
                state <= state1;
            6'b010000:
                state <= state2;
            6'b001000: 
                state <= state3;
            6'b000100: 
                state <= state4;
            6'b000010:
                state <= stateRst;
            6'b000001:
                state <= stateOnline;
            default: begin
                state <= GREEN;
            end
        endcase
    end

endmodule
