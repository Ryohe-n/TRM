# 31 :16 N 0xff SPARE:

- Spare control bits that are non-shadowed
Y 0x1 POST_RUNAWAY_EMBED: Same as previous field, except for embedded data. Y 0x1 POST_RUNAWAY_PIXEL:
- Always flag a runaway error even a previous type of
error has occurred during frame. A RUNAWAY error occurs when too many lines are detected in the frame.
- Therefore RUNAWAY errors necessarily occur after
- EOF and therefore will not be flagged if another
type of error occurred during the course of frame.
- This field is for non-embeded data runaways. Value
of 1 means always post, 0 only if it is first frame error.
- The disadvantage of turning this feature on is that
it places more pressure on the notification FIFO from CHANSEL. Y 0x0 EARLY_ABORT:
- If LOAD command was received during an on going
frame of an ENABLEd channel then frame is immediately aborted with an FE at the time of the LOAD arrival.
- Otherwise frame is left to finish normally and
shadow operation occurs at FE packet.
- If a channel is disabled when LOAD arrives from
host then this bit is ignored and any ongoing frame would always be aborted. Y 0x0 SINGLESHOT_AUTO: 1 if this channel should automatically set
- SINGLESHOT to 1 when an autoload event occurs
(either AUTOLOAD or deferred-LOAD.) Y 0x0 SINGLESHOT:
- Set to 1, if this channel should automatically set
- ENABLE to 0 when an EOF that
was preceded by an SOF arrives at CHANSEL.
- VI_CH35_MATCH_0
STREAM and VIRTUAL CHANNELS are encoded on a hot bit per stream scheme.
- Example: only STREAM 2 is desired then STREAM =6''b000100 (0x4 or (1U << 2) needs to be
programmed with mask STREAM_MASK=6''b111111 (0x3F or (1U << VI_STREAMS)-1 )
- Offset: 0x6307
- Byte Offset: 0x18c1c
- Read/Write: R/W

- Video Input Channels 21-35 Registers
- Parity Protection: Y
- Shadow: Y
- SCR Protection: 0
- Reset: 0x00003f0f (0bxxxx,xxxx,xxxx,0000,0011,1111,0000,1111)
- Bit
- Reset
- Description

