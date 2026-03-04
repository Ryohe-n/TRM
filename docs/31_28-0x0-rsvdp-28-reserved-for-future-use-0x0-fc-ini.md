# 31 :28 0x0 RSVDP_28: Reserved for future use. 0x0 FC_INIT2:

- FC_INIT2. Indicates the controller is in FC_INIT2(VC0) state. Note: This
register field is sticky. 0x0 FC_INIT1:
- FC_INIT1. Indicates the controller is in FC_INIT1(VC0) state. Note: This
register field is sticky. 25:24 0x0 DLCMSM:
- DLCMSM. Indicates the current DLCMSM. Note: This register field is
sticky. 23:12 0xfff RX_ACK_SEQ_NO:
- Tx Ack Sequence Number. Indicates ACKD_SEQ which is updated by
receiving ACK/NAK DLLP. Note: This register field is sticky. 11:0 0x0 TX_TLP_SEQ_NO:
- Tx Tlp Sequence Number. Indicates next transmit sequence number
for transmit TLP. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_SD_STATUS_L3FC_REG_0
where <j> = 4, 8. Description:The CREDIT_DATA[0/1] fields in this viewport register return the data for the VC and
- TLP Type selected by the following fields: - CREDIT_SEL_VC - CREDIT_SEL_CREDIT_TYPE -
- CREDIT_SEL_TLP_TYPE - CREDIT_SEL_HD For more details, see the RAS DES section in the Core
Operations chapter of the Databook.
- PCIE_X4_EP_PF0_RAS_DES_CAP_SD_STATUS_L3FC_REG_0
- Offset: 0x27c
- PCIE_X8_EP_PF0_RAS_DES_CAP_SD_STATUS_L3FC_REG_0
- Offset: 0x290
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description

