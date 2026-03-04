# 25 :24 0x0 FC_MODE: 0 = NO_MMIO 1 = ONE_MMIO 2 = TWO_MMIO 3 = FOUR_MMIO 23:21 0x0 DMA_MODE: 0 = IO2MEM_NO_FC 1 = IO2MEM_FC 2 = MEM2IO_NO_FC 3 = MEM2IO_FC 4 = MEM2MEM 5 = RSVD 6 = FIXED_PAT 20:16 0x0 REQ_SEL: 0 = I2C1 1 = I2C2 2 = I2C3 3 = SPI 4 = UART1 5 = UART2 6 = DMIC 7 = GTE 8 = UART6 9 = UART8 29 = RSVD 0x1 IRQ_MASK: 0 = DISABLE 1 = ENABLE 13:10 0x1

- WEIGHT
- GPCDMA_AO_CHANNEL_CH7_STA_0
- Offset: 0x80004
- Read/Write: See table below
- Parity Protection: N
- SCR Protection: SCR_CH7_0
- Reset: 0x00000000 (0b00x0,0000,0x00,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- Description
- RO
0x0 BSY: 0 = WAIT 1 = ACTIVE
- RW
0x0 ISE_EOC: 0 = NO_INTR 1 = INTR
- RO
0x0 PING_PONG_STA: 0 = PING_INTR_STA 1 = PONG_INTR_STA

- AO-DMA Registers
- Bit
R/W
- Reset
- Description
- RO
0x0 DMA_ACTIVITY: 0 = IDLE 1 = BUSY
- RO
0x0 CHANNEL_PAUSE: 0 = RESUME 1 = PAUSE
- RO
0x0 CHANNEL_RX: 0 = NOT_ACTIVE 1 = ACTIVE
- RO
0x0 CHANNEL_TX: 0 = NOT_ACTIVE 1 = ACTIVE
- RO
0x0 IRQ_INTR_STA: 0 = DISABLE 1 = ENABLE
- RO
0x0 TRIG_STA: 0 = NOT_ACTIVE 1 = ACTIVE
- RO
0x0 INTR_STA: 0 = NOT_ACTIVE 1 = ACTIVE
- GPCDMA_AO_CHANNEL_CH7_CSRE_0
- Offset: 0x80008
- Read/Write: R/W
- Parity Protection: N
- SCR Protection: SCR_CH7_0
- Reset: 0x00000000 (0b0xxx,xxxx,xxxx,0000,00xx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
0x0 DMA_ACTIVITY: 0 = RESUME 1 = PAUSE 19:14 0x0 TRIG_SEL: 1 = SMP_24 2 = SMP_25 3 = SMP_26 4 = CH0 5 = CH1 6 = CH2 7 = CH3 8 = CH4 9 = CH5 10 = CH6 11 = CH7 0 = RSVD

- AO-DMA Registers
- GPCDMA_AO_CHANNEL_CH7_SRC_PTR_0
- Offset: 0x8000c
- Read/Write: R/W
- Parity Protection: N
- SCR Protection: SCR_CH7_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

