# 31 :24 0x0 PLL_LOCKDET_MEM:

- PLL error signal observation length for PLL lock detect
- PLL_LD_MEM[7:0]=0 disables the process that checks whether PLL is
locked or not. After some clock delay, it forces PLL_LOCK=1 without ensuring if PLL has acquired phase and frequency. 23:16 0x0 PLL_FRUG:
- PLL frequency update gain
- PLL frequency gain = 2^( PLL_FRUG[7:0] - 4)

