# 31 :0 0x0 TASK_DOORBELL:

- Command Queuing Task Doorbell
- Software shall configure TDLBA and TDLBAU, and enable CQE in CQCFG
before using this register.
- Writing 1 to bit n of this register triggers CQE to start processing the
task encoded in slot n of the TDL.
- CQE always processes tasks in-order according to the order submitted
to the list by CQTDBR write transactions.
- CQE processes Data Transfer tasks by reading the Task Descriptor and
sending QUEUED_TASK_PARAMS (CMD44) and QUEUED_TASK_ADDRESS (CMD45) commands to the device.
- CQE processes DCMD tasks (in slot 31, when enabled) by reading the
- Task Descriptor, and generating the command
encoded by its index and argument.
- The corresponding bit is cleared to '0' by CQE in one of the following
events: (a) When a task execution is completed (with success or error) (b) The task is cleared using CQTCLR register (c) All tasks are cleared using CQCTL register (d) CQE is disabled using CQCFG register
- Software may initiate multiple tasks at the same time (batch
submission) by writing 1 to multiple bits of this register in the same transaction. In the case of batch submission:
- CQE shall process the tasks in order of the task index, starting with the
lowest index.
- If one or more tasks in the batch are marked with QBR, the ordering of
execution will be based on said processing order.
- Writing 0 by software shall have no impact on the hardware, and will not
change the value of the register bit.
- SDMMCAB_CQE_CQTCN_0
- Task Completion Notification
This register is used by CQE to notify software about completed tasks.
- Offset: 0xf02c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- SDMMCAB Registers
- Bit
- Reset
- Description

