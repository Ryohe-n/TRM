# 31 :16 0xc NUM_ERR:

- Number of errors connected to this collator. This is passed as a build
time option to the plugin 5:0 0x1 NUM_ERR_SLICES:
- Number of error slices supported by this error collator, does not
include the GlobalSpace and is derived by CEIL (NUM_ERR/32). Software shall first read this register to determine the number of slices and read the required number of Error_Status registers .
- GPCDMA_ERRCOLLATOR_SWRESET_0
- Offset: 0xff04
- Read/Write: WO
- Parity Protection: N
- SCR Protection: EC_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 SWRST: 1'b1 : Issue a Software reset to the Error Collator. This will reset all the registers (Except SCR), counters and logic of the Error Collator. Software can use this bit to flush errors logged into the error collator for example, after Boot, SC7/8 exit. 1'b0 : Do nothing, reset value. This bit is auto-cleared.
- GPCDMA_ERRCOLLATOR_MISSIONERR_TYPE_0
- Offset: 0xff08
- Read/Write: RO
- Parity Protection: N

- GPC-DMA Registers
- SCR Protection: EC_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0101)
- Bit
- Reset
- Description

