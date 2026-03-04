# 64 -bit AXI Master interface for DRAM Requests 32-bit AXI Peripheral interface for MMIO Requests 64-bit AXI Slave interface for DMA access to the local SRAM

- Functional Description
The following diagram depicts the Lockstep configuration of the Cortex-R5. It includes redundant logic (no RAM and clock modules) and Comparators. Caches, Debug, and ETM modules are not replicated. Debug and ETM functions are not considered as safety critical, any debug activity during the safety-critical mission mode handled as an error. Caches are protected by ECC as these are safety critical.

- Display Control Engine (DCE)
**Figure 7.43 Lockstep Configuration of DCE Cortex-R5**
- Configuration
The DCE Cortex-R5F is implemented with the following features: 32 KB instruction cache with ECC 32 KB data cache with ECC 384 KB of SRAM with ECC attached to BTCM as two banks of 192 KB SRAM
- TCM hard error cache
- Init Low Vectors
- Processor version r1p3
- FPU extensions including double-precision capability
##### 7.2.5.1.2 Interrupt Controller
The Cortex-R5 does not have an integrated interrupt controller. A pair of ARM Vectored Interrupt Controllers (AVIC) accessed through the local NoC serves as the interrupt controller for the DCE and are referred to as the AVIC.

- Display Control Engine (DCE)
- Processor and Interrupt Controller Documentation
Detailed documentation for the Cortex-R5 Processor and the AVIC is readily available from Arm and may be downloaded from the Arm website. A good starting point is these documents:
- Document DDI 0273A
- This document assumes access to these documents, and does not reproduce information from
them.
##### 7.2.5.1.3 Timers
The Cortex-R5 does not have any integrated timers. Timers for the DCE Cortex-R5 are provided by a separate timer block in the DCE.
##### 7.2.5.1.4 TCM Interface
Cortex-R5 provides two tightly coupled memory (TCM) ports. These ports, named ATCM, and BTCM, provide low latency access to the Cortex-R5 processor. The ATCM hosts the EVP interface and the BTCM hosts 384 KB of RAM. The following pin and build configurations define the ATCM and BTCM configurations.
- Build Configuration
The DCE Cortex-R5 processor is built with both the ATCM and BTCM enabled.
- Table 7.43 TCM Build Configuration
- Config
- ATCM
- BTCM
- Ports
- One Port
- Two Ports (BTCM0, BTCM1)
- ECC
- ECC
- ECC
- Pin Configuration for ATCM Base Address
With both ATCM and BTCM enabled, the Cortex-R5 requires that the base address of one of the
- TCMs is set to 0x0. For the DCE Cortex-R5, this is the ATCM since the ATCM hosts the EVP,
therefore the LOCZRAMA pin is tied HIGH.
##### 7.2.5.1.5 ATCM Interface
The Cortex-R5 ATCM interface hosts the Exception Vector Table module. The EVP is wrapped in the ATCM Wrapper that provides the ATCM interface to Cortex-R5.

- Display Control Engine (DCE)
- Exception Vector Pointers
- When the DCE Cortex-R5 takes an exception (including the reset exception), the processor
execution is forced to an address that corresponds to the type of exception. These addresses are called the exception vectors. By default, the exception vectors are eight consecutive word-aligned memory addresses, starting at an exception base address (which is reset default to 0x0000_0000 for the DCE Cortex-R5 since VINITHI is tied to 0). The Exception Vector Pointers (EVP) module is implemented through a set of 16 registers starting at address 0x0. The following table shows the default organization of the EVP coming out of reset. The programmability of EVP allows the processor to jump to an arbitrary address space in the entire memory space that is accessible to the DCE Cortex-R5.
- Table 7.44 EVP Registers
- Data
- Description
- LDR, PC, [PC+0x18]
- Reset vector. According to Arm Arch manual, the PC reads an address
equals current instruction + 8.
- LDR, PC, [PC+0x18]
- Undefined exception
- LDR, PC, [PC+0x18]
- SWI (also known as SVC) exception
- LDR, PC, [PC+0x18]
- Prefetch Abort
- LDR, PC, [PC+0x18]
- Data Abort
- LDR, PC, [PC+0x18]
- Reserved
- LDR, PC, [PC+0x18]
- IRQ
- LDR, PC, [PC+0x18]
- FIQ
- NV_ADDRESS_MAP_SCE_BTCM
BTCM base address.
- NV_ADDRESS_MAP_SCE_BTCM + 4
- NV_ADDRESS_MAP_SCE_BTCM + 8
- NV_ADDRESS_MAP_SCE_BTCM + 12
- NV_ADDRESS_MAP_SCE_BTCM + 16
- NV_ADDRESS_MAP_SCE_BTCM + 20
- NV_ADDRESS_MAP_SCE_BTCM + 24
- NV_ADDRESS_MAP_SCE_BTCM + 28

- Display Control Engine (DCE)
- The EVP table assumes that the BTCM starts at address NV_ADDRESS_MAP_DCE_BTCM. The
redirection of exception vectors enables DCE to execute an ISR handler in the entire memory space accessible by it. The following steps are performed to handle EVP requests: 1. 2. 3. 4.
- The Cortex-R5 issues a read for exception vector address (@0x0000_00XX)
- EVP decodes exception vector aperture and generates read-response
- Returns LD PC, [PC + 0x18] instruction as return data
- This results in PC getting loaded with pointer to exception vector
Note: Cortex-R5 additionally supports vectored exception handling specifically for IRQ interrupts. This is supported with PL192 AVIC interrupt controller. When the AVIC triggers an IRQ exception, it can optionally send out a pointer to the interrupt handler to service the specific interrupt. In case of vectored interrupts through AVIC, Cortex-R5 does not reference the EVP table.
- Note: EVP reset is decoupled from the Cortex-R5 reset. This enables the Cortex-R5 to be
independently reset without affecting the content of EVP registers.
- ECC
The EVP logic in DCE is protected using the 64-bit ECC scheme defined in the Arm TRM.
- Error Checking and Signaling
The ATCM interface does not allow accesses to ATCM signal an error. When bit[0] of Auxiliary Control Register (ACTLR.ATCMECEN) is set to 1, the error triggers an undefined exception on Cortex-R5 accesses or AXI slave error on AXI slave requests by asserting the ATCERROR. ATCERROR is asserted when the ATCADDR address does not decode into address space implemented within the ATCM wrapper.
##### 7.2.5.1.6 BTCM Interface
BTCM hosts the DCE Cortex-R5 tightly coupled RAM. It is a 384 KB RAM with ECC support. BTCM is split into two ports, B0TCM and B1TCM, each with 192 KB of RAM. These memories are configured in interleaved mode.
- The NV_ADDRESS_MAP_DCE_BTCM in the global AMAP defines the address range for B0TCM and
B1TCM. The benefits of splitting the BTCM into two ports are as follows:
- Having the 192 KB BTCM split into B0TCM and B1TCM enables simultaneous use of both
ports: one by the processor and another by the DCE DMA. The DCE Cortex-R5 can be working on one bank of the BTCM while DCE DMA can be paging in data/code to/from the other.

