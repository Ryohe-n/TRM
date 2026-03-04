# 15 :11 X LATENCY_TIMER:

- The LATENCY_TIMER bits contain, in units of PCI bus clocks, the value of the
- Latency Timer for this PCI bus master. This register must be implemented as
writable by any master that can burst more than two data phases. This register may be implemented as read-only for devices that burst two or fewer data phases, but the hardwired value must be limited to 16 or less. A typical implementation would be to build the five high-order bits (leaving the bottom three as read-only), resulting in a timer granularity of eight clocks. At reset, the register should be set to 0 (if programmable). LATENCY_TIMER bits are writable. 0 = _0_CLOCKS 7:0 X CACHE_LINE_SIZE: 0 = _0 T_XUSB_CFG_4_0
- Offset: 0x10
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000XXXXX (0b0000,0000,0000,00xx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- Description

