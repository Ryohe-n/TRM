# 5 :0 0x1 NUM_ERR_SLICES:

- Number of error slices supported by this error collator, does not
include the GlobalSpace and is derived by ceil (NUM_ERR/32). SW shall first read this register to determine the number of slices and read the required number of Error_Status registers .
- PADCTL_G9_EC_SWRESET_0
- Offset: 0x404
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: PADCTL_G9_SCR_EC_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 SWRST: 1'b1 : Issue a SW reset to the Error Collator. This will reset all the registers(Except SCR), counters and logic of the Error Collator. SW can use this bit to flush errors logged into the error collator for ex, after Boot, SC7/8 exit. 1'b0 : Do nothing, reset value. This bit is auto-cleared.
- PADCTL_G9_EC_MISSIONERR_TYPE_0
- Offset: 0x408
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PADCTL_G9_SCR_EC_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0101)

- G9 PAD Control Registers
- Bit
- Reset
- Description