- Display Control Engine (DCE)
- If the code and data space can be segregated into B0TCM and B1TCM, the instruction and
data accesses from the Cortex-R5 can be done independently.
- ECC
The BTCM interface in the DCE uses the 32-bit ECC.
- Error Checking and Signaling
- Accesses to the BTCM signal an error when the particular access is not allowed by the BTCM
interface. When bit[1] and bit[2] of Auxiliary Control Register (ACTLR.B0TCMECEN and ACTLR.B1TCMECEN) are set to 1, the error triggers an undefined exception on Cortex-R5 accesses. It can trigger an AXI slave error on AXI slave requests by asserting the B{0/1}TCERROR. B{0/1}TCERROR is asserted when any of the following happens: B{0/1}TCADDR address does not decode into address space implemented within the BTCM wrapper. The retention port for a TCM RAM bank is asserted and the TCM RAM bank is accessed. However, RAM sleep controls are not used.
- BTCM Error Injection
The BTCM interface supports injecting single- or double-bit errors to test the error detection logic.
- The error logic allows an error to be injected on a single Cortex-R5 to create a lock-step
miscompare, or on both Cortex-R5 processors. The error injection logic consists of an error mux that is placed on the BTCM read data bus and an error control block that connects to the BTCM address bus. The DCE Cortex-R5 connections are the same except for a dedicated set of error muxes.

- Display Control Engine (DCE)
**Figure 7.44 BTCM Error Injection Diagram**
- BTCM Error Injection Controls
The error control block performs two major functions: 1. 2. Determining when to inject an error. Determining the channel and bits to inject an error on.
- The error control block injects an error on the next read transaction received if
BTCM_ERR_CTL[ForceErr]=1, or if the error timer expires. The error timer is a 16-bit preloadable counter that increments when any read is received on the BTCM interface, except if the read is received one clock after an error is injected. The error timer can be configured in roll-over mode (BTCM_ERR_CTL[ErrTimerReloadEn]=1), or one-shot mode (BTCM_ERR_CTL[ErrTimerReloadEn]=0). The error control block uses a round robin arbiter to select the channel to inject an error if more than one read channel is active. The error control logic determines the location of one or more bits to corrupt using a counter and two decoders. The counter increments on every BTCM read when BTCM_ERR_CTL[BitCntEn]=1.
- When BTCM_ERR_CTL[BitCntEn]=0, BTCM_ERR_CTL[BitCntLoad] can be used to specify a specific
error location. Since there are only 39 bits per-channel, the counter counts from zero to 38 and

- Display Control Engine (DCE)
then rolls over. The two decoders are used to create the bit location for a single- and double-bit error.
##### 7.2.5.1.7 Interrupts
The interrupt controller for the DCE consists of two components: 1. (Vector/Scalar) interrupts driven through a pair of daisy-chained Arm-Vectored Interrupt
- Controllers (AVIC), and
Scalar interrupts from Legacy Interrupt Controllers (LIC) that feed into the AVIC. 2. The PL192 interrupt controllers are hooked up to the DCE through the AXI2APB bridge on the DCE- NIC. Note that the AHB peripheral port of the DCE Cortex-R5 processor is NOT used to hook up the PL192s. The AVIC is located behind the AXI2APB bridge in the DCE. Having the AVIC sit behind the AXI2APB bridge enables AXI2APB bridge to protect accesses to the AVIC configuration space. The AVIC port of DCE Cortex-R5 interfaces to the PL192 and enables the following functions in hardware to minimize software overheads of servicing the interrupt. Determine from the interrupt controller which interrupt source is requesting service. Determine where the service routine for that interrupt source is loaded.
- Masks that interrupt source before reenabling processor interrupts to permit another
interrupt to be taken. The interrupt connection to PL192 uses the following rules. Local interrupts originating from within DCE are connected to PL192 interrupt inputs. These are vectored and have low interrupt latency. Four external interrupts are connected from the LIC. Each interrupt can be an aggregation of one or more interrupts. While it is possible to service the interrupts by reading VICADDRESS register in PL192, usually the low latency AVIC port is used (i.e., SCTLR.VE bit is set to enable the AVIC port). Note: For further information on DCE Cluster Interrupt, refer to the Interrupt Controller section of this TRM.
- PL192 Connections
- Table 7.45 VIC0 Interrupts
- Function
- Bit
- NV_SCE_INTERRUPT_WDTFIQ
- NV_SCE_INTERRUPT_WDTIRQ

- Display Control Engine (DCE)
- Function
- Bit
- NV_SCE_INTERRUPT_TIMER0
- NV_SCE_INTERRUPT_TIMER1
- NV_SCE_INTERRUPT_TIMER2
- NV_SCE_INTERRUPT_TIMER3
- NV_SCE_INTERRUPT_MBOX
- NV_SCE_INTERRUPT_GTE
- NV_SCE_INTERRUPT_PMU
- NV_SCE_INTERRUPT_DMA0
- NV_SCE_INTERRUPT_DMA1
- NV_SCE_INTERRUPT_DMA2
- NV_SCE_INTERRUPT_DMA3
- NV_SCE_INTERRUPT_DMA4
- NV_SCE_INTERRUPT_DMA5
- NV_SCE_INTERRUPT_DMA6
- NV_SCE_INTERRUPT_DMA7
- NV_SCE_INTERRUPT_LIC0
- NV_SCE_INTERRUPT_LIC1
- NV_SCE_INTERRUPT_LIC2
- NV_SCE_INTERRUPT_LIC3
- NV_SCE_INTERRUPT_V0RSVD21
- NV_SCE_INTERRUPT_HSM_CRITICAL_ERR
- NV_SCE_INTERRUPT_VI_HP
- NV_SCE_INTERRUPT_VI2_HP
- NV_SCE_INTERRUPT_HSM_HP
- NV_SCE_INTERRUPT_HSM_LP
- NV_SCE_INTERRUPT_VI_LP
- NV_SCE_INTERRUPT_V0RSVD27
- NV_SCE_INTERRUPT_V0RSVD28
- NV_SCE_INTERRUPT_V0RSVD29

