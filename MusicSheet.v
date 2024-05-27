`timescale 1ns / 1ps

module MusicSheet(input [9:0] number, 
output reg [19:0] note,//what is the max frequency  
output reg [4:0] duration, input val);
parameter   QUARTER = 5'b00010; 
parameter HALF = 5'b00100;
parameter ONE = 2* HALF;
parameter TWO = 2* ONE;
parameter FOUR = 2* TWO;
parameter A4=113598.8,B4=101198,G4S=120357.9,E4=151662.6,C4=191109.6,C4S=180377.1,SP=1;
parameter D4=170247.4, C5S=90150.88, D5=85088.14, E5=75799.63, D5S=80309.71, C5=95514.86;
always @ (number) begin
case(number) 
    0: begin note = SP; duration = HALF; end
    1: begin note = SP; duration = HALF; end
    2: begin note = SP; duration = HALF; end
    3: begin note = SP; duration = HALF; end
    4: begin note = SP; duration = HALF; end
    5: begin note = SP; duration = HALF; end
    6: begin note = SP; duration = HALF; end
    7: begin note = SP; duration = HALF; end
    8: begin note = SP; duration = HALF; end
    9: begin if(val) note = A4; else note = B4; duration = QUARTER; end
    10: begin if (val) note = A4; else note = E5; duration = QUARTER; end
    default: begin note = SP; duration = FOUR; end
endcase
end
endmodule