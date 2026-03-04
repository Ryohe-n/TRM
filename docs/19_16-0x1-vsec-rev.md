# 19 :16 0x1 VSEC_REV:

- VSEC Rev. This field is a vendor-defined version number that indicates the
version of the VSEC structure. Software must qualify the Vendor ID and VSEC ID before interpreting this field. Note: This register field is sticky. 15:0 0x1 VSEC_ID:
- VSEC ID. This field is a vendor-defined ID number that indicates the nature
and format of the VSEC structure. Software must qualify the Vendor ID before interpreting this field. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_VSECRAS_CAP_RASDP_ERROR_PROT_CTRL_OFF_0
where <j> = 4, 8.
- Description:Allows you to disable ECC error correction for RAMs and datapath. When the AXI
Bridge Module is implemented and the master / slave clocks are asynchronous to the PCIe native controller clock (core_clk), you must not write this register while operations are in progress in the AXI master / slave interface.
- PCIE_X4_EP_PF0_VSECRAS_CAP_RASDP_ERROR_PROT_CTRL_OFF_0
- Offset: 0x2c4
- PCIE_X8_EP_PF0_VSECRAS_CAP_RASDP_ERROR_PROT_CTRL_OFF_0
- Offset: 0x2d8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

