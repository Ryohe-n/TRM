# 1 :0 0x0 ATT0_SWID: 0 = INIT

- NV_PVIC_TFBIF_REGIONCFG_0
- Offset: 0x2048
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,0xxx,0xxx,0xxx,0xxx,0xxx,0xxx,0xxx)
- Bit
- Reset
- Description
0x0 T7_VPR: 0 = INIT 0x0 T6_VPR: 0 = INIT 0x0 T5_VPR: 0 = INIT 0x0 T4_VPR: 0 = INIT 0x0 T3_VPR: 0 = INIT 0x0 T2_VPR: 0 = INIT 0x0 T1_VPR: 0 = INIT 0x0 T0_VPR: 0 = INIT
- NV_PVIC_TFBIF_ACTMON_ACTIVE_MASK_0
- Offset: 0x204c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000006 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0110)

- VIC Registers
- Bit
- Reset
- Description
0x0 ACTIVE: 0 = FALSE 0 = INIT 1 = TRUE 0x1 DELAYED_MC: 0 = FALSE 1 = INIT 1 = TRUE 0x1 STALLED_MC: 0 = FALSE 1 = INIT 1 = TRUE 0x0 STARVED_MC: 0 = FALSE 0 = INIT 1 = TRUE
- NV_PVIC_TFBIF_ACTMON_ACTIVE_BORPS_0
- Offset: 0x2050
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000083 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,1000,0011)
- Bit
- Reset
- Description
0x1 ACTIVE_OPERATION: 0 = OR 1 = AND 1 = INIT 0x0 ACTIVE_POLARITY: 0 = INIT 0 = POSITIVE 1 = NEGATIVE 0x0 DELAYED_MC_OPERATION: 0 = INIT 0 = OR 1 = AND 0x0 DELAYED_MC_POLARITY: 0 = INIT 0 = POSITIVE 1 = NEGATIVE 0x0 STALLED_MC_OPERATION: 0 = INIT 0 = OR 1 = AND

- VIC Registers
- Bit
- Reset
- Description
0x0 STALLED_MC_POLARITY: 0 = INIT 0 = POSITIVE 1 = NEGATIVE 0x1 STARVED_MC_OPERATION: 0 = OR 1 = AND 1 = INIT 0x1 STARVED_MC_POLARITY: 0 = POSITIVE 1 = INIT 1 = NEGATIVE
- NV_PVIC_TFBIF_ACTMON_ACTIVE_WEIGHT_0
- Offset: 0x2054
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)
- Bit
- Reset
- Description

