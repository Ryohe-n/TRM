# 15 :12 0x2 ITC_FREQ_MUL:

- Internal Timer Clock Frequency Multiplier (ITCFMUL)
can be updated by writing into VENDOR_CQE_CNTRL0_0_CQE_ITC_FREQ_MUL_OVR.
- ITCFMUL and ITCFVAL indicate the frequency of the clock used for
interrupt coalescing timer and for determining the SQS polling period. See ITCFVAL definition for details. Field Value Description: 0h = 0.001 MHz 1h = 0.01 MHz 2h = 0.1 MHz 3h = 1 MHz
- Other values are reserved

- SDMMCAB Registers
- Bit
- Reset
- Description

