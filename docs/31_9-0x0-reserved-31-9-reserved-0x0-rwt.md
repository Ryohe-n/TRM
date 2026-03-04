# 31 :9 0x0 Reserved_31_9: Reserved. 0x0 RWT:

- Receive Watchdog Timeout This bit is set when a packet with length greater
than 2,048 bytes is received (10, 240 bytes when Jumbo Packet mode is enabled) and the WD bit is reset in the MAC_Configuration register. This bit is set when a packet with length greater than 16,383 bytes is received and the WD bit is set in the MAC_Configuration register. Access restriction applies.
- Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is
set). Self-set to 1 on internal event. 7:6 0x0 Reserved_7_6: Reserved. 0x0 EXCOL:
- Excessive Collisions When the DTXSTS bit is set in the MTL_Operation_Mode
register, this bit indicates that the transmission aborted after 16 successive collisions while attempting to transmit the current packet. If the DR bit is set in the MAC_Configuration register, this bit is set after the first collision and the packet transmission is aborted. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 LCOL:
- Late Collision When the DTXSTS bit is set in the MTL_Operation_Mode register,
this bit indicates that the packet transmission aborted because a collision occurred after the collision window (64 bytes including Preamble in MII mode; 512 bytes including Preamble and Carrier Extension in GMII mode). This bit is not valid if the Underflow error occurs. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self- set to 1 on internal event. 0x0 EXDEF:
- Excessive Deferral When the DTXSTS bit is set in the MTL_Operation_Mode
register and the DC bit is set in the MAC_Configuration register, this bit indicates that the transmission ended because of excessive deferral of over 24,288 bit times (155,680 in 1000/2500 Mbps mode or when Jumbo packet is enabled). Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 LCARR:
- Loss of Carrier When the DTXSTS bit is set in the MTL_Operation_Mode
register, this bit indicates that the loss of carrier occurred during packet transmission, that is, the phy_crs_i signal was inactive for one or more transmission clock periods during packet transmission. This bit is valid only for packets transmitted without collision. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 NCARR:
- No Carrier When the DTXSTS bit is set in the MTL_Operation_Mode register,
this bit indicates that the carrier signal from the PHY is not present at the end of preamble transmission. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event.

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 TJT:
- Transmit Jabber Timeout This bit indicates that the Transmit Jabber Timer
expired which happens when the packet size exceeds 2,048 bytes (10,240 bytes when the Jumbo packet is enabled) and JD bit is reset in the
- MAC_Configuration register. This bit is set when the packet size exceeds

