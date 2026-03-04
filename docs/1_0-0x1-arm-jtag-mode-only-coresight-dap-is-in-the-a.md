# 1 :0 0x1 ARM_JTAG_MODE: Only Coresight DAP is in the ARM JTAG chain (only 0x1 value is valid). 1 = CORESIGHT_ONLY

- CORESIGHT_CFG_ARM_JTAG_STATUS_0
- CoreSight JTAG Status Register
- Offset: 0x2001c
- Read/Write: RO
- Parity Protection: N
- Reset: 0x0000000X (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X JTAGTOP: indicates JTAG-DP TAP controller is in one of the following states
- Test-Logic-Reset
- Run-Test/Idle
- Select-DR-Scan
- Select-IR-Scan

