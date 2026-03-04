# 14 :12 0x7 USP_RX_PRESET_HINT6:

- Upstream Port 8.0 GT/s Receiver Preset Hint6. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Receiver preset hint 6 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 11:8 0x4 USP_TX_PRESET6:
- Upstream Port 8.0 GT/s Transmitter Preset6. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Transmitter preset 6 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 0x0 RSVDP_7: Reserved for future use. 6:4 0x0 DSP_RX_PRESET_HINT6:
- Downstream Port 8.0 GT/s Receiver Preset Hint6. Receiver preset hint 6 value
that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. 3:0 0x0 DSP_TX_PRESET6:
- Downstream Port 8.0 GT/s Transmitter Preset6. Transmitter preset 6 value used
for 8.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit.
- PCIE_X<j>_EP_PF0_PL16G_CAP_PL16G_EXT_CAP_HDR_REG_0
where <j> = 4, 8.
- Description:Physical Layer 16.0 GT/s Extended Capability Header provides information about
Capability ID, Version, and next offset.

- PCIe x4/x8 Endpoint
- Offset: 0x168
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X4_EP_PF0_PL16G_CAP_PL16G_EXT_CAP_HDR_REG_0
- Reset: 0x18c10026 (0b0001,1000,1100,0001,0000,0000,0010,0110)
- Bit
- Reset
- Description

