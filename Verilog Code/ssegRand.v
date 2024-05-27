`timescale 1ns / 1ps

module ssegRand(input [3:0] randValue, input [1:0] gameMode, output reg [6:0] sseg, output reg [6:0] sseg2);
always@(randValue)begin
    case(randValue)
        4'b0000:begin //0
            sseg = 7'b000_0001;
            sseg2 = 7'b000_0001;
        end
        4'b0001:begin //1
            sseg = 7'b100_1111;
            sseg2 = 7'b000_0001;
        end
        4'b0010:begin //2
            sseg = 7'b001_0010;
            sseg2 = 7'b000_0001;
        end
        4'b0011:begin //3
            sseg = 7'b000_0110;
            sseg2 = 7'b000_0001;
        end
        4'b0100:begin //4
            sseg = 7'b100_1100;
            sseg2 = 7'b000_0001;
        end 
        4'b0101:begin //5
            sseg = 7'b010_0100;
            sseg2 = 7'b000_0001;
        end
        4'b0110:begin //6
            sseg = 7'b010_0000;
            sseg2 = 7'b000_0001;
        end
        4'b0111:begin //7
            sseg = 7'b000_1111;
            sseg2 = 7'b000_0001;
        end
        4'b1000:begin 
            if(gameMode == 2'b11) begin //10
                sseg = 7'b000_0001;
                sseg2 = 7'b100_1111;
            end else begin //8
                sseg = 7'b000_0000;
                sseg2 = 7'b000_0001;
            end
        end
        4'b1001:begin 
            if(gameMode == 2'b11) begin //11
                sseg = 7'b100_1111; 
                sseg2 = 7'b100_1111;
            end else begin //9
                sseg = 7'b000_1100;
                sseg2 = 7'b000_0001;  
            end            
        end 
        4'b1010:begin
            if(gameMode == 2'b11)begin //12
                sseg = 7'b001_0010;
                sseg2 = 7'b100_1111;           
            end else if (gameMode == 2'b10) begin //0A
                sseg = 7'b000_1000;
                sseg2 = 7'b000_0001;
            end else begin //10
                sseg = 7'b000_0001;
                sseg2 = 7'b100_1111;
            end
        end
        4'b1011:begin 
            if(gameMode == 2'b11)begin //13
                sseg = 7'b000_0110;
                sseg2 = 7'b100_1111;            
            end else if (gameMode == 2'b10) begin //0B
                sseg = 7'b110_0000;
                sseg2 = 7'b000_0001;
            end else begin //11
                sseg = 7'b100_1111;
                sseg2 = 7'b100_1111;
            end        
        end
        4'b1100:begin 
            if(gameMode == 2'b11)begin //14
                sseg = 7'b100_1100;
                sseg2 = 7'b100_1111;            
            end else if (gameMode == 2'b10) begin //0C
                sseg = 7'b011_0001;
                sseg2 = 7'b000_0001;
            end else begin //12
                sseg = 7'b001_0010;
                sseg2 = 7'b100_1111;
            end          
        end
        4'b1101:begin 
            if(gameMode == 2'b11)begin //15
                sseg = 7'b010_0100;
                sseg2 = 7'b100_1111;            
            end else if (gameMode == 2'b10) begin //0D
                sseg = 7'b100_0010;
                sseg2 = 7'b000_0001;
            end else begin //13
                sseg = 7'b000_0110;
                sseg2 = 7'b100_1111;
            end           
        end
        4'b1110:begin 
            if(gameMode == 2'b11)begin //16
                sseg = 7'b010_0100;
                sseg2 = 7'b100_1111;            
            end else if (gameMode == 2'b10) begin //0E
                sseg = 7'b100_0010;
                sseg2 = 7'b000_0001;
            end else begin //14
                sseg = 7'b000_0110;
                sseg2 = 7'b100_1111;
            end          
        end
        4'b1111:begin 
            if(gameMode == 2'b11)begin //17
                sseg = 7'b000_1111;
                sseg2 = 7'b100_1111;            
            end else if (gameMode == 2'b10) begin //0F
                sseg = 7'b011_1000;
                sseg2 = 7'b000_0001;
            end else begin //15
                sseg = 7'b010_0100;
                sseg2 = 7'b100_1111;
            end          
        end
        default: begin
            sseg = 7'b000_0001;
            sseg2 = 7'b000_0001;
        end
    endcase
end
endmodule