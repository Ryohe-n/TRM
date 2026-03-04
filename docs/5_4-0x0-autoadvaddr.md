# 5 :4 0x0 AUTOADVADDR:

- When auto advance (AUTOADVENABLE) is enabled, advance the FIFO
when reading address 0x08 + 4 * AutoAdvAddr. 0x0 AUTOADVENABLE: Enable automatic advance of the FIFO for DMA purpose. When enabled, AutoAdvAddr indicates which register advance the FIFO.
- When disabled the FIFO advance is via the command register to avoid
read-sensitive addresses. 0 = DISABLE 1 = ENABLE 0x0 INTERRUPTENABLE:
- Enable generation of interrupt based on FIFO occupancy

