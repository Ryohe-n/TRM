# 10 :0 0x140 SKP_INT_VAL:

- SKP Interval Value. The number of symbol times to wait between transmitting SKP
ordered sets. The controller waits the number of symbol times in this register plus 1, between transmitting SKP ordered sets. Your application must program this register accordingly. For example, if 1536 were programmed into this register (in a 250 MHz controller), then the controller actually transmits SKP ordered sets once every 1537 symbol times. The value programmed to this register is actually clock ticks and not symbol times. In a 125 MHz controller, programming the value programmed to this register should be scaled down by a factor of 2 (because one clock tick =two symbol times in this case). Note: This value is not used at Gen3 speed; the skip interval is hardcoded to 370 blocks. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_FILTER_MASK_2_OFF_0
where <j> = 4, 8. Description:This register modifies the RADM filtering and error handling rules. For more details, see the "Receive Filtering" section. In each case, '0' applies the associated filtering rule and '1' masks the associated filtering rule.
- PCIE_X4_EP_PF0_PORT_LOGIC_FILTER_MASK_2_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_FILTER_MASK_2_OFF_0
- Offset: 0x720
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

