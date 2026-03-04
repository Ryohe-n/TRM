# 29 :27 0x0 REQ_FUNC_NUM:

- The function Number of the timed out completion. Function numbering
starts at '0' 26:24 0x0 REQ_CPL_TC: The Traffic Class of the timed out completion. 23:16 0x0 REQ_CPL_TAG: The Tag field of the timed out completion. 15:4 0x0 REQ_CPL_LEN:
- Length (in bytes) of the timed out completion. For a split completion, it
indicates the number of bytes remaining to be delivered when the completion timed out. 2:1 0x0 REQ_CPL_ATTR: The Attributes field of the timed out completion.
- PCIE_RP_APPL_RAS_5_0
- Offset: 0xd8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,0000,0000,0xxx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- Description

