# 1 MHz

- TMR is part of TKE, which has multiple
instances:
- For Top TKE, the TMR interrupts
are routed to LIC and there are 16 such interrupts.
- For other TKE, the TMR interrupts
are routed to the local interrupt controller of the processor cluster that instances the TKE, i.e., BPMP.
- TKE TMR interrupts are routed to
the BPMP VIC attached to the BPMP Cortex-R5.
- WDT
- Top and local
watchdog timers
- LIC for Top
- WDT2-0 +
local interrupts in processor clusters
- Configurable

