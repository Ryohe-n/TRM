# 31 :0 0x0 STATUS: wake status read back for wake event 95-64, this register indicates status post wake masking

- WAKE_AOWAKE_LATCH_SW_0
- One SCR for the following five registers
- Offset: 0x498
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: WAKE_SCR_SW_CNTRL_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- FALSE
LATCH_SWEN:
- Enables latching wakeup events .Status latching stops on transition
from 1 to 0(sequence - set to 1,set to 0) 0 = FALSE 1 = TRUE
- WAKE_AOWAKE_SW_STATUS_W_0
- Offset: 0x49c
- Read/Write: R/W

- PMC Wake Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: WAKE_SCR_SW_CNTRL_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- FALSE
CLEAR: Raw wake status clear signal. writting this regsiter with 1 (TRUE) will clear all the sw status for all the Wakes to be 0 (UNSET) 0 = FALSE 1 = TRUE
- WAKE_AOWAKE_SW_STATUS_31_0_0
- Offset: 0x4a0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

