# 13 +2 A pair of GTE for interrupt timestamping between LIC and GIC. Note that local GIC interrupts are not timestamped.

- Extra two slices for timestamping of top level peripherals
or other top level signals.
- BPMP
- No
- Timestamping the local interrupts, i.e., the inputs to
the AVIC.
- SCE
- No
- PVA{0}
- No
- RCE
- No
- DCE
- No
- AON
- No
- Timestamping the local interrupts, i.e., the inputs to
the VIC, plus a small subset of GPIOs. The two lower slices are reserved for local interrupts, the third one for GPIOs. In Orin, the following rules are followed to make the mapping between source signals and GTE input numbering more deterministic and stable:
- When timestamping interrupts, the GTE slice mapping is one to one with the corresponding
interrupt slice, so that the interrupt numbering and GTE signal numbering are identical. In particular, reserved interrupt IDs become reserved GTE signal IDs and are not reused for other purpose, helping forward compatibility.
- Slices used for GPIO signals are mapped based on information contained in the GPIO
configuration file; this indirectly also provides the mapping from GTE input number to a corresponding pin. Note: All interrupt controllers are organized in slices, the GTE slice structure was patterned to reflect that approach.
#### 9.3.2.10 RefClk Source Change Logic
The recommended usage model is to always use OSC (at 38.4 MHz) and with K=1 always.
#### 9.3.2.11 Power Management
The TSC logic is not power gated but implements clock gating. Note that as it provides an SoC-wide timing reference, TSC is normally always enabled.

- Timers
The secondary TSC and TSC distribution logic can not work when the OSC is disabled, as RefClk is not available then. OSC is disabled in some of the deep sleep states, with only 32,768 Hz present. This is true for some variants of SC7. The transitions to and from the deep sleep states that disable the OSC circuitry are controlled by the PMC logic. The PMC logic handshakes with TSC, to allow for a clean shutdown and restart of the secondary TSC as well as TSC distribution in case OSC is stopped in the target power state.
- Entering a deep sleep mode where OSC is to be stopped
- PMC asserts a deep sleep request signal while OSC and RefClk are still running
- TSC stops the secondary TSC and the distribution logic, then assert a deep sleep status
signal to PMC
- Stopping is logically equivalent to disabling these blocks via the software control bits
- PMC can now stop OSC and indirectly stops RefClk
- Exiting a deep sleep mode where OSC already stopped
- PMC restarts OSC and indirectly restarts RefClk, and waits until OSC is stable
- PMC deasserts the deep sleep request signal
- TSC restarts the secondary TSC and the TSC distribution logic if their respective software
enable bits is set Restarting the secondary TSC requires an initialization, the main TSC value is copied to the secondary TSC counter at the next edge of the 32,768 Hz clock
- Restarting the TSC distribution preferably includes sending a synchronization message as
soon as possible
- TSC deasserts the deep sleep status signal to PMC
The whole sequence is similar to the sequence used for Arm processors. The handshake must also work even when TSC itself is disabled, to avoid blocking the forward progress of the PMC state machine. This may require providing a non-gateable clock to the handshake logic.

- Timers
**Figure 9.29 Deep Sleep Handshake with PMC**
#### 9.3.2.12 Real Time Clock
The internal Real Time Clock (RTC) is a real-time clock in the AO partition that measures elapsed time since the last cold boot and is not affected by SC7 entry/exit transitions. Note that the PMIC also generally provides an external RTC with better robustness (not affected by the cold boot of the SoC). The RTC accumulates real time in a mixed radix format of seconds (32 bits) and milliseconds (10 bits), it operates on the 32,768 Hz clock and can take its reference from the 32,768 Hz clock itself or TSC.