- Display Control Engine (DCE)
- Function
- Bit
- NV_SCE_INTERRUPT_V0RSVD30
- NV_SCE_INTERRUPT_V0RSVD31
- Table 7.46 VIC1
- Function
- Bit
- NV_SCE_INTERRUPT_V1RSVD0
- NV_SCE_INTERRUPT_ACTMON
- NV_SCE_INTERRUPT_FPUINT
- NV_SCE_INTERRUPT_PM
- NV_SCE_INTERRUPT_MC_SBE
- NV_SCE_INTERRUPT_NOC_SECURE
- NV_SCE_INTERRUPT_HSP1_SI_0
- NV_SCE_INTERRUPT_HSP1_SI_1
- NV_SCE_INTERRUPT_HSP1_SI_2
- NV_SCE_INTERRUPT_HSP1_SI_3
- NV_SCE_INTERRUPT_HSP1_SI_4
- NV_SCE_INTERRUPT_HSP1_SI_5
- NV_SCE_INTERRUPT_HSP1_SI_6
- NV_SCE_INTERRUPT_HSP1_SI_7
- NV_SCE_INTERRUPT_TOP0_HSP_DB
- NV_SCE_INTERRUPT_CAR
- NV_SCE_INTERRUPT_V1RSVD16
- NV_SCE_INTERRUPT_CTIIRQ
- NV_SCE_INTERRUPT_V1RSVD18
- NV_SCE_INTERRUPT_I2C1
- NV_SCE_INTERRUPT_I2C3
- NV_SCE_INTERRUPT_I2C8
- NV_SCE_INTERRUPT_DISP

- Display Control Engine (DCE)
- Function
- Bit
- NV_SCE_INTERRUPT_V1RSVD23
- NV_SCE_INTERRUPT_HSP2_SI_0
- NV_SCE_INTERRUPT_HSP2_SI_1
- NV_SCE_INTERRUPT_HSP2_SI_2
- NV_SCE_INTERRUPT_HSP2_SI_3
- NV_SCE_INTERRUPT_HSP2_SI_4
- NV_SCE_INTERRUPT_HSP2_SI_5
- NV_SCE_INTERRUPT_HSP2_SI_6
- NV_SCE_INTERRUPT_HSP2_SI_7
##### 7.2.5.1.8 DCE Fabric
As shown in the next figure, the DCE Fabric connects various submodules in the cluster. It also provides CBB master and slave ports, DBB master and slave ports to/from the cluster. At a high level, each of the different masters and slaves (such as Cortex-R5, DMA, HSP, AST) in the cluster are interfaced to nodes within the Fabric. Depending on the master and slaves, a node can be an AXI or an APB. Nodes are interconnected using AXI4 protocol through Fabric transport path network.
- Master Node: Node of the fabric connected to a Master interface
- Slave Node: Node of the fabric connected to a Slave interface
- Root Master Node: A Master Node connected to an IP, which is a master to the fabric is a
- Root Master Node. For example, the SCE Master Node interfaced to Cortex-R5 AXIM is a Root
Master Node.
- Intermediate Master Node: A Master Node, which does not connect to an actual Master on
an IP but connects to a Master on another fabric. For example, CBB Master Node for DCE cluster (as a master) is an Intermediate Master Node.

- Display Control Engine (DCE)
**Figure 7.45 DCE Fabric Connectivity**
- Error Monitoring, Notification, and Collation
The cluster fabric implements the following modules to deal with functional/safety errors.
- Error Monitoring
An Error Monitor is implemented in every Root Master Node, which logs the in-band errors as reported by an IP (Slave on the Cluster Fabric/CBB) using a Slave Node. The errors supported by the fabric are:

- Display Control Engine (DCE)
- Slave Errors
- Address Decode Errors
- Timeout Errors
- Firewall Errors
- Power-down Errors
- Unsupported Request Errors
On occurrence of any of the above errors, the Error Monitor reports it/them to the Error Notifier. The Error Monitor logs the attributes of the first erroneous transaction. Subsequent errors are only indicated as an Overflow status.
- Error Notifier
The Error Notifier (one per fabric) receives the errors from the various Error Monitors in the fabric, collates them, and sends out an interrupt to AVIC and LIC.
- Error Collator
The fabric houses an Error Collator, which collates the errors as detected by the various safety diagnostics implemented throughout the fabric. These error/faults are routed to HSM.
- MC Ports
To prevent Cortex-R5 demand requests from being blocked by DMA requests, the DCE has two 64- bit AXI ports to the MC. One MC port is used for Cortex-R5 requests. The second is used for DMA requests.
- DCE Error Responses
The DCE returns different error responses for accesses made to unimplemented/reserved address spaces. However, all submodules meets the basic requirement of not hanging the bus when reserved space is accessed.
- One important point to note is that the NoC does NOT transport dead-codes when an APB
transaction returns PSLVERR. Hence, the master shall not rely on dead-code behavior.
- Table 7.47 AXI Slave Error Responses
- Module
- SlvErr / DecErr
- Read DATA
- DCE_ATCM_EXT_BASE
- SlvErr
0x0
- DCE_R5AXISLAVE_BASE
- SlvErr
0x0 The following table lists the behavior of DCE submodules when a reserved space access is done.

- Display Control Engine (DCE)
- Table 7.48 DCE Submodules
- Submodule
- Generates pslverr
- Return value on reserved space read
access
- DMA
- Yes
0xdead1001
- GTE
- Yes
0xdead1001
- HSP
- Yes
0x0
- TKE
- Yes
0xdead1001
- AVIC
- No
0x0
- AST0/AST1
- Yes
0xdead1001
- DCE_CAR
- Yes
0xdead1001
- DCE_CAR_ERR_COLLATOR
- Yes
0xdead1001
- DCE PM
- Yes
0xdead1001
- PM Actmon
- Yes
0xdead1001
- DCE ATCM (by APB)
- Yes
0xdead1001
- DCE Cluster (from CBB)
- Yes
0xdead1001 Accesses, which violate the security settings are returned with AXI SLVERR to the masters. Security violations are either detected in NoC ARF/BLF firewalls or submodule SCR firewalls.
##### 7.2.5.1.9 DMA Controller
The DCE DMA controller is an eight-channel implementation of the central DMA controller. Refer to the General Purpose DMA chapter for more details.
- Table 7.49 DMA Channel Mapping
- Block
- AMAP name - use case
- Tx DMA Request Port
- Rx DMA Request Port
- GEN1_I2C
- I2C1 – Camera config
- CAM-I2C
- I2C3 – Camera config
- GEN8_I2C
- I2C8 – Display Aggregator
- DP-AUX0
- I2C6 – eDP/HDMI side channel

