`timescale 1ns / 1ps

module mux8to1(input [2:0] select, input [6:0] m1, m2, m3, m4, m5, m6, m7, m8, output reg [6:0] sseg, output reg [7:0] AN, input ready);
always@(select)begin
case(select)
    3'b000:begin
        sseg = m1;
        AN = 8'b0111_1111;
    end
    3'b001:begin
        sseg = m2;
        AN = 8'b1011_1111;
    end
    3'b010:begin
        sseg = m3;
        AN = 8'b1101_1111;
    end
    3'b011:begin
        sseg = m4;
        AN = 8'b1110_1111;
    end
    3'b100:begin
        sseg = m5;
        AN = 8'b1111_0111;
    end
    3'b101:begin
        sseg = m6;
        AN = 8'b1111_1011;
    end
    3'b110:begin
        if(!ready)
            sseg = 7'b000_0001;
        else               
            sseg = m7;
        AN = 8'b1111_1101;
    end
    3'b111:begin
        if(!ready)
            sseg = 7'b000_0001;
        else    
            sseg = m8;
        AN = 8'b1111_1110;
    end
endcase
end
endmodule