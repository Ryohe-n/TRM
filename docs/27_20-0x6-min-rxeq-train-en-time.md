# 27 :20 0x6 MIN_RXEQ_TRAIN_EN_TIME:

- This register configures the minimum time from LFPS end to RX data en
assertion 6 = INIT 19:0 0x3840 RXEQ_WAIT_CNT: The minimum wait time between polling.LFPS to polling.RXEQ transition.
- Here we first wait for the LFPS to end. Once LFPS is ended, wait for this
minimum time before rx_data_en is asserted. This is to prevent CDR lock failure (CDR should lock on HS data not on LFPS). 14400 = INIT T_XUSB_CFG_SSPX_CORE_CNT54_0
- Offset: 0x6f4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00600e10 (0bxxxx,0000,0110,0000,0000,1110,0001,0000)
- Bit
- Reset
- Description

