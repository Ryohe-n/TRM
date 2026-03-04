# 15 :8 0x0 OCCUPANCYTHRESHOLD:

- Generate an interrupt if the FIFO occupancy is equal to or larger than this
limit. Not all bits physically present depending on FIFO capacity 5:4 0x0 AUTOADVADDR:
- When auto advance (AUTOADVENABLE) is enabled, advance the FIFO
when reading address 0x08 + 4 * AutoAdvAddr. 0x0 AUTOADVENABLE: Enable automatic advance of the FIFO for DMA purpose. When enabled, AutoAdvAddr indicates which register advance the FIFO.
- When disabled the FIFO advance is via the command register to avoid
read-sensitive addresses. 0 = DISABLE 1 = ENABLE

- Generic Timestamping Engine (GTE) Interrupt Controller Registers
0x0 INTERRUPTENABLE:
- Enable generation of interrupt based on FIFO occupancy