- Timers
The seconds counter can be updated by software to provide an initial offset different from zero at initialization, and later updates sticky disabled for security. The RTC provides different alarms that can be used as interrupts or SC7 wake signals. The RTC also provides a safety reference counter, with no configuration whatsoever that can be used to check the correct operating frequency of other TKEs.
- RTC logic operates in the 32,768 Hz clock domain, and software must take into account when
accessing RTC registers. In particular, the RTC module maintains a ‘busy’ status register bit which is set (1’b1) while a register write is being transferred. Software must not send a write when this bit is set (this requires write accesses to the RTC to be protected by a resource semaphore if more than two agents are allowed to access the RTC). The RTC maintains a count of seconds and milliseconds since the last cold reset. It can select between the 32,768 Hz clock and MTSC as time base. The only difference is the first NCO stage, the rest of the logic is independent of the selected reference. The logic itself always operates at the 32,768 Hz clock.
**Figure 9.30 RTC Generation**
The RTC block also contains alarms implemented by comparison between a target value and the current RTC value. The RTC value is exported to SPE where it is used to generate local alarms on top of the alarms supported in RTC itself. For safety related purposes, the RTC also provides a reference counter, always enabled, that increments at each rising edge of the 32,768 Hz clock. This can be used as a safety reference to assess the health of other timing elements. This reference counter is never halted, especially it is not stopped during debug and has no configuration. RTC is not configurable but is instanced inside the AO partition, the same as in previous devices. It also contains the AOWDT.

- Timers
#### 9.3.2.13 Always On WatchDog Timer
A watchdog timer (WDT) is provided in the Always On (AO) power domain, with the following rationale: Its operation is not dependent on OSC; it only requires the 32,768 Hz clock and the main TSC to be active. The timer can be used to detect and flag SC7 related issues, such as an inability to wake up. Using a different clock source and voltage domain for this time can be used for safety diversity. The AO WDT requirements are only slightly different from a standard WDT: Operates on the 32,768 Hz clock, so that it can operate continuously, including during power states where OSC is OFF when WDT operation is suspended. The actions associated with some expiration levels are redefined as wake events: Expiration level 2 asserts a standard wake signal.
- Expiration level 3 asserts a wake signal that also clears the PMC scratch register info
indicating warm boot. The debug reset associated with expiration level 4, while connected, must not be used. The AO WDT reuses the implementation of the TKE WDT, including the register interface; the only changes are in the inputs and outputs connected to it, especially the operating clock.
#### 9.3.2.14 Microsecond Counter and Time Reference Pulses Generation
- The USEC module broadcasts periodic pulses with 1 microsecond and 1 millisecond periods,
allowing time to be measured in a platform-independent way. USEC operates on OSC to allow operation when no PLL is active. The time base can be OSC itself or TSC, and USEC also maintains a counter of elapsed microseconds.
- While USEC operates in the AO partition, it relies on OSC for its operation and so may be
suspended in some power states where RTC keeps counting, and so USEC and RTC are complementary, not redundant.
**Figure 9.31 Reference Pulses Generation and Microsecond Counter**

- Timers
#### 9.3.2.15 TKE Module
NV Timers (TMRs) and Watchdog Timers (WDTs) are instantiated as part of a TKE module. There are nT timers and nW watchdog timers per TKE. Each TKE also includes registers to make different measures of time available: OSC, microsecond counter, and TSC. This access is low latency to the local processor. Finally, each TKE can optionally contain an interrupt routing function, this is only present for the TKE instantiated at the top level to limit the number of top-level interrupts. For debug purposes, the TKE operation can optionally be halted during debug. This is especially important to suspend the operation of enabled WDTs that could otherwise reset the system while debug is in progress.
##### 9.3.2.15.1 NV Timer
Each NV timer is a general-purpose timer with the following characteristics:
- Downcounter of 29 bits generating an interrupt when reaching zero
The decrement rate is on a configurable reference:
- At 1 MHz, as defined by the 1 MHz reference pulse
- At OSC rate
- On any edge of TSC[0], so normally at the recommended 31.25 MHz TSC update rate
- On any edge of TSC[12], so normally at 31.25 MHz / 4096, about 7.63 kHz
Optionally operates in periodic mode, i.e., automatically reload the start value when reaching zero The ability to select the timebase for each timer independently may be of assistance in functional safety applications.
##### 9.3.2.15.2 Optional Interrupt Routing
The interrupt routing block takes the set of interrupts present in the TKE and aggregates them in a configurable fashion into nSI shared interrupts. This is only present for the top-level TKE and the shared interrupts are connected to the LIC in that case. The number of (internal) interrupts inside a TKE is dependent on the number of NV timers and WDT:
- Each NV timer has one associated interrupt, set when the downcounter reaches 0
Each WDT has three associated interrupts, one for each of the three first expirations of the
- WDT
The interrupt logic uses nSI masks, each containing (nT + 3 * nW) bits. Each mask selects which local interrupt are included in the corresponding shared interrupt. The interrupt logic also exposes interrupt status registers to software.

