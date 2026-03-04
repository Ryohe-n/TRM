# 30 :28 0x7 USP_RX_PRESET_HINT7:

- Upstream Port 8.0 GT/s Receiver Preset Hint7. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Receiver preset hint 7 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 27:24 0x4 USP_TX_PRESET7:
- Upstream Port 8.0 GT/s Transmitter Preset7. The write value is gated with the
- PCIE_CAP_CROSS_LINK_SUPPORT field of LINK_CAPABILITIES2_REG. Field
contains the Transmitter preset 7 value sent or received during 8.0 GT/s Link
- Equalization. - Case A: When Operating port is Downstream port and whether
the Crosslink is supported or not, this field representss the value sent on Lane 0 during 8.0 GT/s equalization. - Case B: When Operating port is Upstream port and
- Crosslink Supported bit is 0, this field is intended for debug and diagnostics. It
contains the value captured from Lane 0 during Link Equalization. - Case C: When
- Operating port is Upstream port and Crosslink Supported bit is 1, Field is not
used or affected by the current Link Equalization. Field value will be used if a future crosslink negotiation switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. Note: This register field is sticky. 0x0 RSVDP_23: Reserved for future use. 22:20 0x0 DSP_RX_PRESET_HINT7:
- Downstream Port 8.0 GT/s Receiver Preset Hint7. Receiver preset hint 7 value
that may be used as a suggested setting for 8.0 GT/s receiver equalization by this Port when the Port is operating as a Downstream Port. This field is ignored when the Port is operating as an Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is RsvdP. Otherwise, this field is HwInit. 19:16 0x0 DSP_TX_PRESET7:
- Downstream Port 8.0 GT/s Transmitter Preset7. Transmitter preset 7 value used
for 8.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit. 0x0 RSVDP_15: Reserved for future use.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

