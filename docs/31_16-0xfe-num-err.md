# 31 :16 0xfe NUM_ERR:

- Number of errors connected to this collator. This is passed as a build
time option to the plugin 5:0 0x8 NUM_ERR_SLICES:
- Number of error slices supported by this error collator, does not
include the GlobalSpace and is derived by ceil (NUM_ERR/32). SW shall first read this register to determine the number of slices and read the required number of Error_Status registers .
- RCE_FABRIC_ERR_COLLATOR_SWRESET_0
- Offset: 0x20004
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 SWRST: 1'b1 : Issue a SW reset to the Error Collator. This will reset all the registers(Except SCR), counters and logic of the Error Collator. SW can use this bit to flush errors logged into the error collator for ex, after Boot, SC7/8 exit. 1'b0 : Do nothing, reset value. This bit is auto-cleared.
- RCE_FABRIC_ERR_COLLATOR_MISSIONERR_TYPE_0
- Offset: 0x20008
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0101)
- Bit
- Reset
- Description

