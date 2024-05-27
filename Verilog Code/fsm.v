`timescale 1ns / 1ps

module fsm(input clock, input reset, input [3:0] userGuess, input [1:0] gameMode, input ready, input [3:0] randValue,
output reg [3:0] userCorrect, output reg [3:0] userIncorrect, output reg playSound, output reg val);

reg[31:0] clk_next, clk_reg;
reg[2:0] state_next, state_reg;
reg[3:0] userCorrectNext, userIncorrectNext, roundsNext, roundsReg;

localparam[2:0] start = 3'b000, hex = 3'b001, octal = 3'b010, dec = 3'b011, done = 3'b100;

always@(posedge clock, posedge reset) begin
    if(reset)begin
        roundsReg <= 0;
        state_reg <= start;
        userCorrect <= 0;
        userIncorrect <= 0;
        clk_reg <= 0;
    end
    else begin
        roundsReg <= roundsNext;
        state_reg <= state_next;
        userCorrect <= userCorrectNext;
        userIncorrect <= userIncorrectNext;
        clk_reg <= clk_next;
    end 
end

always@(*) begin

state_next = state_reg;
userIncorrectNext = userIncorrect;
userCorrectNext = userCorrect;
clk_next = clk_reg;
roundsNext = roundsReg;

case(state_reg)
    start:begin
        playSound = 1'b0;
        if(ready)begin
            if(gameMode == 2'b01)
                state_next = dec;
            else if (gameMode == 2'b10)
                state_next = hex;
            else if (gameMode == 2'b11)
                state_next = octal;
            else
                state_next = dec;
        end
        else 
            state_next = start;
    end
    hex: begin
        if(roundsReg == 10)
            state_next = done;
        else begin
            if(clk_reg == 500_000_000)begin
                clk_next = 0;
                roundsNext = roundsReg + 1;
                if(userGuess == randValue) begin
                    playSound = 1'b1;
                    val = 1'b0;
                    userCorrectNext = userCorrect + 1;
                    end
                else begin
                    userIncorrectNext = userIncorrect + 1;
                    playSound = 1'b1;
                    val = 1'b1;
                    end
            end 
            else 
                clk_next = clk_reg + 1;
        end
    end
    octal: begin
        if(roundsReg == 10)
            state_next = done;
        else begin
            if(clk_reg == 500_000_000)begin
                clk_next = 0;
                roundsNext = roundsReg + 1;
                //if(userGuess[3] == randValue[3] && userGuess[2] == randValue[2] && userGuess[1] == randValue[1] &&
                //userGuess[0] == randValue[0])
                if(userGuess == randValue)begin
                    userCorrectNext = userCorrect + 1;
                    playSound = 1'b1;
                    val = 1'b0;
                    end
                else begin
                    userIncorrectNext = userIncorrect + 1;
                    playSound = 1'b1;
                    val = 1'b1;
                    end
            end 
            else 
                clk_next = clk_reg + 1;
        end
    end
    dec: begin
        if(roundsReg == 10)
            state_next = done;
        else begin
            if(clk_reg == 500_000_000)begin
                clk_next = 0;
                roundsNext = roundsReg + 1;
                if(userGuess == randValue)begin
                    userCorrectNext = userCorrect + 1;
                    playSound = 1'b1;
                    val = 1'b0;
                    end
                else begin
                    userIncorrectNext = userIncorrect + 1;
                    playSound = 1'b1;
                    val = 1'b1;
                    end 
            end 
            else 
                clk_next = clk_reg + 1;
        end
    end
    done: begin
        playSound = 1'b0;
        if(ready == 1'b0)
            state_next = start;
        else
            state_next = done;
    end
    default: 
         state_next = start;
endcase
end

endmodule