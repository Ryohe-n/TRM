# 31 :28 0x5 USP_16G_TX_PRESET3:

- Upstream Port 16.0 GT/s Transmitter Preset3. - Case A: When Operating port is
- Downstream port and whether the Crosslink is supported or not, this field
represents the value sent on Lane 3 during 16.0 GT/s equalization. - Case B:
- When Operating port is Upstream port and Crosslink Supported bit is 0, this
field is intended for debug and diagnostics. It contains the value captured from
- Lane 3 during Link Equalization. - Case C: When Operating port is Upstream port
and Crosslink Supported bit is 1, Field is not used or affected by the current Link
- Equalization. Field value will be used if a future crosslink negotiation switches the
Operating Port Direction so that case A applies. For case A and C, Field is HwInit.
- For case B, Field is RO. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R

