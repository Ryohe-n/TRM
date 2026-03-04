# 11 :8 0x0 DSP_16G_TX_PRESET5:

- Downstream Port 16.0 GT/s Transmitter Preset5. Transmitter Preset of Lane 5
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit. 7:4 0x4 USP_16G_TX_PRESET4:
- Upstream Port 16.0 GT/s Transmitter Preset4. -Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 4 during 16.0 GT/s equalization. -Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 4 during Link Equalization. Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. 3:0 0x0 DSP_16G_TX_PRESET4:
- Downstream Port 16.0 GT/s Transmitter Preset4. Transmitter Preset of Lane 4
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit.
- PCIE_X<j>_EP_PF0_MARGIN_CAP_MARGIN_EXT_CAP_HDR_REG_0
where <j> = 4, 8. Description:This register provides capbility ID, capability version and next offset value for Margining Extended Capability.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X4_EP_PF0_MARGIN_CAP_MARGIN_EXT_CAP_HDR_REG_0
- Offset: 0x18c
- Reset: 0x1a410027 (0b0001,1010,0100,0001,0000,0000,0010,0111)

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

