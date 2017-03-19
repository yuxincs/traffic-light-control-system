`timescale 1ns / 1ps


module FreqDiv_1s(
    output reg div,
    input clk
    );

    reg[24:0] count = 0;
    
    always @(posedge clk) begin
        //if(count == 25'd27967451) begin
        if(count == 25'd7967400) begin
            count <= 0;
            div = ~div;
        end
        else
            count <= count + 1;
    end

endmodule
