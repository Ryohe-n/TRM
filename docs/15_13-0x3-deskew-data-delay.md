# 15 :13 0x3 DESKEW_DATA_DELAY:

- How many cycles delay introduced by re-timing flops
0x1 DESKEW_LANE_SKEW_CHECK_EN:
- Check the skew between the lanes. this is used to handle the error case that
error happen in the CSI link caused some data lanes detect the HS sync word (0xb8) while other data lanes detect the deskew sync word (0xff). If this bit is not set with the error case, the lane FIFO will overflow and reset is required.
- With this bit set, the FIFO will be auto flused and the FIFO overflow will not
happen. 11:8 0x4 DESKEW_LANE_SKEW_TOLERANCE:
- The allowed skew between the data lane, only used in sync word search

