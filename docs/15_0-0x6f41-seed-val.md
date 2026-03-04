# 15 :0 0x6f41 seed_val

- IST_GLOBAL_SHUTDOWN_COUNTER_0
ENABLE = 1: enables shut down once counter reaches to 0. ENABLE = 0: do not shut down (tip) even though global shutdown counter reached to 0. TRIGGER = 1: trigger (enable) global shut down COUNTER (down counter).

- IST Registers
- Offset: 0x70
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 trigger 0x0 enable
- IST_MODE_DELAY_0
ist_mode_delay value. By default its 50 cycles (of IST_CLK).
- Offset: 0x74
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000032 (0b0000,0000,0000,0000,0000,0000,0011,0010)
- Bit
- Reset
- Description

