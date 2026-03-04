# 12 :6 0x2 0x1 MUL_M: implements a multiplier - M+1

- Final tap value is derived from best passing window
and calculated as follows.
- Final tap value = first_pass + ( (last_pass -
first_pass)*Q); where Q = percentage of pass window;default-75% Q = M+1/(2^N); N:1...7 M:should be in range [0:2^N-1]; 5:3 0x2 _NONE_ DIV_N: implements a divider - 2^N; max div is 2^7 =>128 2:0 0x0 _NONE_ TUNING_WORD_SEL:
- Selects desired word from 256-bit tuning status
bitmap status_word[31:0] = status[255:0] >> ( tuning_word_sel * 32)
- SDMMC_VENDOR_TUNING_CNTRL1_0
- Vendor Tuning Control1 register
- Different step size is required in SDR50 mode to cover two UI (100MHz => 2*10ns)
- With 70ps/tap trimmer resolution, we can cover almost 2UI using step_size=8 in SDR50 and
step_size=4 in SDR104. Tuning will be done in HS200 - SDR mode only.
- HS200 - tuning @200MHz - UHS_SEL should be SDR104 for executing tuning
Before initiating data transfers in HS400 mode, tuning procedure should be executed in HS200 mode with IO clock running @200MHz DQ_OFFSET: offset between even and odd bits. Td is per-tap delay in trimmer. When the DQ offset function is turned off (DQ_OFFSET[1:0]=00), there is no offset between ZI0~7. When the DQ offset function is turned on (DQ_OFFSET[1:0]=01, 10, 11), extra delays are added at the odd bits (DQ1, 3, 5,7). Thus, there is an offset between even bits and odd bits. DQ offset function is turned on during auto-tuning to avoid the window-merged issue and turned off during normal operation. 00 no offset 01 1*Td 10 2*Td 11 3*Td
- Offset: 0x1c4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000400 (0b00xx,xxxx,xxxx,xx00,0000,0100,x000,x000)

- SDMMC Registers
- Bit
- Reset
- Description

