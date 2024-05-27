`timescale  1ns / 1ps

module SongPlayer(input clock, input reset, input playSound, input val, output reg 
audioOut, output wire aud_sd);
reg [19:0] counter;
reg [31:0] time1, noteTime;
reg [9:0] msec, number; //millisecond counter, and sequence number of musical note.
wire [4:0] note, duration;
wire [19:0] notePeriod;
parameter clockFrequency = 100_000_000; 
assign aud_sd = 1'b1;

MusicSheet mysong(number, notePeriod, duration, val);

always @ (posedge clock, posedge reset) begin
if(reset | ~playSound) begin 
          counter <=0;  
          time1<=0;  
          number <=0;  
          audioOut <=1;
end
else begin
counter <= counter + 1; 
time1<= time1+1;
    if( counter >= notePeriod) begin
        counter <=0;  
        audioOut <= ~audioOut ; 
        end //toggle audio output 
    if( time1 >= noteTime) begin
    time1 <=0;  
    number <= number + 1; 
    end  //play next note
    if(number == 10) begin 
    number <=0; // Make the number reset at the end of the song
    end
end
end
              
always @(duration) 
noteTime = duration * clockFrequency/8;
       //number of   FPGA clock periods in one note.
endmodule