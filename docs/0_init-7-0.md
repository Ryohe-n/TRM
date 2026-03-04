# 0 = INIT 7:0

- RO
X RSVD0: 0 = _00 T_XUSB_DEV_XHCI_ERSTSZ_0
- Event Ring Segment Table Size Register
Specifies the size of each event ring segment in terms of number of event TRB slots (each slot is 16 bytes) the min value of size in each register is 16 and the max is 4096 both the segments should be initialized with valid values.
- Offset: 0x8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

