# 3 :0 0x5 DSP_16G_TX_PRESET4:

- Downstream Port 16.0 GT/s Transmitter Preset4. Transmitter Preset of Lane 4
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- PCIE_X<i>_RC_PF0_MARGIN_CAP_MARGIN_EXT_CAP_HDR_REG_0
where <i> = 1, 4, 8. Description: This register provides capbility ID, capability version and next offset value for Margining Extended Capability.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_MARGIN_CAP_MARGIN_EXT_CAP_HDR_REG_0
- Offset: 0x17c
- Reset: 0x19010027 (0b0001,1001,0000,0001,0000,0000,0010,0111)
- Bit
- Reset
- Description

