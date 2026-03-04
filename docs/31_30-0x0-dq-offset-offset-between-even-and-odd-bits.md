# 31 :30 0x0 DQ_OFFSET: offset between even and odd bits 0x0 FIRST_PASS_WINDOW_SEL:

- This enables the selection of the first pass window by the HW tuning
engine. First pass window select feature is enabled only when STEP_SIZE is set to 0.

- SDMMCA Registers
- Bit
- Reset
- Description
0x0 FALSE_PASS_MASK:
- This enables masking of the false pass windows from the tap value
selection. False pass mask feature is enabled only when STEP_SIZE is set to 0. 15:8 0x4 MIN_PASS_WINDOW_WIDTH:
- This is used to mask false passes.Tuning engine considers PASS
windows of size > MIN_WIDTH for tap value calculation. Allowed range is 1<= MIN_PASS_WINDOW_WIDTH <=4. 6:4 0x0 STEP_SIZE_SDR104_HS200: tap_val is incremented by step_size for every tuning iteration - used in
- SDR104/HS200/HS400 mode
increment = 2^step_size; step_size should be in range 0-4. Others are
- RSVD

