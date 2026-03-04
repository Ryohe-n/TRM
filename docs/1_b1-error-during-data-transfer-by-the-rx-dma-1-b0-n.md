# 1 'b1: Error during data transfer by the Rx DMA - 1'b0: No error during data transfer by the Rx DMA Bit 20 - 1'b1: Error during descriptor access - 1'b0: Error during data buffer access Bit 19 - 1'b1: Error during read transfer - 1'b0: Error during write transfer This field is valid only when the FBE bit is set. This field does not generate an interrupt. 18:16

- RW
0x0 TEB:
- Tx DMA Error Bits. This field indicates the type of error that caused a
- Bus Error. For example, error response on the AXI interface. Bit 18 -

