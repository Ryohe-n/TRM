# 0 : Disable, normal mode 1: Enable

- HorRegionNu
m fixed<0, 2,0> Horizontal region number: 0: 1 horizontal region 1: 2 horizontal regions 2: 3 horizontal regions 3: 4 horizontal regions
- VerRegionNu
m fixed<0, 2,0> Vertical region number: 0: 1 vertical region 1: 2 vertical regions 2: 3 vertical regions 3: 4 vertical regions log2HorSpac e_0 fixed<0, 3,0> log2 value of Horizontal spacing factor; log2 value of Vertical spacing factor. Horizontal or Vertical Space size in one patch of one region: 3'b0: 1 pixel (full warp map) 3'b1: 2 pixels (half warp map) 3'b2: 4 pixels (quad warp map) 3'b3: 8 pixels 3'b4: 16 pixels 3'b5: 32 pixels 3'b6: 64 pixels 3'b7: 128 pixels log2VerSpac e_0 fixed<0, 3,0> log2HorSpac e_1 fixed<0, 3,0> log2VerSpac e_1 fixed<0, 3,0> log2HorSpac e_2 fixed<0, 3,0> log2VerSpac e_2 fixed<0, 3,0> log2HorSpac e_3 fixed<0, 3,0> log2VerSpac e_3 fixed<0, 3,0> horRegionWi dth_0 fixed<0, 14,0>
- Horizontal Region width minus 1

- VIC Programming Guidelines
- Name
- Data
- Type
- Offs
et
- Notes
horRegionWi dth_1 fixed<0, 14,0> horRegionWi dth_2 fixed<0, 14,0> horRegionWi dth_3 fixed<0, 14,0> verRegionHei ght_0 fixed<0, 14,0>
- Vertical Region height minus 1
verRegionHei ght_1 fixed<0, 14,0> verRegionHei ght_2 fixed<0, 14,0> verRegionHei ght_3 fixed<0, 14,0>
- IPT_M11
fixed<0, 32,0> Inverse Perspective Transform 3x3 Matrix M IPT matrix coefficients.
- IEEE754 float point compliant format: 1S + 8E + 23F
[ M11, M12, M13 ] [ M21, M22, M23 ] [ M31, M32, M33 ]
- IPT_M12
fixed<0, 32,0>
- IPT_M13
fixed<0, 32,0>
- IPT_M21
fixed<0, 32,0>
- IPT_M22
fixed<0, 32,0>
- IPT_M23
fixed<0, 32,0>
- IPT_M31
fixed<0, 32,0>
- IPT_M32
fixed<0, 32,0>
- IPT_M33
fixed<0, 32,0>
- SourceRectL
eft fixed<0, 14,0>
- The source rectangle defines the region of pixels that are read from the source
surface. Any pixel data outside of this is not used inside VIC but might still be read.
- SourceRectRi
ght fixed<0, 14,0>
- SourceRectT
op fixed<0, 14,0>

- VIC Programming Guidelines
- Name
- Data
- Type
- Offs
et
- Notes
- SourceRectB
ottom fixed<0, 14,0>
- SrcImgWidth
fixed<0, 14,0>
- Source image width minus 1 in pixel unit
- SrcImgHeigh
t fixed<0, 14,0>
- Source image height minus 1 in pixel unit
- SrcSfcLuma
- Width
fixed<0, 14,0>
- Source Surface Luma Stride
- Actual_stride_in_bytes = (SrcSfcLumaWidth + 1) * 64 Bytes
- For PL: Actual_stride_in_bytes should be 256 Bytes aligned
- SrcSfcLuma
- Height
fixed<0, 14,0>
- Source Surface Luma Height minus 1
- SrcSfcChrom
aWidth fixed<0, 14,0>
- Source Surface Chroma Stride
- Actual_stride_in_bytes = (SrcSfcChromaWidth + 1) * 64 Bytes
- For PL: Actual_stride_in_bytes should be 256 Bytes aligned
- SrcSfcChrom
aHeight fixed<0, 14,0>
- Source Surface Chroma Height minus 1
- DestRectLeft
fixed<0, 14,0>
- DestRect indicates destination frame resolution and location in the destination
surface
- Dest Frame_width = DestRectRight – DestRectLeft + 1
- Dest Frame_height = DestRectBottom – DestRectTop + 1
- DestRectRig
ht fixed<0, 14,0>
- DestRectTop
fixed<0, 14,0>
- DestRectBot
tom fixed<0, 14,0>
- SubFrameRe
ctTop fixed<0, 14,0> SubFrameRect resolution:
- The value is related to DestRectTop. SubFrameRectTop and SubFrameRectBottom
should be within 0 and Dest Frame_height-1
- SubFrameRe
ctBottom fixed<0, 14,0>
- DestSfcLuma
- Width
fixed<0, 14,0>
- Dest Surface Luma Stride
- Actual_stride_in_bytes = (DestSfcLumaWidth + 1) * 64 Bytes
- Actual_stride_in_bytes should be one tile aligned
- DestSfcLuma
- Height
fixed<0, 14,0>
- Destination Surface Luma Height minus 1
- Actual_DestSfcLumaHeight = DestSfcLumaHeight + 1
- Actual_DestSfcLumaHeight should be one tile aligned
- DestSfcChro
maWidth fixed<0, 14,0>
- Dest Surface Chroma Stride
- Actual_stride_in_bytes = (DestSfcChromaWidth + 1) * 64 Bytes
- Actual_stride_in_bytes should be one tile aligned
- DestSfcChro
maHeight fixed<0, 14,0>
- Destination Surface Chroma Height minus 1
- Actual_DestSfcChromaHeight = DestSfcChromaHeight + 1
- Actual_DestSfcChromaHeight should be one tile aligned

