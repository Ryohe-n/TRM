# 31 :24 0x3f OSC_PREPWR: OSC clock stabilization timer prior to SoC rail pwr-req assertion.

- Timer value is 4*OSC_PREPWR+1 number of 32.768kHz clock cycles
i.e. timer value is (OSC_PREPWR*122.07)+30.518 usec. 23:16 0x0 OSC_POSTPWR: OSC clock stabilization timer after SoC rail power is stabilized.
- Timer value is 4*OSC_POSTPWR+1 number of 32.768kHz clock cycles
i.e. timer value is (OSC_POSTPWR*122.07)+30.518 usec.

- PMC IMPL Registers
- Bit
- Reset
- Description

