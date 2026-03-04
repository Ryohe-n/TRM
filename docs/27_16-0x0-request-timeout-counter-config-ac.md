# 27 :16 0x0 REQUEST_TIMEOUT_COUNTER: config access timeout value 13:12

- FALSE
LIVE_STATUS: 0 = FALSE 1 = TRUE
- FALSE
MASTER_CLKEN: 0 = FALSE 1 = TRUE
- FALSE
SLAVE_CLKEN: 0 = FALSE 1 = TRUE
- FALSE
HRD_FIFO_FULL: 0 = FALSE 1 = TRUE
- TRUE
HRD_FIFO_EMPTY: 0 = FALSE 1 = TRUE
- FALSE
HWR_FIFO_FULL: 0 = FALSE 1 = TRUE
- TRUE
HWR_FIFO_EMPTY: 0 = FALSE 1 = TRUE
- AHC_INT_STATUS_0

- Audio Hub Configuration (AHC) Registers
- Offset: 0x10
- Read/Write: RO
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- CLEAR
CONFIG_REQUEST_TIMEOUT: time out status indication bit 0 = CLEAR 1 = SET
- AHC_INT_MASK_0
- Offset: 0x14
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- MASK
CONFIG_REQUEST_TIMEOUT: 0 = UNMASK 1 = MASK
- AHC_INT_SET_0
- Offset: 0x18
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- FALSE
CONFIG_REQUEST_TIMEOUT: 0 = FALSE 1 = TRUE
- AHC_INT_CLEAR_0
- Offset: 0x1c
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- Audio Hub Configuration (AHC) Registers
- Bit
- Reset
- Description
- FALSE
CONFIG_REQUEST_TIMEOUT: 0 = FALSE 1 = TRUE
- AHC_CTRL_0
- Offset: 0x24
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000021 (0bxxxx,xxxx,xxxx,xxxx,xxxx,0000,0010,0001)
- Bit
- Reset
- Description

