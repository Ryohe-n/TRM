# 19 :16 0x0 STREAM_EVENT_MASK: deint_stream_event_mask 15:2 0x0 FRAME_FAULT_MASK: deint_frame_fault_mask 1:0 0x0 FRAME_STATUS_MASK: mask particular status events from being notified

- VI_CSIMUX_CSI_STREAM_0
- STREAM CSI FAULTS (6 registers)
Mask specific bits of the CSI error status so that only some type of errors result in failure. CSIMASK registers are applicable even when deinterleave mode is in use. This is an array of six identical register entries; the register fields below apply to each entry. Full register list is: VI_CSIMUX_CSI_STREAM_<i>, among which <i> belongs to <0..5>.
- Offset: 0x111c,..,0x1121
- Byte Offset: 0x4470,..,0x4484
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description

