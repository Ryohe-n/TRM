# 6 :0 0x0 WAKE_INDEX: for TSC snapping shot, SW need to first program this register to indicate which wake event is selected to trigger the TSC snap.

- After programming this register, the TSC_SNAP_VALUE will be reset to 0,
and SW can continue to read TSC_SNAP_VALUE register, if the read back data is non-zero, it means that specific wake event has happened.
- WAKE_AOWAKE_TSC_SNAP_VALUE_0
- Offset: 0x4e8

- PMC Wake Registers
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

