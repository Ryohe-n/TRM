# 7 :0 0x0 NUM_INITIATOR_NISO_PW_RESP_PEND:

- Number of pending initiator NISO PW responses
- HDA_INTR_STATUS_0
- IPFS Interrupt Status
- Offset: 0x1b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 IP_INTR_STATUS:
- Status of IP interrupt
0x0 MSI_INTR_STATUS:
- Status of MSI interrupt
0x0 IPFS_INTR_STATUS:
- Status of IPFS interrupt
- HDA_DFPCI_BEN_0
- Downstream FPCI Byte Enables
- Offset: 0x1b8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 EN_DFPCI_BEN:
- Enable bit for ben; when set, programmed be is sent on DFPCI bus

- HDA Registers
- Bit
- Reset
- Description

