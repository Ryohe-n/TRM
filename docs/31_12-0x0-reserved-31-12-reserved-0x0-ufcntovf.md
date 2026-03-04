# 31 :12 0x0 Reserved_31_12: Reserved. 0x0 UFCNTOVF:

- Overflow Bit for Underflow Packet Counter This bit is set every time the Tx
queue Underflow Packet Counter field overflows, that is, it has crossed the maximum count. In such a scenario, the overflow packet counter is reset to all-zeros and this bit indicates that the rollover happened. Access restriction applies. Clears on read. Self-set to 1 on internal event.

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description

