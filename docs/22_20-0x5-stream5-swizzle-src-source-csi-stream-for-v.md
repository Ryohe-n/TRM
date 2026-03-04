# 22 :20 0x5 STREAM5_SWIZZLE_SRC: source CSI stream for VI stream 5 18:16 0x4 STREAM4_SWIZZLE_SRC: source CSI stream for VI stream 4 14:12 0x3 STREAM3_SWIZZLE_SRC: source CSI stream for VI stream 3 10:8 0x2 STREAM2_SWIZZLE_SRC: source CSI stream for VI stream 2 6:4 0x1 STREAM1_SWIZZLE_SRC: source CSI stream for VI stream 1 2:0 0x0 STREAM0_SWIZZLE_SRC: source CSI stream for VI stream 0

- VI_CSIMUX_INPUT_STREAM_MUX_0
- Offset: 0x1199
- Byte Offset: 0x4664

- Video Input Registers
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,x0x0,x0x0,x0x0)
- Bit
- Reset
- Description
0x0 STREAM5: 0 = NVCSI_STREAM 1 = TERMINATE 0x0 STREAM4: 0 = NVCSI_STREAM 1 = TERMINATE 0x0 STREAM3: 0 = NVCSI_STREAM 1 = TERMINATE 0x0 STREAM2: 0 = NVCSI_STREAM 1 = TERMINATE 0x0 STREAM1: 0 = NVCSI_STREAM 1 = TERMINATE 0x0 STREAM0: 0 = NVCSI_STREAM 1 = TERMINATE
- VI_ISPBUFA_ERROR_0
- Offset: 0x1400
- Byte Offset: 0x5000
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- Video Input Registers
- Bit
- Reset
- Description
0x0 FIFO_OVERFLOW: Set by Hardware when the ISPBUF's internal FIFO has overflowed. (Generally due to clock speed mismatch b/w ISP and VI interfaces) Write 1 to clear. Also causes VI Master error.
- VI_ISPBUFA_SW_RESET_0
- Offset: 0x1401
- Byte Offset: 0x5004
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 ISPINTF_RESET:
- Reset ISP interface
- This S/W reset is to be used when Asynchronously reset ISP unit
due to an error condition (possibly FIFO_OVERFLOW) 1 : Assert reset on ISP interface 0 : De-asssert reset on ISP interface
- This reset needs to be held for the duration of atleast 200 isp_clk time
in order to ensure that the internal buffer is completely flushed out.
- VI_ATOMP_DVFS_LIMIT_WR_LIMIT_0
- Offset: 0x1d00
- Byte Offset: 0x7400
- Read/Write: R/W
- Parity Protection: N
- Shadow: Y
- SCR Protection: 0
- Reset: 0x000001c2 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx1,1100,0010)
- Bit
- Reset
- Description

