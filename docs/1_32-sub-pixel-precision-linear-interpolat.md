# 1 /32 sub-pixel precision Linear interpolation for filter-type (detail/noise/normal) and scale ratio (1:1, 2:1, 4:1, 8:1, 16:1) Sub-picture and normal mode for display subtitles as well as menu buttons. -

- Filter override mode with exact filter kernel for the first five slots
- Panoramic scaling for different aspect ratios image conversion
- Detail filter clamping to avoid large ghosting effect
- Sub-pixel source rectangles to smoothly zoom into image portion
- Pixel Format Processing
- Surface format conversion: Example: Pitch Linear -> Block Linear
- Programmable GOB height
- Extensive pixel format support
- - - - - -
- Component number: T_L8 / T_Y8___U8V8
- Color space: AYUV or ARGB
- Bit depths of 8, 10, 12, or 16-bit
- Chroma formats: YUV420, YUV422, or YUV444
- Color gamuts: Rec.2020, Rec.709, or sRGB
- Memory layouts: Planar or Semi-planar
- Pixel format conversion
- - - - - 4x3 matrix multiplication conversion with soft clamping; Example: RGB -> YUV
- Color space conversion; Example: REC2020 -> REC709 -> sRGB
- Different sub-sampled chroma location; Example: (1/2, 1/2) or (0, 1/2)
- Data size conversion with MSB bits replication: RGB565 -> RGB888

