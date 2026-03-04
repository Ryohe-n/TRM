# 128 KB of SRAM attached to BTCM0 as one bank

- ATCM base address set to 0
- Init Low Vectors
- Floating Point
##### 8.2.2.6.2 Power Management
The whole CV cluster can be rail gated or each PVA cluster can be power gated separately. There is no inner cluster power gating. For the current PVA generation, VPS0 and VPS1 partitions can't be power gated separately by Cortex-R5 or from external control. The power processor (BPMP) is responsible for any frequency settings for PVA and it is the BPMP responsibility for CV voltage scaling. BPMP is also responsible for all power up and power down sequence.
##### 8.2.2.6.3 HSP
Hardware Synchronization Primitives (HSP) has different hardware synchronization primitives as detailed in the following table.
- Primitive
- Count
- Description
- SM (mail box)
To support a single writer/single reader model.
- SS (Shared Semaphores)
- Used as flags for producer/consumer

- Programmable Computer-Vision Accelerator (PVA)
- Primitive
- Count
- Description
nSI (Shared interrupt)
- Can be used to map 16 mailbox interrupts
- Doorbells
- PVA has no doorbells
##### 8.2.2.6.4 Mailboxes
PVA cluster can use mailboxes to implement inter-processor communication (IPC) or unidirectional communication with CPU cores and other SoC masters. The PVA cluster instances one HSP module to communicate asynchronously with CPU and other engines. There are eight mailboxes in PVA. Each mailbox is one 32 bits register with two associated interrupts to implement the software handshake. The two interrupts per mailbox are for empty and full flags that are directly under software control. The full interrupt is the MSB of the register, called the TAG bit and the empty interrupt is the inversion of the TAG bit. The messaging in mailboxes is defined by software convention where the producer of the mailbox may get interrupted on mailbox empty and then write data with TAG set to 1 into the mailbox to trigger the full interrupt. On the other hand, the consumer of the mailbox may get interrupted on mailbox full, read the data and then write to the mailbox register with TAG field set to 0 to complete the handshake. Polling is an alternative solution and can be used by either the producer or the consumer. Each mailbox has an SCR to allow for secure access. HSP SCRs are located in first page of SM: PVA0/1_HSP_SM0_BASE. Shared mailboxes are 32 KB apart and a pair is mapped in a 64 KB page.
- The base for a given mailbox is SMx_BASEx = HSP_PVA{0/1}_BASE + 64 KB
{ PVA0/1_HSP_COMMON} + x * 32 KB.
##### 8.2.2.6.5 Shared Semaphores
There are four shared semaphores which are registers with associated set/clear addresses to allow easy manipulation of individual bits inside them, i.e., without the need for a RMW operation. Shared semaphores are accessed by either PVA-R5 or outside masters (including CCPLEX). Software must statically allocate the ownership of individual semaphores for correct operation. The shared semaphores are formed by three registers, each 32-bits wide: A read/write register showing the current value of the semaphore
- Two read/write registers to set and clear individual semaphore bits
##### 8.2.2.6.6 Shared Interrupts
Shared interrupts are located in the common register space and there are five shared interrupts that can be used to map the 16 mailbox interrupts.

- Programmable Computer-Vision Accelerator (PVA)
#### 8.2.2.7 Timers
The following table and diagram show the configuration of timers and the block diagram of timers in PVA.
- Parameter
- Value
- Number of NV_timers (nT)
- Number of watchdogs (nW)
- Interrupt routing
- Disabled
- Number of shared interrupts exposed
- Each one of the timers has a 29-bit count and can be programmed to generate one pulse or
periodic reference pulses. The timing reference clock for each of the timers can be the 1 MHz reference, TSC or OSC clk. Upon enable, the timer loads the timer present trigger value into its counter and starts decrementing at the rate it was selected. When the counter present value reaches zero, a pulse is generated. In case the periodic interrupt mode is enabled, the timer reloads the PTV value and start decrementing again. The pulse from the timer is translated into an interrupt to AVIC/Cortex-R5. Each NV timer has one associated interrupt, which is set when the down counter reaches 0. For 1 MHz reference, the timer has a range between 1 µs and 537 sec. Each NV timer can optionally be halted during debug.
- The TKE block contains four NV timers and one watchdog timer. There are also few common
registers and SCR registers.

- System Components
9. System Components

