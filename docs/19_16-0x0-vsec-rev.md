# 19 :16 0x0 VSEC_REV:

- VSEC Rev. This field is a vendor-defined version number that indicates the
version of the VSEC structure. Software must qualify the Vendor ID and VSEC ID before interpreting this field. 15:0 0x6 VSEC_ID:
- VSEC ID. This field is a vendor-defined ID number that indicates the nature
and format of the VSEC structure. Software must qualify the Vendor ID before interpreting this field.
- PCIE_X<j>_EP_PF0_VSECDMA_CAP_VSECDMA_DEVICE_INFORMATION_OFF_0
where <j> = 4, 8. Description:This register provides DMA and AXI Bridge implementation-specific information: - DMA Architecture: Legacy DMA or Hyper DMA (HDMA). - Register Location: Port-logic or Mapped to a Function and BAR. - Register Map: Legacy DMA or HDMA. - Channel Separation: Address distance between read and write channels. - AXI Bridge: Used or Not Used - AXI Master Bus Specification: AXI Master Bus Width, Burst Length, and Boundary Pointer Width You must use this information along with the IP version registers: - PCIE_VERSION_NUMBER_OFF - PCIE_VERSION_TYPE_OFF.
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X4_EP_PF0_VSECDMA_CAP_VSECDMA_DEVICE_INFORMATION_OFF_0
- Offset: 0x37c
- Reset: 0x34a80401 (0b0011,0100,1010,1000,0000,0100,0000,0001)
- Bit
- Reset
- Description

