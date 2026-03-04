# 0 = OFF 1 = ON 0x0 SPI2_SCK:

- On - SPI2_SCK PAD(s) is in Deep Power Down mode, Off - SPI2_SCK PAD(s)
is out of Deep Power Down mode 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_IO_AO_DPD_OFF_MASK_0
- Offset: 0xe028
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_IO_AO_SCR_0
- Reset: 0x000007ff (0bxxxx,xxxx,xxxx,xxxx,xxxx,x111,1111,1111)
- Bit
- Reset
- Description
0x1 GEN8_I2C_SDA:
- On - GEN8_I2C_SDA PAD(s) are masked to enter Deep Power Down mode
from SC7 controller, Off - GEN8_I2C_SDA PAD(s) are free to enter Deep
- Power Down mode

