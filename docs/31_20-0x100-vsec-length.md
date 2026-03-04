# 31 :20 0x100 VSEC_LENGTH:

- VSEC Length. This field indicates the number of bytes in the entire VSEC
structure, including the Vendor-Specific Extended Capability Header, the Vendor-Specific Header, and the vendor-specific registers. 19:16 0x4 VSEC_REV:
- VSEC Rev. This field is a vendor-defined version number that indicates the
version of the VSEC structure. Software must qualify the Vendor ID and VSEC ID before interpreting this field. 15:0 0x2 VSEC_ID:
- VSEC ID. This field is a vendor-defined ID number that indicates the nature
and format of the VSEC structure. Software must qualify the Vendor ID before interpreting this field.
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_EVENT_COUNTER_CONTROL_REG_0
where <j> = 4, 8. Description:This is a viewport control register.
- Setting the EVENT_COUNTER_EVENT_SELECT and EVENT_COUNTER_LANE_SELECT fields in
this register determine the Event Counter data returned by the EVENT_COUNTER_DATA_REG viewport register.
- Setting the EVENT_COUNTER_ENABLE field in this register enables the Event Counter
selected by the EVENT_COUNTER_EVENT_SELECT and EVENT_COUNTER_LANE_SELECT fields in this register.
- Setting the EVENT_COUNTER_CLEAR field in this register clears the Event Counter selected
by the EVENT_COUNTER_EVENT_SELECT and EVENT_COUNTER_LANE_SELECT fields in this register.
- Reading the EVENT_COUNTER_STATUS field in this register returns the Enable status of the
- Event Counter selected by the EVENT_COUNTER_EVENT_SELECT and
EVENT_COUNTER_LANE_SELECT fields in this register.
- PCIE_X4_EP_PF0_RAS_DES_CAP_EVENT_COUNTER_CONTROL_REG_0
- Offset: 0x1c4
- PCIE_X8_EP_PF0_RAS_DES_CAP_EVENT_COUNTER_CONTROL_REG_0
- Offset: 0x1d8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x4/x8 Endpoint
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

