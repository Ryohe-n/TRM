# 31 :26 0x0 RSVDP_26: Reserved for future use. 25:16 0x2 NUM_DMA_RD_CHAN:

- This field provides information regarding the number of implemented
read channels. It reports the value of CC_NUM_DMA_RD_CHAN parameter. 15:10 0x0 RSVDP_10: Reserved for future use. 9:0 0x4 NUM_DMA_WR_CHAN:
- This field provides information regarding the number of implemented
write channels. It reports the value of CC_NUM_DMA_WR_CHAN parameter.
- PCIE_X<j>_EP_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_LOW_OFF_0
where <j> = 4, 8.

- PCIe x4/x8 Endpoint
Description:This register specifies the lower 32 bits of the offset of the start address of the DMA register map. Applicable only if MAP_FORMAT >0, that is, all map formats other than EDMA_LEGACY_PL.
- PCIE_X4_EP_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_LOW_OFF_0
- Offset: 0x384
- PCIE_X8_EP_PF0_VSECDMA_CAP_VSECDMA_UNROLL_ADDR_OFFSET_LOW_OFF_0
VSECDMA_UNROLL_ADDR_OFFSET_LOW_OFF offset(decimal)=920/0x398 size=32 (32'bit reset value: 0x0 Description: This register specifies the lower 32 bits of the offset of the start address of the DMA register map. Applicable only if MAP_FORMAT >0, that is, all map formats other than
- EDMA_LEGACY_PL. )
- Offset: 0x398
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

