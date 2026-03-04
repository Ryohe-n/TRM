# 7 :0 0x0 MSI_CTRL_INT_VEC_STATE:

- Status bit to indicate that MSI/MSI-X message has received from the
corresponding endpoint. One bit per Endpoint. Refer to
- PF0_PORT_LOGIC_MSI_CTRL_INT_<EP_NUM>_STATUS_OFF to find the
corresponding MSI Vector.
- PCIE_RP_APPL_INTR_STATUS_L1_6_0
- Offset: 0x3c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 RADM_VENDOR_MSG_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that the core received a vendor-
defined message. Corresponding Payload can be accessed from APPL_VENDOR_MSG_PAYLOAD1 & APPL_VENDOR_MSG_PAYLOAD0.
- PCIE_RP_APPL_INTR_STATUS_L1_7_0

- PCIe Root Port
- Offset: 0x40
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 VEN_MSG_GRANT_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate request have been accepted to
send the Vendor Defined Message requested using APPL_VDM_MSG_1/ APPL_VDM_MSG_0.
- PCIE_RP_APPL_INTR_EN_L1_8_0
- Offset: 0x44
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,x000,0xxx,0xxx,x000,0000)
- Bit
- Reset
- Description
0x0 PCIE_ELPG_READY_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_8

