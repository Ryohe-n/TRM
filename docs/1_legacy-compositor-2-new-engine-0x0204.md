# 1 : Legacy compositor 2: New engine 0x0204

- VIC.SetWatchdogTimer
0x0240
- VIC.SemaphoreA
0x0244
- VIC.SemaphoreB
0x0248
- VIC.SemaphoreC
0x024c
- VIC.CtxSaveArea
0x0250
- VIC.CtxSwitch
0x0300
- VIC.Execute
0x0304
- VIC.SemaphoreD
0x0700
- VIC.SetPictureIndex
0x0704
- VIC.SetControlParams
0x0708
- VIC.SetConfigStructOffset
- Class input surface
0x070c
- VIC.SetFilterStructOffset

- VIC Programming Guidelines
- Address
- Method
- Comment
0x0710
- VIC.SetPaletteOffset
0x0714
- VIC. SetHistOffset
0x0718
- VIC.SetContexID
0x071c
- VIC.SetFceUcodeSize
0x0720
- VIC.SetOutputSurfaceLumaOffset
- Output Luma surface
0x0724
- VIC.SetOutputSurfaceChromaU_Offset
- Output chroma U surface
0x0728
- VIC.SetOutputSurfaceChromaV_Offset
- Output chroma V surface
0x072c
- VIC.SetFceUcodeOffset
0x0730
- VIC.SetCrcStructOffset
0x0734
- VIC.SetCrcMode
0x0738
- VIC.SetStatusOffset
0x0800
- VIC.SetSparseWarpMap_Offset
- Sparse warpmap surface
0x0804
- VIC.SetMaskBitMap_Offset
- Mask BitMap surface
0x0808
- VIC.SetXsobelSurface_Offset
- XSobel gradient image surface
0x080c
- VIC.SetXsobelDsSurface_Offset
4x4 downsample image surface 0x0810
- VIC.SetXSobelNeighborBuffer_Offset
- XSobel neighbor buffer
0x0814
- VIC.SetTNR3PrevFrmSurfaceLumaOffset
- TNR previous frame Luma surface
0x0818
- VIC.SetTNR3PrevFrmSurfaceChromaU_Offset
- TNR previous frame Chroma U surface
0x081c
- VIC.SetTNR3PrevFrmSurfaceChromaV_Offset
- TNR previous frame Chroma V surface
0x0820
- VIC.SetTNR3CurAlphaSurfaceOffset
- TNR current alpha surface
0x0824
- VIC.SetTNR3PrevAlphaSurfaceOffset
- TNR previous alpha surface
0x0828
- VIC.SetTNR3NeighborBufferOffset
- TNR neighbor buffer
0x082c
- VIC.SetStatusNotifierInputOffset
- STATUS Notifier Input buffer
0x0830
- VIC.SetStatusNotifierOutputOffset
- STATUS Notifier Output buffer
0x1114
- VIC.PmTriggerEnd
0x1200
- VIC.SetSurface0LumaOffset[0]
- Input Luma surface
0x1204
- VIC.SetSurface0ChromaU_Offset[0]
- Input Chroma U surface
0x1208
- VIC.SetSurface0ChromaV_Offset[0]
- Input Chroma V surface

- VIC Programming Guidelines
##### 7.3.2.8.2 TNR3 Related Class Define
TNR3 uses the same 10-bpp parameter setting for all 8-bit, 10-bit, and 12-bit use cases via internal pixel value normalization as a result of no 12-bpp requirement for deep-color/HDR in IVA/TP market. TNR3 feature related class definitions are as follows:
- Table 7.93 TNR3ConfigParamStruct
- Name
- Data Type
- Off
set
- Notes
- TNR3En
fixed<0,1,0> (1 bit)
- Temporal Noise Reduction (TNR3) enable

