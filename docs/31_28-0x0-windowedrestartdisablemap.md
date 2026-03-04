# 31 :28 0x0 WINDOWEDRESTARTDISABLEMAP:

- When WindowedOperationEnable is 1b, restart commands attempted
when expiration level has value l become NOP if bit b equals 1b. 0x0 DISALLOWWDTFREEZE:
- When 1b, the signal watchdog_freeze_request has no effect
- When 0b, when the signal watchdog_freeze_request is asserted, the
- WDT stops decrementing CurrentCount if the WDT is enabled

