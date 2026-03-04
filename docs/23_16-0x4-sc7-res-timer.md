# 23 :16 0x4 SC7_RES_TIMER:

- Number of 32K clocks to wait after requesting power off, before
declaring residency in SC7 15:8 0x4 SC7_DPD_TIMER:
- Number of 32K clocks between assertion of sel/e_dpd and
deassertion of e/sel_dpd
- For Optimal Setting - SW should change SC7_DPD_TIMER values
from default to 0x0 for a 1-32k cycle delay
- OFF
SC8_HW_BYPASS:
- Whether SC8 exit will be bypassed by HW or not, only applicable
when Target is SC8 (not SC7) 0 = OFF 1 = ON
- SC7
SC7_TARGET:
- Target state - whether DPD ENABLE results in going to sc7 or sc8

