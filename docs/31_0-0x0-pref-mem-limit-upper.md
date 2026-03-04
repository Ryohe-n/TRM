# 31 :0 0x0 PREF_MEM_LIMIT_UPPER:

- Prefetchable Limit Upper 32 Bit. - If the Prefetchable Memory Limit register
indicate support for 64-bit addressing, then this register is implemented as read/write register which must be initialized by configuration software. - This register specifies the upper 32 bits, corresponding to Address[63:32], of the 64- bit base addresses which specify the prefetchable memory address range. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- PREF_MEM_LIMIT_PREF_MEM_BASE_REG.PREF_MEM_DECODE ? RW : RO
- PCIE_X<i>_RC_PF0_TYPE1_HDR_IO_LIMIT_UPPER_IO_BASE_UPPER_REG_0
where <i> = 1, 4, 8.
- Description: The I/O Limit Upper 16 Bits and I/O Base Upper 16 Bits registers are optional
extensions to the I/O Limit and I/O Base registers.
- Offset: 0x30
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- PCIE_X1_RC_PF0_TYPE1_HDR_IO_LIMIT_UPPER_IO_BASE_UPPER_REG_0
- Read/Write: RO
- PCIE_X4_RC_PF0_TYPE1_HDR_IO_LIMIT_UPPER_IO_BASE_UPPER_REG_0
- PCIE_X8_RC_PF0_TYPE1_HDR_IO_LIMIT_UPPER_IO_BASE_UPPER_REG_0
- Read/Write: R/W

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description

