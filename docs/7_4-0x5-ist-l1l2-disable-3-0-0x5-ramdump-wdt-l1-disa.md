# 7 :4 0x5 IST_L1L2_DISABLE: 3:0 0x5 RAMDUMP_WDT_L1_DISABLE:

- PMC_MISC_DEBUG_AUTHENTICATION_SHADOW_0

- PMC Miscellaneous Registers
- Offset: 0x1c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_MISC_SCR_DEBUG_AUTHENTICATION_SCR_0
- Reset: 0x0000000d (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,11x1)
- Bit
- Reset
- Description
0x1
- SPIDEN
0x1
- SPNIDEN
0x1
- JTAG_ENABLE
- PMC_MISC_PSC_PREPROD_DBG_SOFT_EN_LOCK_0
- Offset: 0x20
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_MISC_SCR_PSC_PREPROD_DBG_SOFT_EN_LOCK_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 STICKY_LOCK: Stick to 1.
- When set, makes PMC_MISC_PSC_PREPROD_DBG_SOFT_EN_0 register
- READ-ONLY/WRITE-DISABLE (Though WRITE-DISABLEd, no write error is
generated).
- PMC_MISC_PSC_PREPROD_DBG_SOFT_EN_0
- Offset: 0x24
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_MISC_SCR_PSC_PREPROD_DBG_SOFT_EN_SCR_0
- Reset: 0xc0deb471 (0b1100,0000,1101,1110,1011,0100,0111,0001)
- Bit
- Reset
- Description

