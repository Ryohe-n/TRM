# 5 :0 0x2b cfg_vc5_dt_nooverride_4:

- When incoming PH_DTYPE in VC5 match with this programmed value,
then DT override is disabled
- NVCSI_STREAM_5_VC5_DT_OVERRIDE_0
- Offset: 0xe027
- Byte Offset: 0x3809c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: Y
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x0000002a (0b0xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx10,1010)

- NVCSI Stream5 Registers
- Bit
- Reset
- Description
- DISABLE
cfg_vc5_dt_override_en: Override enable for image DT. 0 = DISABLE 1 = ENABLE 5:0 0x2a cfg_vc5_dt_override:
- This value is used by Color Parser to arrgange the pixels to VI,when
OVERRIDE_DT_EN[31] = '1'.
- If cfg_vc5_dt_override_en = 0, then Color Parser use the DT form PH
- NVCSI_STREAM_5_VC6_DT_NOOVERRIDE_CTRL_0_0
- VC6
- Offset: 0xe028
- Byte Offset: 0x380a0
- Read/Write: R/W
- Parity Protection: N
- Shadow: Y
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000012 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx01,0010)
- Bit
- Reset
- Description

