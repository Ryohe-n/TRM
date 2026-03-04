# 256 Bytes aligned.

- For NewBlit and TNR3 work mode, actual_stride_in_bytes for luma and
chroma surface should also be one tile's pixel width aligned.
- For PL, SrcSfcLumaHeight and SrcSfcChromaHeight should be 4 pixel
aligned.
- For BL, SrcSfcLumaHeight and SrcSfcChromaHeight should be GOB
height aligned.
- For NewBlit and TNR3 work mode, SrcSfcLumaHeight and
SrcSfcChromaHeight should also be one tile's pixel height aligned.
- SourceRectLeft
- SourceRectRight
- SourceRectTop
- SourceRectBottom
SourceRectLeft and SourceRectTop should be even number. SourceRectWidth and SourceRectHeight should be even number. SourceRect should be within SRC image region.
- DestRectLeft
- DestRectRight
- DestRectTop
- DestRectBottom
DestRectLeft and DestRectTop should be even number. DestRectWidth and DestRectHeight should be even number. DestRect should be within dest surface region. DestRectWidth, DestRectHeight should be larger than 64x16. DestRectWidth, DestRectHeight should be smaller than 16. DestRectRight and DestRectBottom should be smaller than 16k.
- DestSfcLumaWidth
- DestSfcLumaHeight
- DestSfcChromaWidth
- DestSfcChromaHeight
actual_stride_in_bytes for luma and chroma surface should be one tile's pixel width aligned.
- Actual_DestSfcLumaHeight and Actual_DestSfcChromaHeight should
be one tile's pixel height aligned.
- For BL, Actual_DestSfcLumaHeight and Actual_DestSfcChromaHeight
should be GOB height aligned.
- SubFrameRectTop
- SubFrameRectBottom
SubFrameRectTop should be always 32-pixel height aligned. SubFrameRectBottom should be 32-pixel height aligned.
- Valid lines in each subframe >= 32
- SparseWarpMapWidth
- SparseWarpMapHeight
- SparseWarpMapStride
- Actual SparseWarpMapHeight should cover DestRect's tile-aligned
region.
- Ex: DestRectBottom = 1079, DestRectTop = 0, log2VerSpace_0 = 2
- SparseWarpMapHeight + 1 = (ALIGNUP (1079–0+1, 16) >> 2) + 1
Actual_stride_in_bytes should be 64 Bytes aligned. Different regions don't share any control points in sparse warp map.
- MaskBitMapWidth
- MaskBitMapHeight
- MaskBitMapStride
- MaskBitMapWidth and MaskBitMapHeight should be related to
DestRectWidth and DestRectHeight. MaskBitMap Surface Stride should be one tile line (128 Bytes) aligned.

- VIC Programming Guidelines
- Class parameter
- Constraints
- XSobelWidth
- XSobelHeight
- XSobelStride
- DSStride
- XSobelWidth and XSobelHeight should be related to DestRectWidth
and DestRectHeight. XSobelStride and DSStride should be 256 Bytes aligned.
- Xsobel and DS surface height should be one tile's pixel height aligned,
and for BL, they should be also GOB height aligned.
#### 7.3.2.8 Program Guideline
- The BlockLinear layout is the recommended setting for DestBlkKind, XSobelBlkKind, and
XSobelDSBlkKind because of memory access bandwidth efficiency.
##### 7.3.2.8.1 Method Interface
- VIC has its own class definition, which include registers named METHOD_OFFSET and
- METHOD_DATA that are interpreted by the THI and are used to create method writes
(corresponding to methods in the VIC class specification) into the VIC. These methods are used to set up pointers to the various surfaces that the VIC needs to read or write, as well as pointers to config structures needed. The VIC class also defines trigger methods such as Execute(), used to start the actual processing of the data for the next output image.
- Address
- Method
- Comment
0x0100
- VIC.Nop
0x0140
- VIC.PmTrigger
0x0200
- VIC.SetApplicationID

