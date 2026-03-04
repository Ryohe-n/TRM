# 15 :0 0x0 RO_COUNT_STATUS:

- Registers RO counter output for debug/characterization
#### 4.2.4.2 PMC Wake Registers
- WAKE_AOWAKE_CNTRL_0
To optimize wake engine HW, all the signaling filters are not observed on all wake events in HW. Depending on the wake event behavior, relevant filters are implemented in HW. SW should enable these filters as per the above spec. This is an array of 96 identical register entries; the register fields below apply to each entry. Full register list is: WAKE_AOWAKE_CNTRL_<i>, among which <i> belongs to <0..95>.
- Offset: 0x0,..,0x17c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: WAKE_SCR_EVENT_CNTRL_SCR_0
- Reset: 0x00000108 (0bxxxx,xxxx,xxxx,xxxx,0000,0001,x00x,1000)
- Bit
- Reset
- Description

