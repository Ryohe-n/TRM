# 4 :0 0x0 TRIM_SEL_SLAVE:

- Clock trimmer for pad->Rx pad macro flops in slave mode
- I2S_ENABLE_0

- Inter-Chip Sound (I2S) Control Registers
- Offset: 0x80
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- FALSE
ENABLE: 0 = FALSE 1 = TRUE
- I2S_SOFT_RESET_0
- Offset: 0x84
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- DISABLE
SOFT_RESET: 0 = DISABLE 1 = ENABLE
- I2S_CG_0
- Offset: 0x88
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- TRUE
SLCG_ENABLE: 0 = FALSE 1 = TRUE
- I2S_STATUS_0
- Offset: 0x8c
- Read/Write: RO
- Parity Protection: N
- Reset: 0x00000202 (0bxxxx,xxxx,xxxx,xxxx,xxx0,x010,xxxx,x010)
- Bit
- Reset
- Description
- FALSE
SLCG_CLKEN: 0 = FALSE 1 = TRUE

- Inter-Chip Sound (I2S) Control Registers
- Bit
- Reset
- Description
- FALSE
RXCIF_FIFO_FULL: 0 = FALSE 1 = TRUE
- TRUE
RXCIF_FIFO_EMPTY: 0 = FALSE 1 = TRUE
- FALSE
RX_ENABLED: 0 = FALSE 1 = TRUE
- FALSE
TXCIF_FIFO_FULL: 0 = FALSE 1 = TRUE
- TRUE
TXCIF_FIFO_EMPTY: 0 = FALSE 1 = TRUE
- FALSE
TX_ENABLED: 0 = FALSE 1 = TRUE
- I2S_INT_STATUS_0
- Offset: 0x90
- Read/Write: RO
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,0000,xxxx,0000)
- Bit
- Reset
- Description
- FALSE
RX_LOWER_WATERMARK: 0 = FALSE 1 = TRUE
- FALSE
RX_NORMAL_WATERMARK: 0 = FALSE 1 = TRUE
- FALSE
RXCIF_FIFO_UNDERRUN: 0 = FALSE 1 = TRUE
- FALSE
RX_DONE: 0 = FALSE 1 = TRUE
- FALSE
TX_UPPER_WATERMARK: 0 = FALSE 1 = TRUE
- FALSE
TX_NORMAL_WATERMARK: 0 = FALSE 1 = TRUE

- Inter-Chip Sound (I2S) Control Registers
- Bit
- Reset
- Description
- FALSE
TXCIF_FIFO_OVERRUN: 0 = FALSE 1 = TRUE
- FALSE
TX_DONE: 0 = FALSE 1 = TRUE
- I2S_CTRL_0
- Offset: 0xa0
- Read/Write: See table below
- Parity Protection: N
- Reset: 0x00080000 (0b0000,0000,xxx0,1xxx,x000,x000,xxxx,x000)
- Bit
R/W
- Reset
- Description

