# 0 :0 0: PPC derived from data-type 1: PPC from NVCSI-to-VI packet

##### 7.2.2.2.2 CHANSEL
CHANSEL is a pattern-matching engine wired up to a priority encoder. Each channel also has a small amount of configuration state associated with it. The matching engine is capable of matching on: input stream ID, virtual channel ID, data-type, and frame ID. (Frame ID is specified as a field and mask to permit matching on every nth frame, for n as a power of 2.) As described previously, CHANSEL can match any number of channels on an input packet from NVCSI. The rules for matching are as follows:
- An NVCSI packet that is an FS or FE matches all channels that have a matching input stream
ID, virtual channel ID, and frame ID. The data-type match is ignored for FS or FE packets. The packet is then broadcast down the pipeline as an NVCSI FS/FE packet.
- An NVCSI packet that contains pixels with an embedded data data-type matches the first
channel that has a matching input stream ID, virtual channel ID, and frame ID. The data-type match is ignored for embedded data packets. (For clarity, pixel data or embedded data can only be transmitted down one VI channel at a time: if a packet matches multiple channels, then the lowest-numbered channel takes precedence.) Embedded data packets use the embedded data line counter to determine when ATOMP shall send an "embedded data complete" notification.
- An NVCSI packet that contains pixels with any other data-type matches the first channel
that has a matching input stream ID, virtual channel ID, frame ID, and data-type. Data packets use the height counter to determine when an EOF is generated in the pipeline; their widths are also validated, and an optional number of pixel packets are skipped at the beginning of each line.
- If the first nonembedded data packet after an NVCSI FS packet from an input stream does
not match any channels at all, a "no-match" notification is emitted from CHANSEL.

- Video Input (VI)
The configuration state contains a width and height to permit CHANSEL to generate notifications for and discard frames that have incorrect sizes, and to set control registers within the pipeline at the beginning and end of lines and frames. CHANSEL also has counters for embedded data and not only pixel data.
- DOL Header Match Mode
Some multiexposure sensors prepend a four-pixel header to each line with a "line information" word describing which lines belong to which exposures. To permit the remainder of the VI pipeline to appropriately route data based on these exposures, CHANSEL has a DOL header match mode. At the beginning of each line a selectable pixel from the first pixel packet is latched and is referred to for the rest of the line; this pixel is the DOL header. All 16 bits of the first pixel are stored and matched on, but the DOL header often appears as follows: Bit 4 of the first pixel in the line is a frame number identifier (FSET). Bits 3 through 0 of the first pixel in the line are a one-hot encoding of which exposure the line represents (FID3-FID0). The user should note that in this mode, output data still includes the line information pixels that are cropped at ISP as necessary. Note: DOL header mode is defined only for RAW6 through RAW14 modes.
- Notifications
CHANSEL emits a handful of notifications. The normal notifications are start-of-frame and end-of- frame (as well as embedded data start-of-frame and end-of-frame), and a line timer notification. CHANSEL also emits two classes of error notifications: channel-specific faults (i.e., faults that apply to exactly one channel, and happen because of data that have been received in the channel), and many-channel faults (i.e., faults that can apply to zero, one, or many channels). The notifications are as described below:
- PXL_SOF / PXL_EOF / EMBED_SOF / EMBED_EOF (normal) are emitted under their
eponymous conditions. NLINES (normal) is emitted when the LINE_TIMER expires.
- FAULT / FAULT_FE (one-channel fault) is a master bitmask notification emitted when a data-
specific fault occurs on a channel. (The _FE version is emitted when CHANSEL is forced to insert an FE packet to terminate a frame; this can happen, for instance, during a channel reset.)
- NOMATCH (many-channel) is emitted because of the "no-match" condition described
preceding.
- COLLISION (many-channel) is emitted when a start-of-frame matches a channel that is
already in frame. "Stale frame" errors also appear through a COLLISION notification, but in a separate payload field; they occur for frames that did not receive a LOAD command before an FS packet arrived.

