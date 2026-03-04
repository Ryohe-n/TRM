# 1 and clear it after 20 cycles to reset FIFO.


- SDMMCA Registers
- Bit
- Reset
- PROD
- Description
0x0 _NONE_ DAT_TFIFO_HOT_RESET:
- SW can reset DAT tuning FIFO present in padmacro incase
there is any error or hang condition.
- Reset duration should be atleast 20 cycles. Set this bit to

