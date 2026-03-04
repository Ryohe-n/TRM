# 24 :16 0x30 RMS_OFFSET:

- RMS Offset used during RMS detection(-16dB to +15.9375dB)
(Q5.4 format)
- UNBIAS
BIAS_UNBIAS:
- Rounding Option across all Rounding Operations of MBDRC
- Biased = Round to plus infinity (both positive and negative
num). 1 = UNBIAS: Unbias = Round to plus infinity (positive num) and minus infinity (negative num) 0 = BIAS
- PEAK
PEAK_RMS: Mode Select for Peak Detection in SideChain. 0 = RMS 1 = PEAK
- ALL_PASS_TREE
FILTER_STRUC:
- Selects between a custom Butterfly Structure with fixed
BiQuad stages (ALL_PASS_TREE). 0 = ALL_PASS_TREE :or a programmable structure where per band biquads can be programmed (FLEX) 1 = FLEX 12:8 0x1e SHIFT_CTRL:
- Shift Control for each BiQuad Stage - this depends on the
format of coefficient programmed. Default to 30 - current coefficients are all with 2.30 format.
- Software can only change it when the format of coeffcients has
changed. Otherwise, always keep 30.

- Multiband Dynamic Range Compression (MBDRC) Control Registers
- Bit
- Reset
- Description

