# 9 :5 0x0 CarveOutID:

- RWCL: Specifies the carveout ID for the region. This field specifies the
state output on ast_master_a[w,r]user[15,11] for requests that match the region 0x0 Snoop:
- RWRL: Specifies if region accesses snoop the Main CPU caches. This bit
controls the state output on ast_master_a[w,r]user[8] for requests that match the region. 1=Snoop request, 0=Do not snoop request 0 = DISABLE 1 = ENABLE 0x0 Lock: RW1: This bit prevents writes to this region registers. 0 = FALSE 1 = TRUE
#### 9.13.4.4 AO-DMA Registers
##### 9.13.4.4.1 COMMON
- GPCDMA_FLV_8CH_NON_SAFE_COMMON_DMA_CHAN_STA_0
- Offset: 0x0
- Read/Write: RO
- Parity Protection: N
- SCR Protection: SCR_DMA_RO_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description
0x0
- CH7
0x0
- CH6
0x0
- CH5
0x0
- CH4
0x0
- CH3
0x0
- CH2
0x0
- CH1

- AO-DMA Registers
- Bit
- Reset
- Description
0x0
- CH0
- GPCDMA_FLV_8CH_NON_SAFE_COMMON_REQUESTORS_TX_0
- Offset: 0x4
- Read/Write: RO
- Parity Protection: N
- SCR Protection: SCR_DMA_RO_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx00,xx00,0000)
- Bit
- Reset
- Description
0x0
- UART8
0x0
- UART6
0x0
- UART2
0x0
- UART1
0x0
- SPI
0x0
- I2C3
0x0
- I2C2
0x0
- I2C1
- GPCDMA_FLV_8CH_NON_SAFE_COMMON_REQUESTORS_RX_0
- Offset: 0x8
- Read/Write: RO
- Parity Protection: N
- SCR Protection: SCR_DMA_RO_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000,0000)
- Bit
- Reset
- Description
0x0
- UART8
0x0
- UART6
0x0
- GTE
0x0
- DMIC
0x0
- UART2
0x0
- UART1

- AO-DMA Registers
- Bit
- Reset
- Description
0x0
- SPI
0x0
- I2C3
0x0
- I2C2
0x0
- I2C1
- GPCDMA_FLV_8CH_NON_SAFE_COMMON_COMMON_ERROR_STA_0
- Offset: 0xc
- Read/Write: R/W
- Parity Protection: N
- SCR Protection: SCR_HYPER_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

