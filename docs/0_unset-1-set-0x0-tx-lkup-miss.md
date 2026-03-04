# 0 = UNSET 1 = SET 0x0 TX_LKUP_MISS:

- MACSEC Transmit Bypass and SC Tables LookUP operation - No matching
entries found 0 = UNSET 1 = SET
- MACSEC_TX_SC_KEY_INVALID_STATUS0_0
Following registers indicate the SCs and ANs for which Key is not valid/programmed. The register bits are set to 1 when a SC/AN key is not available to process a packet for MACSEC Writing 1'b1 to a bit clears it and writing with 1'b0 is ignored MACSEC Egress Key Invalid Status-0 Register.
- Offset: 0xd064
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- MACsec Registers
- Bit
- Reset
- Description

