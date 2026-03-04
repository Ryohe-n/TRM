# 5 :3 0x0 CFG_MAX_RD_REQ_SIZE:

- The value of the Max_Read_Request_Size field in the Device Control
register. There are 3 bits of cfg_max_rd_req_size assigned. 2:0 0x0 CFG_MAX_PAYLOAD_SIZE: The value of the Max_Payload_Size field in the Device Control register. There are 3 bits of cfg_max_payload_size assigned.
- PCIE_RP_APPL_RADM_STATUS0_0
- Offset: 0xe4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 RADM_XFER_PENDING:
- Receive request pending status. Indicates Receive TLP requests are
pending, that is, requests sent to the RTRGT1 or RTRGT0 interfaces are awaiting a response from your application. For debugging purposes.
- RO
0x0 RADM_QOVERFLOW: one or more of the P/NP/CPL receive queues have overflowed

- PCIe Root Port
- Bit
R/W
- Reset
- Description
- RO
0x0 RADM_Q_NOT_EMPTY:
- Level indicating that the receive queues contain TLP header/data
- RW
0x0 APPS_PM_XMT_TURNOFF_STATE:
- SELF-CLEAR : Request from your application to generate a
- PM_Turn_Off message. The core does not return an acknowledgment
or grant signal. You must not pulse the same signal again, until the previous message has been transmitted.
- PCIE_RP_APPL_RADM_MSG_PAYLOAD0_0
- Offset: 0xe8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

