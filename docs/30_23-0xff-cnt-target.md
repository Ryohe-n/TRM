# 30 :23 0xff CNT_TARGET:

- Count target minus 1 before signal to actmon. Actmon will be signalled
when the counter = CNT_TARGET and another ~standbywfi cycle is detected (i.e. CNT_TARGET+1 events).
- AMISC_MC_STATS_READ_0
This is an array of 2 identical register entries; the register fields below apply to each entry. Full register list is: AMISC_MC_STATS_READ_<i>, where <i> = 0, 1.
- Note: the register with (<i> = 0) is for ACAST,
the register with (<i> = 1) is for ADAST.
- Offset: 0x60,0x64
- Read/Write: RO
- Parity Protection: N
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

