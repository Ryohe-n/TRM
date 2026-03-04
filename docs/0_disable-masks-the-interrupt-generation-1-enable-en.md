# 0 = DISABLE :Masks the Interrupt generation 1 = ENABLE :Enables the Interrupt generation 0x0 TX_LKUP_MISS_INT_EN:

- MACSEC Transmit Interrupt Enable bit for Bypass and SC Tables LookUP
miss 0 = DISABLE :Masks the Lookup Miss Interrupt generation 1 = ENABLE :Enables the Lookup Miss Interrupt generation
- MACSEC_INTERRUPT_STATUS0_0
- MACSEC Interrupt Status Register 0
Status bits corresponding to an Interrupt event Status bits are sticky. They get cleared when written with 1.
- Offset: 0xd058
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N

- MACsec Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,xxxx,xxxx,xx00,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 SECURE_REG_VIOL: non-secure access happened to a secure register 0 = UNSET 1 = SET 0x0 RX_UNINIT_KEY_SLOT:
- MACSEC Receive SC LookUP outcome pointing to an Unitialized_Key_Slot
in GCM KeyTable 0 = UNSET 1 = SET 0x0 RX_LKUP_MISS:
- MACSEC Receive Bypass and SC Tables LookUP operation - No matching
entries found 0 = UNSET 1 = SET 0x0 TX_UNINIT_KEY_SLOT:
- MACSEC Transmit SC LookUP outcome pointing to an
- Unitialized_Key_Slot in GCM KeyTable

