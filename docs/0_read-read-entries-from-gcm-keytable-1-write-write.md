# 0 = READ :Read entries from GCM KeyTable 1 = WRITE :Write to GCM KeyTable 4:0 0x0 TABLE_INDEX:

- Key Table slot Address or Index where the Key would be written
- MACSEC_GCM_KEYTABLE_DATA_0
The following register set holds the data value for KeyTable.Format of the data resembles exactly the KeyTable format. This is an array of 13 identical register entries; the register fields below apply to each entry. Full register list is: MACSEC_GCM_KEYTABLE_DATA_<i>, among which <i> belongs to <0..12>.
- Offset: 0x4,..,0x34

- MACsec Registers
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

