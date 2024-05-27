`timescale 1ns / 1ps

module LFSR(input clock, l, input [3:0] R, output reg [3:0] Q);
always@(posedge clock, negedge l)
    if(!l)
        Q <= R;
    else 
        Q <= {Q[2:0],Q[3]^Q[2]};
endmodule