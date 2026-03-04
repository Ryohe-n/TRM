# 11 :9 0x0 Reserved_11_9: Reserved. 0x0 RWT:

- Receive Watchdog Timeout. This bit is set when a packet with length greater
than 2048 bytes is received (10240 bytes when Jumbo Packet mode is enabled) and the WD bit is reset in the MAC_Rx_Configuration register or when a packet with length greater than 16383 bytes is received and the WD bit is set in the
- MAC_Rx_Configuration register. Access restriction applies. Clears on read (or
write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 7:6 0x0 Reserved_7_6: Reserved. 0x0 Reserved_EXCOL: Reserved. 0x0 Reserved_LCOL: Reserved. 0x0 Reserved_EXDEF: Reserved. 0x0 Reserved_LCARR: Reserved. 0x0 Reserved_NCARR: Reserved. 0x0 TJT:
- Transmit Jabber Timeout. This bit indicates that the Transmit Jabber Timer
expired, which happens when the packet size exceeds 2048 bytes (10240 bytes when the Jumbo packet is enabled) and the JD bit is reset in the
- MAC_Tx_Configuration register. This bit is set when the packet size exceeds

