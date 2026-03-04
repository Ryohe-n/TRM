# 31 :0 0x0 STATUS: mask status read back for wake event 95-64

- WAKE_AOWAKE_STATUS_W_0

- PMC Wake Registers
- One SCR per wake event
This is an array of 96 identical register entries; the register fields below apply to each entry. Full register list is: WAKE_AOWAKE_STATUS_W_<i>, among which <i> belongs to <0..95>.
- Offset: 0x30c,..,0x488
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: WAKE_SCR_EVENT_CNTRL_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- FALSE
CLEAR: wake status clear signal. writting this regsiter with 1(TRUE) will clear the wake status to be 0(UNSET) 0 = FALSE 1 = TRUE
- WAKE_AOWAKE_STATUS_R_31_0_0
- Offset: 0x48c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

