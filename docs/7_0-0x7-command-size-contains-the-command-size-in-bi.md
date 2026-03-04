# 7 :0 0x7 COMMAND_SIZE: Contains the Command size in bits (n+1). 0x0 = 1-bit wide cmd. 0x1 = 2-bit wide cmd. ... 0x1f = 32-bit wide cmd.

- QSPI_GLOBAL_CONFIG_0
- Offset: 0x1a4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 TPM_WAIT_POLL_EN:
- Enable polling for wait state in TPM devices
0x0 CMB_SEQ_EN: Indicates whether Combined sequence mode is enabled or not.
- QSPI_CMB_SEQ_ADDR_0
- Offset: 0x1a8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

