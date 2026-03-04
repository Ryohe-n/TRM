# 31 :0 0x800000 INIT_VOL: Eight initial volumes for eight channels.

- If PER_CHAN_CTRL_EN is DISABLE, all the channels use the same
initial volume: ch0->INIT_VOL_0 This register is shared for Volume Initialization for two curve types: Polynomial: default curve type, all 32 bits of the registers are used.
- The volume is provided in linear and should be in signed Q8.24
format. default: 0x80_0000 (0.5, Q8.24) range : 0x0 ~ 0x6400_0000 (0 ~ 100 @Q8.24) positive value only, cannot be set with negative number Linear Ramp: For this curve type, only bottom 16 bits are used. The volume is provided in dB and should be in signed Q8.8 format. default: 0xffff_fa00 (-6dB @Q8.8) range : 0xffff_8800 ~ 0x2800 (-120dB ~ 40dB @Q8.8)
- MVC_TARGET_VOL_0

- Master Volume Control (MVC) Registers
Register array of 8 entries.
- Offset: 0xd0,..,0xec
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00800000 (0b0000,0000,1000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

