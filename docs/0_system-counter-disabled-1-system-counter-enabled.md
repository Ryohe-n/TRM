# 0 : System counter disabled 1: System counter enabled

- When this bit changes from '0' to '1', the
master TSC is loaded with the CNTCVx registers value, and starts incrementing from that value. Slave
- TSC may also start counting depending on
- STSCCR.DIS, a field in a TSC implementation
register, see artsc.h
- When this bit is '0', master and slave TSC do
not count and maintain their value. 0 = DISABLE 1 = ENABLE
- TSC_FSI_SYSCTR0_CNTSR_0
- Counter Status Register
- Offset: 0x4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,xx0x)
- Bit
- Reset
- Description
0x0 FCACK:
- Frequency change acknowledge
- Always 0 as only one frequency is exposed to the Arm architectural
registers. 0x0 HDBG:
- Indicates whether the counter is halted because the Halt-on-Debug
signal is asserted: 0: Counter is not halted. 1: Counter is halted. 0 = DISABLE 1 = ENABLE
- TSC_FSI_SYSCTR0_CNTCV0_0
Counter Count Value[31:0] Register.
- Offset: 0x8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- Time Stamp Counter System Control Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

