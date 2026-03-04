# 31 :4 0x0 BAR5_START:

- BAR5 Base Address. - Memory Space: Base Address. - IO Space: bits[31:2] are
used to map the function into IO space/Base. Address. Note: The access attributes of this field are as follows: - Wire: R(Sticky)/W(Sticky) if enabled else R(Sticky) - Dbi: R(Sticky)/W(Sticky) if enabled else R(Sticky) Note: This register field is sticky. 0x0 BAR5_PREFETCH:
- BAR5 Prefetchable. - Memory Space: Set to one if data is prefetchable. A
- Function is permitted to mark a range as prefetchable. If there are no side
effects on reads, the function returns all bytes on reads regardless of the byte enables, and host bridges can merge processor writes into this range without causing errors. Bit must me clear otherwise. - IO Space: Not applicable Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (BAR_ENABLED == 1) then (if [DBI_RO_WR_EN == 1] then R(Sticky)/W(Sticky) else R(Sticky)) else RO(Sticky) Note: This register field is sticky. 2:1 0x0 BAR5_TYPE:
- BAR5 Type. - Memory Space: Base Address registers that map into Memory
- Space can be 32 bits or 64 bits wide (to support mapping into a 64-bit address
space). The encodings defined in Values: apply. - IO Space: Bit 1 is reserved and must return 0b on reads. Bits[31:2] are used to map the function into IO space.
- The encodings defined in Values: do not apply. Note: The access attributes of
this field are as follows: - Wire: R (sticky) - Dbi: if (BAR_ENABLED == 1) then (if [DBI_RO_WR_EN == 1] then R(Sticky)/W(Sticky) else R(Sticky)) else RO(Sticky) Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description
0x0 BAR5_MEM_IO:
- BAR5 Memory Space Indicator. This bit is used to determine whether the
register maps into Memory or I/O Space. Base Address registers that map to
- Memory Space must return a 0b. Base Address registers that map to I/O Space
must return a 1b. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (BAR_ENABLED == 1) then (if [DBI_RO_WR_EN == 1] then R(Sticky)/W(Sticky) else R(Sticky)) else RO(Sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_TYPE0_HDR_CARDBUS_CIS_PTR_REG_0
where <j> = 4, 8. Description:This register holds the CardBus CIS pointer.
- PCIE_X4_EP_PF0_TYPE0_HDR_CARDBUS_CIS_PTR_REG_0
- PCIE_X8_EP_PF0_TYPE0_HDR_CARDBUS_CIS_PTR_REG_0
- Offset: 0x28
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

