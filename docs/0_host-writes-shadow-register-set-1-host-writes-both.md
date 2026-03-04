# 0 : host writes shadow register set. 1: host writes both shadow and active register sets. For debug use only.

- The AUTOLOAD bit behaves as described, but should be used with caution. Since the autoload
functionality has no provision for error detection and handling, it is generally not the preferred mechanism with which to build a robust system. The primary expected use case for AUTOLOAD is in conditions that require extremely low Vblank times, in which it becomes impossible even for a

- Video Input (VI)
- Falcon to reprogram a channel between frames. Additionally, when a channel is in frame and
enabled, LOAD commands are deferred until the frame completes; this can also be used as an alternative to autoload mode. The SINGLESHOT bit should be set in most use cases. Continuous retriggering of a VI frame, if reprogramming does not complete in time, could result in corrupting an already-completed frame (even though a STALE_FRAME error is generated). As such, STALE_FRAME errors should never be masked in continuous mode since they always indicate that a race between configuration and frame start has occurred.
- Using SINGLESHOT_AUTO and clear SINGLESHOT after shadow registers are programmed is the
preferred programming model in continuous capture mode.
- Initial Programming and Channel Reset
In the ideal case, a VI channel should be enabled before a sensor begins streaming into VI. Failing to do this could result in partial frames being transferred from VI, with a NOMATCH notification from the first pixel after a missing frame-start. In cases in which VI must be started after the sensor has been enabled, the first frame can be treated as an error frame, and the system can begin programming the next frame in the vertical-blanking interval (as determined by the CSIMUX FE event) as usual. The combination of disabling, reloading, and then reenabling a channel functions as a reset for a stuck channel. Transitioning a channel from disabled to enabled is defined as resetting all channel state that is not contained in configuration registers. To reset a channel, follow the following procedure: 1. 2. Disable the channel by clearing CONTROL.ENABLE.
- Issue a LOAD command to the channel. The LOAD operation forces an FE to be sent down the
channel if a frame was open at the time that the channel was disabled.
- If the channel was configured to feed into FMLite, reset FMLite by asserting
VI_FMLITE_VFM_CTRL.TDS_SW_RESET for at least 100 VI clock cycles.
- If appropriate, reconfigure the channel for a new programming, and issue another LOAD
command to the channel. If appropriate, reenable the channel by setting CONTROL.ENABLE. 3. 4. 5.
##### 7.2.2.2.4 PIXFMT
CSI2 provides a very minimal set of pixel formats through the bus interface. VI's PIXFMT module unpacks the input NVCSI pixel formats into formats that are advantageous for the host system to read. The input to PIXFMT is formatted exactly as NVCSI presents it to VI. PIXFMT contains logic to reformat these pixels into the memory output format in preparation for ATOMP, and as such, the output format is designed to be conducive for easy atom packing.

- Video Input (VI)
- Input Data Formats
NVCSI provides input to VI in one of several formats. NVCSI can transmit the following pixel formats with the following bus widths:
- RAW 8ppc: RAW6, RAW7, RAW8, RAW10, RAW12, RAW14, RAW16, embedded-8
- RAW 4ppc: RAW20
- RGB 8ppc: RGB444, RGB555, RGB565
- RGB 4ppc: RGB666, RGB888
- YUV 8ppc: YUV420-8 legacy, YUV420-8 CSPS, YUV422-8
- YUV 4ppc: YUV422-10
- YUV mixed: YUV420-10 CSPS
- Merged RAW Data Input
HDR applications can present linearized wide data in formats that are too wide to transmit over CSI in any native fashion. For instance, in addition to the native CSI RAW16 format, RAW16 can be implemented by merging adjacent RAW8 pixels, and RAW20 is implemented by merging adjacent
- RAW10 pixels. PIXFMT supports this by taking eight PPC packets in these two modes, merging
adjacent pixels, and treating them as four PPC packets. This is controlled by the VI_PIXFMT_WIDE register. Note that VI_PIXFMT_WIDE does not need to be enabled for CSI2 v2.0 native high-bit- depth modes.
- Note that pixel merge is a PIXFMT function, which works behind CHANSEL. CHANSEL functions
related to pixel coordinates, e.g., size checking and cropping, are still regarding to CSI input data format. Functions related to pixel coordinates after PIXFMT merge, for instances PDAF extraction and cropping, are in merged wide data format.
- Companding Module
- Some HDR sensors have modes that compand higher-resolution raw samples. PIXFMT provides a
companding engine with a programmable look-up table, allowing a multitude of sensor modes to be supported. Additionally, since the companding engine supports fractional scale factors, it can be used to expand as well as compress; this allows HDR linear data from a sensor to be converted to compressed-space for processing in ISP. PIXFMT's compand unit implements a piecewise linear function with 10 knee points. All 10 knee points are tested for their base point in parallel, and the lowest matching comparator selects the LUT entry; afterwards, the base is subtracted from the pixel, a scaling function is multiplied in, and an offset is added back in to produce the output. Only one set of compand knee points is supported across all VI channels. However, although all channels share the same companding table, each channel can have companding enabled and

