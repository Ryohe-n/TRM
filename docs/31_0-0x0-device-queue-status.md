# 31 :0 0x0 DEVICE_QUEUE_STATUS:

- Device Queue Status
- Every time the Host controller receives a queue status register (QSR)
from the device, it updates this register with the response of status command, i.e. the device queue status.
- SDMMCAB_CQE_CQDPT_0
- Device Pending Tasks
This register indicates to software which tasks are queued in the device, awaiting execution.
- Offset: 0xf034
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- SDMMCAB Registers
- Bit
- Reset
- Description

