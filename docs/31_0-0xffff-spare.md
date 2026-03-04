# 31 :0 0xffff SPARE:

- Per CHANNEL shadowed spare register for chansel
- VI_CH35_ENABLE_0
- Channel prefix gets added to register name (VI_CH*)
- NON-SHADOWED CHANSEL REGISTER
- When turning channel ENABLE off (1 -> 0) it is always important to issue a follow up LOAD
command from the CHANNEL_COMMAND register in channel hostif. This guarantees that any ongoing frame on the channel is properly terminated. The two step process ensures no races in hardware. Put channel enable to a separate register field to avoid SW race condition.
- Offset: 0x6305
- Byte Offset: 0x18c14
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 ENABLE: Enables or disables this channel’s match state in CHANSEL. Does not necessarily disable the channel in all stages of the pipeline.
- If there are atoms remaining to be written in ATOMP, they will still be
written even if the channel is disabled.
- VI_CH35_CONTROL_0
- Channel prefix gets added to register name (VI_CH*)
- Offset: 0x6306
- Byte Offset: 0x18c18
- Read/Write: R/W
- Parity Protection: See table below
- Shadow: N

- Video Input Channels 21-35 Registers
- SCR Protection: 0
- Reset: 0x00ff0030 (0b0000,0000,1111,1111,xxxx,xxxx,xx11,000x)
- Bit
- Parity Protection
- Reset
- Description

