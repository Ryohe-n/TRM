# 16 /32 in 10-tap case. Therefore, phase 0/32 and 16/32 are folded into the same column. Due to symmetry, we don't need to store base coefficients for phases 17 through 31. VIC also implements 1-tap (nearest-neighbor) and 2-tap (bi-linear) filtering modes. These modes can be used when power and bandwidth are of greater concern than quality. The 1- and 2-tap modes use filter coefficients that are based only on the output pixel phase with respect to the input pixel grid, and do not use the programmable coefficient tables at all. As a result, it doesn't make sense to enable Detail Filtering or Noise Filtering when using these modes.

- Subpixel Source Rectangles
VIC has the ability to specify source rectangles to a sub-pixel resolution. This feature is used in cases requiring a smooth zoom into a portion of an image in real-time, for example when using the zoom button on a camera.
##### 7.3.1.3.7 Video Quality Improve
- De-interlacing
The VIC supports various modes of de-interlacing the input video content such as DiSi1, BOB, and WEAVE. Weave is only used on progressive content or in case inverse telecine detected a cadence.
##### 7.3.1.3.8 Temporal Noise Reduction
- TNR1
VIC has a temporal noise reduction (TNR) algorithm based on a motion adaptive IIR filter, where the filter weight was adapted based on a few constants and the SOS difference between a 3x3 neighborhood of pixels around the current pixel in the current and previous frames. SOS = sum_of_squared_differences between current and prev frame in 3x3 neighborhood.
- If (!denoise || (sos >> (20-deblur_const))!=0) {
alpha = 0; } else { alpha = min(1024, iir - ((iir * sos) >> (20-deblur_const))); } mul = hdr? max(0, min(1024, ((c * hdrm)>>10) + hdrb)) : 1024; alpha = (alpha * mul) >> 10; diffc = fc - c; dc = diffc * diffc; ad = max(4, abs(dc) * ac); max_alpha = la ? 1024 - 4096/ad : 1024;

- Video Image Compositor (VIC)
alpha = min(alpha, max_alpha); out = ((alpha * diffc)>>10) + c; The pixel differences calculated in the above algorithm can be written out as a motion-adaptation buffer to memory for use in the motion-adaptive de-interlacing algorithm (DiSi1).
##### 7.3.1.3.9 Blender
- Blender Configuration
The blender API allows for symmetric blend modes between the VIC and Display units. The VIC blender supports the following different blending modes:
- DXVAHD_ALPHA_FILL_MODE_OPAQUE
- DXVAHD_ALPHA_FILL_MODE_BACKGROUND
- DXVAHD_ALPHA_FILL_MODE_DESTINATION
- DXVAHD_ALPHA_FILL_MODE_COMPOSITED
- DXVAHD_ALPHA_FILL_MODE_SOURCE_ALPHA
- All modes other than _ALPHA_FILL_MODE_COMPOSITED are as defined in the Microsoft DirectX
Video Acceleration 2.0 Enhanced Video Processor specification (DXVA). The mode that allows the VIC and Display blenders to match each other is enabled by setting the AlphaFillMode in the
- OutputConfig structure to _ALPHA_FILL_MODE_COMPOSITED. When the AlphaFillMode is set to
anything other than _ALPHA_FILL_MODE_COMPOSITED, the srcFact and dstFact parameters specified below are ignored and do not affect the processing. The parameterizable blender interface allows a variety of blend modes, including the following:
- Per-Pixel Non-Premultiplied Alpha Blend output = src*src_alpha + dst*(1-src_alpha)
- Per Pixel Source Premultiplied Alpha Blend output = src + dst*(1-src_alpha)
- Constant-Alpha Blend output = src*const_alpha + dst*(1-const_alpha)
- Per-Pixel Non-Premultiplied Alpha Blend with constant blend output =
src*src_alpha*const_alpha + dst*(1-src_alpha*const_alpha)
- Per-Pixel Premultiplied Alpha Blend with constant blend output = src*const_alpha + dst*(1-
src_alpha*const_alpha) Note that color-key is not supported and the following text should be read keeping in mind that ColorKeySelect should always be set to disabled. The blend data path requires the color key comparison match the result, and per-slot inputs from the config structure to formulate the blend equation. srcFactC, srcFactA, dstFactC, and dstFactA multiplicand inputs are determined by the config structure programming and color key comparison results.

- Video Image Compositor (VIC)
- Table 7.61 Per-slot Blend Configuration
- Blend Spec Name
- Register Name
- Description
- K1
- AlphaK1

