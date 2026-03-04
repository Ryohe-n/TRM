# 2 x 2 Static and Dynamic Dither

- Round-to-nearest (12 bpc output supported with this mode)
- Chroma Low-Pass filter (to facilitate 422 output)
- Programmable output CSC matrix
- Overscan border is added when the output viewport is smaller than the active raster region
- Programmable range clamping before output
- Display Stream Compression (DSC) v1.2a
- RGB444/YCbCr444 input at 8/10/12bpc
6bpp-32bpp output pixel depth with 1/16bpp precision 1, 2, 4 slices per line
- Max line width: 5120
- Max pclk with DSC: same as max pclk