- Video Input (VI)
- SHORT_FRAME (many-channel) is emitted when a Frame End appears from NVCSI before the
normal number of pixels has appeared (or when zero pixels have appeared, and therefore no channel could be selected). An additional payload field indicates that too few embedded lines have been received.
- LOAD_FRAMED (many-channel) is emitted when a LOAD command is received for a channel
while that channel is currently in a frame. The FAULT and FAULT_FE notifications deserve slightly more explanation. The faults that CHANSEL can detect are: {PIXEL,EMBED}_MISSING_LE: Two line-start packets were detected without a line-end packet between them. {PIXEL,EMBED}_RUNAWAY: More lines were received than expected. {PIXEL,EMBED}_SPURIOUS: A pixel data packet was received without a line-start packet first. {PIXEL,EMBED}_LONG_LINE: More pixels (or embedded data bytes) were received than expected in a line. PIXEL_SHORT_LINE: Fewer pixels were received than expected in a line.
- EMBED_INFRINGE: Embedded data was received on a frame for which no embedded data was
expected. Note that in such a case, the embedded data is still sent to downstream VI units.
- DTYPE_MISMATCH: The pixel data-type changed in the middle of the line (or there is another
data-type error). FORCE_FE: CHANSEL needed to force a frame to end for some reason.
- Programming Notes
Note that both FRAME* and CROP* registers exist; but pixels are no longer transmitted after CROP, but the actual frame size is compared against FRAME_X.WIDTH. Therefore, if the line from the sensor is longer or shorter than _FRAME_X.WIDTH, an error is generated; if the line width is exactly _FRAME_X.WIDTH, a line of _CROP_X.WIDTH is output downstream. (This allows support for sensors that generate CSI padding pixels.) Note also that _CROP_X is specified in pixels, although _SKIP_X is specified in packets. If _CROP is longer than the image size, this is not an error; however, the appropriate sizes must be programmed into OUT* to ensure consistent behavior. Note that _EMBED_Y.EXPECT does not control whether data is transmitted downstream, although _EMBED_Y.LINES and _EMBED_Y.ENABLE do. This means that even if EXPECT is set to 0, it is still possible that an embedded data line can travel downstream to ATOMP, which proceeds to write it out, if ENABLE is set. If ENABLE is unset, but EXPECT is set, then notifications are still generated for missing embedded data, but no atoms are generated for PIXFMT or ATOMP. The _FLUSH and _LINE_TIMER registers are very similar; they differ in their behavior when the timer is triggered. A line timer event results only in a notification, intended for software to timestamp a specific line, and react. This may be valuable in triggering an external flash or focuser at a particular point in the image scanout. By comparison, a flush event sends a request to ATOMP to flush out all lines that have accumulated until this point, and to provide a write acknowledgment when they have been written to memory; this allows "early start" processing on a GPU (or other external

- Video Input (VI)
chunking-capable engine). The flush event is restricted to lines within the crop region, whereas the line timer is usable outside of the crop. (Lines are numbered from 1 in these registers.) To better support subframe processing, the _FLUSH_FIRST and _LINE_TIMER_FIRST registers are introduced. These exist because subframe processing requires overfetch regions, and so the first sub-frame must wait for more data to be written than the following subframes.
**Figure 7.12 FLUSH/LINE_TIMER**
Finally, there are some additional considerations when using interleaving multiple data-types on a single channel. Data-type interleaving is not permitted for data-types that toggle between eight PPC and four PPC lines, such as the YUV420 10-bit modes. The data-type override should not be programmed to a user data-type, since a default path in PIXFMT does not exist to write those data- types out. When data-type interleaving is in use, all data-types have the same line width; if they do not, the maximum line width is programmed into _FRAME_X.WIDTH, and PIXEL_SHORT_LINE faults are masked off. Lastly, the _FRAME_Y.HEIGHT register is programmed to the total number of lines expected across all data-types sent to a channel.
##### 7.2.2.2.3 Channel Programming Model
VI provides a double-buffered per-channel control scheme as its primary programming model. Each channel in VI has two sets of registers exposed–an active set and a shadow set. All registers that are marked as (paged) exist twice per channel; the register VI_CHANSEL_PARAM_SIZE exists internally as VI_CHANSEL_PARAM_SIZE_0, VI_CHANSEL_PARAM_SIZE_0_NS,
- VI_CHANSEL_PARAM_SIZE_1, VI_CHANSEL_ PARAM_SIZE_1_NS, and so on. Each channel is
configured through a control register, VI_CHANNEL_CONTROL, which is programmed as described in the table below. For debugging purposes, the CHANNEL_COMMAND interface presents the RD_MUX_SEL and WR_ACT_SEL registers that allow direct access to the active register set; these registers should never be enabled in normal operation.

- Video Input (VI)
- Table 7.19 Channel Control Register
- Register
- Field
- Bits
- Reset
- Description
- VI_CHn ENABLE _(per-channel,
but does not have shadow copy).
- ENABLE

