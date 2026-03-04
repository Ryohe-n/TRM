# 2 :1 0x0 TRCSTS:

- MTL Tx Queue Read Controller Status. This field indicates the state of the Tx
- Queue Read Controller: - 2'b00: Idle state - 2'b01: Read state (transferring
data to the MAC transmitter) - 2'b10: Waiting for pending Tx Status from the
- MAC transmitter - 2'b11: Flushing the Tx queue because of the Packet Abort
request from the MAC 0x0 TCPAUSED:
- Traffic Class in Pause. When this bit is high and the Rx flow control is enabled,
it indicates that the Traffic Class 0 is in the Pause condition because of the following: - Reception of the PFC packet for the priorities assigned to the
- Traffic Class 0 when PFC is enabled - Reception of IEEE 802.3-2018 Pause
packet when Priority Based Flow Control (PFC) is disabled
- MGBE_DWCXG_MTL_TCQ0_MTL_TC0_ETS_CONTROL_0
This register configures the transmission selection algorithm, for Traffic Class 0.This register is not available in single traffic class configuration.
- Offset: 0x1110
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

