# 19 :16 0x0 STREAM_EVENT_LO_MASK: deint_stream_even_mask 15:2 0x0 FRAME_FAULT_MASK: deint_frame_fault_mask 1:0 0x0 FRAME_STATUS_MASK: mask particular status events from being notified

- VI_CSIMUX_CONFIG_STREAM_0
- STREAM CONFIGURATION
Streams which are used by the Omnivision style interleaving have their configuration automatically disabled. For example, if pair (0,2) is interleaved then WT revers to 0 for streams 1,2 and WT for from the deinterleaved configuration register applies to stream 0.
- When WT set to 0 implies the stream is turned off and no traffic will be allowed out if
the correspnding stream FIFOs. If traffic is pushed in on a stream with no DEINT in use and WT=0 this will eventually cause a STREAM FIFO overflow. Setting 0 on the FRAMEIDGEN bit resets the generated frame ID counter to 0 for the next time FRAMEIDGEN is set. There is one FRAMEIDGEN bit per VC. This is an array of six identical register entries; the register fields below apply to each entry. Full register list is: VI_CSIMUX_CONFIG_STREAM_<i>, among which <i> belongs to <0..5>.
- Offset: 0x1109,..,0x110e
- Byte Offset: 0x4424,..,0x4438
- Read/Write: See table below
- Parity Protection: See table below
- Shadow: N
- SCR Protection: 0
- Reset: 0x0X400000 (0bxx00,000x,0100,0000,0000,0000,0000,0000)
- Bit
R/W
- Parity Protection
- Reset
- Description

