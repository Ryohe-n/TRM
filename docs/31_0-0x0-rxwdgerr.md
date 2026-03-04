# 31 :0 0x0 RXWDGERR:

- Rx Watchdog Error Packets This field indicates the number of packets received
with error because of watchdog timeout error (packets with a data load larger than 2,048 bytes (when JE and WD bits are reset in MAC_Configuration register), 10,240 bytes (when JE bit is set and WD bit is reset in
- MAC_Configuration register), 16,384 bytes (when WD bit is set in
- MAC_Configuration register) or the value programmed in the
MAC_WD_JB_Timeout register).
- EQOS_EQOS_MAC_RX_RECEIVE_ERROR_PACKETS_0
This register provides the number of packets received by DWC_ether_qos with Receive error or Packet Extension error on the GMII or MII interface.
- Offset: 0x7e0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

