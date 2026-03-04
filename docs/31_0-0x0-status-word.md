# 31 :0 0x0 STATUS_WORD:

- Each bit indicates the status of each tuning iteration, when tap value is
updated by HW (TAP_VAL_UPDATED_BY_HW=1); 0-Tuning pattern not matched 1-tuning pattern matched
- We have a total of 256 tap values. SW can issue a max.of 256 tuning
commands for debug.
- SW needs to read this register eight times to get status of all 256
iterations by changing tuning_word_sel status[255:0] is left shifted and loaded into this register every time when tuning_word_sel is changed status_word[31:0] = status[255:0] >> ( tuning_word_sel * 32)
- SDMMCA_VENDOR_TUNING_STATUS1_0
- Vendor Tuning Status1 register

- SDMMCA Registers
- Offset: 0x1cc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

