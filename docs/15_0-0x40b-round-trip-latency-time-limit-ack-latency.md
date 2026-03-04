# 15 :0 0x40b ROUND_TRIP_LATENCY_TIME_LIMIT: Ack Latency Timer Limit. The Ack latency timer expires when it reaches this limit.

- For more details, see "ACK/NAK Scheduling" in the Databook. - You can modify
the effective timer limit through the TIMER_MOD_ACK_NAK field of the
- TIMER_CTRL_MAX_FUNC_NUM_OFF register. - After reset, the controller
updates the default according to the Negotiated Link Width, Max_Payload_Size, and speed. The value is determined from Tables 3-7, 3-8, and 3-9 of the PCI
- Express Base Specification. - The limit must reflect the round trip latency from
requester to completer. - If there is a change in the payload size or link width, the controller overrides any value that you have written to this register field, and resets the field back to the specification-defined value. The controller does not change the value in the TIMER_MOD_ACK_NAK field of the TIMER_CTRL_MAX_FUNC_NUM_OFF register.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_VENDOR_SPEC_DLLP_OFF_0
where <j> = 4, 8. Description:This register holds the vendor specific DLLP.
- PCIE_X4_EP_PF0_PORT_LOGIC_VENDOR_SPEC_DLLP_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_VENDOR_SPEC_DLLP_OFF_0
- Offset: 0x704
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xffffffff (0b1111,1111,1111,1111,1111,1111,1111,1111)
- Bit
- Reset
- Description

