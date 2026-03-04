# 5 :4 0x0 EDGE_SELECT:

- Select which edge is used in the locking mechanism, encoded as the edge
select for capture purposes. 0x0 SYNC_START_ENABLE:
- Starts the counter at the next edge of the reference source
0x0 INVERT_ADJUST_SIGN:
- For testing, invert the sign of the measured difference, making the loop
unstable 0x0 INT_ENABLE:
- Enable the generation of interrupt linked to the hardware lock operation, in
particular when losing lock 0x0 ENABLE:
- Enable the hardware lock mechanism, i.e., the dynamic adjustment of the
frequency and direction of adjust indications sent to the TSC reference clock generator.
- TSC_LOCKING_CONTROL_0
- Offset: 0x1ec
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TSC_SCR_TSCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 UPDATE_DIFF_DISABLE: Note that this also disturbs the hardware locking mechanism.
- As difference values are contained in single registers, the use of this bit is
generally not required but allow the atomic reading of a sequence of difference registers by software. 0x0 ALIGN:
- When set, and ALIGNED is 0, set the reference value equal to the TSC value
at a capture edge; this forces the measured difference to 0. Alignment can be done at any time, but normally only once at start.
- TSC_LOCKING_STATUS_0
- Offset: 0x1f0
- Read/Write: See table below
- Parity Protection: See table below
- Shadow: N
- SCR Protection: TSC_SCR_TSCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,x000)

- Time Stamp Counter Registers
- Bit
R/W
- Parity Protection
- Reset
- Description

