# 31 :1 0x1 NUM_ERR: Number of errors connected to this collator. This is passed as a build time option to the plugin. 5:0 0x1 NUM_ERR_SLICES: Number of error slices supported by this error collator, does not include the GlobalSpace and is derived by ceil (NUM_ERR/32). Software shall first read this register to determine the number of slices and read the required number of Error_Status registers.

- FSI_HSM_ERROR_COLLATOR_SWRESET_0
- Offset: 0x1004
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bi
t
- Res
et
- Description
0x0 SWRST: 1'b1: Issue a Software reset to the Error Collator. This will reset all the registers (Except SCR), counters and logic of the Error Collator. Software can use this bit to flush errors logged into the error collator for example, after Boot, SC7 exit. 1'b0: Do nothing, reset value. This bit is auto-cleared.
- FSI_HSM_ERROR_COLLATOR_MISSIONERR_TYPE_0
- Offset: 0x1008
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0101)

- HSM Registers
- Bi
t
- Res
et
- Description