- Video Input (VI)
disabled independently. The compand knee points are defined in the VI_PIXFMT_COMPAND_KNEE_ registers; the compand enable is present in the VI_PIXFMT_ENABLE register. The compand scaling registers are sized to allow for a compression range of 1x to 1/128, and an expansion range of 1x to 1023x. Because this feature supports both expanding and compression, it needs to function on modes from RAW10 all the way out to RAW20. Pixel companding occurs after VI_PIXFMT_WIDE merging and after MSB-repeating; the input format is normalized to RAW20.
- Phase Detect Autofocus Pixel Separation and Replacement
Note: Phase Detect Autofocus (PDAF) on the SoC is limited to channels 0 through 11. PIXFMT provides support for extracting individual pixels out of a frame. This support exists to assist PDAF algorithms that need to read specific pixels in order to do their work, but that do not wish to decode an entire DPCM stream. PIXFMT's PDAF support operates on a bitmap grid of 32 x 32 pixels, tiled over the surface of the image sensor.
**Figure 7.13 Example PDAF Pattern**

- Video Input (VI)
Some applications may wish to also dump out surrounding pixels–for instance, for a correlation on known neighbors, rather than a simple correlation on phase-detect pixels alone. This can be accomplished by setting additional bits in the bitmap corresponding to the neighboring pixels. To avoid a memory traffic amplification that would overwhelm the advantages from DPCM compression, the PDAF separator includes a crop operation, so that the algorithm can request only a small focus region of interest.
- Pixels chosen by the PDAF separator are output both to the main output surface (which may
include DPCM compression) and to the secondary output surface (i.e., the surface that UV or U output would be applied to). In PDAF mode, the secondary surface does not have a line stride, and outputs all captured pixels in one linear range. Optionally, the PDAF mode can override phase- detect pixels sent to the main output surface with a fixed value; doing so assists SAPOR in correcting away PDAF pixels, if they otherwise would be too close to valid-appearing neighbors. Pixels sent through the PDAF separator must be fully encompassed within the CHANSEL cropping region. When all PDAF data are fully written to the output surface, a PDAF_DATA_DONE notification is generated. The coordinate of the last PDAF pixel is required to help flush buffered PDAF data to memory and generate PDAF_DATA_DONE. The last PDAF pixel coordinate must be valid; i.e., the corresponding PDAF pattern bit must be 1. The coordinates of the last PDAF pixel are programmed through a register. The PDAF separator can be enabled even if PIXFMT is normally disabled. If PIXFMT is disabled, then no pixels are written to the main output surface, but data can still be written to the PDAF output surface. (This behavior is primarily vestigial from when a direct ISP link existed, but may still be useful in specialty applications.) PDAF mode is valid only for RAW pixel types.
- RAW Memory Formats
RAW data is sent to memory in four possible formats (in addition to the DPCM format). The T_R8 format is a classical 8-bit unsigned word format, packing four per 32-bit word. The T_R16 is a 16- bit unsigned word format, packing two per 32-bit word. T_R32 is a left-aligned 0.32 fixed-point format, packing one per 32-bit word. Finally, T_FP32 is an IEEE-754 single-precision floating point format, representing data on the [0,1) interval, also packing one per 32-bit word. The previous format from VI2, in which three 10-bit pixels are packed in a 32-bit word, is now unsupported; users of that application need to use DPCM instead. Both raw image modes either replicate MSBs or truncate LSBs, as needed to fit pixels into the appropriate format. (Concretely, input pixel formats have their MSBs replicated out to full width, and then are truncated down to the desired output pixel format.) Examples of these modes are given in the tables below.
- Table 7.20 RAW Memory Formats
- CSI Format Name
- RAW6

- Video Input (VI)
- CSI Format Name
- RAW7
- RAW8
- RAW10
- RAW12
- RAW14
- RAW16 (CSI native)
- RAW16 (merged)
- RAW20 (CSI native)
- RAW20 (merged)
- RAW24 (merged)
T_R8 bpp T_R8 T_R16_I T_R16 T_R24 T_R32 T_R16_F T_R16_X_ISP20 T_R16_X_ISP24 T_R32_F T_DPCM var.

- Video Input (VI)
**Figure 7.14 T_R16 Format**
**Figure 7.15 T_R16_I Format with Examples for RAW6, RAW10, RAW12, and RAW14**

- Video Input (VI)
**Figure 7.16 T_R8 Format with Examples for 6 through 14-bit RAW Modes**
VI6 has support for ISP6's native floating-point pixel bus format. The ISP's pixel bus format is still a 16-bit format, but increases mantissa precision by two bits, and has slightly reduced dynamic range as compared to IEEE-754 half-precision floating point. ISP6's floating-point pixel bus, when operating in raw pixel mode, has a range of [-0.125, 2.0]. The mantissa is stored in bits [11:0], and the tag (combined exponent and sign) is stored in bits [15:12]; tag value interpretations are given below.
- Table 7.21 ISP Floating Point Tag Representations
D[15:12]
- Interpretation