- Timers
##### 9.3.2.15.3 Watchdog Timer
A general view of the WDT logic is shown below.
**Figure 9.32 WDT Structure**
The watchdog mechanism operates in the following way:
- Each processor complex is associated with one WDT. For the CCPLEX, all cores are in the
same coherency domain and are considered as one SMP processor for software purposes; i.e., all cores inside CCPLEX are associated with the same WDT (WDT0 in the Top TKE). Select as reference time base either:
- Any of the timer zero pulses
A transition on any bit in a defined subset of the bits of the local TSC counter Having more than one reference source may be used for the safety requirements for diversity.
- Implements a periodic downcounter decrementing at the selected rate. The downcounter
generates an expiration event when it reaches zero.
- At each expiration, the WDT increases the expiration level, saturating at level 5
- The increase may be larger than 1, the exact increase is configurable per expiration level
- The WDT logic can assert specific output signals based on the current expiration
- For the first three expiration levels, the WDT can assert a corresponding interrupt, each
with a specific use:

- Timers
- If the expiration level is 1 or more, a normal priority interrupt (IRQ) directly routed to the associated processor complex. This may be used to restart the timer inside an interrupt handler in non-safety critical applications. If the expiration level is 2 or more, a high priority interrupt (FIQ) directly routed to the associated processor complex. In Android, the corresponding interrupt handler assumes the system is in a bad state and captures some state information for a potential post mortem analysis. The interrupt handler may not attempt to correct the problem.
- If the expiration level is 3 or more, a normal interrupt (IRQ) routed to the LIC and from
there routed to a set of processors, this is meant to trigger system wide actions, in particular recovery actions of the processor associated with the WDT. This is also known as a remote interrupt. - - If the expiration level transitions from a value strictly below 4 to a value above or equal to 4, the WDT can assert a system wide debug reset. When debug is allowed, this reset can be intercepted by debug logic, and specific actions taken to preserve information about the state of the system before reset assertion clears them, allowing for post-mortem debug analysis. In particular, DFD logic attempts to flush the processor caches and local memories to DRAM, save processor state, and put the DRAM in self-refresh before allowing the reset to take effect. WDT and CAR logic uses a four phase handshake to communicate the WDT debug reset request. If the expiration level is 5, the WDT can assert a system wide reset, equivalent to a Power On Reset, this reset can optionally include a PMIC power cycling depending on the configuration in PMC. This is the last safety net for recovery purposes, attempting to bring the system to a working state without any specific attempt at preserving information. Each WDT signals an error to the Hardware Safety Manager (HSM) when its expiration level is greater or equal than a programmable threshold. Orin supports a force error command for testing; software must not issue any restart command while error forcing takes place. The watchdog timer supports a configurable restart mechanism. These features are disabled by default for backwards compatibility.
- The counter can only be optionally restarted in defined windows of time instead of at any
time
- Two window mechanisms with different granularity are supported, with coarse and fine
granularity. The window mechanism is a safety requirement.
- The counter can only be optionally restarted or disabled using a Challenge/Response pair
(also known as Question/Answer, QA). In previous chips, only disabling required an unlock using a simpler fixed pattern unlock. The challenge/response mechanism is a safety requirement to avoid unexpected deactivation of a WDT. The windowing operation works like this:
- Optionally enabled, normal operation is windowless and the WDT can be restarted at any
time. When enabled, a restart of the timer is disabled:

