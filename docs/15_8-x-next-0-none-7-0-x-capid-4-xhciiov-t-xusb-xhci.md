# 15 :8 X NEXT: 0 = NONE 7:0 X CAPID: 4 = XHCIIOV T_XUSB_XHCI_EC_XHCIIOV_INTR_RANGE_0 This is an array of four identical register entries; the register fields below apply to each entry.

- Full register list is: T_XUSB_XHCI_EC_XHCIIOV_INTR_RANGE_<i>, among which <i> belongs to
<0..3>.
- Offset: 0x63c,..,0x648
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00200000 (0bxxxx,xxxx,xx10,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x1 VFH: 1 = INIT
- RW
0x0 VFR: 0 = INIT 19:10
- RW
0x0 INTRCNT: 0 = INIT 9:0
- RW
0x0 INTROFS: 0 = INIT

- XHCI Controller Memory-Mapped I/O Registers
T_XUSB_XHCI_EC_XHCIIOV_SLOT_ASSIGN_0 This is an array of 256 identical register entries; the register fields below apply to each entry.
- Full register list is: T_XUSB_XHCI_EC_XHCIIOV_SLOT_ASSIGN_<i>, among which <i> belongs to
<0..255>.
- Offset: 0x64c,..,0xa48
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000,0000)
- Bit
- Reset
- Description
0x0 SE: 0 = INIT 5:0 0x0 VF_ID: 0 = INIT T_XUSB_XHCI_RT_MFINDEX_0
- Offset: 0x20000
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