- Display Control Engine (DCE)
##### 7.2.5.1.10 Address Translation
- The DCE is required to support sending requests to DRAM that indicate to the SMMU if the
request requires translation to support a physical carve-out. The SMMU needs to handle requests differently based on if a translation is requested. Since the Cortex-R5 is not capable of indicating if a request requires translation, an Address Space Translation Engine (AST) is used to define the address regions that require translation. The AST is also used to remap the Cortex-R5 and DMA- generated address to prevent address space collision for I/O virtual addresses. The DCE includes two eight region AST modules. The DCE is only allowed to bypass SMMU translations when accessing either a DCE carve-out or SysRAM. If a translation is not requested, the SMMU must bypass the address translation and ensure that the address is inside the DCE DRAM region. If a translation is requested, the SMMU performs the translation and ensures that the translated address is not in the DCE region (or any other protected region).
##### 7.2.5.1.11 Shared Mailboxes
- The DCE uses shared MMIO mailbox registers to communicate between the DCE Cortex-R5 and
other processors in the system. The mailbox implementation is defined in the HSP section.
- Table 7.50 Shared Mailboxes
nSM nAS nSS nDB nSI
- Notes
SI[0] is sent to the AVIC. SI[4:1] are sent to the LIC.
##### 7.2.5.1.12 Timekeeping Unit
- The Cortex-R5 does not come with built-in timers. The timers are integrated into the DCE
subsystem with an external Timekeeping Engine (TKE). The architecture for TKE is specified in the Timers chapter of this document. The timekeeping unit provides the following functionalities: 1. 2. 3.
- Timers (NV_timers)
- Watchdog Timer (WDT)
- Timestamp counter (TSC) read-back
- Table 7.51 DCE TKE Configuration
- Parameter
- Value
- Number of NV_timers (nT)
- Number of watchdogs (nW)
- Interrupt routing
- Disabled

- Display Control Engine (DCE)
- Parameter
- Value
- Number of shared interrupts exposed
TSC input type (is Serial). 1 (Serial)
**Figure 7.46 DCE Timers and WDT Hookup**
- Watchdog Timer
A watchdog timer associated with the DCE Cortex-R5 is instanced to monitor Cortex-R5 health. The watchdog timer has robust restart mechanisms like windowed watchdog and Q&A watchdog. DCE has a dedicated watchdog timer instanced in the cluster. This enables us to architect the functionality of this timer as per DCE-specific requirements.
##### 7.2.5.1.13 Interrupt Timestamp
- The DCE implements a timestamp module for logging the current TSC value when interrupts
occur.

- Display Control Engine (DCE)
##### 7.2.5.1.14 Power Management Module
There is no power management module in this SoC.
##### 7.2.5.1.15 Reset and Clocking
- Reset
- There are several independent reset domains in the DCE that are able to independently
reset different parts of the Cortex-R5 and DCE.
- Cortex-R5 Reset
Cortex-R5 has the ability to start executing instructions as soon as its reset is released (de- asserted). Hence, it is important to ensure that the entire system is ready to accept instructions before Cortex-R5 is released out of reset.
- Table 7.52 Cortex-R5 Reset Domains
- Reset
- Domain
- Description
- ACPRESETn
Since the DCE Cortex-R5 subsystem does not have an ACP. This should be tied inactive (to 1). nRESET CPU non-debugging logic reset. Note: Whenever nRESET is asserted, it should be asserted for at least four CLKIN cycles for correct reset operation. This signal needs to be pulsed by the watchdog timer on a "processor hang" if debug through reset is needed. nSYSPORRE
- SET
Cortex-R5 system reset. This resets the Cortex-R5 processor and debug logic. Note: Whenever nSYSPORESET is asserted, it should be asserted for at least four CLKIN cycles for correct reset operation. nPRESETDB G Cortex-R5 Debug reset. Resets debug-domain debug logic and the APB interface of the CPU. nCPUHALT Prevents the Cortex-R5 from fetching code out of reset.
- DBGRESETn
Cortex-R5 Debug reset. Resets core-domain debug logic. This includes breakpoints, watchpoints, and the DCC registers.
- DCE Reset
There are four groups of resets in the DCE as shown below. They are grouped so that the reset assertion and deassertion can be understood in terms of a group of signals rather than a bunch of independent signals.

- Display Control Engine (DCE)
- Table 7.53 Reset Levels in DCE
- Group 0
- Group 1
- Group 2
- Group 3
- System reset
- All DCE resets, except for Groups 2
and 3 resets nSYSPORRESET, nRESET,
- ARSTn, CRSTn, LRSTn, VIC0, VIC1
nCPUHALT The order of deassertion of resets on cold boot are from Level 0 through Level 3. Group 0 reset is the system reset. This is controlled by the central CAR module.
- Group 1 resets include most of the resets of DCE (except the Group 2 and Group 3). This
reset group is de-asserted when Level 0 group reset is released/deasserted. DBGRESETn and nPRESETDBG may be extended up to four clocks after the Group 1 reset de-asserts. Group 2 reset group is primarily the Cortex-R5, comparison logic, and PL192 resets. This is the last module in the DCE cluster that comes out of reset. The rest of the cluster is ready to receive and process Cortex-R5 requests as soon as Cortex-R5 is released. The Group 2 reset is the same as Group 1 reset, except it may be extended up to four clocks.
- Group 3 reset group includes the nCPUHALT. This is not truly a processor reset, but can be
used to hold the processor from executing instructions. For the DCE, nCPUHALT remains asserted until firmware has been loaded into the TCM. Do this as the boot code sets the
- FWLoadDone bit once the TCM load is complete. The FWLoadDone bit is not cleared except
by an sce_cluster_reset.
##### 7.2.5.1.16 Clocking
The DCE has multiple clock domains and each domain can have its clock sources from a DFLL, a shared system HPLL, or PLLP.
- Major Clock Domains
1. 2. DCE CPU Clocks: This is the main clock for the Cortex-R5, TCM, and PM blocks.
- DCE NIC Clocks: Other than the Cortex-R5 modules listed, the remaining submodules such as
NoC, DMA, AST, HSP, TKE, GTE , use sce_nic_clk.
##### 7.2.5.1.17 Debug Interface
The DCE supports Arm CoreSight Debug Architecture. CoreSight is an architecture that decouples the logic talking to the external host from the logic talking to the internal debug logic. The architecture is highly modular with a debug system being built from a set of compatible building blocks.

