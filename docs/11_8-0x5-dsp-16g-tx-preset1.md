# 11 :8 0x5 DSP_16G_TX_PRESET1:

- Downstream Port 16.0 GT/s Transmitter Preset1. Transmitter Preset of Lane 1
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 7:4 0x5 USP_16G_TX_PRESET0:
- Upstream Port 16.0 GT/s Transmitter Preset0. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 0 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 0 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R

