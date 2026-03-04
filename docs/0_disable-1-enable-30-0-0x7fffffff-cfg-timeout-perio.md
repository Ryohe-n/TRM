# 0 = DISABLE 1 = ENABLE 30:0 0x7fffffff cfg_timeout_period:

- Timeout period

- NVCSI Stream5 Registers
- NVCSI_STREAM_5_PH_CHK_CTRL_0
- Offset: 0xe065
- Byte Offset: 0x38194
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- ENABLE
cfg_ph_16_vc: 16 VC support 0 = DISABLE 1 = ENABLE
- ENABLE
cfg_ph_crc_chk_en:
- PH CRC check enable (only for CPHY case), when this bit is set to 0, the
packet header will still be decode when the CRC check fail, but the error will be set. 0 = DISABLE 1 = ENABLE
- ENABLE
cfg_ph_ecc_chk_en:
- PH ECC check enable (only for DPHY case), when this bit is set to 0, the
packet header will still be decode when the ECC check fail, but the error will be set. 0 = DISABLE 1 = ENABLE
- NVCSI_STREAM_5_VC0_DPCM_CTRL_0
- Offset: 0xe066
- Byte Offset: 0x38198
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description

