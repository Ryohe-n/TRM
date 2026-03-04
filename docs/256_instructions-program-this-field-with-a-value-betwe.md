# 256 instructions. - Program this field with a value between 0 and

- Maximum Entries of Parser Instruction Table-1. Read the value after
programming this field. 15:12
- RW
0x0 FPE_RCH:
- Frame Preemption Residue Channel This field holds the Rx Channel
number to which the residual preemption frames must be forwarded.
- Preemption frames which pass RXP filtering, are routed based on
- Instruction Table. All other frames are treated as residual frames and
are routed to the channel number mentioned in this field. Channel-0 is used as a default Channel for express residual frames, so this field should not be programmed to a value 0.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 OKI_DME:
- Instruction's OK Index Dual Meaning Enable When this field is set to 1,
it indicates Instruction's OK Index field has dual meaning. It is used for specific purpose when SGF or PC is enabled. For more detail refer respective feature section. 10:8
- RO
0x0 Reserved_10_8:
- Reserved

