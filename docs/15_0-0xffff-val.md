# 15 :0 0xffff VAL:

- Timer is loaded with this value at reload. Note: This value should NOT
be programmed to '0'.
- The timer operates with regard to 1µs pulse synchronous to APB
clock. So overall timer period is VALUE*1µs
- FSI_HSM_TIMER_0
- Offset: 0x804
- Read/Write: RO

- HSM Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000ffff (0bxxxx,xxxx,xxxx,xxx0,1111,1111,1111,1111)
- Bit
- Reset
- Description
0x0 COUNT_EN:
- Count enable status of the timer

