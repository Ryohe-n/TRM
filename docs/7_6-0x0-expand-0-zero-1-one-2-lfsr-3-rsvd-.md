# 7 :6 0x0 EXPAND: 0 = ZERO 1 = ONE 2 = LFSR 3 = RSVD 5:4 0x0 STEREO_MONO_CONV: 0 = CH0 1 = CH1 2 = AVG 3 = RSVD 3:2 0x0

- FIFO_SIZE_DOWNSHIFT
0x0 TRUNCATE: 0 = ROUND 1 = CHOP 0x0 MONO_STEREO_CONV: 0 = ZERO 1 = COPY
- DSPK_ENABLE_0
- Offset: 0x40
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- FALSE
ENABLE: 0 = FALSE 1 = TRUE
- DSPK_SOFT_RESET_0
- Offset: 0x44
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- DISABLE
SOFT_RESET: 0 = DISABLE 1 = ENABLE
- DSPK_CG_0

- Digital Speaker (DSPK) Control Registers
- Offset: 0x48
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- TRUE
SLCG_ENABLE: 0 = FALSE 1 = TRUE
- DSPK_STATUS_0
- Offset: 0x4c
- Read/Write: RO
- Parity Protection: N
- Reset: 0x00000200 (0bxxxx,xxxx,xxxx,xxxx,x0x0,x010,xxxx,xxxx)
- Bit
- Reset
- Description
- FALSE
CODEC_CONFIG_DONE: 0 = FALSE 1 = TRUE
- FALSE
SLCG_CLKEN: 0 = FALSE 1 = TRUE
- FALSE
RXCIF_FIFO_FULL: 0 = FALSE 1 = TRUE
- TRUE
RXCIF_FIFO_EMPTY: 0 = FALSE 1 = TRUE
- FALSE
RX_ENABLED: 0 = FALSE 1 = TRUE
- DSPK_INT_STATUS_0
- Offset: 0x50
- Read/Write: RO
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,x000,xx00,xxxx,xxxx)
- Bit
- Reset
- Description
- FALSE
RX_LOWER_WATERMARK: 0 = FALSE 1 = TRUE

- Digital Speaker (DSPK) Control Registers
- Bit
- Reset
- Description
- FALSE
RX_NORMAL_WATERMARK: 0 = FALSE 1 = TRUE
- FALSE
CODEC_CONFIG_DONE: 0 = FALSE 1 = TRUE
- FALSE
RXCIF_FIFO_UNDERRUN: 0 = FALSE 1 = TRUE
- FALSE
RX_DONE: 0 = FALSE 1 = TRUE
- DSPK_CORE_CTRL_0
- Offset: 0x60
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000310 (0bx000,x000,x000,xxx0,xxxx,xx11,xx01,xxx0)
- Bit
- Reset
- Description

