# 31 :30 0x0 TARGET: 0 = INIT 0 = LOCAL_FB 1 = SYSMEM_COH 2 = SYSMEM_NONCOH 27:0 0x0 PTR: 0 = INIT

- NV_PVIC_THI_INT_STATUS_0
- Offset: 0x78
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 FALCON_INT: 0 = INIT 1 = CLEAR
- NV_PVIC_THI_INT_MASK_0
- Offset: 0x7c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
0x1 FALCON_INT: 1 = INIT

- VIC Registers
- NV_PVIC_THI_CONFIG0_0
- Offset: 0x80
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxx0)
- Bit
- Reset
- Description
0x0 IDLE_SYNCPT_INC_ENG: 0 = FALSE 1 = TRUE 0x0 RETURN_SYNCPT_ON_ERR: 0 = INIT
- NV_PVIC_THI_DBG_MISC_0
- Offset: 0x84
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000000X (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- Description
- RW
X THI_IDLE_EN: 0 = CLEAR 1 = SET
- RO
X THI_SYNCPT_PENDING_STATUS: 0 = CLEAR 1 = SET
- RO
X THI_IDLE_STATUS: // For checking status first enable the bit 3 in DBG_MISC register 0 = CLEAR 1 = SET
- RO
X CLIENT_IDLE_STATUS: 0 = CLEAR 1 = SET

- VIC Registers
- NV_PVIC_THI_SLCG_OVERRIDE_HIGH_A_0
- Offset: 0x88
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000000ff (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,1111,1111)
- Bit
- Reset
- Description

