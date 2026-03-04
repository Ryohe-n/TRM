# 4 :0 0x9 RXFIFOSIZE:

- MTL Receive FIFO Size This field contains the configured value of MTL Rx
- FIFO in bytes expressed as Log to base 2 minus 7, that is,
Log2(RXFIFO_SIZE) -7:
- EQOS_EQOS_MAC_MAC_HW_FEATURE2_0
This register indicates the presence of third set of the optional features or functions of the DWC_ether_qos. The software driver can use this register to dynamically enable or disable the programs related to the optional blocks.
- Offset: 0x124
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x12df71c7 (0b0001,0010,1101,1111,0111,0001,1100,0111)
- Bit
- Reset
- Description
0x0 Reserved_31: Reserved. 30:28 0x1 AUXSNAPNUM:
- Number of Auxiliary Snapshot Inputs This field indicates the number of
auxiliary snapshot inputs: 0x0 Reserved_27: Reserved. 26:24 0x2 PPSOUTNUM: Number of PPS Outputs This field indicates the number of PPS outputs: 23:22 0x3 TDCSZ:
- Tx DMA Descriptor Cache Size in terms of 16 bytes descriptors: 00 -
- Cache Not configured 01 - 4 16 bytes descriptor 10 - 8 16 bytes
descriptor 11 - 16 16 bytes descriptor 21:18 0x7 TXCHCNT:
- Number of DMA Transmit Channels This field indicates the number of
DMA Transmit channels: 17:16 0x3 RDCSZ:
- Rx DMA Descriptor Cache Size in terms of 16 bytes descriptors: 00 -
- Cache Not configured 01 - 4 16 bytes descriptor 10 - 8 16 bytes
descriptor 11 - 16 16 bytes descriptor 15:12 0x7 RXCHCNT:
- Number of DMA Receive Channels This field indicates the number of
DMA Receive channels: 11:10 0x0 Reserved_11_10: Reserved.

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description

