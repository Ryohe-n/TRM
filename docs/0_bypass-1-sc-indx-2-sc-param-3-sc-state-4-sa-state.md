# 0 = BYPASS 1 = SC_INDX 2 = SC_PARAM 3 = SC_STATE 4 = SA_STATE 4:0 0x0 TABLE_ENTRY_INDEX:

- Table slot Address or Index where an entry would be written

- MACsec Registers
- MACSEC_LUT_DATA_0
- MACSEC LUT Data register
Following register-set holds the data value for a LookUP table. Format of the data resembles the exact table that is to be programmed. This is an array of 7 identical register entries; the register fields below apply to each entry. Full register list is: MACSEC_LUT_DATA_<i>, among which <i> belongs to <0..6>.
- Offset: 0xd008,..,0xd020
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

