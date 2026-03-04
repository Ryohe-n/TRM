# 31 :0 0x3b9aca00 N_SEC:

- Second counter will be incremented for every N_SEC
nanoseconds.

- Audio Miscellaneous (AMISC) Control Registers
- AMISC_APE_TSC_CTRL_3_0
- Offset: 0xcc
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x00000000 (0b0xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 ENABLE:
- Enable signals for clock synchronization.Loads all initialization values on 0
to 1. 0x0 COPY:
- Copy value of EAVB timestamps to APE timestamps. Clears FRAC and to
0.,auto clear bit 0x0 RST:
- When written 1 to this field will reset the APE timestamping counter
logic,auto clear bit 0x0 TRIGGER:
- When written 1 to this field will trigger the snapshot capture for both
- EAVB/APE timestamps,auto clear bit
- AMISC_APE_RT_TSC_NS_0
- Offset: 0xd0
- Read/Write: RO
- Parity Protection: N
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

