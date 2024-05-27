`timescale 1ns / 1ps

module main(input clock, input reset, input resetclk, input [1:0] gameMode, input [3:0] userGuess, input ready,
output [7:0] AN, output [6:0] C, output audioOut, output aud_sd);

wire outsignalOne, outsignalTwo, outsignalThree, playSound, val;
wire [2:0] select;
wire [3:0] randValue, userCorrect, userIncorrect;
wire [6:0] ssegIncorrectOne, ssegIncorrectTwo, ssegCorrectOne, ssegCorrectTwo, ssegRandOne, ssegRandTwo;

slowerClkGen stage0(clock, resetclk, outsignalOne, outsignalTwo, outsignalThree);
fsm stage1(clock, reset, userGuess, gameMode, ready, randValue, userCorrect, userIncorrect, playSound, val);
LFSR stage2(outsignalThree, ready, 3'b100, randValue);
threeBitCounter stage3(outsignalTwo, select, 1'b1, 1'b1);
ssegGuess stage4part1(userCorrect, ssegCorrectOne, ssegCorrectTwo);
ssegGuess stage4part2(userIncorrect, ssegIncorrectOne, ssegIncorrectTwo);
ssegRand stage4part3(randValue, gameMode, ssegRandOne, ssegRandTwo);
mux8to1 stage5(select, ssegCorrectOne, ssegCorrectTwo, ssegIncorrectOne, 
ssegIncorrectTwo, 7'b111_1110, 7'b111_1110, ssegRandTwo, ssegRandOne, C, AN, ready);
SongPlayer stage8(clock, 1'b0, playSound, val, audioOut, aud_sd);

endmodule























