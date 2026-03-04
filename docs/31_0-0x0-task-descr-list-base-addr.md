# 31 :0 0x0 TASK_DESCR_LIST_BASE_ADDR:

- Task Descriptor List Base Address (TDLBA)
- This register stores the LSB bits (bits 31:0) of the byte address of the
head of the Task Descriptor List in system memory.
- The size of the task descriptor list is 32 * (Task Descriptor size +
- Transfer Descriptor size)
as configured by Host driver.
- This address shall be set on 1 KByte boundary: The lower 10 bits of this
register shall be set to 0 by software and shall be ignored by CQE.

- SDMMCAB Registers
- SDMMCAB_CQE_CQTDLBAU_0
- Command Queuing Task Descriptor List Base Address Upper 32 Bits
This register is used for configuring the upper 32 bits of the byte address of the head of the Task Descriptor List in the host memory.
- Offset: 0xf024
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

