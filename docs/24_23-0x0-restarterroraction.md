# 24 :23 0x0 RESTARTERRORACTION:

- If a restart action is attempted but fails, indicate which of four actions
to take 0x0: do nothing, silently ignore the restart 0x1: immediately jump to expiration level 4 and reload the downcounter 0x2: immediately jump to expiration level 5 and reload the downcounter 0x3: immediately request a system power on reset (POR)
- When jumping levels, the normal actions configured per level must
take place 22:20 0x7 ERRORTHRESHOLD:
- The WDT logic asserts an error signal to HSM when ExpirationLevel >
ErrorThreshold. 0x0 TSCREFERENCEENABLE: Select as timing reference transitions on a configured TSC bit.

- Real-Time Clock Registers
- Bit
- Reset
- Description
0x0 CHALLENGERESPONSEENABLE:
- Enable the Challenge Response mode of operation.When 1b, the
Unlock register operates as a Challenge Response register. 0x0 WINDOWEDOPERATIONENABLE:
- Enable the windowed mode of operation. When 1b, a restart command
is rejected when the current expiration level is identified as disallowed in the WindowedRestartDisableMap or the current time is below the window threshold.
- The rejection is either silent or performs a reset based on
- RestartErrorAction is identified
as disallowed in the WindowedRestartDisableMap. 0x0 SYSTEMPORRESETENABLE:
- Enable full system reset at fifth expiration of the counter, mostly at
the same level as the signal from
- PMC asserted in case of a Power On Reset
0x0 SYSTEMDEBUGRESETENABLE: Enable systemwide reset assertion at fourth expiration of the counter.
- This reset can be intercepted by debug logic, e.g., to preserve
information. Debug reset must not be enabled for AO WDT. 0x0 WAKECOLDENABLE:
- Redefined, enable the generation of an SC7 wake event plus clearing
of PMC scratch register 0 at third expiration of the counter.
- This bit is RemoteInterruptEnable for a standard WDT
0x0 WAKEENABLE:
- Redefined, enable the generation of an SC7 wake event at second
expiration of the counter.
- This bit is LocalFIQEnable for a standard WDT
0x0 LOCALINTERRUPTENABLE:
- Enable normal priority interrupt assertion at first expiration of the
counter, connected to local interrupt controller 11:4 0x0 PERIOD:
- Measured in periods of the timer selected as source, this is the reload
value, so 0 is treated as maximum period 3:0 0x0 TIMERSOURCE:
- The timer source interpretation is dependent on the value of
TscReferenceEnable.
- TscReferenceEnable is 0b, the timing reference is redefined as a
transition on an RTC bit
- If TimerSource is in 0 or 9, bit TimerSource in the Millisecond counter
- If TimeSource is in 10 or 15, bit TimerSource-10 of the Second counter
- TscReferenceEnable is 1b, the timing reference is redefined as a
transition on TSC[10+2*TimerSource]
- RTC2_AOWDTSR_0
- Always On Watchdog Timer Status Register

- Real-Time Clock Registers
- Offset: 0x104
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: RTC2_SCR_AOWDTSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,0000,x000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 FROZEN: 1b indicates that the WDT is frozen because of the assertion of the global WDT freeze request (when allowed) or because of the assertion of the global timer freeze request 0x0 ERRORFORCED: 1b indicates that the error reported to HSM is forced active for testing purposes 0x0 STICKYENABLED: 1b when the counter is enabled and cannot be disabled, set by StickyStart command, cleared by reset only. 0x0 CURRENTERROR:
- Current error reported to HSM, this is the output after combining the
functional and forced error paths 14:12 0x0 CURRENTEXPIRATIONCOUNT: Current expiration level, cleared by Start command, saturating at 5. 11:4 0x0 CURRENTCOUNT:
- Current value of the down counter, reloaded with Period by Start
command. 0x0 WAKECOLDSTATUS:
- Redefined as the status of the wake cold signal for the AO WDT,
- RemoteInterruptStatus for a standard WDT,
cleared by Start command 0x0 WAKESTATUS:
- Redefined as the status of the wake signal for the AO WDT,
- LocalFIQStatus for a standard WDT,
cleared by Start command. 0x0 LOCALINTERRUPTSTATUS: Current status of local interrupt, cleared by Start command. 0x0 ENABLED: 1b when the counter is active. When Enabled is 1b, the configuration of the WDT is frozen by silently ignoring write attempts to the configuration registers: WDTCR, WDTSCR and WDTFWCR.
- Set by Start or StickyStart commands, cleared by Disable when
StickyEnabled is 0b. Set by Start command, cleared by Disable.
- RTC2_AOWDTCMDR_0

- Real-Time Clock Registers
- Always On Watchdog Timer Command Register
- Offset: 0x108
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: RTC2_SCR_AOWDTSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 FORCEERROR:
- Only working if the Command register is unlocked. 1b sets an internal flop
that is ORed with the functional error signal (based on threshold), 0b clears the bit. The state of the flop is shown in the status register. 0x0 STICKYSTART:
- Qualifies the StartCounter bit, if both bits are 1b, the counter is enabled in
permanent fashion, i.e., it remains enabled until the next reset, and a disable counter operation has no effect.
- Ignored if StartCounter is 0b
0x0 DISABLECOUNTER:
- Only working if the disable unlock register has been programmed before
with the correct pattern. Writing to the command register always clears the disable unlock register.
- If written to 1b,
while StartCounter is 0b and the unlock register contains the unlock pattern, the watchdog transitions back to disabled. 0x0 STARTCOUNTER:
- When written to 1b, enable the counter operation, load the counter with
- Period and starts downcounting,
resets the expiration count to 0 and clears all status flags. Enabled is always 1b after this. This is also used as Restart.
- RTC2_AOWDTUR_0
- Always On Watchdog Timer Unlock Register
- Offset: 0x10c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: RTC2_SCR_AOWDTSCR_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- Real-Time Clock Registers
- Bit
- Reset
- Description

