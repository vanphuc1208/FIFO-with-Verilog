# FIFO - First In First Out - HCMUT Logic Design with HDL Project

## General Information:
- Goal: design, validate, and synthesize a synchronous FIFO (read and write clock domains are regulated by the same clock signal).
- Purpose: used in designs to reliably transport multi-bit data words from one clock domain to another or to manage data flow between source and destination clock domains.

## About the Project layout:
- fifo.v: implement the FIFO using verilog.
- fifo_tb.v: validate the operation of FIFO using waveform.

## About the Operation:
***Input**
- clk (active high input): clock signal is provided to synchronize all operations in the
FIFO.
- rst (active high input): when this signal is 1, the FIFO read and write data at the first index of the memory.
- buf_in (8-bit data input): it is the data input to be written into the memory.
- wr_en (active high input): signal to write data into FIFO.
- rd_en (active high input): signal to read data from FIFO.

***Output**
- buf_out (8-bit output): it is the data output read from the FIFO.
- buf_empty (active high output):indicating that FIFO is empty.
- buf_full (active high output): indicating that FIFO is full.
- fifo_counter (7-bit output): indicating the number of data values in FIFO.
