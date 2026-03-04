# 7 :0 0x0 INT_INFO_UPPER:

- These 8 bits are the upper byte of captured FPCI address (bits[39:32]) when
interrupt code is 3, 4 or 7. These bits determine the region in the HyperTransport Address Map that was accessed.
- HDA_IPFS_INTR_ENABLE_0
- IPFS Interrupt Enable
- Offset: 0x198
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xx00,xxxx,0000,0000)
- Bit
- Reset
- Description
0x0 EN_SM_NON_FATAL_ERROR:
- Enable bit for interrupt code 15
0x0 EN_SM_FATAL_ERROR:
- Enable bit for interrupt code 14
0x0 EN_FPCI_TIMEOUT:
- Enable bit for interrupt code 9
0x0 EN_AXI_DECERR:
- Enable bit for interrupt code 8

- HDA Registers
- Bit
- Reset
- Description
0x0 EN_DFPCI_DECERR:
- Enable bit for interrupt code 7
0x0 EN_TGT_WRERR:
- Enable bit for interrupt code 5
0x0 EN_TGT_DECERR:
- Enable bit for interrupt code 4
0x0 EN_TGT_SLVERR:
- Enable bit for interrupt code 3
0x0 EN_INI_DECERR:
- Enable bit for interrupt code 2
0x0 EN_INI_SLVERR:
- Enable bit for interrupt code 1
- HDA_UFPCI_CONFIG_0
- Upstream FPCI Configuration
- Offset: 0x19c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000002 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0010)
- Bit
- Reset
- Description

