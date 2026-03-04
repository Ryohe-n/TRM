# 1 (Serial)

**Figure 9.100 AON Timers and WDT Hookup**

- AON Cluster Functional Description
- Watchdog Timer
A watchdog timer associated with the AON Cortex-R5 is instanced to monitor Cortex-R5 CPU's health. The watchdog timer has robust restart mechanisms like windowed watchdog and Question and Answer watchdog. AON cluster has a dedicated watchdog timer instanced in the cluster. This enables us to architect the functionality of this timer as per AON clusters specific requirements.
##### 9.13.2.16.8 Timestamping (GTE)
- The AON cluster implements a timestamp module (GTE) for logging the current TSC value when
interrupts or GPIO events occur.
##### 9.13.2.16.9 GTE and DMA
- The AON DMA engine can be used to read from the GTE timestamp FIFO instead of reading the
FIFO using the Cortex-R5. One use case is for the GTE to timestamp the GPIO changes to recover a waveform (for example handling IR receive). To use GTE and DMA in this manner, the following configuration must be used. GTE:
- GTE_GPIO_TECTRL_0[AUTOADVADDR] = 0x3
- GTE_GPIO_TECTRL_0[OCCUPANCYTHRESHOLD] = 0x1
- GTE_GPIO_TECTRL_0[INTERRUPTENABLE] = 0x1
DMA:
- GPCDMA_FLV_8CH_NON_SAFE_CHANNEL_CH<X>_MMIO_SEQ_0[MMIO_BURST] = 0x7
- GPCDMA_FLV_8CH_NON_SAFE_CHANNEL_CH<X>_MMIO_SEQ_0[MMIO_ADDR_WRAP] = 0x4
- GPCDMA_FLV_8CH_NON_SAFE_CHANNEL_CH<X>_SRC_PTR_0[SRC_PTR] = GTE base
address
- GPCDMA_FLV_8CH_NON_SAFE_CHANNEL_CH<X>_MC_SEQ_0[MC_BURST] = 0x0
- GPCDMA_FLV_8CH_NON_SAFE_CHANNEL_CH<X>_DMA_BYTE_TRA_0[TRANSFER_COUNT] =
8x4x (number of samples) When using this configuration, the GTE interrupt in the AVIC must be masked.
##### 9.13.2.16.10 I2C
The AON cluster implements two I2C controllers.

- AON Cluster Functional Description
- Table 9.102 AON I2C Controllers
- Global AMAP Name
- Key Usage Examples
- I2C2
- Camera configuration, Touch control, Sensor interfaces
- I2C8
- Display Aggregator, Sensor Hub Control
##### 9.13.2.16.11 SPI
The AON cluster implements one SPI controller.
- Table 9.103 AON SPI Controller
- AON SPI Instance
- Global AMAP Name
- AON_SPI
- SPI2
##### 9.13.2.16.12 UART
The AON cluster implements two UARTs for primary debug purposes. UARTC is an instance of the standard UART IP, but is implemented as a two pin UART with the CTS and RTS pins tied off so the IP can always send and receive data. UARTJ is the SBSA Compliant UART for debug purposes.
- See Universal Asynchronous Receiver/Transmitter (UART)
- Table 9.104 AON UARTs
- Global AMAP Name
- UART Type
- Usage Details
- UARTC
2pin
- Primary Two Pin Debug UART. Can also be controlled by
- BPMP and CCPLEX with interrupts routed to BPMP cluster
and LIC. This is the case for flow control signals also, i.e., routed to BPMP Cluster DMA and GPC DMA.
- UART_J

