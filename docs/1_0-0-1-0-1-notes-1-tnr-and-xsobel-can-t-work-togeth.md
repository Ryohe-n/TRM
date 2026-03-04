# 1 /0 0/1 0/1 Notes: 1. TNR and Xsobel can't work together. 2. MaskBitMap must work together with Rectify or LDC. 3. IPTBlit mode means Rectify work mode with Identity IPT matrix coefficients.

- Table 7.91 Supported Pixel Format For Different Work Modes
- Pixel Format
- New Blit
- Rectify/LDC
- TNR3
- Rectify/LDC+TNR3
T_R8 Y Y T_Y8___V8U8_N444 Y T_Y8___V8U8_N422 Y Y T_Y8___V8U8_N420 Y Y Y Y T_R16 Y Y T_Y16___V16U16_N444 Y T_Y16___V16U16_N422 Y Y T_Y16___V16U16_N420 Y Y T_Y10___V10U10_N420 (YUV420 semi-planar) Y Y Y Y T_Y12___V12U12_N420 (YUV420 semi-planar) Y Y Y Y T_Y8_U8__Y8_V8 (YUV422 packed) (YUY2/YUYV) Y Y T_U8_Y8__V8_Y8 (YUV422 packed) ( UYVY) Y Y T_Y8__U8__V8_N420 (YUV420 planar, YV12) Y Y T_Y10__U10__V10_N420 (YUV420 planar) Y Y T_Y12__U12__V12_N420 (YUV420 planar) Y Y

- VIC Programming Guidelines
Notes: T_Y8__V8U8_N444, T_Y16__V16U16_N444 can use IPTBlit mode.
- Table 7.92 Parameter Constraint Table
- Class parameter
- Constraints
horRegionWidth_0/1/2/3 verRegionHeight_0/1/2/3 horRegionWidth must be the multiple of 64 pixels expect the most right valid region. verRegionRegion must be the multiple of 16 pixels expect the most bottom valid region.
- Sum of all valid horRegionWidth and verRegionHeight should be equal
to DestFrame_Width and DestFrame_Height
- SrcImgWidth
- SrcImgHeight
SrcImgWidth plus 1 and SrcImgHeight plus 1 should be even number. SrcImgWidth and SrcImgHeight should be larger than 64x16. SrcImgWidth and SrcImgHeight should be larger than 16384x16384.
- SrcSfcLumaWidth
- SrcSfcLumaHeight
- SrcSfcChromaWidth
- SrcSfcChromaHeight
- For BL, actual_stride_in_bytes for luma and chroma surface should be

