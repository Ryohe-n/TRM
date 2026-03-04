# 2 :0 0x0 APP_PARITY_ERRS_STATE:

- WRITE-ONE-CLEAR : Status bit to indicate that the core detected a
datapath parity error, one bit for each of the following parity errors: --> app_parity_errs[0]: Parity error at front end of the transmit datapath. --> app_parity_errs[1]: Parity error at back end of the transmit datapath. --> app_parity_errs[2]: Parity error the receive datapath.
- PCIE_RP_APPL_INTR_STATUS_L1_15_0

- PCIe Root Port
- Offset: 0x7c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 CFG_BUS_MASTER_EN_CHGED:
- WRITE-ONE-CLEAR : Status bit to indicate that the Host Software has
updated Bus Master Enable (BME) 0x0 CFG_MEM_SPACE_EN_CHGED:
- WRITE-ONE-CLEAR : Status bit to indicate that the Host Software has
updated Memory Space Enable (MSE)
- PCIE_RP_APPL_FAULT_EN_L1_17_0
- Offset: 0x80
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0 APB_PSLVERR_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
0x0 AXI_SLV_RRESP_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
0x0 AXI_SLV_BRESP_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
0x0 AXI_MSTR_RRESP_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
0x0 AXI_MSTR_BRESP_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
- PCIE_RP_APPL_INTR_EN_L1_17_0

- PCIe Root Port
- Offset: 0x84
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0 APB_PSLVERR_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
0x0 AXI_SLV_RRESP_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
0x0 AXI_SLV_BRESP_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
0x0 AXI_MSTR_RRESP_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
0x0 AXI_MSTR_BRESP_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_17
- PCIE_RP_APPL_INTR_STATUS_L1_17_0
- Offset: 0x88
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0 APB_PSLVERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that APB error has occured
0x0 AXI_SLV_RRESP_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that AXI slave read response
error has occured 0x0 AXI_SLV_BRESP_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that AXI slave write response
error has occured 0x0 AXI_MSTR_RRESP_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that AXI master read response
error has occured

- PCIe Root Port
- Bit
- Reset
- Description
0x0 AXI_MSTR_BRESP_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that AXI master write
response error has occured
- PCIE_RP_APPL_FAULT_EN_L1_18_0
- Offset: 0x8c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 CDM_REG_CHK_CMP_ERR_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_18
0x0 CDM_REG_CHK_LOGIC_ERR_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_18
- PCIE_RP_APPL_INTR_EN_L1_18_0
- Offset: 0x90
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 CDM_REG_CHK_CMPLT_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_18
0x0 CDM_REG_CHK_CMP_ERR_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_18
0x0 CDM_REG_CHK_LOGIC_ERR_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_18

- PCIe Root Port
- PCIE_RP_APPL_INTR_STATUS_L1_18_0
- Offset: 0x94
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 CDM_REG_CHK_CMPLT_STATE: Status bit to indicate that Register Checking Sequence has Completed.
- Place holder Register. Needs to be cleared in CDM register
0x0 CDM_REG_CHK_CMP_ERR_STATE:
- Status bit to indicate that the register values read from both CDM's do not
match. Place holder Register. Needs to be cleared in CDM register 0x0 CDM_REG_CHK_LOGIC_ERR_STATE: Status bit to indicate that there is an Error in the Register Checking Logic.
- Place holder Register. Needs to be cleared in CDM register
- PCIE_RP_AUTOMOTIVE_DEBUG_REG_0
- Offset: 0x98
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 CDM_REG_CHK_TEST_EN:
- Signal to enter test mode in the Register Checking Logic. Shadow copy(u_cdm_b)
of the controller registers will not be written to when this signal is high. Allows a value to be written to Original SET (u_cdm) to compare against the previous value in u_cdm_b. If this bit is set and a controller register is updated, would trigger APPL_INTR_STATUS_L1_18 when the CDM register check is enabled.
- PCIE_RP_APPL_VDM_MSG_0_0
Register space mapped for different vendor message header fields. The mapping is as follows: ven_msg_len --> ven_msg_hdr0[9:0]

- PCIe Root Port
ven_msg_fmt --> ven_msg_hdr0[11:10] ven_msg_attr --> ven_msg_hdr0[13:12] ven_msg_ep --> ven_msg_hdr0[14] ven_msg_td --> ven_msg_hdr0[15] ven_msg_func_num --> ven_msg_hdr0[18:16] ven_msg_tc --> ven_msg_hdr0[22:20] ven_msg_type --> ven_msg_hdr0[28:24] ven_msg_code --> ven_msg_hdr1[7:0] ven_msg_tag --> ven_msg_hdr1[15:8] ven_msg_data --> {ven_msg_hdr3,ven_msg_hdr2}
- Offset: 0x9c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 VEN_MSG_REQ_STATE:
- HW-CLEAR : When set to 1, VDM message will be transmitted using the
fields VEN_MSG_HDR0/1/2/3. 30:0 0x0 VEN_MSG_HDR0: {ven_msg_type[4:0],1'b0,ven_msg_tc[2:0],1'b0,'ven_msg_func_num[2:0], ven_msg_td,ven_msg_ep,ven_msg_attr[1:0],ven_msg_fmt[1:0],ven_msg_ len[9:0]}
- PCIE_RP_APPL_VDM_MSG_1_0
- Offset: 0xa0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

