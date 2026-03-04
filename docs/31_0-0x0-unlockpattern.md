# 31 :0 0x0 UNLOCKPATTERN:

- When ChallengeResponseEnable is 0b, Unlock must be written with
value 0x0000_C45A to allow a write to DisableCounter to take effect. The UnlockPattern is reset at each write to the Command register.
- When ChallengeResponseEnable is 1b, read of the Unlock pattern
returns the current value of an LFSR, and writing the next value of the LFSR allows a write to the Command register.
- RTC2_AOWDTSCOR_0
- Always On Watchdog Timer Skip Configuration Register
- Offset: 0x110
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: RTC2_SCR_AOWDTSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,x000,x000,x000,x000)
- Bit
- Reset
- Description

