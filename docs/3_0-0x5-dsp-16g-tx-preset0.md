# 3 :0 0x5 DSP_16G_TX_PRESET0:

- Downstream Port 16.0 GT/s Transmitter Preset0. Transmitter Preset of Lane 0
used for 16.0 GT/s equalization by this Port when the Port is operating as a
- Downstream Port. This field is ignored when the Port is operating as an
- Upstream Port. For an Upstream Port if Crosslink Supported is 0b, this field is
- RsvdP. Otherwise, this field is HwInit. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R
- PCIE_X8_RC_PF0_PL16G_CAP_PL16G_CAP_OFF_24H_REG_0
Description: This Equalization Control register consists of control fields required for Lane 4-7 16.0
- GT/s equalization.)
- Offset: 0x18c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x55555555 (0b0101,0101,0101,0101,0101,0101,0101,0101)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description

