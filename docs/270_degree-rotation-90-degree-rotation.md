# 270 -degree rotation 90-degree rotation

- Mirror on 45-degree axis

- Video Image Compositor (VIC)
Surface mirroring (FlipX/FlipY) is accomplished via programming of the OutputConfig structure.
- Surface transposition is accomplished via programming of the OutputTranspose field of the
OutputConfig structure. The results of the transformations are summarized in the rules below. 1.
- The output surface parameters (SurfaceWidth/Height, LumaWidth/Height, and
- ChromaWidth/Height) are transposed when output transpose is enabled. This means that if
the target rectangle/destination rectangles fit within the output surface before transformation, they also fit within the output surface after all transformations are done. The position of the target rectangle in the output surface gets flipped or transposed along with all of its contents (clear rectangles and destination rectangles) when OutputFlipX/ OutputFlipY/OutputTranspose are enabled.
- When output flips are enabled, the entire contents of the target rectangle are flipped,
including all ClearRects and DestinationRects and their contents. The axis of the flip is the axis of the output surface.
- When OutputTranspose is enabled, the position of the target rectangle is transposed, as
does its contents (including all clear/destination rectangles).
- When transpose and flips are enabled together, the overall effect of the transformation
happens as if the flip operations occur first, followed by the transpose operation. 2. 3. 4. 5.
- Scaling and Filtering
The VIC contains Y and X-scaler units that together allow 5 or 10 tap polyphase filtering and scaling of the input surface. The hardware is programmed with a set of filter coefficients for each filter-type (Detail/Noise/Normal), phase (0,1/32,2/32, .. 32/32), scale ratio (1:1, 2:1, 4:1, 8:1, 16:1), filter length (5-tap, 10-tap) and stream (sub-picture or normal). Based on the actual scale-ratio, phase etc. the hardware can then interpolate between these programmed values for use in the actual filters. There are four filter types (5 tap non-substream, 5 tap substream, and 10 tap non-substream, 10 tap substream). Therefore there are five tables for each coefficient type, as well as different tables for different scale down ratio of 1:1, 2:1, 4:1, 8:1, and 16:1. This means there are a total of 20 tables and that the maximum downscale ratio is 16:1. Each table has 16x4 memory entries (for 5-tap filter) or 16x9 memory entries (for 10-tap filter). Each memory entry has three 10-bit base coefficients (for Detail/Noise/Default) that are feed into a LERP3 simultaneously to interpolate based on different noise and detail weight. The table has 16 columns, and each column stores all the coefficients for phase 0/32, 1/32, 2/32, 3/32, 4/32, 5/32, 6/32, 7/32, 8/32, 9/32, 10/32, 11/32, 12/32, 13/32, 14/32, and 15/32, with the exception that the first column stores coefficients for both 0/32 and 16/32. Each column stores four sets of base coefficients for 5-tap filter because the last coefficient can be derived from the remaining four. Phase 0/32 and 16/32 are special cases in that only two sets of base coefficients are needed for each of them in 5-tap case and only four sets of base coefficients are needed for phase 0/32 in 10-tap case and five sets of base coefficients are needed for phase

- Video Image Compositor (VIC)

