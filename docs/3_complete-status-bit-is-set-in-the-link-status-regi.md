# 3 Complete status bit is set in the "Link Status Register 2" Note:

- GEN3_EQ_PHASE23_EXIT_MODE = 1 affects Direction Change feed back
mode. EQ requests for Figure Of Merit mode complete before 24 ms timeout. Please see GEN3_EQ_PSET_REQ_VEC Register for more. Note: -
- When CX_GEN4_SPEED/CX_GEN5_SPEED, this register is shadow register
for Gen3 and Gen4/Gen5 data rate. - If RATE_SHADOW_SEL==00b, this register is for Gen3 data rate. - If RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: This register field is sticky. 3:0
- RW
0x0 GEN3_EQ_FB_MODE:
- Feedback Mode. Other values are reserved. Note: - When
- CX_GEN4_SPEED/CX_GEN5_SPEED, this register is a shadow register for
- Gen3 and Gen4/Gen5 data rate. - If RATE_SHADOW_SEL==00b, this
register is for Gen3 data rate. - If RATE_SHADOW_SEL==01b, this register is for Gen4 data rate. - If RATE_SHADOW_SEL==10b, this register is for Gen5 data rate. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_ORDER_RULE_CTRL_OFF_0
where <j> = 4, 8. Description:This register controls the order rule.
- PCIE_X4_EP_PF0_PORT_LOGIC_ORDER_RULE_CTRL_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_ORDER_RULE_CTRL_OFF_0
- Offset: 0x8b4
- Read/Write: See table below
- Parity Protection: N

- PCIe x4/x8 Endpoint
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

