`timescale 1ns / 1ps

module threeBitCounter(input clk, output reg [2:0] select, input resetn, enable);
always@(posedge clk, negedge resetn)begin
if(!resetn)
    select <= 3'b000;
else if(enable)
    select <= select + 3'b001;
end
endmodule