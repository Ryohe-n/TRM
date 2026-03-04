# 7 :0 0x0 global_reg

- NVCSI_GLOBAL_TPG_CTRL_VC0_0
- Offset: 0x40
- Byte Offset: 0x100
- Read/Write: R/W
- Parity Protection: N

- NVCSI Global Registers
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000008 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,1000)
- Bit
- Reset
- Description
- ENABLE
PHASE_INC: If the is field is set, the initial phase will increase 512 by frame. 0 = DISABLE 1 = ENABLE
- DISABLE
AUTO_STOP:
- If the auto stop is set, this virtual channel will automaticly stop when
the frame count to the TPG_FN_VCx.MAX_FN. 0 = DISABLE 1 = ENABLE 1:0
- DIRECT
MODE:
- Pattern mode

