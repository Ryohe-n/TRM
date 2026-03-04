# 8 -bit constant alpha value srcFactC_Match_Select srcFactCMatchSelect 3-bit enum which sets srcFactC:

- K1: AlphaK1
- K1_TIMES_DST: AlphaK1*dstA
- NEG_K1_TIMES_DST: 1.0-
(AlphaK1*dstA)
- K1_TIMES_SRC: AlphaK1*srcA
- ZERO: 0
dstFactC_Match_Select dstFactCMatchSelect 3-bit enum which sets dstFactC:
- K1: AlphaK1
- K2: AlphaK2
- K1_TIMES_DST: AlphaK1*dstA
- NEG_K1_TIMES_DST: 1.0-
(AlphaK1*dstA)
- NEG_K1_TIMES_SRC: 1.0-
(AlphaK1*srcA)
- ZERO: 0
- ONE: 1.0
srcFactA_Match_Select srcFactAMatchSelect 3-bit enum which sets srcFactA:
- K1: AlphaK1
- K2: AlphaK2
- ZERO: 0
- NEG_K1_TIMES_DST: 1.0-
(AlphaK1*dstA) dstFactA_Match_Select dstFactAMatchSelect 3-bit enum which sets dstFactA:
- K2: AlphaK2
- NEG_K1_TIMES_SRC: 1.0-
(AlphaK1*srcA)
- ZERO: 0
- ONE: 1.0
- UseK3
- UseOverrideR

