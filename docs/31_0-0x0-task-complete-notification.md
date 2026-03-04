# 31 :0 0x0 TASK_COMPLETE_NOTIFICATION:

- Task Complete Notification
- CQE shall set bit n of this register (at the same time it clears bit n of
- CQTDBR) when a
task execution is completed (with success or error).
- When receiving interrupt for task completion, software may read this
register to know which tasks have finished. After reading this register, software may clear the relevant bit fields by writing 1 to the corresponding bits.
- SDMMCAB_CQE_CQDQS_0
- Device Queue Status
This register stores the most recent value of the device queue status.
- Offset: 0xf030
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

