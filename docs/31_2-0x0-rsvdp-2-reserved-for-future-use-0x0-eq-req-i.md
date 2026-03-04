# 31 :2 0x0 RSVDP_2: Reserved for future use. 0x0 EQ_REQ_INT_EN:

- Link Equalization Request Interrupt Enable. This bit is RW for Downstream
- Ports and for Upstream Ports when Crosslink Supported is 1b. This bit is not
applicable and is RsvdP for Upstream Ports when the Crosslink Supported bit is 0b. If the Port does not support 8.0 GT/s, this bit is permitted to be hardwired to 0b by the controller. Note: The access attributes of this field are as follows: - Wire: RSVDP - Dbi: RSVDP 0x0 PERFORM_EQ:
- Perform Equalization. This bit is RW for Downstream Ports and for Upstream
- Ports when Crosslink Supported is 1b. This bit is not applicable and is RsvdP
for Upstream Ports when the Crosslink Supported bit is 0b. If the Port does not support 8.0 GT/s, this bit is permitted to be hardwired to 0b by the controller. Note: The access attributes of this field are as follows: - Wire:
- RSVDP - Dbi: RSVDP
- PCIE_X<j>_EP_PF0_SPCIE_CAP_LANE_ERR_STATUS_REG_0
where <j> = 4, 8. Description:This Register contains Lane Error Status Bits per Lane.
- PCIE_X4_EP_PF0_SPCIE_CAP_LANE_ERR_STATUS_REG_0
- PCIE_X8_EP_PF0_SPCIE_CAP_LANE_ERR_STATUS_REG_0
- Offset: 0x150
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

