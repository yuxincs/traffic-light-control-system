`timescale 1ns / 1ps

module TimeTrans(
    output flicker,
    output reg[7:0] oSeg,
    output [3:0] oAn,
    input [4:0] lightTime,
    input Cm,Cc,
    input clk
    );
    
    wire [7:0] oSeg1,oSeg2,oSeg3,oSeg4;
    wire[7:0] sec;
    reg [3:0]CmBuf = 4'd15;
    reg [3:0]CcBuf = 4'd15;
    DigitTrans dt(flicker,sec,lightTime);
    SEG7 seg1(oSeg1,sec[3:0]);
    SEG7 seg2(oSeg2,sec[7:4]);
    SEG7 seg3(oSeg3,CcBuf);
    SEG7 seg4(oSeg4,CmBuf);
    
    Enabler enb(oAn,clk);
    
    always@(clk) begin
        if(Cm)
            CmBuf <= 4'd10;
        else
            CmBuf <= 4'd15;
        if(Cc)
            CcBuf <= 4'd10;
        else
            CcBuf <= 4'd15;
    end
    
    always @(oAn) begin
        case(oAn)
            4'b0111:    oSeg <= oSeg1;
            4'b1011:    oSeg <= oSeg2;
            4'b1101: oSeg <= oSeg3;
            4'b1110: oSeg <= oSeg4;
            default: oSeg <= 7'b1111111;
        endcase
    end
endmodule