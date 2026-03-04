# 1 = CQIS.HAC will be set when its interrupt condition is active 0 = CQIS.HAC is disabled


- SDMMCAB Registers
- SDMMCAB_CQE_CQISGE_0
- Command Queuing Interrupt Signal Enable
This register enables and disables the generation of interrupts to host software. When a bit is set ('1') and the corresponding bit in CQIS is set, then an interrupt is generated. Interrupt sources that are disabled ('0') are still indicated in the CQIS register. This register is bit-index matched to CQIS register.
- Offset: 0xf018
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 TASK_CLR_INTR_SIGNAL_EN:
- Task Cleared Signal Enable (TCL)
- When set and CQIS.TCL is asserted, the CQE shall generate an interrupt
0x0 RESP_ERR_DETECT_INTR_SIGNAL_EN:
- Response Error Detected Signal Enable (TCC)
- When set and CQIS.RED is asserted, the CQE shall generate an interrupt
0x0 TASK_COMPLETE_INTR_SIGNAL_EN:
- Task Complete Signal Enable (TCC)
- When set and CQIS.TCC is asserted, the CQE shall generate an interrupt
0x0 HALT_COMPLETE_INTR_SIGNAL_EN:
- Halt Complete Signal Enable (HAC)
- When set and CQIS.HAC is asserted, the CQE shall generate an interrupt
- SDMMCAB_CQE_CQIC_0
- Interrupt Coalescing
This register controls the interrupt coalescing feature.
- Offset: 0xf01c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,xxxx,xxx0,xxx0,0xx0,0000,0000,0000)

- SDMMCAB Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 INTR_COAL_EN: Interrupt Coalescing Enable/Disable:
- When set to '0' by software, command responses are neither
counted nor timed.
- Interrupts are still triggered by completion of tasks with
INT=1 in the Task Descriptor.
- When set to '1', the interrupt coalescing mechanism is
enabled and coalesced interrupts are generated
- RO
0x0 INTR_COAL_STATUS: Interrupt Coalescing Status Bit (ICSB):
- This bit indicates to software whether any tasks (with INT=0)
have completed and counted towards interrupt coalescing (i.e., ICSB is set if and only if IC counter > 0).
- Bit Value Description

