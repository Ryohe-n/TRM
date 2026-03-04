# 31 :16 0xc23 REPLAY_TIME_LIMIT:

- Replay Timer Limit. The replay timer expires when it reaches this limit. The
controller initiates a replay upon reception of a NAK or when the replay timer expires. For more details, see "Transmit Replay" in the Databook. - You can modify the effective timer limit through the TIMER_MOD_REPLAY_TIMER field of the TIMER_CTRL_MAX_FUNC_NUM_OFF register. - After reset, the controller updates the default according to the Negotiated Link Width, Max_Payload_Size, and speed. The value is determined from Tables 3-4, 3-5, and 3-6 of the PCI
- Express Base Specification. - If there is a change in the payload size or link
speed, the controller overrides any value that you have written to this register field, and resets the field back to the specification-defined value. The controller does not change the value in the TIMER_MOD_REPLAY_TIMER field of the TIMER_CTRL_MAX_FUNC_NUM_OFF register.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

