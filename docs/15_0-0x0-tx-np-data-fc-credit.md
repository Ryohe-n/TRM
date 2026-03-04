# 15 :0 0x0 TX_NP_DATA_FC_CREDIT:

- Transmit Non-Posted Data FC Credits. - The non-posted Data credits
advertised by the receiver at the other end of the link, updated with each
- UpdateFC DLLP. - Default value depends on the number of advertised credits
for header and data - Scaled Flow Control: [4'b0, xtlh_xadm_nph_cdts, xtlh_xadm_npd_cdts]; When the number of advertised non-posted credits (both header and data) are infinite, then the default would be [4'b0, 12'hFFF, 16'hFFFF]. - No Scaling: [12'b0, xtlh_xadm_nph_cdts, xtlh_xadm_npd_cdts];
- When the number of advertised non-posted credits (both header and data) are
infinite, then the default would be [12'b0, 8'hFF, 12'hFFF].
- PCIE_X<i>_RC_PF0_PORT_LOGIC_TX_CPL_FC_CREDIT_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides transmit completion FC credit status.
- PCIE_X1_RC_PF0_PORT_LOGIC_TX_CPL_FC_CREDIT_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_TX_CPL_FC_CREDIT_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_TX_CPL_FC_CREDIT_STATUS_OFF_0
- Offset: 0x738
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

