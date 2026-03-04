# 1 = Task descriptor size is 128 bits 0 = Task descriptor size is 64 bits


- SDMMCAB Registers
- Bit
- Reset
- Description
0x0 CQ_EN:
- Command Queuing Enable
- Software shall write '1' this bit when in order to enable command queueing
mode (i.e. enable CQE).
- When this bit is 0, CQE is disabled and software controls the eMMC bus
using the legacy eMMC host controller.
- Before software writes '1' to this bit, software shall verify that the eMMC
host controller is in idle state and there are no commands or data transfers ongoing.
- When software wants to exit command queueing mode, it shall clear all
previous tasks if such exist before setting this bit to 0.
- SDMMCAB_CQE_CQCTL_0
- Command Queuing Control
This register controls CQE behavior affecting the general operation of command queueing module or operation of multiple tasks in the same time.
- Offset: 0xf00c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 CLR_ALL_TASKS:
- Clear All Tasks
- Software shall write '1' this bit when it wants to clear all the tasks sent to
the device. This bit can only be written when CQE is in halt state (i.e. Halt bit is 1).
- When software writes 1, the value of the register is updated to '1', and CQE
shall reset CQTDBR register and all other context information for all unfinished tasks. Then CQE will clear this bit.
- Software should poll on this bit until it is set to back 0 and may then
resume normal operation, by clearing the Halt bit. CQE does not communicate to the device that the tasks were cleared. It is softwares responsibility to order the device to discard the tasks in its queue using CMDQ_TASK_MGMT command. Writing '0' to this register shall have no effect.

- SDMMCAB Registers
- Bit
- Reset
- Description
0x0 HALT:
- Halt
- Host software shall write '1' to the bit when it wants to acquire software
control over the eMMC bus and disable CQE from issuing commands on the bus.
- For example, issuing a Discard Task command (CMDQ_TASK_MGMT)
- When software writes '1', CQE shall complete the ongoing task if such a
task is in progress.
- Once the task is completed and CQE is in idle state, CQE shall not issue
new commands and shall indicate so to software by setting this bit to 1.
- Software may poll on this bit until it is set to 1, and may only then send
commands on the eMMC bus.
- In order to exit halt state (i.e. resume CQE activity), software shall clear this
bit (write '0'). Writing '0' when the value is already '0' shall have no effect.
- SDMMCAB_CQE_CQIS_0
- Command Queuing Interrupt Status
This register indicates pending interrupts that require service. Each bit in this registers is asserted in response a specific event, only if the respective bit is set in CQISTE register.
- Offset: 0xf010
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 TASK_CLR_INTR:
- Task Cleared (TCL)
- This status bit is asserted (if CQISTE.TCL=1) when a task clear operation
is completed by
- CQE. The completed task clear operation is either an individual task clear
(CQTCLR) or clearing of all tasks (CQCTL). 0x0 RESP_ERR_DETECT_INTR:
- Response Error Detected Interrupt (RED)
- This status bit is asserted (if CQISTE.RED=1) when a response is received
with an error bit set in the device status field. The contents of the device status field are listed in Section 6.13 of eMMC5.1 spec.
- Software uses CQRMEM register to configure which device status bit
fields may trigger an interrupt, and which are masked.

- SDMMCAB Registers
- Bit
- Reset
- Description
0x0 TASK_COMPLETE_INTR:
- Task Complete Interrupt (TCC)
- This status bit is asserted (if CQISTE.TCC=1) when at least one of the
following two conditions are met: (1) A task is completed and the INT bit is set in its Task Descriptor (2) Interrupt caused by Interrupt Coalescing logic (see Section C.4.9) 0x0 HALT_COMPLETE_INTR:
- Halt Complete Interrupt (HAC)
- This status bit is asserted (if CQISTE.HAC=1) when halt bit in CQCTL
register transitions from 0 to 1 indicating that host controller has completed its current ongoing task and has entered halt state.
- SDMMCAB_CQE_CQISTE_0
- Command Queuing Interrupt Status Enable
This register enables and disables the reporting of the corresponding interrupt to host software in CQIS register. When a bit is set ('1') and the corresponding interrupt condition is active, then the bit is CQIS is asserted. Interrupt sources that are disabled ('0') are not indicated in the CQIS register. This register is bit-index matched to CQIS register.
- Offset: 0xf014
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 TASK_CLR_INTR_STATUS_EN:
- Task Cleared Status Enable (TCL)

