# 0 = DISABLE 1 = ENABLE 3:0 Y 0x0 0x1 K:

- The K value inserted in software triggered
synchronization messages; in other cases, the K value in the synchronization message is the currently active K value, with special attention at RefClk source change
- TSC_TSCDHCR_0
TSC Distribution Halt Configuration Register The register bits are selected to allow future extensions into up to 16 groups

- Time Stamp Counter Registers
- Offset: 0x118
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TSC_SCR_TSCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 STOP_CPU_TSC:
- Unconditionally stop the CPU terminal nodes
0x0 HDBG_CPU:
- Halt CPU terminal nodes in debug mode
- TSC_CLK_OVR_ON_0
- Offset: 0x11c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TSC_SCR_TSCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 CK32K:
- SLCG override bit

