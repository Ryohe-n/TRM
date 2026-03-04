# 31 :0 0x0 EVENT_COUNTER_DATA:

- Event Counter Data. This register returns the data selected by the
following fields: - EVENT_COUNTER_EVENT_SELECT in EVENT_COUNTER_CONTROL_REG Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_CONTROL_REG_0
where <j> = 4, 8. Description:Used for controlling the measurement of RX/TX data throughput and time spent in each low-power LTSSM state. For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X4_EP_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_CONTROL_REG_0
- Offset: 0x1cc
- PCIE_X8_EP_PF0_RAS_DES_CAP_TIME_BASED_ANALYSIS_CONTROL_REG_0
- Offset: 0x1e0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000100 (0b0000,0000,0000,0000,0000,0001,0000,0000)

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description

