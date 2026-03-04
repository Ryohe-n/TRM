# 26 :25 0x0 VD09REG_LEVEL: 2-bit regulator level control. control voltage level output of 0.9v regulator. 00:0.9v, 01:0.85v, 10: 0.95v, 11: 1v 24:23 0x0 VD09REG_LEAKER: 2-bit regulator leaker control. 11 will give best performance, but consumers more DC quiescent current. (control 0.9v internal regulator for all partitions) 22:21 0x0 VD04REG_LEVEL: 2-bit regulator level control control voltage level output of 0.4V regulator 00: 0.4v 01: 0.38V 10: 0.42V 11: 0.44V 20:19 0x0 VD04REG_LEAKER: 2-bit regulator leaker control. 11 will give best performance, but consumers more DC quiescent current. (control 0.4v internal tx regulator for all partitions) 18:16 0x4 LPRX_LEVEL_SEL:

- Internal vref adjustment for LP self-biased receiver(when
- LP_RX_SELECT_IO1_[A/B]=1)

