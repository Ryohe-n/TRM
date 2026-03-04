# 31 :24 0x0 WRR_WEIGHT_VC_7:

- WRR Weight for VC7. Note: The access attributes of this field are as
follows: - Wire: R - Dbi: R 23:16 0x0 WRR_WEIGHT_VC_6:
- WRR Weight for VC6. Note: The access attributes of this field are as
follows: - Wire: R - Dbi: R 15:8 0x0 WRR_WEIGHT_VC_5:
- WRR Weight for VC5. Note: The access attributes of this field are as
follows: - Wire: R - Dbi: R 7:0 0x0 WRR_WEIGHT_VC_4:
- WRR Weight for VC4. Note: The access attributes of this field are as
follows: - Wire: R - Dbi: R

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_PORT_LOGIC_VC0_P_RX_Q_CTRL_OFF_0
where <j> = 4, 8. Description:This register controls segmented-buffer VC0 posted receive queue operation.
- PCIE_X4_EP_PF0_PORT_LOGIC_VC0_P_RX_Q_CTRL_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_VC0_P_RX_Q_CTRL_OFF_0
- Offset: 0x748
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x4622c140 (0b0100,0110,0010,0010,1100,0001,0100,0000)
- Bit
- Reset
- Description
0x0 VC_ORDERING_RX_Q:
- VC Ordering for Receive Queues. Determines the VC ordering rule for the
receive queues, used only in the segmented-buffer configuration: Note: This register field is sticky. 0x1 TLP_TYPE_ORDERING_VC0:
- TLP Type Ordering for VC0. Determines the TLP type ordering rule for VC0
receive queues, used only in the segmented-buffer configuration: Note: This register field is sticky. 29:28 0x0 RESERVED5: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_P_DATA_SCALE: VC0 Scale Posted Data Credits. Note: This register field is sticky. 25:24 0x2 VC0_P_HDR_SCALE: VC0 Scale Posted Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_P_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED4: Reserved. Note: This register field is sticky. 19:12 0x2c VC0_P_HEADER_CREDIT:
- VC0 Posted Header Credits. The number of initial posted header credits for
- VC0, used only in the segmented-buffer configuration. Note: The access
attributes of this field are as follows: - Wire: R (sticky) - Dbi: R (sticky) Note: This register field is sticky. 11:0 0x140 VC0_P_DATA_CREDIT:
- VC0 Posted Data Credits. The number of initial posted data credits for VC0,
used only in the segmented-buffer configuration. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: R (sticky) Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_PORT_LOGIC_VC0_NP_RX_Q_CTRL_OFF_0
where <j> = 4, 8. Description:This register controls the segmented-buffer VC0 non-posted receive queue operation.
- PCIE_X4_EP_PF0_PORT_LOGIC_VC0_NP_RX_Q_CTRL_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_VC0_NP_RX_Q_CTRL_OFF_0
- Offset: 0x74c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0622c02c (0b0000,0110,0010,0010,1100,0000,0010,1100)
- Bit
- Reset
- Description

