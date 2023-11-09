`resetall
`timescale 1ns / 1ps
module FIFO_test;

reg clk, rst, wr_en, rd_en;
reg [7:0] buf_in;
wire [7:0] buf_out;
wire buf_empty, buf_full;
wire [6:0] fifo_counter;

FIFO test1(clk, rst, wr_en, rd_en, buf_in, buf_out, buf_empty, buf_full, fifo_counter);

initial clk = 0;
always #4 clk=~clk;

initial begin
    rst = 1'b1; wr_en = 1'b1; rd_en = 1'b1; buf_in = 8'b00000111; #10; //reset condition check
//    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; //write into fifo 1st data
//    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; //write into fifo 2nd data
//    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; //write into fifo 3rd data
//    rst = 1'b0; wr_en = 1'b0; rd_en = 1'b1; buf_in = 8'b00000110; #10; //read from fifo 1st data
//    rst = 1'b0; wr_en = 1'b0; rd_en = 1'b1; buf_in = 8'b00000111; #10; //read from fifo 2nd data
//    rst = 1'b0; wr_en = 1'b0; rd_en = 1'b1; buf_in = 8'b00001000; //read from fifo 3rd data
    //Test memory
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;     
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b1; wr_en = 1'b1; rd_en = 1'b1; buf_in = 8'b00000111; #10; //reset condition check 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10; 
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000010; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000011; #10;
    rst = 1'b0; wr_en = 1'b1; rd_en = 1'b0; buf_in = 8'b00000001; 
    #10 $stop;
end

endmodule