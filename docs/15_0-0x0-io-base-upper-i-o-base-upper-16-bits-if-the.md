# 15 :0 0x0 IO_BASE_UPPER: I/O Base Upper 16 Bits. - If the I/O Base register indicates support for 16-bit I/O address decoding, then this register is implemented as a read-only register which return zero when read. - If the I/O base register indicates support for 32- bit I/O addressing, then this register must be initialized by configuration software. - If 32-bit I/O address decoding is supported, this register specifies the upper 16 bits, corresponding to Address[31:16], of the 32-bit base address, that specify the I/O address range. - See the PCI-to-PCI Bridge Architecture

- Specification for additional details. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi:
- SEC_STAT_IO_LIMIT_IO_BASE_REG.IO_DECODE ? RW : RO
- PCIE_X<i>_RC_PF0_TYPE1_HDR_TYPE1_CAP_PTR_REG_0
where <i> = 1, 4, 8. Description: This register is used to point to a linked list of capabilities implemented by a Function.
- PCIE_X1_RC_PF0_TYPE1_HDR_TYPE1_CAP_PTR_REG_0
- PCIE_X4_RC_PF0_TYPE1_HDR_TYPE1_CAP_PTR_REG_0
- PCIE_X8_RC_PF0_TYPE1_HDR_TYPE1_CAP_PTR_REG_0
- Offset: 0x34
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000040 (0b0000,0000,0000,0000,0000,0000,0100,0000)
- Bit
R/W
- Reset
- Description

