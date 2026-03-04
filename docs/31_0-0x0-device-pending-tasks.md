# 31 :0 0x0 DEVICE_PENDING_TASKS:

- Device Pending Tasks
- Bit n of this register is set if and only if QUEUED_TASK_PARAMS
(CMD44) and
- QUEUED_TASK_ADDRESS (CMD45) were sent for this specific task and
if this task has not been executed yet. CQE shall set this bit after receiving a successful response for CMD45.
- CQE shall clear this bit after
the task has completed execution.
- Software needs to read this register in the task-discard procedure,
when the controller is halted, to determine if the task is queued in the device. If the task is queued, the driver sends a CMDQ_TASK_MGMT (CMD48) to the device ordering it to discard the task. Then software clears the task in the CQE. Only then the software orders CQE to resume its operation using CQCTL register.
- SDMMCAB_CQE_CQTCLR_0
- Task Clear
This register is used for removing an outstanding task in the CQE. The register should be used only when CQE is in Halt state.
- Offset: 0xf038
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- SDMMCAB Registers
- Bit
- Reset
- Description

