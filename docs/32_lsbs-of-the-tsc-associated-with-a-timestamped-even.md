# 32 LSBs of the TSC associated with a timestamped event

- TECCV{t}
- NR
- Current captured value of bitmap for timestamped event
- TEPVV{t}
- NR
- Previous captured value of bitmap for timestamped event
- TESRC{t}
- NR
- Identifies the source of the timestamped event
- TEENCV{t}
- NR
- Encoded version of TECV{t} and TEPV{t}, with explicit valid
- TECMD{t}
- NR
- Command register, especially to pop the FIFO
- TESTATUS{t}
- NR
- Status register
- TESCR{t}
- R0
Access rights control register for timestamp engine {t}.
- TEDSCR{t}
- R0
Specific security domain for disable bits for timestamp engine {t}. Table 9.27 Guidance for SC7 Handling of per Slice GTE Registers, when Outside of AO Partition
- Register
- Name
- Category
- Remark
- TETEN{t}{s}
- R2

- Timers
- Register
- Name
- Category
- Remark
- TETDN{t}{s}
- R1
- If not restored in step 1, non-secure software can observe the timing and occurrence
of secure events. This can be avoided by restoring this register before enabling the event source. As only observation is possible if the sequence above is not followed, security is not directly compromised, allowing R1.
- Table 9.28 Guidance for SC7 Handling of RTC Registers
- Register
- Name
- Category
- Remark
- RTCCR
In Always On partition, not affected by SC7.
- RTCBR
- RTCSCR
- RTCSSCR
- RTCMCR
- RTCSAR{0,1}
- RTCMAR
- NR
- RTCSCAR
- RTCMCAR
- RTCIER
- RTCISR
- RTCIVR
- RTCFIR
- RTCRSR
- RTCDR
- RTCSCR
- AOWDTCR
- AOWDTSR
- AOWDTCMDR
- AOWDTUR
- AOWDTSCOR
- AOWDTSCR

- Timers
- Table 9.29 Guidance for SC7 Handling of USEC Registers
- Register
- Name
- Category
- Remark
In Always On partition, not affected by SC7.
- USECCCR
- USECCVR
- NR
- USECCRSR
- USECCFR
- USECSCR
- Table 9.30 Guidance for SC7 Handling of TKE Registers, when outside of AO partition
- Register
- Name
- Category
- Remark
- TKETSC{0,1}
- NR
- TKEUSEC
- NR
- TKEOSC
- NR
- TKECR
- R2
- TKEIE{i}
- R2
- TKEIV
- NR
- TKEIR
- NR
- TKESCR
- R0
- TMRCR{t}
- R2
- Restoring the state of a timer may require compensating for the amount of time
the power state consumed.
- TMRSR{t}
- NR (but
saved)
- TMRCSSR{t}
- R2
- TMRSCR{t}
- R0
- WDTCR{w}
- R2
- WDT cannot compensate for the amount of time the power of state consumed,
they can only be restarted from scratch.
- WDTSR{w}
- NR
- WDTCMDR{w}
- NR
- WDTUR{w}
- NR
- WDTSCOR{w}
- R2
- WDTSCR{w}
- R0

- Timer Registers
Restoring a TKE timer needs to consider a few special cases when trying to compensate for the amount of time consumed by the power state:
- For a one off timer
- The timer may have expired during the power state, the restore code can perform either of
the following: - - Insert an (fake) event into the handler.
- Program the timer to its shortest possible duration, resulting in the raising of the
corresponding interrupt as usual.
- If the timer has not expired, the compensation can be done by performing any of the
following: -
- Restore without compensation, the timer is linked to the amount of time elapsed in the
active state, not real time.
- Restore in absolute fashion, if the timer targets a known real time deadline, the timer
delay can be computed by target time minus current time. This has the advantage that errors do not accumulate if the timer is suspended multiple times. This requires to save the calculated expiration time, not the TMRSR{T} itself.
- Restore in relative fashion, calculate the timer delay as the timer value at SC7 entry
minus the amount of time consumed during SC7. This requires saving TMRSR{t}.PCV and to know the time spent in SC7. Note that the TMRSR{t}.PCV value is restored on a calculated value not the saved value itself. - - For a periodic timer:
- The timer may have expired a number of times during the power state. Then, it may need to
insert corresponding (fake) events into the handler. A timer cannot be restarted at a value different than its period. Then the restore may need to proceed in two phases if the phase of the timer is important. -
- Restart the timer as a one off for the remainder of the period, using the same time of
calculation for one-off timer.
- At the first expiration after the power state transition, restarts the timer in periodic
mode. -
- If the phase of the periodic timer is not important, but only its period, then restart it
immediately. A final requirement is to assert/deassert the reset to terminal nodes located in a power-gated partition if the reset is software controlled.

