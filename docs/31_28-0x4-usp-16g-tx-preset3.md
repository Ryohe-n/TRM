# 31 :28 0x4 USP_16G_TX_PRESET3:

- Upstream Port 16.0 GT/s Transmitter Preset3. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 3 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 3 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. 27:24 0x0 DSP_16G_TX_PRESET3:
- Downstream Port 16.0 GT/s Transmitter Preset3. Transmitter Preset of Lane 3
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

