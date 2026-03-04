# 31 :30 0x0 CODE: code of operation for all set bits 0 = IDLE 1 = DPD_OFF 2 = DPD_ON


- PMC IMPL Registers
- Bit
- Reset
- Description
0x0 HDMI_DP0: puts HDMI_DP0 PAD(s) in/out of Depp Power Down (DPD) mode 0 = OFF 1 = ON
- PMC_IMPL_IO_DISP_DPD_STATUS_0
- Offset: 0xe0d4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_IO_DISP_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 HDMI_DP0:
- On - HDMI_DP0 PAD(s) is in Deep Power Down mode, Off - HDMI_DP0
- PAD(s) is out of Deep Power Down mode

