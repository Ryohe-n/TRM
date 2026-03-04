# 31 :0 0x0 TASK_CLEAR:

- Command Queuing Task Clear
- Writing 1 to bit n of this register orders CQE to clear a task which
software has previously issued.
- This bit can only be written when CQE is in Halt state as indicated in
CQCFG register Halt bit.
- When software writes '1' to a bit in this register, CQE updates the value
to '1', and starts clearing the data structures related to the task. CQE clears the bit fields (sets a value of 0) in CQTCLR and in CQTDBR once clear operation is complete.
- Software should poll on the CQTCLR until it is cleared to verify clear
operation was complete.
- Writing to this register only clears the task in the CQE and does not
have impact on the device.
- In order to discard the task in the device, host software shall send
CMDQ_TASK _MGMT while CQE is still in Halt state.
- Host driver is not allowed to use this register to clear multiple tasks at
the same time. Clearing multiple tasks can be done using CQCTL register. Writing 0 to a register bit shall have no impact.
- SDMMCAB_CQE_CQSSC1_0
- Send Status Configuration 1
The register controls the when SEND_QUEUE_STATUS commands are sent.
- Offset: 0xf040
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00011000 (0bxxxx,xxxx,xxxx,0001,0001,0000,0000,0000)
- Bit
- Reset
- Description

