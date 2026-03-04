# 0 = UNSET 1 = SET 0x0 PN_THRSHLD_RCHD:

- Threshold value of Packet Number of SA/AN is reached
to indicate the next AN should be programmed and available before PN gets fully exhausted 0 = UNSET 1 = SET
- MACSEC_TX_SC_PN_THRESHOLD_STATUS0_0
Following registers indicate the SCs and ANs for which PN Threshold is Reached. PN Threshold status should be used by the SW to identify the future ANs and the associated keys to be programmed to avoid reaching invalid AN state. SW should enable the future ANs and keys and clear this bit. If SW has already programmed the future ANs it can just clear the status. Writing "1'b1" to a bit clears it.
- Offset: 0x4018
- Read/Write: R/W
- Parity Protection: Y

- MACsec Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

