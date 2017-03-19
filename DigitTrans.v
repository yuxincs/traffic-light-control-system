`timescale 1ns / 1ps

module DigitTrans(
   output reg flicker,
    output reg[7:0] sec,
    input [4:0] lightTime
    );
    reg [4:0]temp;
    
    always@(lightTime) begin
        if(lightTime < 5'd5) begin
            flicker <= 1;
        end
        else begin
            flicker <= 0;
        end
        if(lightTime > 5'd9) begin
            sec[7:4] = 4'd1;
            temp[4:0] = lightTime - 5'd10;
            sec[3:0] = temp[3:0];
        end
        else begin
            sec[7:4] = 4'd15;
            sec[3:0] = lightTime[3:0];
        end
    end

endmodule