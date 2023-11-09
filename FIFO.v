`timescale 1ns / 1ps
module FIFO(clk, rst, wr_en, rd_en, buf_in, buf_out, buf_empty, buf_full, fifo_counter);
input clk, rst, wr_en, rd_en;
input [7:0] buf_in;
output [7:0] buf_out;
output buf_empty, buf_full;
output [6:0] fifo_counter;

reg [7:0] buf_out;
reg buf_empty, buf_full;
reg [6:0] fifo_counter;
reg [5:0] rd_ptr, wr_ptr;
reg [7:0] buf_mem[63:0];

//Status Flag
always@ (fifo_counter) begin
    buf_empty = (fifo_counter == 0); //When counter is 0, buffer is empty
    buf_full = (fifo_counter == 64); //When counter is 64, buffer is full
end

//Set the FIFO counter
always @(posedge clk or posedge rst) begin
    if( rst ) //If reset is active, counter equals 0
        fifo_counter <= 0;
    else if((!buf_full && wr_en) && (!buf_empty && rd_en)) // If you are writing (buffer isn't full) and reading (buffer isn't empty), counter stay constant
        fifo_counter <= fifo_counter;
    else if (!buf_full && wr_en) //If you are writing and the buffer isn't full, counter increase by 1
        fifo_counter <= fifo_counter + 1;
    else if (!buf_empty && rd_en) //If you are reading and the buffer isn't empty, counter decrease by 1
        fifo_counter <= fifo_counter - 1;
    else //Else, hold the FIFO counter
        fifo_counter <= fifo_counter;
end

//Fetching the data from the FIFO
always @(posedge clk or posedge rst) begin
    if (rst) //If reset is active, data out equals 0
        buf_out <= 0;
    else begin
        if (rd_en && !buf_empty)
            buf_out <= buf_mem[rd_ptr];
        else //If the previous is not true, nothing change
            buf_out <= buf_out;
    end
end

//Writing data into the FIFO
always @(posedge clk) begin
    if (!buf_full && wr_en)
        buf_mem[wr_ptr] <= buf_in;
    else
        buf_mem[wr_ptr] <= buf_mem[wr_ptr];
end

//Manage the pointers
always @(posedge clk or posedge rst) begin
    if(rst) begin
        //Initialize the pointers
        wr_ptr <= 0;
        rd_ptr <= 0;
    end
    else begin
        if (!buf_full && wr_en) //If you are writing, the wr_ptr increase
            wr_ptr <= wr_ptr + 1;
        else //Else, nothing happen
            wr_ptr <= wr_ptr;
        if (!buf_empty && rd_en) //If you are reading, the rd_ptr icrease
            rd_ptr <= rd_ptr + 1;
        else //Else, do nothing
            rd_ptr <= rd_ptr;               
    end
end

endmodule
