# 0 = DIS 1 = EN


- PCIe Root Port
- PCIE_RP_APPL_INTR_STATUS_L1_11_0
- Offset: 0x64
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 CFG_SEND_NF_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that Core has sent a message
towards the Root Complex indicating that an Rx TLP that contained a fatal error, and that can not be corrected, was received by the EndPoint 0x0 CFG_SEND_F_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that Core has sent a message
towards the Root Complex indicating that an Rx TLP that contained an non- fatal error, and that can not be corrected, was received by the EndPoint 0x0 CFG_SEND_COR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that Core has sent a message
towards the Root Complex indicating that an Rx TLP that contained an error, and that can be corrected, was received by the EndPoint
- PCIE_RP_APPL_FAULT_EN_L1_12_0
- Offset: 0x68
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 SLV_RASDP_ERR_MODE_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_12
0x0 MSTR_RASDP_ERR_MODE_FAULT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_12
- PCIE_RP_APPL_INTR_EN_L1_12_0

- PCIe Root Port
- Offset: 0x6c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 SLV_RASDP_ERR_MODE_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_12
0x0 MSTR_RASDP_ERR_MODE_INT_EN:
- Enable for interrupt generation for the corresponding bit in
- APPL_INTR_STATUS_L1_12
- PCIE_RP_APPL_INTR_STATUS_L1_12_0
- Offset: 0x70
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 SLV_RASDP_ERR_MODE:
- SLV_ACLK version: Status bit to indicate that the core that it has entered
- RASDP error mode.The core enters RASDP error mode (if the
- ERROR_MODE_EN register field =1) upon detection of the first uncorrectable
error. 0x0 MSTR_RASDP_ERR_MODE:
- MSTR_ACLK version: Status bit to indicate that the core has entered RASDP
error mode.The core enters RASDP error mode (if the ERROR_MODE_EN register field =1) upon detection of the first uncorrectable error.
- PCIE_RP_APPL_INTR_STATUS_L1_13_0
- Offset: 0x74
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- PCIe Root Port
- Bit
- Reset
- Description
0x0 RADM_CPL_TIMEOUT_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate that the completion TLP for a
request has not been received within the expected time window. Refer :
- APPL_RADM_CPL_TO
- PCIE_RP_APPL_INTR_STATUS_L1_14_0
- Offset: 0x78
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxx00,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 IB_WREQ_C2A_CDC_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Inbound Write Req C2A CDC RAM
0x0 IB_RREQ_ORDR_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Inbound Read Req Order RAM
0x0 IB_RREQ_C2A_CDC_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Inbound Read Req C2A CDC RAM
0x0 IB_MCPL_SB_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Inbound Master CPL SB RAM
0x0 IB_MCPL_A2C_CDC_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Inbound Master CPL A2C CDC RAM
0x0 XDLH_RETRYSOTRAM_RADDR_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on XDLH
- Retry SOT RAM
0x0 XDLH_RETRYRAM_ADDR_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on XDLH
- Retry Buffer RAM
0x0 SLV_NPW_SAB_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on Slv Non
- Posted Write Sab RAM
0x0 P_HDRQ_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on Posted
- Hdr Queue RAM
0x0 P_DATAQ_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on Posted
- Data Queue RAM

- PCIe Root Port
- Bit
- Reset
- Description
0x0 OB_PDCMP_HDR_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Outbound Posted Decompose Hdr RAM
0x0 OB_PDCMP_DATA_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Outbound Posted Decompose Data RAM
0x0 OB_NPDCMP_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Outbound Non Posted Decompose RAM
0x0 OB_CPL_C2A_CDC_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Outbound Completion C2A CDC RAM
0x0 OB_CCMP_DATA_RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on
- Outbound Completion Compose Data RAM
0x0 EDMARBUFF2RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on EDMA
- RBUFF RAM
0x0 EDMA2RAM_ADDRB_PAR_ERR_STATE:
- WRITE-ONE-CLEAR : Status bit to indicate address parity error on EDMA
- RAM

