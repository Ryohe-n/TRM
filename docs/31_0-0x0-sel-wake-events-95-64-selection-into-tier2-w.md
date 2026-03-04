# 31 :0 0x0 SEL: wake events(95-64) selection into tier2 wake routing. 0 means corresponding wake event not enabled for tier2 wake 1 means corresponding wake event is enabled for tier2 wake

- WAKE_AOWAKE_SW_WAKE_TIER0_TRIGGER_0
- One SCR for the following register
- Offset: 0x4d8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: WAKE_SCR_SW_CNTRL_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- FALSE
ENABLE: tier0 wake trigger by SW. SW can write this register with TRUE to trigger a wake event 0 = FALSE 1 = TRUE
- WAKE_AOWAKE_COAL_GRP0_0
- One SCR for the following two registers
- Offset: 0x4dc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PMC Wake Registers
- SCR Protection: WAKE_SCR_COAL_SCR_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

