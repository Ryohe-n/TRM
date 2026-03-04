# 15 :0 0x0 RADM_MSG_REQ_ID: The requester ID of the received Message.

- PCIE_RP_APPL_PM_STATUS_0
- Offset: 0xfc
- Read/Write: See table below
- Parity Protection: N

- PCIe Root Port
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
0x0 APPS_PM_XMT_PME_STATE:
- SELF-CLEAR : Wake Up. Used by application logic to wake up the PMC
state machine from a D1, D2 or D3 power state. Upon wake-up, the core sends a PM_PME Message. There is a separate apps_pm_xmt_pme input bit for each function in your core configuration. This port is functionally identical to outband_pwrup_cmd. This signal or outband_pwrup_cmd them must be used to request a return from D1/
- D2/D3 to D0/
- RW
0x0 APP_UNLOCK_MSG_STATE:
- SELF-CLEAR : Request from your application to generate an Unlock
message.The core does not return an acknowledgment or grant signal.
- You must not pulse the same signal again, until the previous message
has been transmitted.
- RO
0x0 PM_PME_EN: PME Enable bit in the PMCSR.
- PCIE_RP_APPL_DM_TYPE_0
- Offset: 0x100
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000004 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0100)
- Bit
- Reset
- Description

