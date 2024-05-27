`timescale 1ns / 1ps

module slowerClkGen(clk, resetSW, outsignal1, outsignal2, outsignal3);
input clk;   
input resetSW;
output reg outsignal1, outsignal2, outsignal3;
reg [27:0] counter, counter2, counter3;
always @ (posedge clk, posedge resetSW)begin
    if (resetSW) begin
        counter=0;
        counter2=0;
        counter3=0;
        outsignal1=0;
        outsignal2=0;
        outsignal3=0;
    end
    else begin
        counter = counter + 1;
        counter2 = counter2 + 1;
        counter3 = counter3 + 1;
            if (counter == 50_000_000) begin //1 Hz ---> 1 sec 
               outsignal1=~outsignal1;
               counter=0;
            end
            if (counter2 == 125_000) begin //400 Hz ---> 1/400 sec
                outsignal2=~outsignal2;
                counter2=0;
            end
            if (counter3 == 250_000_000) begin // 1/5hz --> 5 sec
                outsignal3=~outsignal3;
                counter3=0;
            end 
   end
end
endmodule