- Display Control Engine (DCE)
**Figure 7.47 DCE DFD Connections**
##### 7.2.5.1.18 DCE Debug
The following provides usage of the Debug Features.
- Configuring DCLS Comparisons in Debug Mode
Refer to the Safety Manual for details on the limitations of the use of debug in safety-related applications. Note: Software does not need to disable lock-step mode while debugging Cortex-R5, as special provision is made in hardware for this.
- Configuring Debug Bus (CNA bus) Monitoring in Debug Mode
Software can choose to enable or disable CNA bus monitoring depending on the platform's safety and debug requirements. From DCE's point of view, software shall follow the sequence below in order to disable CNA bus monitoring in DCE cluster.
- Perform the following configurations before setting ENABLE in the DCLS_ENABLE field in
APS_PROC_CFG_DCLS_ENABLE register within DCE_CFG AMAP space.
- Configure DISABLE in ERR77 field in the SCE_EC_REGS_ERRSLICE2_MISSIONERR_ENABLE
register in DCE_ERR_COLLATOR AMAP space.
- Configure DISABLE in ERR77 field in the SCE_EC_REGS_ERRSLICE2_LATENTERR_ENABLE
register in DCE_ERR_COLLATOR AMAP space.

- Display Control Engine (DCE)
- Configure DISABLE in ERR77 field in the
- SCE_MISC_AUTOLOCK_EC_ERRSLICE2_MISSIONERR_ENABLE register in DCE_MISC AMAP
space.
- Configure DISABLE in ERR77 field in the
- SCE_MISC_AUTOLOCK_EC_ERRSLICE2_LATENTERR_ENABLE register in DCE_MISC AMAP
space.
- Error Assertion for ATCM Writes
ATCM writes initiated by software running on Cortex-R5 do not result in TCERROR assertions. Hence those writes may go undetected and result in possible systematic fault. If software needs a mechanism to flag errors for ATCM writes (initiated by Cortex-R5 software), it can configure the Cortex-R5 MPU to set up the ATCM region as a read-only region. No additional software configuration is required to detect errors for write access happening through the AXI slave port. Cortex-R5 shall return TCERROR for those accesses.
- Configuration of DCE Hardware Safety Mechanisms
This section describes the steps that can be completed by software to set up/enable various safety mechanisms implemented in hardware. DCLS initialization and enabling:
- Arm Safety manual recommends initializing Arm Architecture registers to prevent
uninitialized registers causing comparison failures in a lock-step configuration.
- After running the initialization code, software can enable LockStep comparison by
programming the APS_PROC_CFG_DCLS_ENABLE in the DCE_CFG AMAP space.
- Lockstep fault monitoring using ErrorCollator can be enabled/disabled using ERR87 in the
register SCE_EC_REGS_ERRSLICE2_MISSIONERR_ENABLE in DCE_ERR_COLLATOR AMAP space. These are enabled by default.
- Debug signal monitoring (CNA bus) can be enabled/disabled using ERR77 in the register
SCE_EC_REGS_ERRSLICE2_MISSIONERR_ENABLE in DCE_ERR_COLLATOR AMAP space. These are enabled by default. Enabling Cortex-R5 ETM tracing for DCLS comparisons: ETM trace output signals on the Cortex-R5's processor trace interface carries information about the current-executed instruction, processed-data, and its corresponding address. These signals are probed from within the processor core. DCLS comparators compare ETM outputs too as a part of lock-step structure.
- Any possible lock-step mismatch between cores can thus be detected as soon as executed
instruction/data flow goes out of sync, instead of waiting for the mismatch to propagate to the Cortex-R5's functional output interfaces (like AXI, TCM, etc.). ETM bus comparison thus improves the detection of latent faults.

