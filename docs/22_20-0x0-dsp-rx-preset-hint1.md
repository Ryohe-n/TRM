# 22 :20 0x0 DSP_RX_PRESET_HINT1:

- Downstream Port 8.0 GT/s Receiver Preset Hint 1. Receiver preset hint 1 value
that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. 19:16 0x0 DSP_TX_PRESET1:
- Downstream Port 8.0 GT/s Transmitter Preset 1. Transmitter preset 1 value used
for 8.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit. 0x0 RSVDP_15: Reserved for future use. 14:12 0x7 USP_RX_PRESET_HINT0:
- Upstream Port 8.0 GT/s Receiver Preset Hint 0. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Receiver preset hint 0 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 11:8 0x4 USP_TX_PRESET0:
- Upstream Port 8.0 GT/s Transmitter Preset 0. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Transmitter preset 0 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 0x0 RSVDP_7: Reserved for future use. 6:4 0x0 DSP_RX_PRESET_HINT0:
- Downstream Port 8.0 GT/s Receiver Preset Hint 0. Receiver preset hint 0 value
that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. 3:0 0x0 DSP_TX_PRESET0:
- Downstream Port 8.0 GT/s Transmitter Preset 0. Transmitter preset 0 value used
for 8.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_SPCIE_CAP_SPCIE_CAP_OFF_10H_REG_0
where <j> = 4, 8. Description:The function of this register is dependent on your actual configuration. - Gen3: LEC or RSVD depending on the value of CX_NL. - Gen4: LEC or LEC2 or RSVD depending on the value of CX_NL. This register provides Transmitter Preset and Receiver Preset Hint for Downstream Port and Upstream Port.
- PCIE_X4_EP_PF0_SPCIE_CAP_SPCIE_CAP_OFF_10H_REG_0
- PCIE_X8_EP_PF0_SPCIE_CAP_SPCIE_CAP_OFF_10H_REG_0
- Offset: 0x158
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x74007400 (0b0111,0100,0000,0000,0111,0100,0000,0000)
- Bit
- Reset
- Description
0x0 RSVDP_31: Reserved for future use. 30:28 0x7 USP_RX_PRESET_HINT3:
- Upstream Port 8.0 GT/s Receiver Preset Hint3. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Receiver preset hint 3 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 27:24 0x4 USP_TX_PRESET3:
- Upstream Port 8.0 GT/s Transmitter Preset3. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Transmitter preset 3 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description
0x0 RSVDP_23: Reserved for future use. 22:20 0x0 DSP_RX_PRESET_HINT3:
- Downstream Port 8.0 GT/s Receiver Preset Hint3. Receiver preset hint 3 value
that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. 19:16 0x0 DSP_TX_PRESET3:
- Downstream Port 8.0 GT/s Transmitter Preset3. Transmitter preset 3 value used
for 8.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit. 0x0 RSVDP_15: Reserved for future use. 14:12 0x7 USP_RX_PRESET_HINT2:
- Upstream Port 8.0 GT/s Receiver Preset Hint2. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Receiver preset hint 2 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 11:8 0x4 USP_TX_PRESET2:
- Upstream Port 8.0 GT/s Transmitter Preset2. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Transmitter preset 2 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 0x0 RSVDP_7: Reserved for future use. 6:4 0x0 DSP_RX_PRESET_HINT2:
- Downstream Port 8.0 GT/s Receiver Preset Hint2. Receiver preset hint 2 value
that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

