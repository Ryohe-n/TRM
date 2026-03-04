# 4 Pixel/clock throughput

- New
- Bilateral Spatial Filter
- New
- Pixel-wise SAD calculation
- Changed
- Improved SAD-alpha curve
- Changed
- Temporal alpha restrict
- New
- Non-temporal beta blending
- Changed
- Flexible alpha clip for luma and chroma
- Changed
- Flexible alpha-beta curve
- Changed
- Register-level programming
- Changed
- Sub-frame level processing
- New
- Merged LDC_TNR in one pass
- New
- TNR bypass mode
- New
- Table 7.65 Supported Pixel Formats
- Enumerant
- Value
T_Y8_U8__Y8_V8 (YUV422 packed) (YUY2/YUYV) T_U8_Y8__V8_Y8 (YUV422 packed) (UYVY) T_Y8___V8U8_N420 (YUV420 semi-planar) T_Y8__U8__V8_N420 (YUV420 planar, YV12) T_Y10___V10U10_N420 (YUV420 semi-planar) T_Y10__U10__V10_N420 (YUV420 planar) T_Y12___V12U12_N420 (YUV420 semi-planar) T_Y12__U12__V12_N420 (YUV420 planar) Notes:

- Video Image Compositor (VIC)
1. Output format is always same as input format 2. T_Y8__U8__V8_N420 is equal to YV12
- Table 7.66 Surface Memory Format
- Surface Name
- Value
- Pixel image surface
- Pitch Linear / Block Linear (16x2)
- Programmable GOB height
- TNR alpha, top and left data
- Internal work buffer
##### 7.3.1.4.3 16-bit New Pixel Format Scale
Scaling support in the CV pipeline requires 16-bit data format support throughout the VIC scaling pipeline. VIC is used to crop the ROI from the original wide camera to get the DLA network input resolution. For example: 960x540@540fps-Y16 -> VIC -> 224x224@540-Y16 -> DLA (downscale) 192x108@1080fps-Y16 -> VIC -> 224x224@1080-Y16 -> DLA (upscale)
- SubFeature List

