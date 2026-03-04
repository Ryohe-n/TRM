# 0 : for regular IST. 1: indicates IST eMMC controller selects the option to bypass eMMC device's internal cache and write the data directly to non-volatile memory

- Offset: 0x10
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- IST Registers
- Bit
- Reset
- Description
0x0 force_prgm:
- When this bit is 1, we will select the option to bypass the eMMC device internal
cache and write the data directly to the non-volatile memory. This results in very slow write bandwidth so it should not be the default option. When this bit is 0 (default option), the data being written to the card will be written to the device internal cache and the device will periodically (and during shutdown sequence) save all the cache data to non-volatile memory. This is the recommended option to get fast write bandwidth.
- IST_INTERRUPT_MASK_ALWAYS_0_0
Interrupts can be masked/ignored using this registers by programming the corresponding mask to 1.
- Offset: 0x14
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

