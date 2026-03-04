# 31 :0 0x800000 TARGET_VOL: Eight target volumes for eight channels.

- If PER_CHAN_CTRL_EN is DISABLE, all the channels use the same
target volume: ch0->TARGET_VOL_0 This register is shared for Target Volume for two curve types: Polynomial: For this curve type, all 32 bits of the registers are used.
- The volume is provided in linear and should be in signed 8.24
format default: 0x80_0000 (0.5, Q8.24) range : 0x0 ~ 0x6400_0000 (0 ~ 100 @Q8.24) positive value only, cannot be set with negative number Linear Ramp: For this curve type, only bottom 16 bits are used.
- The volume is provided in dB and should be in signed 8.8 format
default: 0xffff_fa00 (-6dB @Q8.8) range : 0xffff_8800 ~ 0x2800 (-120dB ~ 40dB @Q8.8)
- If Software program this register, must be followed by
- VOLUME_SWITCH trigger to let Hardware know new volume
parameters ready.
- Hardware will take the new target volume after finishing current
frame
- Usually this case is not allowed: Software programming both MUTE
and new target volume at the same time. But if it is by accident, system will go to MUTE, ignore the target volume set it with RWTO, which Hardware can update this reg to be MUTE value when Software programming mute flag
- MVC_DURATION_0
- Offset: 0xf0
- Read/Write: RW
- Parity Protection: N
- Reset: 0x000012c0 (0bxxxx,xxxx,0000,0000,0001,0010,1100,0000)
- Bit
- Reset
- Description

