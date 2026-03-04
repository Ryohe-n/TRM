# 31 :2 0x0 RSVDP_2: Reserved for future use. 0x0 PTM_RES_REQUEST_RECEIVED:

- PTM 1st Request Received. PTM Responder has received the first PTM
- Request Message. Upon receipt of a second PTM Request Message a
- ResponseD message with timing information will be sent from the Responder,
if the context is valid. If the context is invalid a Response message will be sent instead. For more details, see the PTM section in the Databook. Note: This register field is sticky. 0x0 PTM_RES_CONTEXT_VALID:
- PTM Responder Status Context Valid. PTM Local Timing Context is Valid. Value
set from upstream port Requester in a Switch. Shadows the same in the control register in all other products. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_LSB_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_LSB_OFF_0
- Offset: 0x300
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_LSB_OFF_0
- Offset: 0x31c
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_LOCAL_LSB_OFF_0
- Offset: 0x330
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

