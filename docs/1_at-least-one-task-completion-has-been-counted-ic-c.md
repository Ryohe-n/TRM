# 1 = At least one task completion has been counted (IC counter >0) 0 = No task completions have occurred since last counter reset (IC counter =0)

- RW
0x0 INTR_COAL_CNTR_TIMER_RST: Counter and Timer Reset(ICCTR):
- When host driver writes '1', the interrupt coalescing timer
and counter are reset
- RW
0x0 INTR_COAL_CNTR_TH_WEN:
- Interrupt Coalescing Counter Threshold Write Enable
(ICCTHWEN):
- When software writes '1', the value ICCTH is updated with the
contents written at the same cycle. When software writes '0', the value in ICCTH is not updated.
- NOTE: Write operations to ICCTH are only allowed when the
task queue is empty. 12:8
- RW
0x0 INTR_COAL_CNTR_THRESHOLD: Interrupt Coalescing Counter Threshold (ICCTH):
- Software uses this field to configure the number of task
completions (only tasks with INT=0 in the Task
- Descriptor) which are required in order to generate an
interrupt.
- Counter Operation: As data transfer tasks with INT=0
complete, they are counted by CQE.
- The counter is reset by software during the interrupt service
routine.
- The counter stops counting when it reaches the value
configured in ICCTH.
- The maximum allowed value is 31
- NOTE: When ICCTH is 0, task completions are not counted,
and counting-based interrupts are not generated.
- In order to write to this field, the ICCTHWEN bit must be set
at the same write operation.
- RW
0x0 INTR_COAL_TIMEOUT_VAL_WEN:
- Interrupt Coalescing Timeout Value Write Enable
(ICTOVALWEN):
- When software writes '1', the value ICTOVAL is updated with
the contents written at the same cycle. When software writes '0', the value in ICTOVAL is not updated.
- NOTE: Write operations to ICTOVAL are only allowed when the
task queue is empty.

- SDMMCAB Registers
- Bit
R/W
- Reset
- Description

