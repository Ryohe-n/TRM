# 31 :28 0x0 RSVDP_28: Reserved for future use. 27:16 0x0 CHK_REG_VF_ERR_NUMBER:

- The VF number at which the error was detected. Valid only when the CDM
Register Checker Comparison Error bit is set in the status register. Note: This register field is sticky. 15:5 0x0 RSVDP_5: Reserved for future use. 4:0 0x0 CHK_REG_PF_ERR_NUMBER:
- The PF number at which the error was detected. Valid only when the CDM
Register Checker Comparison Error bit is set in the status register. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_PL_LTR_LATENCY_OFF_0
where <j> = 4, 8. Description:The function of this register field (and all other fields in this register) differs between an upstream port and a downstream port. For an upstream port, the register fields capture the corresponding fields in the LTR messages that are transmitted by the port. For a downstream port,

- PCIe x4/x8 Endpoint
the register fields capture the corresponding fields in the LTR messages that are received by the port. The full content of the register is reflected on the app_ltr_latency[31:0] output.
- PCIE_X4_EP_PF0_PORT_LOGIC_PL_LTR_LATENCY_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_PL_LTR_LATENCY_OFF_0
- Offset: 0xb30
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 NO_SNOOP_LATENCY_REQUIRE:
- No Snoop Latency Requirement. Note: The access attributes
of this field are as follows: - Wire: R - Dbi: R/W 30:29
- RO
0x0 RSVDP_29: Reserved for future use. 28:26
- RW
0x0 NO_SNOOP_LATENCY_SCALE:
- No Snoop Latency Scale. Note: The access attributes of this
field are as follows: - Wire: R - Dbi: R/W 25:16
- RW
0x0 NO_SNOOP_LATENCY_VALUE:
- No Snoop Latency Value. Note: The access attributes of this
field are as follows: - Wire: R - Dbi: R/W
- RW
0x0 SNOOP_LATENCY_REQUIRE:
- Snoop Latency Requirement. Note: The access attributes of
this field are as follows: - Wire: R - Dbi: R/W 14:13
- RO
0x0 RSVDP_13: Reserved for future use. 12:10
- RW
0x0 SNOOP_LATENCY_SCALE:
- Snoop Latency Scale. Note: The access attributes of this
field are as follows: - Wire: R - Dbi: R/W 9:0
- RW
0x0 SNOOP_LATENCY_VALUE:
- Snoop Latency Value. Note: The access attributes of this
field are as follows: - Wire: R - Dbi: R/W
- PCIE_X<j>_EP_PF0_PORT_LOGIC_AUX_CLK_FREQ_OFF_0
where <j> = 4, 8. Description:This register controls the auxiliary clock frequency.
- PCIE_X4_EP_PF0_PORT_LOGIC_AUX_CLK_FREQ_OFF_0

- PCIe x4/x8 Endpoint
- PCIE_X8_EP_PF0_PORT_LOGIC_AUX_CLK_FREQ_OFF_0
- Offset: 0xb40
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000013 (0b0000,0000,0000,0000,0000,0000,0001,0011)
- Bit
R/W
- Reset
- Description

