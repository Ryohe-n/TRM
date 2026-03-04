# 31 :0 0x0 TASK_DESCR_LIST_BASE_UPPER_ADDR:

- Task Descriptor List Base Upper Address (TDLBA)
- This register stores the MSB bits (bits 63:32) of the byte address of
the head of the Task Descriptor List in system memory.
- The size of the task descriptor list is 32 * (Task Descriptor size +
- Transfer Descriptor size)
as configured by Host driver. This register is reserved when using 32-bit addressing mode.
- SDMMCAB_CQE_CQTDBR_0
- Command Queuing Task Doorbell
Using this register, software triggers CQE to process a new task.
- Offset: 0xf028
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- SDMMCAB Registers
- Bit
- Reset
- Description

