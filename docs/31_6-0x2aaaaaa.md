# 31 :6 0x2aaaaaa

- SPARE_BITS: Spare Register Bits

- AON Registers
- Bit
- Reset
- Description
0x0
- SLEC1B2B_ENABLE: Bit for Size/Length error checking - AXI2APB
only supports single beat transactions of 1Byte and 2Byte size. This is for diagnostic purposes only and should not normally be changed. 0 - OFF: Generate error on multi-beat transactions of 1Byte and 2Byte size. 1 - ON: Do not Generate error on multi-beat transactions of 1Byte and 2Byte size. 0x1
- FC_ENABLE_CH3: Bit for FC This is for diagnostic purposes only and
should not normally be changed. 0 - OFF, FC Sideband Enabled 1 - ON, FC Sideband Disabled 0x1
- FC_ENABLE_CH2: Bit for FC This is for diagnostic purposes only and
should not normally be changed. 0 - OFF, FC Sideband Enabled 1 - ON, FC Sideband Disabled 0x0
- FC_ENABLE_CH1: Bit for FC This is for diagnostic purposes only and
should not normally be changed. 0 - OFF, FC Sideband Enabled 1 - ON, FC Sideband Disabled 0x1
- FC_ENABLE_CH0: Bit for FC This is for diagnostic purposes only and
should not normally be changed. 0 - OFF, FC Sideband Enabled 1 - ON, FC Sideband Disabled 0x0
- VC_ENABLE: Bit for VC This is for diagnostic purposes only and
should not normally be changed. 0 - OFF, VC Enabled 1 - ON, VC Disabled
- DMAAPB_AON_FC_DELAY_CONFIG_0
- Offset: 0x404
Read/Write: See table below.
- Parity Protection: N
- SCR Protection: BR_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0101)
- Bit
- Reset
- Description

