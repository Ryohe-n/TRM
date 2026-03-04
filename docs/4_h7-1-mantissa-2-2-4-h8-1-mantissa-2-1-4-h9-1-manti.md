# 4 'h7 +1.mantissa * 2-2 4'h8 +1.mantissa * 2-1 4'h9 +1.mantissa 4'hA -1.mantissa * 2-4 4'hB -1.mantissa * 2-5 4'hC -1.mantissa * 2-6 4'hD -1.mantissa * 2-7 4'hE -1.mantissa * 2-8 4'hF -0.mantissa * 2-8 (denorm)

- RAW24 Support
- RAW24 is not a native data type defined in MIPI CSI-2 spec. To support uncompressed 24-bit
precision data, some sensors like Sony IMX490 splits each single 24-bit pixel to two 12-bit pixels to transmit them in RAW12 style on CSI-2 protocol. The 24-bit RAW data can be saved to memory in three options:
- Memory format
- BPP
- Description
- New/Legacy
T_R16_X_ISP24
- ISP private floating point for 24-bit precision
data
- New
T_R24
- ISP private 0.24 fixed-point format
- New
T_R32
- Legacy 0.32 fixed-point format
- Legacy
- RAW Padding Mode
Besides default MSB replication mode, VI6 adds other padding options on RAW8/10/12/14/20/24 to T_16/T_R32 conversion, as listed below.

- Video Input (VI)
- Register
- Field
- Bit
s
- Res
et
- Description
- VI_CH*_PIXFMT_FORM
- AT_0
T_R16_R32_PAD0_
- EN
- Control conversion rule for RAW8/10/12/14->T_R16;
- RAW20/24->T_R32;
Should be 0 in non T_R16/T_R32 case. 0: Legacy mode: MSB replication on LSB 1: Data is right aligned, with MSB padded with 0 2: Data is left aligned, with LSB padded with 0 3: Reserved The output RAW image can still be processed by ISP when PAD0_EN is set to 1 or 2 with T_R16 / T_R32 format, but it requires ISP being programmed in same PAD_EN mode to let MR convert the data back for further processing,
- RGB Memory Formats
- RGB data comes from NVCSI in one of several possible formats and VI provides a handful of
options for sending the data to system memory. In VI, the input modes are decoupled from the output modes; when insufficient bits of data exist to fill out a channel, the MSBs are replicated into the LSBs, and when too much precision exists, the LSBs are truncated. Additionally, VI provides a luminance output format, which multiplies through by a matrix. The input data formats and output data formats are shown below.
- Table 7.22 RGB Formats from NVCSI
- CSI Format
- RGB444
- RGB555
- RGB565
- RGB666
- RGB888
- Table 7.23 RGB Formats Supported by VI
- Memory Format
- BPP
T_A1B5G5R5 T_A1R5G5B5 T_B5G5R5A1 T_R5G5B5A1 T_R5G6B5 T_B5G6R5

- Video Input (VI)
- Memory Format
- BPP
T_A4B4G4R4 T_A4R4G4B4 T_B4G4R4A4 T_R4G4B4A4 T_A8R8G8B8 T_A8B8G8R8 T_R8G8B8A8 T_B8G8R8A8 T_A2R10G10B10 T_A2B10G10R10 T_R10G10B10A2 T_B10G10R10A2
**Figure 7.17 RGB Bit Depth Conversion**

- Video Input (VI)
- YUV Memory Formats
VI also supports YCbCr / YUV formats. No support is provided for interpolating or decimating chroma data; users of that functionality need to process through ISP or through VIC. Non-planar, semi-planar, and fully planar formats are both available for 8-bit modes and 10-bit modes. Only 16- bit padded "inefficient" modes are supported in 10-bit YUV mode; more efficient memory capture can be provided with the YUV compression built into ISP. YUV capture modes are as shown in the table below.
- Table 7.24 YUV Modes
- CSI Format Name
- Pixel Formats in Memory
bpp (per plane)
- Notes
- YUV422 8-bit
T_R8 Y component only T_Y8_U8_Y8_V8 ; T_Y8_V8
- Y8_U8 ; T_U8_Y8 V8_Y8;
T_V8_Y8_U8_Y8
- YUV packed
T_Y8___U8V8_N422
- Semi-planar; Y+UV
T_Y8___V8U8_N422
- Semi-planar; Y+VU
T_Y8__U8__V8_N422
- Planar
- YUV422 10-bit
T_R8 Y component only T_Y8_U8_Y8_V8 ; T_Y8_V8
- Y8_U8 ; T_U8_Y8 V8_Y8 ;
T_V8_Y8_U8_Y8
- YUV packed
T_Y8___U8V8_N422
- Semi-planar; Y+UV
T_Y8___V8U8_N422
- Semi-planar; Y+VU
T_Y8__U8__V8_N422
- Planar
T_Y10___U10V10_N422
- Semi-planar; Y+UV
T_Y10___V10U10_N422
- Semi-planar; Y+VU
T_Y10__U10__V10_N422
- Planar
- YUV420 8-bit legacy
T_R8 Y component only
- YUV420 8-bit / 8-bit (CSPS)
T_R8 Y Component only. T_Y8___U8V8_N420
- Semi-planar; Y+UV
T_Y8___V8U8_N420
- Semi-planar; Y+VU
T_Y8__U8__V8_N420
- Planar
- YUV420 10-bit / 10-bit (CSPS)
T_R8 Y Component only. T_Y8___U8V8_N420
- Semi-planar; Y+UV

