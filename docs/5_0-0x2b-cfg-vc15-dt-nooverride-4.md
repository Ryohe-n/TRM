# 5 :0 0x2b cfg_vc15_dt_nooverride_4:

- When incoming PH_DTYPE in VC15 match with this programmed value,
then DT override is disabled
- NVCSI_STREAM_5_VC15_DT_OVERRIDE_0
- Offset: 0xe063
- Byte Offset: 0x3818c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: Y
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x0000002a (0b0xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx10,1010)
- Bit
- Reset
- Description
- DISABLE
cfg_vc15_dt_override_en: Override enable for image DT. 0 = DISABLE 1 = ENABLE 5:0 0x2a cfg_vc15_dt_override:
- This value is used by Color Parser to arrgange the pixels to VI,when
OVERRIDE_DT_EN[31] = '1'.
- If cfg_vc15_dt_override_en = 0, then Color Parser use the DT form PH
- NVCSI_STREAM_5_PPFSM_TIMEOUT_CTRL_0
- Offset: 0xe064
- Byte Offset: 0x38190
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x7fffffff (0b0111,1111,1111,1111,1111,1111,1111,1111)
- Bit
- Reset
- Description
- DISABLE
cfg_timeout_en:
- Enable Timeout counter for the PP FSM

