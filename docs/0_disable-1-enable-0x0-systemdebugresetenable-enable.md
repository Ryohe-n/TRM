# 0 = DISABLE 1 = ENABLE 0x0 SystemDebugResetEnable: Enable systemwide reset assertion at fourth expiration of the counter.

- This reset can be intercepted by debug logic, e.g., to preserve
information 0x0 RemoteInterruptEnable:
- Enable normal priority interrupt assertion at third expiration of the
counter, connected to LIC for systemwide visibility 0x0 LocalFIQEnable:
- Enable high priority interrupt (FIQ) assertion at second expiration of
the counter, connected to local interrupt controller 0x0 LocalInterruptEnable:
- Enable normal priority interrupt assertion at first expiration of the
counter, connected to local interrupt controller 11:4 0x0 Period:
- Measured in periods of the timer selected as source, this is the reload
value, so 0 is treated as maximum period 3:0 0x0 TimerSource:
- The timer source interpretation is dependent on the value of
TscReferenceEnable:
- TscReferenceEnable = 0b: timer<TimerSource> is the timing reference
- TscReferenceEnable = 1b: a transition of TSC[2*TimerSource] is the
timing reference 0 = TMR0
- TKE_TOP_WDT2_WDTSR_0
- Watchdog Timer Status Register
- Offset: 0x130004
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- Time Keeping Element: TOP Registers
- SCR Protection: TKE_TOP_SCR_WDTSCR2_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,0000,x000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 Frozen: 1b indicates that the WDT is frozen because of the assertion of the global WDT freeze request (when allowed) or because of the assertion of the global timer freeze request 0x0 ErrorForced: 1b indicates that the error reported to HSM is forced active for testing purposes 0x0 StickyEnabled: 1b when the counter is enabled and cannot be disabled, set by StickyStart command, cleared by reset only. 0x0 CurrentError:
- Current error reported to HSM, this is the output after combining the
functional and forced error paths 14:12 0x0 CurrentExpirationCount:
- Current count of expiration since last start operation, cleared by Start
command, saturating at 5. 0 = NO_EXPIRY 1 = LOCAL_IRQ 2 = LOCAL_FIQ 3 = REMOTE_IRQ 4 = DEBUG_RESET 5 = SYSTEM_RESET 11:4 0x0 CurrentCount:
- Current value of the downcounter, reloaded with Period by Start
command. 0x0 RemoteInterruptStatus: Current status of remote interrupt, cleared by Start command. 0x0 LocalFIQStatus: Current status of FIQ, cleared by Start command. 0x0 LocalInterruptStatus: Current status of local interrupt, cleared by Start command. 0x0 Enabled: 1b when the counter is active. When Enabled is 1b, the configuration of the WDT is frozen by silently ignoring write attempts to the configuration registers: WDTCR,
- WDTSCR and WDTFWCR. Set by Start or StickyStart commands,
cleared by Disable when StickyEnabled is 0b. 0 = DISABLE 1 = ENABLE
- TKE_TOP_WDT2_WDTCMDR_0
- Watchdog Timer Command Register

- Time Keeping Element: TOP Registers
- Offset: 0x130008
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TKE_TOP_SCR_WDTSCR2_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 ForceError:
- Only working if the Command register is unlocked. 1b sets an internal flop
that is ORed with the functional error signal (based on threshold), 0b clears the bit. The state of the flop is shown in the status register. 0x0 StickyStart:
- Qualifies the StartCounter bit, if both bits are 1b, the counter is enabled in
permanent fashion, i.e., it remains enabled until the next reset, and a disable counter operation has no effect. Ignored if StartCounter is 0b 0x0 DisableCounter:
- Only working if the unlock register (WDTUR{w}) has been programmed
before with the correct pattern.
- Writing to the command register always clears the unlock register. If
written to 1b, while StartCounter is 0b and the unlock register contains the unlock pattern, the watchdog transitions back to disabled. 0 = DISABLE 1 = ENABLE 0x0 StartCounter:
- When written to 1b, enables the counter operation, loads the counter with
- Period and starts downcounting,
resets the expiration count to 0 and clears all status flags. Enabled is always 1b after this.
- This is also used as Restart. Writing to StartCounter requires unlocking
when ChallengeResponseEnable is 1b, and writing to StartCounter is also restricted to windows of time given by WindowedRestartDisableMap when WindowedOperationEnable is 1b. 0 = DISABLE 1 = ENABLE
- TKE_TOP_WDT2_WDTUR_0
- Watchdog Timer Unlock Register
- Offset: 0x13000c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N

- Time Keeping Element: TOP Registers
- SCR Protection: TKE_TOP_SCR_WDTSCR2_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

