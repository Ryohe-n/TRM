# 31 :2 0x0 INT_INFO:

- For interrupt codes 1-5/7-8, it contains address bits [31:2], either in
FPCI memory space or AXI space.
- For FPCI generated errors, the info contains FPCI address. For AXI/IPFS
generated errors, the info contains AXI address.

- HDA Registers
- Bit
- Reset
- Description
0x0 DIR:
- Indicates direction of the AXI/FPCI transaction. 1 = Read /0 = Write
If signature type is 6 (sideband message), this field is 1. 0 = WRITE: Interrupt due to a write transaction 1 = READ: Interrupt due to a read transaction
- HDA_UPPER_FPCI_ADDR_0
- Upper FPCI Address
- Offset: 0x194
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

