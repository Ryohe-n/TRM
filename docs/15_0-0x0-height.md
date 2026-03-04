# 15 :0 0x0 HEIGHT:

- Line Height of cropped frame at output of chansel, if 0x0 then 2^16
- VI_CH35_NOTIFY_MASK_0
- Offset: 0x6319
- Byte Offset: 0x18c64
- Read/Write: R/W
- Parity Protection: Y
- Shadow: Y
- SCR Protection: 0
- Reset: 0x00000000 (0b0xxx,xxxx,x000,0000,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description
0x0 DTYPE_MISMATCH:
- Data type mismatch: switched type during line, non-overriden user type
or bad pixel enables
- Embepdded data byte related events
0x0 EMBED_INFRINGE:
- Unexpected embedded data in frame
0x0 EMBED_LONG_LINE:
- Extra bytes on line
0x0 EMBED_SPURIOUS:
- Embedded bytes found between line start and line end
0x0 EMBED_RUNAWAY:
- Too many embeded lines in frame
0x0 EMBED_MISSING_LE:
- Two embedded line starts without a line end in between
0x0 EMBED_EOF:
- Last byte of embedded data
0x0 EMBED_SOF:
- First byte of embedded data
- Pixel data related events
0x0 PIXEL_LINE_TIMER:
- Line counting event, see LINE_TIMER register
0x0 PIXEL_SHORT_LINE: A line has fewer pixels than expected width 0x0 PIXEL_LONG_LINE: A line has more pixels than expected width, pixels dropped 0x0 PIXEL_SPURIOUS: A pixel found between line end and line start markers, dropped

- Video Input Channels 21-35 Registers
- Bit
- Reset
- Description
0x0 PIXEL_RUNAWAY:
- Too many pixel lines in frame, extra lines dropped
0x0 PIXEL_MISSING_LE:
- Two lines starts without a line end in between
0x0 PIXEL_EOF:
- Last pixel of frame
0x0 PIXEL_SOF:
- First pixel of frame
- VI_CH35_NOTIFY_MASK_XCPT_0
- Events that can occur on zero, one or more streams at once (exceptions)
- If a NOMATCH occurs concurrently to a LOAD_FRAMED, the NOMATCH is reported embedded to
LOAD_FRAMED. The expected use of NOMATCH is for debug purposes.
- If a LOAD_FRAMED occurs simultaneous to a SHORT_FRAME or COLLISION fault then the LOAD
FRAME notification will be embedded on the payload of the SHORT_FRAME notification. To mask NOMATCH it suffices to program the mask on any single channel.
- Offset: 0x631a
- Byte Offset: 0x18c68
- Read/Write: R/W
- Parity Protection: Y
- Shadow: Y
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000,0000)
- Bit
- Reset
- Description
0x0 NOMATCH:
- Do not report on pixel preceeded by a valid frame start but for which no
channel matches 0x0 EMBED_OPEN_LINE:
- Frame end occurred while still processing embedded byte line
0x0 PIXEL_OPEN_LINE:
- Frame end (FE) occurs while still processing a pixel line
0x0 FORCE_FE:
- Pixels stopped, an FE was forced due to a latent LOAD event (see
EARLY_ABORT). 0x0 STALE_FRAME:
- Do not report on channels that did not receive a LOAD prior to each
frame start (FS)

- Video Input Channels 21-35 Registers
- Bit
- Reset
- Description
0x0 COLLISION:
- Do not report on frames that match a channel already processing
another frame 0x0 EMPTY_FRAME:
- Do not report on frames without any pixels
0x0 EMBED_SHORT_FRAME:
- Do not report on frames that have received partial embedded data
0x0 PIXEL_SHORT_FRAME:
- Do not report on frames that have received partial pixels
0x0 LOAD_FRAMED:
- Do not fault on LOAD that occur while in frame
- VI_CH35_FRAME_SOURCE_0
- Non-Secure Register Indicating Status of last frame seen on channel
Status of current or last frame seen. IN_FRAME bit determines if the frame is current or has elapsed.
- Offset: 0x631b
- Byte Offset: 0x18c6c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0XXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X IN_FRAME:
- In frame status
X VPR:
- VPR status of frame

