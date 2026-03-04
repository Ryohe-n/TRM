# 30 MHz

- Counter value can only be updated in
secure mode.
- GT
- Arm Generic
- PPI(2)
- TrustZone
- TSC
These timers use TSC as reference.
- A9T
- Cortex®-A9
- Timers
- PPI
- TrustZone
- SCU
- Operates on the CPU clock; so can be
problematic if frequency is not fixed. (1) See the Interrupt Controller chapter for the authoritative mapping of RTC/TMR/WDT interrupts. (2) PPIs are per CPU Private Peripheral Interrupts. All timer modules support fine grain access rights. The security model is TrustZone® for modules coming from Arm or following the Arm architecture prescriptions: TSC, GT, and A9T, and the configurable NV security models based on Security Control Register (SCR) for all other modules, including the NV-specific TSC implementation registers. All time-keeping modules can be configured to stop during debug. This is useful to suspend the operation of WDT (to avoid resetting the chip) and the CCPLEX GT (suspending the OS tick). The only exception is the safety reference counter in RTC.
#### 9.3.1.1 Glossary and Acronyms
- Note that different names may end up in the same acronym when the entire TRM is put in
perspective. The acronyms listed here are within the context of the Timers chapter. Refer also to the Glossary in the Introduction section of the TRM. Note: NVIDIA is transitioning from the use of Master/Slave terminology in our documentation. During the transition period, there may be inconsistent use of the terminology. In this chapter, "Main" can be interpreted as "Master" and "Secondary" can be interpreted as "Slave."

- Timers
- Term
- Definition
- AO
- Always On (sometimes also shown as AON)
- Arm Processor Complex
- Arm processor core itself plus some closely associated peripherals, including
- CCPLEX, the main CPU complex of eight Carmel cores
- Multiple Cortex-R5 clusters
- The Cortex-A9 ADSP inside APE
- AVIC
- Arm Vectored Interrupt Controller
- GT
- Generic Timer
- GTE
- Generic Timestamping Engine
- LFSR
- Linear Feedback Shift Register
- LIC
- Legacy Interrupt Controller
- LNCO
- Lockable NCO
- MTSC
- Main TSC
- NCO
- Numerically Controlled Oscillator
- OSC
- Oscillator
- PCR
- Present Count value Register
- PTV
- Present Trigger Value, the value loaded at start into an NV timer
- RTC
- Real-Time Clock
- SMP
- Symmetrical Multi-Processing
- SPE
- Sensor Processing Engine
- TKE
- Time-Keeping Element, the module instantiating NV timers and WDTs
- TMR
- TMR refers to NV timers
- TSC
- Timer’s System Counter, also known as TimeStamp Counter
- WDT
- WatchDog Timer
#### 9.3.1.2 Relevant Chapters in the TRM
- Address Map
- Clock Controller and Reset (CAR)
- Hardware Safety Manager (HSM)
#### 9.3.1.3 Address Map
The address spaces (in 64 KiB pages) assigned to the different timers modules are as follows:

- Timers
- Each TKE
- One page for shared registers
- One page per NV Timer, nT of them where nT is a configuration parameter
- One page per WDT, nW of them where nW is a configuration parameter
- Each GTE requires one page
The RTC requires two pages:
- One page for the RTC proper
- One page for the AOWDT
- The TSC requires four pages total
- One page for each of the three Arm specified frames
- One page for the TSC implementation registers
- One page for the microsecond (µs) counter
#### 9.3.1.4 Clocks
The TSC RefClk (also known as tsc_ref_clk) is specific to timers and generated inside CAR using dedicated circuitry. The base logic is a fractional divider, but with an additional adjust signal to allow for fine control of the generated frequency. The fractional divider is part of CAR with the adjust signal coming from TSC. TKE uses the following clocks:
- APB clock
- TSC RefClk, used for the TSC input and for general operation
- TKE also uses one of these two clocks
- OSC for the TKE instance inside the Always On partition
clk_m for all other TKE instances RTC uses the following clocks:
- APB clock
- The 32,768 Hz reference clock
TSC uses the following clocks:
- APB clock

