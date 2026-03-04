# 5 :0 0x0 RESP_ERR_CMD_IDX:

- Response Mode Error Command Index
- This field indicates the index of the command which was executed on
the command line when an error occurred.
- The field is updated if a command transaction is in progress when an
error is detected by CQE, or indicated by eMMC controller.
- SDMMCAB_CQE_CQCRI_0
- Command Response Index
This register stores the index of the last received command response.
- Offset: 0xf058
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description

