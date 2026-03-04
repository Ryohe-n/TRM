# 31 :28 0x0 RSVDP_TX_CPL_FC_CREDIT_STATUS: Reserved for future use. 27:16 0x0 TX_CPL_HEADER_FC_CREDIT:

- Transmit Completion Header FC Credits. - The Completion Header credits
advertised by the receiver at the other end of the link, updated with each
- UpdateFC DLLP. - Default value depends on the number of advertised credits
for header and data - Scaled Flow Control: [4'b0, xtlh_xadm_cplh_cdts, xtlh_xadm_cpld_cdts]; When the number of advertised completion credits (both header and data) are infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_cplh_cdts, xtlh_xadm_cpld_cdts];
- When the number of advertised completion credits (both header and data) are
infinite, then the default would be [12'b0, 8'hFF, 12'hFFF]. 15:0 0x0 TX_CPL_DATA_FC_CREDIT:
- Transmit Completion Data FC Credits. - The Completion Data credits advertised
by the receiver at the other end of the link, updated with each UpdateFC DLLP.
- Default value depends on the number of advertised credits for header and
data - Scaled Flow Control: [4'b0, xtlh_xadm_cplh_cdts, xtlh_xadm_cpld_cdts];
- When the number of advertised completion credits (both header and data) are
infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_cplh_cdts, xtlh_xadm_cpld_cdts]; When the number of advertised completion credits (both header and data) are infinite, then the default would be [12'b0, 8'hFF, 12'hFFF].
- PCIE_X<j>_EP_PF0_PORT_LOGIC_QUEUE_STATUS_OFF_0
where <j> = 4, 8. Description:This register provides the queue status.
- PCIE_X4_EP_PF0_PORT_LOGIC_QUEUE_STATUS_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_QUEUE_STATUS_OFF_0
- Offset: 0x73c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,xx00,0000,0000,0000)

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x0 TIMER_MOD_FLOW_CONTROL_EN: FC Latency Timer Override Enable. Note: This register field is sticky. 30:29
- RO
0x0 RSVDP_29: Reserved for future use. 28:16
- RW
0x0 TIMER_MOD_FLOW_CONTROL:
- FC Latency Timer Override Value. When you set the "FC Latency
- Timer Override Enable" in this register, the value in this field will
override the FC latency timer value that the controller calculates according to the PCIe specification. For more details, see "Flow Control" in the Databook. Note: This register field is sticky.
- RO
0x0 RX_SERIALIZATION_Q_NON_EMPTY: Receive Serialization Queue Not Empty. 12:4
- RO
0x0 RSVDP_4: Reserved for future use.
- RW
0x0 RX_QUEUE_OVERFLOW: Receive Credit Queue Overflow.
- RO
0x0 RX_QUEUE_NON_EMPTY: Receive Credit Queue Not Empty.
- RO
0x0 TX_RETRY_BUFFER_NE: Transmit Retry Buffer Not Empty.
- RO
0x0 RX_TLP_FC_CREDIT_NON_RETURN: Received TLP FC Credits Not Returned.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_VC_TX_ARBI_1_OFF_0
where <j> = 4, 8. Description:This register is used for setting the WRR weights for VC0 - VC3.
- PCIE_X4_EP_PF0_PORT_LOGIC_VC_TX_ARBI_1_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_VC_TX_ARBI_1_OFF_0
- Offset: 0x740
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000000f (0b0000,0000,0000,0000,0000,0000,0000,1111)

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