- VIC Programming Guidelines
- Name
- Data
- Type
- Offs
et
- Notes
- SparseWarp
- MapWidth
fixed<0, 14,0>
- SparseWarpMap horizontal control point number minus 1
- SparseWarp
- MapHeight
fixed<0, 14,0>
- SparseWarpMap vertical control point number minus 1
- SparseWarpMapHeight + 1 should cover DestRect's tile-aligned region
- Ex: DestRectBottom = 1079, DestRectTop = 0, log2VerSpace_0 = 2
- SparseWarpMapHeight + 1 = (ALIGNUP(1079–0+1, 16) >> 2) + 1
- SparseWarp
- MapStride
fixed<0, 14,0>
- SparseWarpMap Surface Stride (control points line)
- Actual_stride_in_bytes = (SparseWarpMapStride + 1) * 64 Bytes
- MaskBitMap
- Width
fixed<0, 14,0>
- MaskBitMap horizontal pixel number minus 1, related to DestRect
- MaskBitMap
- Height
fixed<0, 14,0>
- MaskBitMap vertical pixel number minus 1, related to DestRect
- MaskBitMap
- Stride
fixed<0, 14,0>
- MaskBitMap Surface Stride: (one tile line, 128 Bytes per tile)
- Actual_stride_in_bytes = (MaskBitMapStride + 1) * 64 Bytes
- XSobelWidth
fixed<0, 14,0>
- XSobel output gradient image width minus 1
- XSobelHeigh
t fixed<0, 14,0>
- XSobel output gradient image height minus 1
- XSobelStride
fixed<0, 14,0>
- Xsobel Gradient Surface Stride (pixel line)
- Actual_stride_in_bytes = (XSobelStride + 1) * 64 Bytes
- DSStride
fixed<0, 14,0>
- Xsobel Gradient downsample Surface Stride
- Actual_stride_in_bytes = (DSStride + 1) * 64 Bytes
- XSobelTopOf
fset fixed<0, 32,0>
- PP Top Offset in the neighbor surface (Left Buffer + Top buffer)
maskY fixed<0, 16,0>
- Masked default color Y component (MSB aligned)
maskU fixed<0, 16,0>
- Masked default color U component (MSB aligned)
maskV fixed<0, 16,0>
- Masked default color V component (MSB aligned)
#### 7.3.2.4 Application Methods
The VIC application method registers are accessed directly by the driver. Because the VIC uses the shared MSDEC Falcon OS, two ranges of methods are used (in the MSDEC, there are common and application specific ranges). The range of method registers is: 0x100-0x6FF, 0x1114, (OS methods range) 0x700-0x7FF (APP common method range) 0x1200-0x17FF (method range corresponding to microcode overlay 1)

- VIC Programming Guidelines
- VIC has its own class definition, which include registers named METHOD_OFFSET and
- METHOD_DATA that are interpreted by the THI and are used to create method writes
(corresponding to methods in the VIC class specification) into the VIC. These methods are used to set up pointers to the various surfaces that the VIC needs to read or write, as well as pointers to config structures needed. The VIC class also defines trigger methods such as Execute(), used to start the actual processing of the data for the next output image.
- Table 7.88 Method Mapping
- Address
- Method
- Comment
0x0100
- VIC.Nop
0x0140
- VIC.PmTrigger
0x0200
- VIC.SetApplicationID

