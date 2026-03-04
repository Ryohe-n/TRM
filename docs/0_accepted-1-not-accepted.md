# 0 = ACCEPTED 1 = NOT_ACCEPTED


10G Ethernet Controller Wrapper Registers
- Bit
R/W
- Parity Protection
- Reset
- Description
- RO
N
- DEASSERTED
CSYSACK:
- This signal is the acknowledgment to the low-
power request from the system. Active Low signal 0 = ASSERTED 1 = DEASSERTED
- RW
Y
- DISABLE
CSYSREQ:
- When this signal is low, it indicates that the
system clock controller requested the AXI low power interface to enter the low-power state.
- When high, this signal indicates that the AXI
low power interface should come out of the low-power state. 0 = ENABLE 1 = DISABLE
- MGBE_WRAP_AUXILLARY_TIMESTAMP_0
- Offset: 0x8008
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- DISABLE
SNAPSHOT:
- This signal goes high to take an auxiliary snapshot of the time and store it
in the auxiliary timestamp FIFO. A rising edge on this port is used to trigger the auxiliary snapshot. 0 = DISABLE 1 = ENABLE
- MGBE_WRAP_SYNC_TSC_PTP_CAPTURE_0
TIME STAMP related Capture control and values.
- Write into MGBE_WRAP_SYNC_TSC_PTP_CAPTURE_0 to capture the timestamp from TSC and
- MGBE simultaneously
This bit is written to Logic 1 to start the capture of TSC and PTP (from MAC) and reset by the H/W after the capture is complete
- Offset: 0x800c
- Read/Write: R/W

10G Ethernet Controller Wrapper Registers
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- DONE
SYNC_TSC_PTP_CAPTURE: 0 = DONE 1 = START
- MGBE_WRAP_TSC_CAPTURE_LOW_0
- Offset: 0x8010
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

