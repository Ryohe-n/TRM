# 1 = Whenever write is ready, send it 0 = Write goes only when outstanding PWs outside of new write's region are retired (default).

- RW
0x0 UFPCI_PASSPW: Input to upstream FPCI. Allow upstream FPCI reads to pass writes.
- RW
0x0 UFPCI_PWPASSNPW: Used for upstream FPCI. Allow upstream FPCI PWs to pass NPWs.
- RW
0x0 DFPCI_PWPASSNPW:
- Used for downstream FPCI. Allow downstream FPCI PWs to pass
NPWs.
- RW
0x0 DFPCI_RSPPASSPW:
- Input to downstream FPCI. Allow downstream FPCI responses to
pass writes
- RW
0x0 DFPCI_PASSPW:
- Input to downstream FPCI. Allow downstream FPCI reads to pass
writes.
- RW
0x0 EN_FPCI:
- When the IPFS device block is disabled, it is completely invisible
on the IPFS bus, i.e., it doesn't even process IPFS configuration accesses.
- HDA_FPCI_ERROR_MASKS_0
- FPCI Error Masks
- Offset: 0x184
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)

- HDA Registers
- Bit
- Reset
- Description
0x0 MASK_FPCI_MASTER_ABORT:
- This bit allows FPCI error to be forwarded to AXI response when FPCI error
response indicates Master Abort. 1 = forward error, 0 = return AXI OKAY response (2'b0) 0x0 MASK_FPCI_DATA_ERROR:
- This bit allows FPCI error to be forwarded to AXI response when FPCI error
response indicates Data Error. 1 = forward error, 0 = return AXI OKAY response (2'b0) 0x0 MASK_FPCI_TARGET_ABORT:
- This bit allows FPCI error to be forwarded to AXI response when FPCI error
response.
- This bit also covers decode error generated when there is no DEVSEL
received indicates Target Abort. 1 = forward error, 0 = return AXI OKAY response (2'b0)
- HDA_INTR_MASK_0
- Interrupt Masks
- Offset: 0x188
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,xxxx,xxx0,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 IP_INT_MASK: IP interrupt to MPCORE gated by mask. 0x0 MSI_MASK: MSI to MPCORE gated by mask. 0x0 INT_MASK: Interrupt to MPCORE gated by mask.
- HDA_INTR_CODE_0
- Interrupt Control
- Offset: 0x18c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0

- HDA Registers
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description

