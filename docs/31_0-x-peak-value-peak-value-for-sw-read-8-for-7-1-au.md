# 31 :0 X PEAK_VALUE: peak value for sw read, 8 for 7.1 audio format

- MVC_CONFIG_ERR_TYPE_0
- Offset: 0x12c
- Read/Write: RO
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)

- Arbitrary Sample Rate Control (ASRC) Registers
- Bit
- Reset
- Description
- FALSE
VOLUME_CONFIG_ERROR: Two sources: 1. Software programming target volume during Switching is SET 2. Wrong programming: a. INIT_VOL > max volume, or INIT_VOL < min volume (refer to range of
- INIT_VOL)
b. TARGET_VOL > max volume, or TARGET_VOL < min volume (refer to range of TARGET_VOL) 0 = FALSE 1 = TRUE
- FALSE
COEFF_CONFIG_ERROR:
- Software programming coefficient buffer during Switching is SET

