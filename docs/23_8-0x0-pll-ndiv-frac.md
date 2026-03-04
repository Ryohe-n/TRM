# 23 :8 0x0 PLL_NDIV_FRAC:

- Feedback divider fractional value (signed)
- Divide by NDIVeff = NDIV_INT[7:0] + (1/8192) x NDIV_FRAC[15:0]
(maximum 1nS skew across all bits of NDIV_INT and NDIV_FRAC) 7:0 0x7 PLL_NDIV_INT:
- Effective only when PLL_DIV_RATIO_OVERRIDE=1
Feedback divider integer value.
- NDIV_INT[7:0] Divide value

