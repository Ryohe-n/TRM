# 0 : C00 = 64, CXY = 0, (X,Y≠0) 1: Normal operation

- BFRangeLumaShi
ft fixed<0,4,0> (4 bits)
- Bilateral Filter LumaRangeShift
- BFRangeChroma
- Shift
fixed<0,4,0> (4 bits)
- Bilateral Filter ChromaRangeShift
- SADMultiplier
fixed<0,6,0> (6 bits)
- SAD Multiplier param (U3.3)
- SADWeightLuma
fixed<0,6,0> (6 bits)
- SAD Weight for luma channel (U1.5)
- SADWeightChroma = 32 - SADWeightLuma
- TempAlphaRestri
ctIncCap fixed<0,11,0> (11 bits)
- Temporal Alpha Restrict Increase Capability (U1.10)

- VIC Programming Guidelines
- Name
- Data Type
- Off
set
- Notes
- AlphaScaleIIR
fixed<0,11,0> (11 bits)
- Alpha Scale IIR for strength (U1.10)