- Timers
- For a programmable set of expiration levels. This is achieved by disabling writes to the
COMMAND register based on a bitmap of disallowed expiration levels.
- When outside an allowed window as measured by the combination of expiration level and
downcounter, as shown in the figure below.
**Figure 9.33 Fine-Grained WDT Windowing Mechanism**
The Challenge/Response works like this:
- Optionally enabled, normal operation does not use Challenge/Response, unlocking is done by
writing using a known fixed pattern to the unlock register address. When enabled, a restart is achieved only after unlocking via a Challenge/Response.
- The Challenge is that a Linear Feedback Shift Register (LFSR) value, present in the Unlock
register and reading the Unlock register, is mandatory as the implementation is allowed to use the read to alter internal state. The Response is the next value of the LFSR that needs to be written in the Unlock register. The LFSR is (re)initialized with the value written to the Unlock register. Note that this is equivalent to advancing the LFSR if the unlock was successful. 0 is an allowed value that can be used for testing, the successor of 0 is 0. The LFSR uses the classic CRC-32 polynomial operating in shift right (reversed) direction; that is, the next value is calculated as LFSR = (LFSR >> 1) ^ ((LFSR & 0x1) ? 0xEDB88320 : 0). When locked, the Command register cannot be written. An incorrect restart attempt can optionally result in an immediate jump in the expiration level. This is normally used to immediately trigger a reset condition when the WDT is used as a safety- relevant WDT. For safety, the WDT enable is controlled by two bits, normal and sticky, and the platform policy can decide which to use, i.e., if a WDT may or not be disabled once enabled. The use of the sticky enable, making it impossible to disable the WDT until the next reset, is a safety requirement. There is a watchdog timer in the Always On partition, that AO WDT is only reset by an external hardware Power On Reset, i.e., it is never disabled by a reset triggered by an SoC WD timer. The AO

- Timers
- WDT has the same structure as the SoC WDTs but with different wiring of some inputs and
outputs. WDTs can optionally be halted during debug; WDT operation may also be suspended when one or more of the TKE clocks is suspended. This can happen for a standard WDT during some low-power states where OSC is stopped; for example, AO WDT is specifically present to continue working during these power states. The SoC supports a modified mechanism to stop all WDTs, similar to the ability to stop all timers. The request comes on a wire broadcast to all TKEs (and AOWDTs). The request is further qualified by the local debug enable signal. Each WDT adds a configuration bit to allow/disallow stopping the WDT, allowed after reset but can be switched to disallow for safety use cases. Each WDT also includes a status bit indicating if it is currently frozen. The local debug enable signal is connected to the invasive debug enable for the processor cluster associated with the TKE:
- CCPLEX DBGEN signal for top TKE: global_dbgen
- Cortex-R5 DBGEN for a Cortex-R5 cluster: {bpmp, spe, sce, rce, dce, pva{0}}_dbgen
- A9 DBGEN for APE cluster: ape_dbgen
- DBGEN connected to SPE for AOWDT: spe_dbgen
Note that this mechanism makes the use of the configuration bit disabling freeze optional in safety applications. It is recommended to leave that bit at 0b.

- Timers
**Figure 9.34 Example Timeline for Watchdog Operation**
The WDT timers are reset on L2 reset except the AOWDT that is reset on L1 only. The reset requests are individually exposed as ports, even when multiple WDT share the same TKE as the reset source must be captured for use by software.
#### 9.3.2.16 Generic Timers
Arm Generic Timer (GT) architecture defines timers to be used by Arm CPUs. This architecture uses the system wide timing reference called Timestamp System Counter (TSC) that increases at a constant rate. This allows the Generic Timers inside a CPU cluster to operate correctly without reconfiguration when the CPU frequency changes. The Arm Generic Timer includes the following features: Physical counter that contains the count value of the system-counter.
- Virtual counter that indicates virtual time. The virtual counter contains the value of the
physical counter minus a 64-bit virtual offset. Multiple timers per CPU (the exact set depends on the core configuration):
- EL1 physical timer
- Non-secure EL2 physical timer
- EL3 physical timer