- Video Input (VI)
- CSI Format Name
- Pixel Formats in Memory
bpp (per plane)
- Notes
T_Y8___V8U8_N420
- Semi-planar; Y+VU
T_Y8__U8__V8_N420
- Planar
T_Y10___U10V10_N420
- Semi-planar; Y+UV
T_Y10___V10U10_N420
- Semi-planar; Y+VU
T_Y10__U10__V10_N420
- Planar
- YUV444 8-bit
n/a n/a
- Does not exist in CSI2
- YUV444 10-bit
n/a n/a
- Does not exist in CSI2
- Format Conversion Constraints
- YUV mode conversions that are permitted are provided preceding. RAW modes that can be
converted are shown in matrix form below. Permissible RGB mode conversions are shown as a matrix in the table below.
- Table 7.25 Matrix of RAW Format Conversions
T_R8 T_R16_I T_R16 T_R32 T_
- R16_F
T_R16_ X_ISP20 T_
- R32_F
T_
- DPCM
T_
- R24
T_R16 _X_ISP24
- RAW6
- Yes
- No
- No
- No
- No
- No
- No
n/a
- No
- No
- RAW7
- Yes
- No
- No
- No
- No
- No
- No
n/a
- No
- No
- RAW8
- Yes
- No
- Yes
- No
- Yes
- Yes
- Yes
n/a
- No
- No
- RAW12
- Yes
- Yes
- Yes
- Yes
- Yes
- Yes
- Yes
- Yes
- No
- No
- RAW14
- Yes
- Yes
- Yes
- Yes
- Yes
- Yes
- Yes
n/a
- No
- No
- RAW16
- No
- No
- Yes
- Yes
- Yes
- Yes
- Yes
- Yes
- No
- No
- RAW20
- No
- No
- Yes
- Yes
- Yes
- Yes
- Yes
- Yes
- Yes
- No
- RAW24
- No
- No
- No
- Yes
- No
- No
- No
- No
- Yes
- Yes
- Table 7.26 Matrix of RGB Format Conversions
T_...444 T_...555 T_...565 T_...888 T_...101010
- RGB444
- Yes
- Yes
- Yes
- Yes
- No
- RGB555
- No
- Yes
- Yes
- Yes
- No
- RGB565
- No
- Yes
- Yes
- Yes
- No
- RGB666
- No
- Yes
- Yes
- Yes
- No
- RGB888
- Yes
- Yes
- Yes
- Yes
- Yes

- Video Input (VI)
##### 7.2.2.2.5 Register Programming
Register programming for PIXFMT is as shown in the table below.
- Table 7.27 PIXFMT Register Programming
- Register
- Field
- Bits
- Rese
t
- Description
- VI_CHn PIXFMT_FORMAT _(paged)
- FORMAT
unde f Pixel memory format for VI channel: T_R8 T_A4B4G4R4 T_A4R4G4B4 T_B4G4R4A4 T_R4G4B4A4 T_A1B5G5R5 T_A1R5G5B5 T_B5G5R5A1 T_R5G5B5A1 T_R5G6B5 T_B5G6R5 T_A8B8G8R8 T_A8R8G8B8 T_B8G8R8A8 T_R8G8B8A8 T_A2B10G10R10 T_A2R10G10B10 T_B10G10R10A2 T_R10G10B10A2 T_Y8_U8__Y8_V8 T_Y8_V8__Y8_U8 T_V8_Y8__U8_Y8 T_U8_Y8__V8_Y8 T_Y8__U8V8_N420 T_Y8__V8U8_N420 T_Y8__U8V8_N422 T_Y8__V8U8_N422 T_Y8_U8_V8_N422 T_Y8_U8_V8_N420
- FORMAT
unde f T_Y10__V10U10_N420 T_Y10__U10V10_N420 T_Y10_U10_V10_N420 T_Y10__V10U10_N422 T_Y10__U10V10_N422 T_Y10_U10_V10_N422 T_R16_ISP T_R16_F T_R16 T_R16_I T_R32 T_R32_F T_DPCM_RAW10 T_DPCM_RAW12 T_DPCM_RAW16 T_DPCM_RAW20
- FORMAT_PDAF
unde f Pixel memory format for PDAF pixels: T_R16_ISP T_R16_F T_R16 T_R32 T_R32_F

- Video Input (VI)
- Register
- Field
- Bits
- Rese
t
- Description
- VI_CHn PIXFMT_WIDE _(paged)
- ENABLE
- Whether to merge adjacent RAW8/RAW10
pixels.
- ENDIAN
- Which order to merge adjacent pixels in. 0 for
big endian, 1 for little endian.
- VI_PIXFMT_COMPAND_KNEE_CF
- G0[0...9]
NOTE: Register is global.
- BASE

