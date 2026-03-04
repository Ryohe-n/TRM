# 31 :0 0x0 PREF_MEM_BASE_UPPER:

- Prefetchable Base Upper 32 Bit. - If the Prefetchable Memory Base register
indicates support for 32-bit addressing, then this register is implemented as read-only register that returns zero when read. - If the Prefetchable Memory
- Base register indicate support for 64-bit addressing, then this register is
implemented as read/write register which must be initialized by configuration software. - This register specifies the upper 32 bits, corresponding to
- Address[63:32], of the 64-bit base addresses which specify the prefetchable
memory address range. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- PREF_MEM_LIMIT_PREF_MEM_BASE_REG.PREF_MEM_DECODE ? RW : RO
- PCIE_X<i>_RC_PF0_TYPE1_HDR_PREF_LIMIT_UPPER_REG_0
where <i> = 1, 4, 8.
- Description: The Prefetchable Limit Upper 32 Bits register is an optional extension to the
Prefetchable Memory Limit register.
- PCIE_X1_RC_PF0_TYPE1_HDR_PREF_LIMIT_UPPER_REG_0
- PCIE_X4_RC_PF0_TYPE1_HDR_PREF_LIMIT_UPPER_REG_0
- PCIE_X8_RC_PF0_TYPE1_HDR_PREF_LIMIT_UPPER_REG_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x2c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

