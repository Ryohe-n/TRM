# 7 :0 0xa1 REVISION_ID:

- Revision ID. The value in this register specifies a Function specific revision
identifier. The value is chosen by the vendor. Zero is an acceptable value. The Revision ID should be viewed as a vendor defined extension to the Device ID. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_TYPE0_HDR_BIST_HEADER_TYPE_LATENCY_CACHE_LINE_SIZE_REG_0
where <j> = 4, 8. Description:This register provides the status and controls BIST. It also holds information regarding the header layout, latency timer, and cache line size.
- PCIE_X4_EP_PF0_TYPE0_HDR_BIST_HEADER_TYPE_LATENCY_CACHE_LINE_SIZE_REG_0
- PCIE_X8_EP_PF0_TYPE0_HDR_BIST_HEADER_TYPE_LATENCY_CACHE_LINE_SIZE_REG_0
- Offset: 0xc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

