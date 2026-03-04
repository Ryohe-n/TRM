# 31 :1 0x7fffffff EVENT_DUR_THRESHOLD:

- An interrupt is triggered when TOTAL_EVENT_DUR >=
EVENT_DUR_THRESHOLD.
- To deal without counter rollovers, EVENT_DUR_THRESHOLD is
treated as always being within -2^(bitwidth-1) to +2^(bitwidth-1) of TOTAL_EVENT_DUR

- Thermal Registers
- Bit
- Reset
- Description
0x0 LAST_MSB:
- Software should write the MSB of TOTAL_EVENT_DUR to this
register after every read. This enables OVERFLOW to detect overflows
- SOC_THERM_THROTTLECTL_THROTTLE_STATUS_0
- Offset: 0x5000
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000XXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

