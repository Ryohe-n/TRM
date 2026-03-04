# 1 = LOCKED 0 = UNLOCKED

- RW
- DISABLE
RETRY_FRAME: 0 = DISABLE 1 = ENABLE
- Indicates if the current frame is a retry frame or not. Based on this
value, hardware chooses appropriate bus idle time programmed in
- TX_TIMING2 register and waits for the bus to be idle before it can
attempt to send start bit. This bit is only meaningful when TX_GENERATE_START_BIT is set.
- RW
- ENABLE
GENERATE_START_BIT: 0 = DISABLE 1 = ENABLE
- Indicates to the hardware to precede the transmission of this block
of data with a start bit.
- RW
- DIRECT
ADDRESS_MODE: 0 = DIRECT 1 = BROADCAST
- This bit indicates to the hardware whether this particular block is
directly addressed or broadcast addressed (which in turn dictates how hardware is to interpret the ACK/NAK for the block).
- RW
0x0
- EOM
The EOM bit read from the bus. 7:0
- RW
0x0
- DATA
- The eight bits of address/data to be transmitted on the bus. The
data is always transmitted MSB (bit 7) first to facilitate smoother
- EOM. This is the "end of message" bit for this block of data. This bit
is set at the last block of the frame.
- CEC_RX_REGISTER_0
- The CEC_HW_RX_REGISTER register is used by hardware to buffer data to the software. When a
block of data has been received from the bus, it is stored here for software (and when the buffer is fully filled, RX_REGISTER_FULL bit is set). The hardware has a 64deep of the receive register in order to give software as much time as possible to empty it.
- Offset: 0x14
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000XXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)

- CEC Registers
- Bit
- Reset
- Description
X
- ACK
- The ACK/NAK bit as read from the bus. In some cases (broadcast block), even
though our device may have ACKd the frame, some other device on the bus may NAK the frame, and software must know this. X
- EOM
The EOM bit read from the bus. 7:0 X
- DATA
The eight bits of data that were read from the bus.
- CEC_RX_TIMING_0_0
Note: Configure all the timing registers before enabling the hardware CEC engine.
- Offset: 0x18
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x8b9a7180 (0b1000,1011,1001,1010,0111,0001,1000,0000)
- Bit
- Reset
- Description

