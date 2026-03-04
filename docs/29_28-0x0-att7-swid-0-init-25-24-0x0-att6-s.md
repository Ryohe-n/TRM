# 29 :28 0x0 ATT7_SWID: 0 = INIT 25:24 0x0 ATT6_SWID: 0 = INIT 21:20 0x0 ATT5_SWID: 0 = INIT 17:16 0x0 ATT4_SWID: 0 = INIT 13:12 0x0 ATT3_SWID: 0 = INIT 9:8 0x0 ATT2_SWID: 0 = INIT 5:4 0x0 ATT1_SWID: 0 = INIT 1:0 0x0 ATT0_SWID: 0 = INIT

- NV_CVIC_TFBIF_REGIONCFG_0

- Video Image Compositor (VIC) Registers
- Offset: 0x41200
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,0xxx,0xxx,0xxx,0xxx,0xxx,0xxx,0xxx)
- Bit
- Reset
- Description
0x0 T7_VPR: 0 = INIT 0x0 T6_VPR: 0 = INIT 0x0 T5_VPR: 0 = INIT 0x0 T4_VPR: 0 = INIT 0x0 T3_VPR: 0 = INIT 0x0 T2_VPR: 0 = INIT 0x0 T1_VPR: 0 = INIT 0x0 T0_VPR: 0 = INIT
- NV_CVIC_TFBIF_ACTMON_ACTIVE_MASK_0
- Offset: 0x41300
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000006 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0110)
- Bit
- Reset
- Description
0x0 ACTIVE: 0 = FALSE 0 = INIT 1 = TRUE 0x1 DELAYED_MC: 0 = FALSE 1 = INIT 1 = TRUE

- Video Image Compositor (VIC) Registers
- Bit
- Reset
- Description
0x1 STALLED_MC: 0 = FALSE 1 = INIT 1 = TRUE 0x0 STARVED_MC: 0 = FALSE 0 = INIT 1 = TRUE
- NV_CVIC_TFBIF_ACTMON_ACTIVE_BORPS_0
- Offset: 0x41400
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000083 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,1000,0011)
- Bit
- Reset
- Description
0x1 ACTIVE_OPERATION: 0 = OR 1 = AND 1 = INIT 0x0 ACTIVE_POLARITY: 0 = INIT 0 = POSITIVE 1 = NEGATIVE 0x0 DELAYED_MC_OPERATION: 0 = INIT 0 = OR 1 = AND 0x0 DELAYED_MC_POLARITY: 0 = INIT 0 = POSITIVE 1 = NEGATIVE 0x0 STALLED_MC_OPERATION: 0 = INIT 0 = OR 1 = AND 0x0 STALLED_MC_POLARITY: 0 = INIT 0 = POSITIVE 1 = NEGATIVE 0x1 STARVED_MC_OPERATION: 0 = OR 1 = AND 1 = INIT

- Video Image Compositor (VIC) Registers
- Bit
- Reset
- Description
0x1 STARVED_MC_POLARITY: 0 = POSITIVE 1 = INIT 1 = NEGATIVE
- NV_CVIC_TFBIF_ACTMON_ACTIVE_WEIGHT_0
- Offset: 0x41500
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)
- Bit
- Reset
- Description

