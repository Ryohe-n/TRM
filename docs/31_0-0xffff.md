# 31 :0 0xffff

- SPARE
- VI_CSIMUX_EIGHT_LANE_DEINT_CONFIG_0
- EIGHT LANE DEINT CONFIG REGISTERS
To turn on OMNIVISION style deinterleaving, set MODE field to a non-zero value. Deinterleaving is done by muxing pixels 2 from a pair of streams: either streams 0 and 2, or streams 2 and 4.

- Video Input Registers
When 0 and 2 are used stream 1 is not used. Similarly stream 3 is not used when 2 and 4 are in use. One is the master stream whereas the other is the slave stream. The least numbered stream in the pair is the master. When the (0,2) stream pair is in use, stream 0 is master, stream 2 is slave. stream 1 is forced disabled. When the (2,4) stream pair is in use, stream 2 is master, stream 4 is slave. stream 3 is forced disabled.
- The outgoing stream number associated with a deinterleaved output is the stream ID of the
master channel. Deinterleaving is done by joining a HI (slave) and a LO stream (master), where the LO stream has the first very first pixel of each line. For the various modes the deinterleaving is done as follows, over 2 or 3 clock cycles which are numbered as beats:
- HI LO
- Mode 2 x8 \ FIFO PXL POSITION 7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0 | Deinterleaved
- Output
- Cycle \ |
-----------+--------------------------------------------------------------------------+---------------------------
- Beat 0 | 7 5 3 1 6 4 2 0 | 7 6 5 4 3 2 1 0
- Beat 1 | 15 13 11 9 14 12 10 8 | 15 14 13 12 11 10 9 8
-----------+--------------------------------------------------------------------------+---------------------------
- Mode 3 x8 \ FIFO PXL POSITION 7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0 | Deinterleaved
- Output
- Cycle \ |
-----------+--------------------------------------------------------------------------+---------------------------
- Beat 0 | 7 6 5 4 3 2 1 0 | 7 6 5 4 3 2 1 0
- Beat 1 | 15 14 13 12 11 10 9 8 | 15 14 13 12 11 10 9 8
-----------+--------------------------------------------------------------------------+---------------------------

- Video Input Registers
- Mode 3 x6 \ FIFO PXL POSITION 7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0 | Deinterleaved
- Output
- Cycle \ |
-----------+--------------------------------------------------------------------------+---------------------------
- Beat 0 | 5 4 ^7 ^6 ^3 ^2 ^1 ^0 | 7 6 5 4 3 2 1 0
- Beat 1 | 11 10 ^9 ^8 15 14 13 12 | 15 14 13 12 11 10 9 8
- Beat 2 | 23 22 17 16 21 20 19 18 | 23 22 21 20 19 18 17 16
-----------+--------------------------------------------------------------------------+--------------------------- Mode 3 x6: for each entry of the HI FIFO, there are two words from the LO FIFO. Pixel with a ^ prefix are on the first entry from the LO FIFO whereas others are from the second entry. Since Beat 1 combines pixels from the first and second FIFO word it follows that ^8 and ^9 and need to be saved when popping the low entry. Constraint A: Omnivision interleaved stream can use only one virtual channel. Constraint B: Omnivision interleaved stream can use only RAW modes. Constraint C: Omnivision interleaved stream must at least be 9 pixels wide for Mode 3 X8, 7 pixels wide for Mode 3 X6, and 3 pixels wide for Mode 2 x8 Constraint D: Omnivision interleaved stream must use 8 PPC, 4 PPC is not supported.
- If MODE==0 then WT is forced to zero and deinterleaved settings are used from the STREAM
registers. When WT set to 0 implies the stream is turned off and no traffic will be allowed out if the DEINT FIFOs. If traffic is pushed in with DEINT in use and WT=0 this will eventually cause a FIFO overflow. To block traffic from interleaved queues, set Q_BLOCK=1, this also resets the FIFO.

- Video Input Registers
To reset deinterleaver in an errored state:
- Set QBLOCK=1,
then trigger FEINJECT=1 (this terminate an ongoing frame, and marks it with error), then trigger SRESET=1, (optional reset on state such as overflow detection and spurious data) then release QBLOCK=0 to resume and unblock traffic. To avoid hanging frames (a frame that has begun for which no Frame End is occurring within a reasonable amount of time set FE_MAX_TIME to a non-zero value. At each start of frame a timer is started. If the timer elapses before a frame end is seen then an errored frame end is forced down the pipeline. For HW testing , FRAMEMAXTIME can also be used to inject error in the pipeline by setting the count expected to be smaller than the transmission duration of the expected frames. Setting 0 on the FRAMEIDGEN bit resets the generated frame ID counter to 1 for the next time FRAMEIDGEN is set.
- Offset: 0x1107
- Byte Offset: 0x441c
- Read/Write: See table below
- Parity Protection: See table below
- Shadow: N
- SCR Protection: 0
- Reset: 0x0X400000 (0b0000,x00x,0100,0000,0000,0000,0000,0000)
- Bit
R/W
- Parity Protection
- Reset
- Description

