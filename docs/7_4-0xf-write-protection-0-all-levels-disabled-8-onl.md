# 7 :4 0xf WRITE_PROTECTION: 0 = ALL_LEVELS_DISABLED 8 = ONLY_LEVEL3_ENABLED 15 = ALL_LEVELS_ENABLED 3:0 0xf READ_PROTECTION: 0 = ALL_LEVELS_DISABLED 8 = ONLY_LEVEL3_ENABLED 15 = ALL_LEVELS_ENABLED 15 = DEFAULT_PRIV_LEVEL

- NV_CVIC_FALCON_SCTL_0
- Offset: 0x9000
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000300X (0bxxxx,xxxx,xxxx,xxxx,x011,xx00,xx00,xxx0)
- Bit
R/W
- Reset
- Description
- RW
0x0 AUTH_EN: 0 = FALSE 1 = TRUE
- RW
0x1 STALLREQ_CLR_EN: 0 = FALSE 1 = TRUE
- RW
0x1 RESET_LVLM_EN: 0 = FALSE 1 = TRUE 9:8
- RW
0x0 DEBUG_PRIV_LEVEL: 0 = INIT 5:4
- RW
0x0 LSMODE_LEVEL: 0 = INIT
- RO
X HSMODE: 0 = FALSE 1 = TRUE
- RW
0x0 LSMODE: 0 = FALSE 1 = TRUE
- NV_CVIC_FALCON_CSBERRSTAT_0

- Video Image Compositor (VIC) Registers
- Offset: 0x9100
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x40XXXXXX (0b01xx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- Description
- RW
0x0 VALID: 0 = FALSE 0 = INIT 1 = TRUE
- RW
0x1 ENABLE: 0 = FALSE 1 = INIT 1 = TRUE 23:0
- RO
X
- PC
- NV_CVIC_FALCON_CSBERR_INFO_0
- Offset: 0x9200
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

