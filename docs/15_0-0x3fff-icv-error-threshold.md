# 15 :0 0x3fff ICV_ERROR_THRESHOLD:

- When Threshold count is reached, MACSEC sets ICV Error event and
generates an interrupt if interrupt is enabled.
- Setting "0" means no reporting of ICV Errors. Should program with
Non zero value to get the ICV Error interrupt.
- MACSEC_INTERRUPT_COMMON_STATUS_0
- MACSEC Common (TX and RX controller) Interrupt Status Register
This status register will have a status bit that is OR(All MACSEC TX interrupts). Similarly a status bit for OR(All MACSEC RX Interrupts). This will help to quickly identify the source of interrupt whether it is MACSEC TX or MACSEC RX controller.
- Offset: 0x4004
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 MSEC_SFTY_ERR_INTR:
- MACSEC Safety Interrupt status

