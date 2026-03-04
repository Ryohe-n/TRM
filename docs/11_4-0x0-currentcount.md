# 11 :4 0x0 CurrentCount:

- Current value of the downcounter, reloaded with Period by Start
command. 0x0 RemoteInterruptStatus: Current status of remote interrupt, cleared by Start command. 0x0 LocalFIQStatus: Current status of FIQ, cleared by Start command. 0x0 LocalInterruptStatus: Current status of local interrupt, cleared by Start command. 0x0 Enabled: 1b when the counter is active. When Enabled is 1b, the configuration of the WDT is frozen by silently ignoring write attempts to the configuration registers: WDTCR,
- WDTSCR and WDTFWCR. Set by Start or StickyStart commands,
cleared by Disable when StickyEnabled is 0b. 0 = DISABLE 1 = ENABLE
- TKE_TOP_WDT0_WDTCMDR_0
- Watchdog Timer Command Register
- Offset: 0x110008
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TKE_TOP_SCR_WDTSCR0_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 ForceError:
- Only working if the Command register is unlocked. 1b sets an internal flop
that is ORed with the functional error signal (based on threshold), 0b clears the bit. The state of the flop is shown in the status register. 0x0 StickyStart:
- Qualifies the StartCounter bit, if both bits are 1b, the counter is enabled in
permanent fashion, i.e., it remains enabled until the next reset, and a disable counter operation has no effect. Ignored if StartCounter is 0b

- Time Keeping Element: TOP Registers
- Bit
- Reset
- Description
0x0 DisableCounter:
- Only working if the unlock register (WDTUR{w}) has been programmed
before with the correct pattern.
- Writing to the command register always clears the unlock register. If
written to 1b, while StartCounter is 0b and the unlock register contains the unlock pattern, the watchdog transitions back to disabled. 0 = DISABLE 1 = ENABLE 0x0 StartCounter:
- When written to 1b, enables the counter operation, loads the counter with
- Period and starts downcounting,
resets the expiration count to 0 and clears all status flags. Enabled is always 1b after this.
- This is also used as Restart. Writing to StartCounter requires unlocking
when ChallengeResponseEnable is 1b, and writing to StartCounter is also restricted to windows of time given by WindowedRestartDisableMap when WindowedOperationEnable is 1b. 0 = DISABLE 1 = ENABLE
- TKE_TOP_WDT0_WDTUR_0
- Watchdog Timer Unlock Register
- Offset: 0x11000c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TKE_TOP_SCR_WDTSCR0_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

