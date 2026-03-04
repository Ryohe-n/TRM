# 1024 indicates the max filter strength

- AlphaClipMaxLu
ma fixed<0,11,0> (11 bits)
- Alpha Clip alpha Max Luma Value (U1.10)
- AlphaClipMinLum
a fixed<0,11,0> (11 bits)
- Alpha Clip alpha Min Luma Value (U1.10)
- AlphaClipMaxChr
oma fixed<0,11,0> (11 bits)
- Alpha Clip for Max Chroma Value (U1.10)
- AlphaClipMinChr
oma fixed<0,11,0> (11 bits)
- Alpha Clip for Min Chroma Value (U1.10)
- BetaCalcMaxBeta
fixed<0,11,0> (11 bits)
- Beta Calculation MaxBeta threshold (U1.10)
- BetaCalcMinBeta
fixed<0,11,0> (11 bits)
- Beta Calculation MinBeta threshold (U1.10)
- BetaCalcBetaX1
fixed<0,11,0> (11 bits)
- Beta Calculation BetaX1 (U1.10)
- BetaCalcBetaX2
fixed<0,11,0> (11 bits)
- Beta Calculation BetaX2 (U1.10)
- BetaCalcStepBet
a fixed<0,11,0> (11 bits)
- Beta Calculation Step Beta (U6.5)
beta = maxBeta - (alpha – betaX1) * StepBeta StepBeta value here is positive.
- BFDomainLumaC
oeffC00 fixed<0,7,0> (7 bits)
- TNR3 Bilateral Filter Coefficients CXY = CYX, X,Y = 0, 1, 2 C00, C01, C02,
C11, C12, C22 6 coefficients are independent.
- Luma 5x5 filter: (U1.6)
[ C22 C12 C02 C12 C22
- C12 C11 C01 C11 C12
- C02 C01 C00 C01 C02
- C12 C11 C01 C11 C12
- C22 C12 C02 C12 C22 ]
- BFDomainLumaC
oeffC01 fixed<0,7,0> (7 bits)
- BFDomainLumaC
oeffC02 fixed<0,7,0> (7 bits)
- BFDomainLumaC
oeffC11 fixed<0,7,0> (7 bits)
- BFDomainLumaC
oeffC12 fixed<0,7,0> (7 bits)
- BFDomainLumaC
oeffC22 fixed<0,7,0> (7 bits)
- BFDomainChrom
aCoeffC00 fixed<0,7,0> (7 bits)
- TNR3 Bilateral Filter Coefficients CXY = CYX, X,Y = 0, 1, 2 C00, C01, C02,
C11, C12, C22 6 coefficients are independent.
- Chroma 5x5 filter: (U1.6)
[ C22 C12 C02 C12 C22
- C12 C11 C01 C11 C12
- C02 C01 C00 C01 C02
- C12 C11 C01 C11 C12
- C22 C12 C02 C12 C22 ]
- BFDomainChrom
aCoeffC01 fixed<0,7,0> (7 bits)
- BFDomainChrom
aCoeffC02 fixed<0,7,0> (7 bits)

- VIC Programming Guidelines
- Name
- Data Type
- Off
set
- Notes
- BFDomainChrom
aCoeffC11 fixed<0,7,0> (7 bits)
- BFDomainChrom
aCoeffC12 fixed<0,7,0> (7 bits)
- BFDomainChrom
aCoeffC22 fixed<0,7,0> (7 bits)
- LeftBufSize
fixed<0,7,0> (7 bits)
- LeftBufSize should be 256 Bytes aligned
- TopBufSize
fixed<0,32,0> (32 bits)
- TopBufSize should be 256 Bytes aligned
- AlphaSufStride
fixed<0,14,0> (14 bits)
- TNR3 Prev and Cur Alpha Surface Stride, (one tile 32x8 line, 256 Bytes
per tile)
- Actual_stride_in_bytes = (AlphaSufStride + 1) * 64 Bytes
Since the first frame does not have a valid previous frame, and the second frame does not have a valid previous alpha, several work modes handled by software driver are defined to solve the issues:
- Name
- First frame
- Second frame
- Followed frame
- BetaBlendingEn
- AlphaBlendingEn
- AlphaSmoothEn

