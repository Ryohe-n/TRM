# 128 B read request interface

- Response bus is 64 B
Critical watermark to limit buffering when immediate flip is active.
- Defined as a number of lines
- Midframe mclk switch
- Used for DVFS

- Display Controller
- Hardware Performance Monitor support
##### 7.5.1.4.3 Pixel Processing
- Pipeline Depth
- Fixed Point for some stages: 16 bpc, [-1.5,2.5] range (2 range extension bits)
- FP16 for other stages
- Alpha blending
such as full alpha, per-window color key, global alpha alpha blending is always done with FP16 in the linear color domain
- Per Window Processing
- Chroma up-conversion for chroma-decimated YUV formats
- Chroma overfetch
- Multiple per-window CSC matrices

