# 15 :8 0x1 DEBOUNCE_VAL:

- This field is used to define the de-bounce value for the de-bounce
filter. This value is ignored if DEBOUNCE_EN is not set. This value translates to number of 1KHz or 32KHz cycles depending on the type of CLK_DEBOUCE INST.
- FALSE
COAL_EN:
- This field is used enable/disable coalescing feature for a given wake
event.
- SW is expected to always enable coalescing, once COAL_GRP_SEL and
COAL_GRP0, COAL_GRP1 are programmed. 0 = FALSE 1 = TRUE
- GROUP0
COAL_GRP_SEL: wake coalescing group selection. 0 = GROUP0 1 = GROUP1

- PMC Wake Registers
- Bit
- Reset
- Description
- HIGH
LEVEL: wake level. If input wake level matches with this register, input wake is forwarded to wake processing logic(signaling). First filter on the input wake in the wake signalling module 0 = LOW 1 = HIGH
- FALSE
DEBOUNCE_EN: debounce filter disable/enable. SW is expected to enable this only after programming DEBOUCE_VAL.Fourth filter on the input wake in the wake signaling module 0 = FALSE 1 = TRUE
- FALSE
SR_CAPTURE_EN: sr latch capture disable/enable. Third filter on the input wake in the wake signaling. 0 = FALSE 1 = TRUE
- FALSE
DELAY_FILTER_EN: delay filter disable/enable. Second filter on the input wake in the wake signalling module 0 = FALSE 1 = TRUE
- WAKE_AOWAKE_MASK_W_0
- One SCR per wake event
This is an array of 96 identical register entries; the register fields below apply to each entry. Full register list is: WAKE_AOWAKE_MASK_W_<i>, among which <i> belongs to <0..95>.
- Offset: 0x180,..,0x2fc
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: WAKE_SCR_EVENT_CNTRL_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- MASK
MASK: mask control for wake event. SW is expected to umask required wakes before SC7 entry. 0 = MASK 1 = UNMASK

- PMC Wake Registers
- WAKE_AOWAKE_MASK_R_31_0_0
- Offset: 0x300
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

