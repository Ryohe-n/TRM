# 23 :20 0x4 USP_16G_TX_PRESET2:

- Upstream Port 16.0 GT/s Transmitter Preset2. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 2 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 2 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. 19:16 0x0 DSP_16G_TX_PRESET2:
- Downstream Port 16.0 GT/s Transmitter Preset2. Transmitter Preset of Lane 2
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit. 15:12 0x4 USP_16G_TX_PRESET1:
- Upstream Port 16.0 GT/s Transmitter Preset1. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 1 during 16.0 GT/s equalization. - CaseB:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 1 during Link Equalization. Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. 11:8 0x0 DSP_16G_TX_PRESET1:
- Downstream Port 16.0 GT/s Transmitter Preset1. Transmitter Preset of Lane 1
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit. 7:4 0x4 USP_16G_TX_PRESET0:
- Upstream Port 16.0 GT/s Transmitter Preset0. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 0 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 0 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current
- Link Equalization. Field value will be used if a future crosslink negotiation
switches the Operating Port Direction so that case A applies. For case A and C, Field is HwInit. For case B, Field is RO. 3:0 0x0 DSP_16G_TX_PRESET0:
- Downstream Port 16.0 GT/s Transmitter Preset0. Transmitter Preset of Lane 0
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
RsvdP. Otherwise, this field is HwInit.
- PCIE_X8_EP_PF0_PL16G_CAP_PL16G_CAP_OFF_24H_REG_0

- PCIe x4/x8 Endpoint
Description: This Equalization Control register consists of control fields required for Lane 4-7 16.0 GT/s equalization.
- Offset: 0x18c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x40404040 (0b0100,0000,0100,0000,0100,0000,0100,0000)
- Bit
- Reset
- Description

