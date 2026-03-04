# 15 :8 0x0 PLL_FLL_LOCKDET_MEM:

- FLL error signal observation length for FLL lock detect
- FLL_LD_MEM[7:0]=0 disables the process that checks whether FLL is
locked or not. After some clock delay, it forces PLL_FREQLOCK=1 without ensuring if FLL has acquired the frequency. 0x0 PLL_FLL_DIV:
- FLL update rate divider