- Display Control Engine (DCE)
- By default, ETM traces are disabled. To enable tracing, software shall configure ETM power
down field in the ETM's Main Control Register to 0. Debug authentication signals do not block the trace generation on Processor trace interface.
- Trace output generation and comparison happen when production_mode==1 and
DBGEN==0 and NIDEN==0.
- ETM module generates trace on the ATB interface based on the debug authentication
settings.
- No trace is generated on ATB interface when production_mode==1 and DBGEN==0 and
NIDEN==0. Enabling Cortex-R5 events:
- Software shall enable the event bus monitoring by setting the X bit in Performance Monitor
Control Register (PMCR) to 1. Cortex-R5 TCM events:
- TCM ECC check is enabled by Cortex-R5 by configuring ATCMPCEN/B0TCMPCEN/
B1TCMPCEN fields (bit [25:27]) in c1, Auxiliary Control Register.
- These checks are enabled by default on reset (since corresponding ports, PARECCENRAMm
[2:0] are tied to 3'b111 in hardware).
- TCM correctable and fatal ECC events can be monitored in two ways: using Cortex-R5 Aborts
or using HSM interrupts.
- Monitoring of TCM fatal events using HSM interrupts can be enabled/disabled using
- ERR42/ERR43/ERR55/ERR47/ERR48/ERR49 fields in the
register SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE in DCE_ERR_COLLATOR AMAP space. These are enabled by default. TCM fatal events always results in Cortex-R5 Prefetch or Data Abort.
- TCM correctable events can optionally be configured to generate Cortex-R5 aborts by
setting 0 in ATCMECC/BTCMECC (bit [3:2]) fields in c15, Secondary Auxiliary Control Register.
- TCM correctable events can be monitored using HSM interrupts by configuring fields
ERR50/ERR51/ERR52/ERR53/ERR54 to 1 in the register. SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE in DCE_ERR_COLLATOR AMAP space. These are enabled by default. Cortex-R5 Cache events: Cache ECC check is enabled by configuring CEC field (bits 3:5) in the c1, Auxiliary Control Register.
- By default, on reset deassertion Cache ECC check is disabled. Software shall enable Cache
ECC by setting above register.
- The Cache ECC error behavior table in the Cortex-R5 TRM describes the various settings of
CEC field. Section 8.5.5 in the Cortex-R5 TRM describes the sequence to enable Cache with ECC.

- Display Control Engine (DCE)
- Cache ECC fatal errors can be monitored using HSM interrupts by configuring fields ERR42/
- ERR43/ERR44/ERR45 in the register. SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE in
DCE_ERR_COLLATOR amap space. These are enabled by default.
- Cache ECC correctable errors can be monitored using HSM by configuring fields ERR38/
- ERR39/ERR40/ERR41 in the register. SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE in
DCE_ERR_COLLATOR amap space. These are enabled by default. Cortex-R5 L2 AXI errors: L2 AXI errors do not result in any Cortex-R5 abort. L2 AXI errors are monitored. using ErrorCollator/HSM as described below:
- L2 AXI Bus Correctable error monitoring can be controlled at ErrorCollator input using
- ERR57 in the SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE register. By default, this
field is enabled and comparator outputs are monitored.
- L2 AXI Bus Fatal error monitoring can be controlled at ErrorCollator input using ERR58 in
the SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE register. By default, this field is enabled and comparator outputs are monitored.
- AXIM's/AXIS's/AXIP's all channel (AR/AW/R/W/B) correctable error monitoring can be
controlled at ErrorCollator input using ERR59/ERR60/ERR61 in the
- SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE register. By default, this field is enabled
and comparator outputs are monitored. AXIM R/AR/B channel's fatal error monitoring can be controlled at ErrorCollator input using
- ERR62/ERR63/ERR64 in the SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE register. By
default, this field is enabled and comparator outputs are monitored.
- AXIM W/AW channel's fatal error monitoring can be controlled at ErrorCollator input using
- ERR65/ERR66 in the SCE_EC_REGS_ERRSLICE2_MISSIONERR_ENABLE register. By default,
this field is enabled and comparator outputs are monitored.
- AXIS R/AR/B/W/AW channel's fatal error monitoring can be controlled at ErrorCollator input
using ERR67/ERR68/ERR69/ERR70/ERR71 in the
- SCE_EC_REGS_ERRSLICE2_MISSIONERR_ENABLE register. By default, this field is enabled
and comparator outputs are monitored.
- AXIP R/AR/B/W/AW channel's fatal error monitoring can be controlled at ErrorCollator input
using ERR72/ERR73/ERR74/ERR75/ERR76 in the
- SCE_EC_REGS_ERRSLICE2_MISSIONERR_ENABLE register. By default, this field is enabled
and comparator outputs are monitored. Cortex-R5 Livelock event monitoring:
- LiveLock event monitoring can be controlled at ErrorCollator input using ERR46 in the
- SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE register. By default, this field is enabled
and comparator outputs are monitored. ATCM LockStep error:

- Display Control Engine (DCE)
- LockStep comparator for the ATCM shall be enabled by configuring the
- ATCM_LOCKSTEP_ENABLE register in the DCE_MISC AMAP space. By default, comparator is
disabled and Software shall enable it.
- Comparator outputs can be controlled at the ErrorCollator input using ERR9 in the
- SCE_EC_REGS_ERRSLICE0_MISSIONERR_ENABLE register. By default, this field is enabled
and comparator outputs are monitored. AST-cpu/AST-dma LockStep error:
- LockStep comparator for AST-cpu and AST-dma shall be enabled by configuring the
- AST_LOCKSTEP_ENABLE register in the DCE_MISC AMAP space. By default, comparator is
disabled and software shall enable it.
- Comparator outputs can be controlled at the ErrorCollator input using ERR2/ERR3 in the
- SCE_EC_REGS_ERRSLICE0_MISSIONERR_ENABLE register. By default, this field is enabled
and comparator outputs are monitored. HSP LockStep error:
- LockStep comparator for the HSP shall be enabled by configuring the
- HSP_LOCKSTEP_ENABLE register in the DCE_MISC AMAP space. By default, comparator is
disabled and software shall enable it.
- Comparator outputs can be controlled at the ErrorCollator input using ERCortex-R5 in the
- SCE_EC_REGS_ERRSLICE0_MISSIONERR_ENABLE register. By default, this field is enabled
and comparator outputs are monitored. AVIC LockStep error:
- LockStep comparator for the AVIC0/AVIC1 shall be enabled by configuring the
- VIC_LOCKSTEP_ENABLE register in the DCE_MISC AMAP space. By default, comparator is
disabled and software shall enable it.
- Comparator outputs can be controlled at the ErrorCollator input using ERR6 in the
- SCE_EC_REGS_ERRSLICE0_MISSIONERR_ENABLE register. By default, this field is enabled
and comparator outputs are monitored. HSM LockStep error:
- LockStep comparator for HSM shall be enabled by configuring the HSM_LOCKSTEP_ENABLE
register in the DCE_MISC AMAP space. By default, comparator is disabled and software shall enable it.
- Comparator outputs can be controlled at the HSM Error Collator input using ERR3 and
ERR2 in the SCE_HSM_ERROR_COLLATOR_REGS_ERRSLICE0_MISSIONERR_ENABLE register. By default, this field is enabled and comparator outputs are monitored. ATCM/BTCM0/BTCM1 Address parity: Parity signals for the TCM address phase signals are checked inside respective TCM modules. Parity error of these signals is routed to ErrorCollator.

- Display Control Engine (DCE)
Parity error monitoring can be controlled at the ErrorCollator input using ERR7/ERR8/ERR9 in the SCE_EC_REGS_ERRSLICE0_MISSIONERR_ENABLE register. By default, this field is enabled and comparator outputs are monitored. Register parity for DCE-PM, DCE-MISC, and DCE-CFG registers: Parity check signals from the registers for the above modules are individually connected to the ErrorCollator.
- DCE-PM register parity error monitoring can be controlled at the ErrorCollator input using
- ERR10 in the SCE_EC_REGS_ERRSLICE0_MISSIONERR_ENABLE register. By default, this field
is enabled and comparator outputs are monitored. DCE-MISC register parity error monitoring can be controlled at the ErrorCollator input using
- ERR37 in the SCE_EC_REGS_ERRSLICE1_MISSIONERR_ENABLE register. By default, this field
is enabled and comparator outputs are monitored. DCE-CFG register parity error monitoring can be controlled at the ErrorCollator input using
- ERR1 in the SCE_EC_REGS_ERRSLICE0_MISSIONERR_ENABLE register. By default, this field is
enabled and comparator outputs are monitored. Enable DCE Safety Watchdog Timer: Software shall configure TKE such a way that a nonzero subset of expiration levels is reported to
- HSM. To do the configuration, software can program the Error Threshold field in the
TKE_SCE_WDT0_WDTCR register.
- Software Shall Perform the NoC BIST Sequence to Ensure Correctness of NoC Safety
Mechanisms: NoC BIST sequence ensures the functionality of NoC comparators. Refer to Fault Aggregation and Reporting section in the NoC Resilience Training manual for the detailed programming sequence. Configuration of Cortex-R5 BTCM Error Injection: There are two ways to inject errors in BTCM accesses and check BTCM ECC termination logic: using BTCM Hardware Error Injection logic and using the Arm sequence to inject error into BTCM. Refer to BTCM Error injection section for the description of the hardware and its related configuration registers. Using BTCM Hardware Error Injection logic: 1.
- These steps describe one possible sequence by configuring hardware error inject logic to
inject an error once for a BTCM read access: a.
- Configure BTCM_ERR_TYPE_EN field in APS_PROC_CFG_BTCM_ERR_CTL register to
indicate single-bit OR double-bit error.
- Configure BTCM_BIT_CNT_RELOAD field in APS_PROC_CFG_BTCM_ERR_CTL register to
indicate the bit location of the error (ranges from 0 to 63).
- Configure BTCM_FORCE_ERR field in APS_PROC_CFG_BTCM_ERR_CTL register to "1" to
inject the error in the next BTCM read. b. c.

- Display Control Engine (DCE)
d. Issue a test BTCM read access. 2. For enabling the timer mode in BTCM Error Injection logic: a.
- Configure BTCM_ERR_TYPE_EN field in APS_PROC_CFG_BTCM_ERR_CTL register to
indicate single-bit OR double-bit error.
- Configure BTCM_BIT_CNT_RELOAD field in APS_PROC_CFG_BTCM_ERR_CTL register to
indicate the bit location of the error (ranges from 0 to 63).
- Configure BTCM_FORCE_ERR field in APS_PROC_CFG_BTCM_ERR_CTL register to "0."
Configure BTCM_ERR_TIMER_RELOAD_EN field to enable single-shot/continuous mode. Configure BTCM_ERR_TIMER_RELOAD field to the desired timer start value. Configure BTCM_ERR_TIMER_EN for the timer to start counting.
- The error is injected in the TCM read transaction that comes after error timer reaches
BTCM_ERR_TIMER_RELOAD value. b. c. d. e. f. g. Notes to Software: 1. Hardware error injection logic does NOT support address-based error injection. a. Injection happens to any BTCM access irrespective of the access address. 2.
- Once the injection logic is configured to inject an error, software shall ensure that only
the test BTCM read access happens. a.
- If an unintended BTCM access occurs, then that access can get corrupted and the impact
is unknown.
- Software shall ensure single threaded operation while doing this testing by globally
disabling interrupts and restoring afterwards.
- To avoid unintended BTCM accesses due to test code itself, software shall ensure that test
code runs from Cortex-R5 Cache/DRAM.
- Software shall ensure that no BTCM access can happen from AXI slave port as well while
doing the testing. b. c. d. 3. Cortex-R5 has an internal TCM cache (configured using parameter HARD_ERR_CACHE). a. b. Back-to-back TCM access to the same location can cause a hit in the cache. In case software is performing both single bit and double bit corruption, software shall use different addresses for back-to-back test read access so that access does not hit the internal TCM cache. Using the Arm sequence to inject error into BTCM: Note: Refer to the latent fault detection and control mechanism in the Cortex-R5 Safety manual for an example sequence to inject error into TCM. The TCM ECC testing flow in the safety manual uses two memory locations: an original memory location to insert ECC error, and a scratch memory location to set up an internal register related to ECC. The flow and description is listed below: 1.
- Write to the original location with a known pattern (ABCD) so the data for the original
location is ABCD, and the ECC value for the original location is ABCD.

- Display Control Engine (DCE)
2. 3. Disable TCM ECC.
- Write the corrupted pattern to the scratch location (A'BCD) so the data for the scratch
location is A'BCD, and the ECC value for the scratch location is A'BCD.
- Read corrupted pattern from the scratch location to set up an internal register inside the
Cortex-R5. 4. a. The actual purpose of this read is not to calculate ECC value, but to emulate the read part of the Read-Modify-Write sequence, so that the ECC value for A'BCD can be read from the scratch location and updated into one of the internal registers of the Cortex-R5 that are related to ECC. 5. Perform a byte write to the original location using the corrupted data. a. At this point the ECC value for A'BCD that is still in the Cortex-R5's internal register is written to the original location that currently contains the data ABCD. So at this time, the data for the original location is ABCD, but the ECC value for the original location has been changed to A'BCD. 6. 7.
- Enable ECC
Read the data from the original location to trigger an ECC error. a.
- Since there is a mismatch between the data (ABCD) and its corresponding ECC value
(A'BCD) for the original location, an ECC error is triggered. Refer to "Test of the fault detection and control features on the Cortex-R5 processor" for an example of Arm code for error injection. Notes to Software: 1.
- While doing this testing, any TCM reads/writes other than the ones mentioned in the above
sequence are NOT allowed. a.
- Software shall ensure single threaded operation while doing this testing sequence by
globally disabling the interrupts and restoring afterwards. To avoid unintended BTCM accesses due to test, code itself, software shall ensure that test code runs from Cortex-R5 Cache/DRAM.
- Software shall ensure that no BTCM access can happen from AXI slave port as well while
doing the testing. b. c. 2. Arm sequence involves turning OFF the TCM cache to corrupt the stored ECC within BTCM. a.
- If an unintended BTCM access occurs during the test time, then ECC for that access can
get corrupted and the impact is unknown. 3. Cortex-R5 has an internal TCM cache (configured using parameter HARD_ERR_CACHE). a. b. Back-to-back TCM access to the same location can cause a hit in the cache. In case software is performing both single bit and double bit corruption, software shall use different addresses for back-to-back test read access so that access does not hit the internal TCM cache. A second sample Arm sequence for TCM error injection from Cortex-R5 is listed below. This sequence is simpler than the one, which is listed in the Safety manual.

- Display Control Engine (DCE)
1. Disable TCM ECC check. a.
- Assume that memory content in the TCM is ABCD and its corresponding ECC code is also
ABCD. 2. Perform a byte write to this memory content to corrupt data. a.
- For example, we can perform a byte write (only the lowest byte selected by STRB) with the
content of A'BCD. So now, the corresponding ECC code for the memory content has been changed to A'BCD. However, since it is only a byte write and only the lowest byte is selected, the memory content is still ABCD. So now there is a mismatch between the memory content (ABCD) and its corresponding ECC code (A'BCD). 3.
- Enable TCM ECC check again, and perform a read to this memory content. This read triggers
an ECC error. Note: Software shall perform the IST-based Latent fault detection for every Multipoint Fault Detection Interval (MPFDI).
- Cortex-R5 Self-reset and Reboot
Software running on Cortex-R5 can reset the processor to reboot it. Depending on the address configured in ATCM reset vector register, Cortex-R5 reboots from the specified location. Software shall ensure that Cortex-R5 remains in "quiescent" state when reset is asserted. A CPU is quiescent when: nWFEPIPESTOPPEDm or nWFIPIPESTOPPEDm is asserted. all transactions to the CPU from the system have completed. the system can send no new stimulus to the CPU. If this is not guaranteed, it is possible that Cortex-R5 issues incomplete transactions to CBB/DBB eventually corrupting its own state (when Cortex-R5 comes to active state after reboot) and/or possibly corrupting the system. In that case, it may need a full system reset to recover. The following steps describe the recommended sequence to complete the self-reset and reboot. Cortex-R5 Software decides to reboot itself. Configure ATCM EVP registers with the address from where Cortex-R5 is to be rebooted. Disable AVIC interrupts. This ensures that Cortex-R5 does not come out of "quiescent" state while resetting is in process. The subsection below describes Disabling AVIC Interrupts.
- Configure CLK_RST_CONTROLLER_SCE_SWR_RESET_CYCLE_COUNT_0 register in CAR with
an initial value for the count-down timer. It is strongly recommended to use the default value of this register for the count-down timer and not program any other value.
- This timer is used to delay the actual assertion of reset after the CAR APB interface
receives the reset-request.
- Timer ticks down on bpmp_apb_clk

- Display Control Engine (DCE)
- Value needs to be configured depending on time needed for the Cortex-R5 to reach the
quiescent state after CAR reset request is issued (idle state reached by executing WFI/WFE instruction).
- Write "1" to SWR_BPMP_NRESET_RST field in the
CLK_RST_CONTROLLER_RST_DEV_SCE_CPU_NIC register.
- Execute "WFI"
- After reboot, software shall reconfigure some of the safety mechanisms since it gets
disabled on Cortex-R5 reset. This includes reenabling: -
- Cortex-R5 Event bus by configuring X bit in PMCR register (Cortex-R5 Event bus
monitoring). Cortex-R5 Cache ECC (Cortex-R5 Cache Events). - Other DCE Hardware Safety mechanisms are not affected by Cortex-R5 self-reset.
- Disabling AVIC Interrupts
By configuring "I" bit in the CPSR register to disable IRQ interrupts (Section 3.7.9 in the Cortex-R5 TRM).
- By writing VICINTENCLEAR register in AVIC AMAP space for AVIC0 and AVIC1. All the bits in
this register need to be "set to 1" so that all interrupts are disabled. However, there is a possible race condition while interrupts are disabled from the CPU: i.e., there may be an interrupt generated while the write txn to VICINTENCLEAR is in transit. It may end-up clearing the VICINTENCLEAR before ISR is activated. Hence, a safe way to clear the interrupt is to do it from an ISR handler, preferably an FIQ handler. Software may trigger an FIQ handler using AVIC's "VICSOFTINT" register. Refer to Section 3.3 in the PL192 reference manual for AVIC's register descriptions. Additional Notes to software:
- Accesses using the Cortex-R5's AXI Slave port shall also not happen while Cortex-R5 is
undergoing reset. If it happens, it may result in uncompleted transactions to Master who is accessing the Cortex-R5 slave port. But there is no hardware option to block the access to Cortex-R5 Slave port. It needs to be ensured from software itself.
- Software shall ensure that no pending transaction to AVIC is pending while Cortex-R5 self-
reset is in process. Note that Cortex-R5 DCLS comparators are not disabled in this process.
- After reboot, it is not mandatory for Software to redo the lock-step initialization
steps. Power-on-reset (nSYSPORRESET) is not asserted and DCLS is already enabled in the processor.

- Display Control Engine (DCE)
#### 7.2.5.2 Programming Guidelines
##### 7.2.5.2.1 Exception Handlers Placement in Memory
The DCE software executes Exception (Abort/ISR) handlers as a response to a hardware fault. It is important to minimize the probability for handler execution to go faulty and possible corrupt the HSM. A fatal scenario that may happen is if fault software proceeds to disable the asserted fault. In order to reduce the scope of faults, it is highly recommended to: Keep the DCE Abort/ISR handlers within DCE Cortex-R5's BTCM memory. Avoid any access using the DCE CBB/DBB ports in the handler. If handler accesses any DCE peripheral, that particular peripheral's fault shall put the HSM to
- AUTOLOCK. Autolocking prevents the faulty peripheral-infecting CPU execution and there by
corrupt HSM operation. If the abort handler is in Cache or TCM, then it is possible for a parity or ECC error to occur in the abort handler. If the error is not recoverable, then a synchronous abort occurs and the processor loops until the next interrupt. The Link Register (LR) and Saved Program Status Register (SPSR) values for the original abort are also lost. The Cortex-R5's livelock-event detector detects some, but not all, of these conditions. In any case, software enables Watch Dog Timers (WDT) for DCE. This enables dealing with the livelock conditions that Cortex-R5's internal livelock-event detector is not able to monitor. In the worst case, livelock fatal events from Cortex-R5's have not asserted any error condition to HSM, WDT's timer expiries can generate additional interrupt triggers to Cortex- R5 (IRQor FIQ), or triggers errors to HSM, or even cause a system-reset to be issued.
- BTCM Initialization
On power-on-reset, BTCM RAM has random values. Since BTCM ECC checking is enabled on reset, it is mandatory for the software to initialize the TCM contents (data and ECC) in before reading BTCM. If Cortex-R5 issues a BTCM read or BTCM partial-write instruction without initialization, it can trigger an ECC check mismatch. To initialize BTCM, software can write any known data into the RAM. Since DCE configures 32-bit ECC for BTCM RAM, initialization writes must also be accessing same width and address shall be aligned to 32-bit.
- Disabling and Reenabling BTCM ECC
At any point of time, software can choose to disable BTCM ECC checking by configuring bit 26 and 27 in the c1, Auxiliary control register within Cortex-R5 system control. Once the BTCM is disabled, Cortex-R5 still computes and stores ECC for 32-bit writes happening to BTCM. But Cortex-R5 does not update the ECC codes for partial writes (<32 bits) to the TCM. Hence, there is a possibility that BTCM ECC is not updated for the data stored using partial writes. If software reenables TCM ECC and reads this data, the ECC check may fail. Hence, if software

- Video Image Compositor (VIC)
plans to reenable ECC after disabling it for some time, software makes sure that TCM is reinitialized, as explained above.
- Use of AxLOCK Transactions
- Cortex-R5 instructions such as LDREX/STREX/SWP/SWPB depend on AxLOCK field behavior on the
out-going AXI memory/peripheral transactions. But this SoC interconnects (or BPMP NoC, CBB NoC) do not support the AXI locking mechanism. Hence, software should not use instructions that rely on the L2 memory system to synchronize between multiple processors in the system.
- However, the processor L1 memory system has an internal exclusive monitor to ensure
synchronization between multiple processes running on an individual Cortex-R5 CPU.
- Cortex-R5 Boot Sequence
After all of the Cortex-R5 resets and nCPUHALT have been de-asserted, the initialization of Cortex- R5 takes place as listed in the below steps: 1. 2. Initialize all the registers of Cortex-R5 like general-purpose registers and banked registers. Initialize the FPU by defining its access permission, enable FPU and initialize the Floating Point registers D0-D15. Enable ETM for early fault detection. Configure Cortex-R5 in DCLS mode. Initialize the caches, which involve disabling the caches, invalidating and then enabling them. Enable export of events in PMCR for external monitoring. Initialize and enable MPU. Enable all the lock-steps for the components within the DCE cluster like AST, HSP, AVIC, HSM, and ATCM. Initialize the BTCM to avoid ECC errors due to uninitialized reads or partial writes. Start with the DCE functionality. 3. 4. 5. 6. 7. 8. 9. 10.

