# 31 :0 0x0 APP_LTR_MSG_LATENCY: Latency Values to be used by the LTR message to be transmitted. Refer :

- APPL_LTR_MSG_2.APP_LTR_MSG_REQ_STATE. Format is same as the
defined in PCIe Spec.
- PCIE_RP_APPL_LTR_MSG_2_0
- Offset: 0xc8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 APP_LTR_MSG_REQ_STATE: HW-CLEAR : EP-MODE-ONLY. Request for LTR message to be transmitter.
- When set to 1 LTR message is transmitter with
APPL_LTR_MSG_1.APP_LTR_MSG_LATENCY as payload. 2:0 0x0 APP_LTR_MSG_FUNC_NUM: Function Number to be used for LTR message.
- PCIE_RP_APPL_LINK_STATUS_0
- Offset: 0xcc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000002 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx10)

- PCIe Root Port
- Bit
R/W
- Reset
- Description
- RW
0x1 APP_CLK_REQ_N:
- Set to 0 if removal of ref_clk (by asserting clkreq_n) is not
desired by application logic.
- RO
0x0 RDLH_LINK_UP: Live status of Data Link Layer.
- PCIE_RP_APPL_DEBUG_0
- Offset: 0xd0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xx00,0000,0000,0x00,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 PM_LINKST_IN_L2_LAT:
- WRITE-ONE_CLEAR : Sticky version of PM_LINKST_IN_L2. Latches a
value of 1 when PM_LINKST_IN_L2 goes high.
- RO
0x0 AUX_PM_EN:
- DEBUG STATUS : Auxiliary Power Enable bit in the Device Control
register.
- RO
0x0 PM_STATUS: DEBUG STATUS : PME Status bit from the PMCSR.
- RO
0x0 PM_LINKST_IN_L1SUB:
- DEBUG STATUS : Power management is in L1 substate. Indicates
when the link has entered L1 substates. It is used in clk_rst.v (see 'Clock Generation and Gating Design Example') to ensure that the switching back of aux_clk from AUXCLK to PCLK occurs only after L1 substates have been exited. For L1.2 this signal is deasserted at the end of the L1.2.Exit state, after the t_power_on constraint has been satisfied. External logic can use the transition high to low on this signal to initiate REFCLK restore.
- RO
0x0 PM_LINKST_L2_EXIT:
- DEBUG STATUS : Power management is exiting L2 state. Not
applicable for downstream port.
- RO
0x0 PM_LINKST_IN_L2:
- Power management is in L2 state . SW polls this register to enable
partition power down sequence.
- RO
0x0 PM_LINKST_IN_L1:
- DEBUG STATUS : Power management is in L1 state
- RO
0x0 PM_LINKST_IN_L0s:
- DEBUG STATUS : Power management is in L0s state

- PCIe Root Port
- Bit
R/W
- Reset
- Description

