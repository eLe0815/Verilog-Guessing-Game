`timescale 1ns / 1ps

module ssegGuess(input [3:0] userGuess, output reg [6:0] ssegFirst, output reg [6:0] ssegSecond);
always@(userGuess)
case(userGuess)
    4'b0000:begin
       ssegFirst = 7'b000_0001; //0
       ssegSecond = 7'b000_0001; //0
    end
    4'b0001:begin
        ssegFirst = 7'b000_0001; //0
        ssegSecond = 7'b100_1111; //1
    end
    4'b0010:begin
        ssegFirst = 7'b000_0001; //0
        ssegSecond = 7'b001_0010; //2
    end
    4'b0011:begin
        ssegFirst = 7'b000_0001; //0 
        ssegSecond = 7'b000_0110; //3
    end
    4'b0100:begin
        ssegFirst = 7'b000_0001; //0
        ssegSecond = 7'b100_1100; //4
    end
    4'b0101:begin
        ssegFirst = 7'b000_0001;  //0 
        ssegSecond = 7'b010_0100; //5
    end
    4'b0110:begin
        ssegFirst = 7'b000_0001; //0
        ssegSecond = 7'b010_0000; //6
    end
    4'b0111:begin
        ssegFirst = 7'b000_0001; //0
        ssegSecond = 7'b000_1111; //7
    end
    4'b1000:begin
        ssegFirst = 7'b000_0001; //0
        ssegSecond = 7'b000_0000; //8
    end
    4'b1001:begin
        ssegFirst = 7'b000_0001; //0
        ssegSecond = 7'b000_1100; //9
    end
    4'b1010:begin
        ssegFirst = 7'b100_1111; //1
        ssegSecond = 7'b000_0001; //0
    end
endcase
endmodule