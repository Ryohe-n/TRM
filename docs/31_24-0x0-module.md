# 31 :24 0x0 MODULE:

- Identifies the specific timestamp engine as the source for this event. The
value must be unique across the SoC. The value is a constant, i.e., it remains non zero when the FIFO is empty. 23:16 0x0 SLICE:
- Indicate the slice for the captured event at the FIFO head, 0b if the FIFO
is empty. Not all bits physically present depending on number of slices present. 15:0 0x0 TAG:
- Always 0, no tag defined
- GTE_INTR_CTLR_TECCV_0
- TECCV, timestamp engine current captured value register
- Offset: 0x10
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: GTE_INTR_CTLR_SCR_TESCR_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

