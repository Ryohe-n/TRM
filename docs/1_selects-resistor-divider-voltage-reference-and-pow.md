# 1 : Selects resistor divider voltage reference and power down bandgap

- Switching time between the supplies is 1µs. When switching from
one supply to other supply, we need to wait for at least 1µs before doing any data transfers.
- Providing reference voltage from R divider network is just a backup
plan, if: A. Bandgap does not work or, B. Bandgap works very well but we want to save bandgap power when Silicon Characterization results shows that the QSPI interface perform well even by using R divider+REG+TRIMMER
- QSPI_GLOBAL_TRIM_CNTRL_0
- Offset: 0x200
- Read/Write: R/W
- Parity Protection: N

- Pulse Width Modulator (PWM)
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 SEL: 0: Uses clock from NBSDMEM_TRIM cell for sampling (DVFS independent trimmer) 1: Uses clock from prog_dly_256tap for sampling

