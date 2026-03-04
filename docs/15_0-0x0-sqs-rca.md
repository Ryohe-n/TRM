# 15 :0 0x0 SQS_RCA:

- Send Queue Status RCA
- This field provides CQE with the contents of the 16-bit RCA field in
- SEND_QUEUE_ STATUS (CMD13)
command argument. SW should program this. CQE shall copy this field to bits 31:16 of the argument when transmitting SEND_ QUEUE_STATUS (CMD13) command.
- SDMMCAB_CQE_CQCRDCT_0
- Command Response for Direct-Command Task
This register is used for passing the response of a DCMD task to software.

- SDMMCAB Registers
- Offset: 0xf048
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

