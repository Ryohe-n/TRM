# 11 :4 0x0 Period:

- Measured in periods of the timer selected as source, this is the reload
value, so 0 is treated as maximum period 3:0 0x0 TimerSource:
- The timer source interpretation is dependent on the value of
TscReferenceEnable:
- TscReferenceEnable = 0b: timer<TimerSource> is the timing reference
- TscReferenceEnable = 1b: a transition of TSC[2*TimerSource] is the
timing reference 0 = TMR0
- TKE_TOP_WDT0_WDTSR_0
- Watchdog Timer Status Register
- Offset: 0x110004
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: TKE_TOP_SCR_WDTSCR0_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,0000,x000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 Frozen: 1b indicates that the WDT is frozen because of the assertion of the global WDT freeze request (when allowed) or because of the assertion of the global timer freeze request 0x0 ErrorForced: 1b indicates that the error reported to HSM is forced active for testing purposes 0x0 StickyEnabled: 1b when the counter is enabled and cannot be disabled, set by StickyStart command, cleared by reset only. 0x0 CurrentError:
- Current error reported to HSM, this is the output after combining the
functional and forced error paths 14:12 0x0 CurrentExpirationCount:
- Current count of expiration since last start operation, cleared by Start
command, saturating at 5. 0 = NO_EXPIRY 1 = LOCAL_IRQ 2 = LOCAL_FIQ 3 = REMOTE_IRQ 4 = DEBUG_RESET 5 = SYSTEM_RESET

- Time Keeping Element: TOP Registers
- Bit
- Reset
- Description