- Timers
- EL1 virtual timer
- Non-secure EL2 virtual timer
- Secure EL2 virtual timer
- Secure EL2 physical timer
- The Arm architectural specification includes a mandatory (CNTCTLBase) registers frame that
provides configuration information related to Arm generic timers implemented in MMIO fashion;
- The SoC does not currently have these registers (all Arm generic timers present use system
registers). Full details about the operation of the Generic Timers were introduced in different Arm documents and are now part of the Arm Architecture Reference Manual.
#### 9.3.2.17 Cortex-A9 Timers
The Cortex-A9 complex inside the APE contains an instance of a Cortex-A9 timer block, including the following:
- Global timer, a 64-bit incrementing counter
- Per CPU core private timer, a 32-bit decrementing counter with optional prescaler
- Per CPU core watchdog timer. It has the same structure as a private timer augmented with
watchdog capabilities and can be used as a second private timer. The Cortex-A9 WDT reset request signal is not connected. All these timers operate on the Cortex-A9 clock, making them difficult to use for real-time purposes when the Cortex-A9 clock is subject to DVFS. The APE cluster includes a TKE (not affected by DVFS) and APE software usually do not use at all the Cortex-A9 timers.
#### 9.3.2.18 Functional Safety Island Timers
The Functional Safety Island (FSI) takes over most of the functions of the external safety MCU. The FSI requires two timer modules: A global system counter, matching the Arm generic timer architecture; this is done reusing some of the TSC building blocks. A TKE that provides timers for the Cortex-R5 (similar to Cortex-R5 clusters on the SoC side) or Cortex-R52 (generic Arm timers part of the Cortex-R52 cluster itself). In addition, at least one WDT per CPU core (five WDTs: four Cortex-R52 and one Cortex-R5), as each core could run as an independent software entity. To limit complexity, all timer elements run on the FSI local crystal clock, this simplifies the CAR logic and remove the need for TSC terminal nodes, as explained later on. The overall timer infrastructure logic inside FSI is illustrated below.

- Timers
**Figure 9.35 FSI Timer Infrastructure**
The FSI module is relatively small, so TSC distribution does not need to cover large distances and the TSC value is only distributed to very few endpoints, so TSC is distributed in parallel binary format, with retime stages if needed. The FSI operates at ASIL-D, this is achieved by using software consistency to check the different timer operations, register parity for all configuration registers and hardware watchdog timers.
##### 9.3.2.18.1 FSI-TSC
The FSI-TSC implements a simplified TSC that performs the following functions:
- Supports the Arm architecture registers, except for TrustZone specific requirements
- Note: The Arm architecture requirements define some registers as TrustZone accessible
only; this is not possible for R class Arm CPU cores that do not support TrustZone. Maintains a 56 bit counter, in steps of 32 ns. This is nominally the same rate as the SoC side TSC.

- Timers
Distribute the 56 bit counter in parallel binary format to the rest of the FSI logic, especially the local TKE, the CAN modules and the Cortex-R52 cores
- Also implements the USEC related counter and signals and sends the usec reference pulse to
the local TKE and the FSI fabric, and the msec reference pulse to the local GPIO controller. The FSI-TSC logic operates directly on the FSI XTAL clock (also known as OSC) working with 40 MHz, there is no 31.25 MHz clock and so no CAR level divider to generate such a clock. The following figure shows the block diagram, showing how the SoC side TSC is modified to get the FSI-TSC.
**Figure 9.36 FSI-TSC Block Diagram (Showing Similarities with SoC Side TSC)**
##### 9.3.2.18.2 Registers and APB Interface
FSI-TSC has the same register windows as the SoC counterpart:
- The Arm defined windows, arfsi_tsc_sysctr{0,1,2} are strictly identical to the equivalent
SoC side windows, except that there is no TrustZone support.
- The NVIDIA implementation window, arfsi_tsc is much simpler than the SoC side and detailed
below.
- The USEC address window, arfsi_usec_cntr is identical to the equivalent SoC side window,
except reset values. Note that to fit in the FSI Low Latency Peripheral address range, the different TSC windows are mapped on consecutive 4 KiB windows, not 64 KiB as on the SoC side. Offsets inside each window are unchanged. This is possible as support for page based address virtualization is not needed in

- Timers
the FSI partition. Also, the SCR registers are not present, protection is done via one BLF per window. The FSI-TSC implementation window contains the same registers as defined for the Main TSC, but with different default values, as summarized below. Values highlighted correspond to differences in reset values from the SoC side.
- Register: FTSCACR, RW, equivalent to MTSACR, TSC Adjust Control Register
- Field name
- Bits
- Reset
- Description
- ABS

