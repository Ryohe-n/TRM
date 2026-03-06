# 5 Overview

## 5.1 Overview
Clusters, each containing four Arm® Cortex®‑A78AE cores, sometimes referred to by the code-name Hercules-AE.
### 5.1.1 Reference Documentation
- The majority of the documentation for this CPU is supplied by Arm, and the following Arm
documents should be referred to. All these documents are publicly available on the Arm Developer web site, and the links below are valid at the time of publishing this section, but might potentially change, in which case a search on the document name should locate it.
#### 5.1.1.1 List of References
The CCPLEX chapter makes the implicit use of the following documents available from Arm, and assumes readers are familiar with the Arm Architecture, and have access to the documents for reference. Refer to the Arm website to download these documents. See the Additional reading section under About this book in each of the following for additional Arm publications containing other relevant information. https://developer.arm.com/documentation/101779/latest https://developer.arm.com/documentation/101799/latest https://developer.arm.com/documentation/101322/latest https://developer.arm.com/documentation/101206/latest
- Arm® Architecture Reference Manual Armv8, for Armv8-A architecture profile
https://developer.arm.com/documentation/ddi0487/latest/ Refer also to the most recent version of the errata notices.

- CPU Complex (CCPLEX)
- Arm Cortex-A78AE (MP105) Software Developer Errata Notice
https://developer.arm.com/documentation/SDEN1707912/latest
- Arm DSU-AE (MP092)Software Developer Errata Notice
https://developer.arm.com/documentation/SDEN1343188/latest
- CoreLink GIC-600 Generic Interrupt Controller Software Developer Errata Notice
https://developer.arm.com/documentation/sden892601/latest The floating-point unit conforms to the following two specifications, available from the IEEE: ANSI/IEEE, IEEE Standard for Binary Floating-Point Arithmetic, Std 754-1985. ANSI/IEEE, IEEE Standard for Floating-Point Arithmetic, Std 754-2008.
### 5.1.2 Glossary
This glossary defines a number of terms used in the context of the CPU Complex. See also the glossary in the Introduction section of this document for terms used across the SoC.
- Term
- Definition
- ACDI
Arm Cluster Debug Interface. A design unit in SCF CMU that instantiates the Debug Block IP from Arm and other necessary Coresight debug related collateral to interface with the SoC.
- ACE
- AXI Coherency Extensions
- ACI
Arm Cluster Interface. Arm Cluster’s gateway to the external world is through the ACI design unit.
- ADB
- AMBA Domain Bridge
- AE
- Automotive Enhanced
(as in Cortex®‑A78AE, Hercules-AE, DSU-AE.)
- AMU
- Activity Monitoring Unit
- ARI
Abstract Request Interface. An interface that enables Arm software to communicate with the MCE software to enable modification of CREGs that are part of the CCPLEX.
- Arm Cluster
Cluster may sometimes be referred to as the Arm Cluster to explicitly indicating that the Cluster is made up of CPU cores from Arm (as opposed to NVIDIA CPUs).
- AVFS
- Automatic Voltage Frequency Scaling
- CCPMU
- CCPLEX Power Management Unit
- CMU
- CCPLEX Miscellaneous Unit
- CMULA
- CCPLEX Miscellaneous Unit Logic Analyzer
- CPE
- Copy Engine
- CRAB
- Control Register Access Bus

- CPU Complex (CCPLEX)
- Term
- Definition
- CREG
- Control Register
- CTI
- Cross Trigger Interface
- DSU-AE
DynamIQ™ Shared Unit. Arm IP containing Cluster coherency logic and the Level-3 (L3) Cache.
- DSU-AE
- Cache
The L3 Cache inside the DSU-AE is also referred to as the DSU-AE Cache. (L3 and DSU-AE Cache are synonymous and are used interchangeably in this document.)
- DUT
Design Under Test. (Referring to the design unit that a test bench is attempting to validate.)
- DVM
Distributed Virtual Memory.
- DVM transactions support the maintenance of a virtual memory system
- ETM
- Embedded Trace Macrocell
- FIQ
- Fast Interrupt Request
- FMU
- Fault Management Unit
- IH
- Interrupt Handling unit
- IOB
- Input-Output Bridge
- IRI
- Interrupt Routing Infrastructure
- IRQ
- Interrupt Request
- ISM
In Silicon Measurement. (ISM circuits are sprinkled around the SoC to measure various parameters for silicon characterization.)
- IST
In System Test. (IST is a mechanism akin to running ATPG vectors on a chip tester except that it is performed on chip by hardware similar to Memory Built In Self Test or MBIST.)
- Lock mode
Mode of operation where a pair of CPU's in a CPU Cluster operate as one CPU and is recognized by the operating system also as one CPU.
- MCA
- Machine Check Architecture
- MP2LS
2-core Multi-Processor in Lock Step mode. (An MP4 processor configuration becomes a 2-core configuration in Lock-Step Mode.)
- MP4
4-core Multi-Processor. (Arm acronym denoting a multi-processor CPU configuration with four CPU cores.)
- NAFLL
Noise Aware Frequency Locked Loop. (Noise aware clock generator that is part of the Automatic Voltage Frequency Scaling, or AVFS, sub- system.)
- PMU
Power Management Unit. (CCPMU in NVIDIA nomenclature, and PMU is Arm's nomenclature, while NVIDIA refers to the
- Performance Monitoring Unit as PerfMon.)
- POD
Power On Detector. (A circuit that monitors a voltage rail for glitches and causes a processor reset in case of one.)

- CCPLEX Functional Description
- Term
- Definition
- PPI
- Private Peripheral Interrupt
- RAS
- Reliability, Availability, and Serviceability
- SCF
- System Coherency Fabric
- SCF Cache
System Coherency Fabric has a Cache that is technically Level 4.
- SCU
- Snoop Control Unit
- SKU
Stock Keeping Unit. (A generic term used to inventory and track products) (An SKU is also used to indicate a group of chips that have the same feature set or characteristics.)
- SNOC
- System Network-On-Chip
- SPI
- Shared Peripheral Interrupt
- Split Mode
Mode of operation where each CPU in a CPU Cluster operates independently and is recognized by the operating system as a different CPU. vGIC
- Virtual Generic Interrupt Controller
(Interrupt Controller for v8 Arm architecture.)
### 5.1.3 Conventions of Units
This chapter follows the IEEE and NIST conventions for multiplying prefixes. Among other things, this convention uses an 'i' to indicate the binary convention, and its absence to indicate decimal. So, 1 KiB is 210 or 1,024 bytes, and 1 KB is 103 or 1,000 bytes. Similarly it uses:
- Mi for 220 and M for 106
- Gi for 230 and G for 109
- Ti for 240 and T for 1012
## 5.2 CCPLEX Functional Description
### 5.2.1 Architecture Overview
The Orin CPU Complex (CCPLEX) uses the Cortex-A78AE CPU core from ARM, that is also referred to as Hercules-AE. The Cortex-A78AE is an ARM Architecture v8-A CPU that has an integrated 256- KiB Level-2 (L2) Cache in each CPU. Each set of four Cortex-A78AE cores is grouped into a quad-core Cluster. The four CPUs in each Cluster are connected to an ARM DynamIQ™ Shared Unit (DSU-AE) to share the 2-MiB Level-3 (L3)

- CCPLEX Functional Description
Cache, also referred to as the DSU-AE Cache. The Orin CCPLEX has up to three of these quad-CPU Clusters.
- An optional safety Lock-Step Mode is supported by the Cortex-A78AE to allow two Cortex-
A78AE cores in a Cluster to execute the same code in tandem and their results compared at each clock cycle. Any divergence (mismatched result) is detected and reported as a Lock-Step Error. This mode can be disabled to allow the two cores to operate independently in Full Performance Mode.
#### 5.2.1.1 Key Features
Up to three CPU Clusters.
- All CPU Clusters share the same 4-MiB 16-way Set-Associative SCF (L4) Cache that is
partitioned in eight 512-KiB slices. Split-Lock-Hybrid Safety Architecture for the Cortex-A78AE processors. Memory-mapped RAS architecture.
- Integration of Clusters with Virtual Generic Interrupt Controller (vGIC) based on ARM
GIC-600AE. Fault Management Unit inside vGIC. AARCH32 Execution Exception Level: EL0 only. AARCH64 Execution Exception Levels: EL0 through EL3.
#### 5.2.1.2 Architecture Summary
##### 5.2.1.2.1 CPU Complex (CCPLEX)
The high-level overview of the CPU Complex showing its CPU Clusters is presented in the diagram below.

- CCPLEX Functional Description
**Figure 5.1 CPU Complex and Its CPU Clusters**
Each CPU Cluster interfaces with an ARM Cluster Interface (ACI) module that is part of the System Coherency Fabric (SCF) and serves as the gateway for signals going in and out of the Cluster. The CPU memory Reads and Writes are routed to SCF Cache Slices then the Memory Controller Fabric (MCF) via ACI and SNOC, while Reads and Writes to the Memory-Mapped Input Output (MMIO) space are routed to the Input Output Bridge (IOB) then Control BackBone (CBB), or back into the units within CCPLEX. The 4-MiB SCF Cache is divided in eight slices, each of 512 KiB.
- The CCPLEX Miscellaneous Unit (CMU) contains has the following units to handle power
management, Interrupts, and Debug.

- CCPLEX Functional Description
- The CPU Complex Power Management Unit (CCPMU) with micro-code programmable engines
to execute power management sequences. The Interrupt Handler (IH) with vGIC (based on ARM GIC-600AE).
- The ARM Cluster Debug Interface (ACDI) module with the ARM Debug Block and several
other components necessary to support the Coresight Debug architecture.
#### 5.2.1.3 CPU Clusters
The high-level overview of the CPU Cluster showing its CPU (Cortex-A78AE) cores is presented in the diagram below.
**Figure 5.2 CPU Cluster and Its CPU Cores**
The CPU Cluster features are summarized as follows:

- CCPLEX Functional Description
Four Cortex-A78AE cores in each CPU Cluster.
- The DynamIQ™ Shared Unit (DSU-AE) with a 2-MiB L3 Cache is responsible for the coherency
amongst the cores in the Cluster.
- Split Mode of operation with independent CPU in the Cluster where the number of physical
CPUs equals to the number of CPU visible to software. Lock Mode of operation with pairs of CPU operate in Lock-Step as one CPU seen by software. Reliability, Availability, and Serviceability (RAS) logic to Interface with the DSU-AE and capture RAS records in the MMIO space. One common CPU power rail for all CPU Clusters in the CPU Complex. Logic for debug, trace, and performance monitoring logic. Noise Aware Frequency Locked Loop (NAFLL) clock source for CPU cores. Noise Aware Frequency Locked Loop (NAFLL) clock source for the DSU-AE. Support for Adaptive Voltage and Frequency Scaling. Independent power gating domains for each of the CPUs and the DSU-AE. Power management support logic to interact with the CCPMU. Interrupt-related support logic to interact with the vGIC. Control Register Access Bus (CRAB) slaves and support fabric. Design For Test (DFT) logic.
##### 5.2.1.3.1 CPU Cores and DSU-AE
The architectural overview of the DSU-AE Cluster showing its one DSU-AE and four CPU cores with major functional blocks is presented in the diagram below.

- CCPLEX Functional Description
**Figure 5.3 DSU-AE Cluster of one DSU-AE Core and four CPU Cores with Architectural Details**
- CPU Core
- The CPU (Cortex-A78AE) core implements the ARMv8-A architecture. Refer to the Arm Cortex-
supported.
- Each CPU core has an L1 memory Cache system and an integrated L2 Cache to work in concert
with its superscalar, variable-length, out-of-order pipeline. The CPU core features are summarized as follows:

- CCPLEX Functional Description
Four Cortex-A78AE cores and one DSU-AE in each CPU Cluster.
- Each Cortex-A78AE core has 64 KiB Instruction and Data Cache each, plus an integrated
256-KiB L2 Cache. Four Cortex-A78AE cores in the Cluster share the 2-MiB L3 Cache inside the DSU-AE. Exception Levels. AArch32 execution states at EL0 only. AArch64 execution states at all exception levels, i.e. EL0 through EL3.
## 5.94 GHz from 270 MHz (multiplier = 22). Can be used only if the eDP
panel reports support for it in the DPCD registers.

- Display Controller Registers
- Bit
R/W
- Reset
- Description
- Note for DVI and HDMI1.4/2.0, there are 4 different reference clock
range defined. Software needs to select the value based on the reference clock frequency. 17:16
- RW
0x2 MODE_BYPASS:
- This will bypass the clock selected by FE with a specific clock. This is
required if the SOR is operating in DP mode. Changing this field will require DP link re-training. 0 = NONE: No clock bypass, use whatever clock is chosen by FE. 1 = DP_NORMAL: Use the clock generated by the analog macro. This is required when the SOR is being used in DP or FRL mode. 1 = FRL_NORMAL: Use the clock generated by the analog macro. This is required when the SOR is being used in DP or FRL mode. 2 = DP_SAFE: Use the safe_clock for the SOR. This is used in DP or FRL mode, when the clock from analog macro is not ready. 2 = FRL_SAFE: Use the safe_clock for the SOR. This is used in DP or FRL mode, when the clock from analog macro is not ready. 2 = INIT 3 = FEEDBACK: When the SOR is awake, use the clock that is generated by the analog macro. This is the same clock that is used with DP_NORMAL, but the CMGR can switch this clock to safe_clock when it needs to. This is used in TMDS mode. 15:12
- RO
X HEAD: Indicates whether the SOR is connected to some head or neither.
- HEAD is only valid if MODE==NORMAL, otherwise it may contain stale
information. 0 = _0 1 = _1 2 = _2 3 = _3 4 = _4 5 = _5 6 = _6 7 = _7 15 = NONE 7:6
- RO
X MODE:
- Indicates whether FE has selected the NORMAL clock (as controlled by
the
- DIV field) or the SAFE clock. Note that at any time the software
expects to change error has occurred and should be reported. 1 = NORMAL 2 = SAFE
- NV_PDISP_FE_SW_SYS_CAP
- Offset: 0x30000
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0b0000,0000,0000,xxxx,0000,0000,0000,0000)

- Display Controller Registers
- Bit
- Reset
- Description
0x0 WBOR7_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 WBOR_EXISTS_7: 0 = INIT 0 = NO 1 = YES 0x0 WBOR6_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 WBOR_EXISTS_6: 0 = INIT 0 = NO 1 = YES 0x0 WBOR5_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 WBOR_EXISTS_5: 0 = INIT 0 = NO 1 = YES 0x0 WBOR4_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 WBOR_EXISTS_4: 0 = INIT 0 = NO 1 = YES 0x0 WBOR3_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 WBOR_EXISTS_3: 0 = INIT 0 = NO 1 = YES 0x0 WBOR2_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 WBOR_EXISTS_2: 0 = INIT 0 = NO 1 = YES

- Display Controller Registers
- Bit
- Reset
- Description
0x0 WBOR1_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 WBOR_EXISTS_1: 0 = INIT 0 = NO 1 = YES 0x0 WBOR0_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 WBOR_EXISTS_0: 0 = INIT 0 = NO 1 = YES 0x0 DSI3_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 DSI_EXISTS_3: 0 = INIT 0 = NO 1 = YES 0x0 DSI2_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 DSI_EXISTS_2: 0 = INIT 0 = NO 1 = YES 0x0 DSI1_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 DSI_EXISTS_1: 0 = INIT 0 = NO 1 = YES 0x0 DSI0_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 DSI_EXISTS_0: 0 = INIT 0 = NO 1 = YES

- Display Controller Registers
- Bit
- Reset
- Description
0x0 SOR7_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 SOR_EXISTS_7: 0 = INIT 0 = NO 1 = YES 0x0 SOR6_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 SOR_EXISTS_6: 0 = INIT 0 = NO 1 = YES 0x0 SOR5_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 SOR_EXISTS_5: 0 = INIT 0 = NO 1 = YES 0x0 SOR4_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 SOR_EXISTS_4: 0 = INIT 0 = NO 1 = YES 0x0 SOR3_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 SOR_EXISTS_3: 0 = INIT 0 = NO 1 = YES 0x0 SOR2_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 SOR_EXISTS_2: 0 = INIT 0 = NO 1 = YES

- Display Controller Registers
- Bit
- Reset
- Description
0x0 SOR1_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 SOR_EXISTS_1: 0 = INIT 0 = NO 1 = YES 0x0 SOR0_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 SOR_EXISTS_0: 0 = INIT 0 = NO 1 = YES 0x0 HEAD7_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 HEAD_EXISTS_7: 0 = INIT 0 = NO 1 = YES 0x0 HEAD6_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 HEAD_EXISTS_6: 0 = INIT 0 = NO 1 = YES 0x0 HEAD5_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 HEAD_EXISTS_5: 0 = INIT 0 = NO 1 = YES 0x0 HEAD4_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 HEAD_EXISTS_4: 0 = INIT 0 = NO 1 = YES

- Consumer Electronics Control (CEC)
- Bit
- Reset
- Description
0x0 HEAD3_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 HEAD_EXISTS_3: 0 = INIT 0 = NO 1 = YES 0x0 HEAD2_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 HEAD_EXISTS_2: 0 = INIT 0 = NO 1 = YES 0x0 HEAD1_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 HEAD_EXISTS_1: 0 = INIT 0 = NO 1 = YES 0x0 HEAD0_EXISTS: 0 = INIT 0 = NO 1 = YES 0x0 HEAD_EXISTS_0: 0 = INIT 0 = NO 1 = YES
## 5.0 GT/s - Bit 2 8.0 GT/s - Bit 3 16.0 GT/s - Bit 4 32.0 GT/s - Bits 6:5 RsvdP
- Multi-Function Devices associated with an Upstream Port must report
the same value in this field for all Functions. This field has a default of (PCIE_CAP_MAX_LINK_SPEED == 0101) ? 0011111 : (PCIE_CAP_MAX_LINK_SPEED == 0100) ? 0001111 : (PCIE_CAP_MAX_LINK_SPEED == 0011) ? 0000111 : (PCIE_CAP_MAX_LINK_SPEED == 0010) ? 0000011 : 0000001 where
- PCIE_CAP_MAX_LINK_SPEED is a field in the LINK_CAPABILITIES_REG
register.
- RO
0x0 RSVDP_0: Reserved for future use.
- PCIE_X<i>_RC_PF0_PCIE_CAP_LINK_CONTROL2_LINK_STATUS2_REG_0
where <i> = 1, 4, 8. Description: This register controls and provides information about PCI Express Link specific parameters; in addition to the Link Control and Link Status Register.
- PCIE_X1_RC_PF0_PCIE_CAP_LINK_CONTROL2_LINK_STATUS2_REG_0
- PCIE_X4_RC_PF0_PCIE_CAP_LINK_CONTROL2_LINK_STATUS2_REG_0
- PCIE_X8_RC_PF0_PCIE_CAP_LINK_CONTROL2_LINK_STATUS2_REG_0
- Offset: 0xa0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x02010004 (0bxxxx,0010,0000,0001,0000,0000,0000,0100)
- Bit
R/W
- Reset
- Description
27:26
- RO
0x0 RSVDP_26: Reserved for future use. 25:24
- RO
0x2 PCIE_CAP_CROSSLINK_RESOLUTION:
- Crosslink Resolution. This field indicates the state of the Crosslink
negotiation. It must be implemented if Crosslink Supported is Set and the
- Port supports 16.0 GT/s or higher data rate. It is permitted to be
implemented in all other Ports. If Crosslink Supported is clear, the controller hardwires this field to 01b or 10b. Once a value of 01b or 10b is returned in this field, that value must continue to be returned while the Link is Up.
- RO
0x0 PCIE_CAP_TWO_RETIMERS_PRE_DET:
- Two Retimers Presence Detected. When set to 1b, this bit indicates that
two Retimers were present during the most recent Link negotiation. For more details, see section 4.2.6.3.5.1 of PCI Express Base Specification. This bit is required for Ports that have the Two Retimers Presence Detect
- Supported bit of the Link Capabilities 2 register set to 1b. Ports that have
the Two Retimers Presence Detect Supported bit set to 0b are permitted to hardwire this bit to 0b. For Multi-Function Devices associated with an
- Upstream Port, this bit must be implemented in Function 0 and RsvdZ in all
other Functions. Note: This register field is sticky.
- RO
0x0 PCIE_CAP_RETIMER_PRE_DET:
- Retimer Presence Detected. When set to 1b, this bit indicates that a
- Retimer was present during the most recent Link negotiation. For more
details, see section 4.2.6.3.5.1 of PCI Express Base Specification. This bit is required for Ports that have the Retimer Presence Detect Supported bit of the Link Capabilities 2 register set to 1b. For Ports that have the Retimer
- Presence Detect Supported bit set to 0b, the controller hardwires this bit
to 0b. For Multi-Function Devices associated with an Upstream Port, this bit must be implemented in Function 0 and is RsvdZ in all other Functions. Note: This register field is sticky.
- RW
0x0 PCIE_CAP_LINK_EQ_REQ:
- Link Equalization Request 8.0 GT/s. This bit is set by hardware to request
the 8.0 GT/s Link equalization process to be performed on the Link. For more details, see sections 4.2.3 and 4.2.6.4.2 of PCI Express Base
- Specification. For Multi-Function Upstream Port, this bit must be
implemented in Function 0 and RsvdZ in other Functions. For components that only support speeds below 8.0 GT/s, the controller hardwires this bit to 0b.
- RO
0x0 PCIE_CAP_EQ_CPL_P3:
- EEqualization 8.0 GT/s Phase 3 Successful. When set to 1b, this bit
indicates that Phase 3 of the 8.0 GT/s Transmitter Equalization procedure has successfully completed. Details of the Transmitter Equalization process and when this bit needs to be set to 1b is provided in section
## 5.0 GT/s - Bit 2 8.0 GT/s - Bit 3 16.0 GT/s - Bit 4 32.0 GT/s - Bits 6:5 RsvdP
- Multi-Function Devices associated with an Upstream Port must report
the same value in this field for all Functions. This field has a default of (PCIE_CAP_MAX_LINK_SPEED == 0101) ? 0011111 : (PCIE_CAP_MAX_LINK_SPEED == 0100) ? 0001111 : (PCIE_CAP_MAX_LINK_SPEED == 0011) ? 0000111 : (PCIE_CAP_MAX_LINK_SPEED == 0010) ? 0000011 : 0000001 where
- PCIE_CAP_MAX_LINK_SPEED is a field in the LINK_CAPABILITIES_REG
register.
- RO
0x0 RSVDP_0: Reserved for future use.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_PCIE_CAP_LINK_CONTROL2_LINK_STATUS2_REG_0
where <j> = 4, 8. Description:This register controls and provides information about PCI Express Link specific parameters; in addition to the Link Control and Link Status Register.
- PCIE_X4_EP_PF0_PCIE_CAP_LINK_CONTROL2_LINK_STATUS2_REG_0
- PCIE_X8_EP_PF0_PCIE_CAP_LINK_CONTROL2_LINK_STATUS2_REG_0
- Offset: 0xa0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x01010004 (0bxxxx,0001,0000,0001,0000,0000,0000,0100)
- Bit
R/W
- Reset
- Description
27:26
- RO
0x0 RSVDP_26: Reserved for future use. 25:24
- RO
0x1 PCIE_CAP_CROSSLINK_RESOLUTION:
- Crosslink Resolution. This field indicates the state of the Crosslink
negotiation. It must be implemented if Crosslink Supported is Set and the
- Port supports 16.0 GT/s or higher data rate. It is permitted to be
implemented in all other Ports. If Crosslink Supported is clear, the controller hardwires this field to 01b or 10b. Once a value of 01b or 10b is returned in this field, that value must continue to be returned while the Link is Up.
- RO
0x0 PCIE_CAP_TWO_RETIMERS_PRE_DET:
- Two Retimers Presence Detected. When set to 1b, this bit indicates that
two Retimers were present during the most recent Link negotiation. For more details, see section 4.2.6.3.5.1 of PCI Express Base Specification. This bit is required for Ports that have the Two Retimers Presence Detect
- Supported bit of the Link Capabilities 2 register set to 1b. Ports that have
the Two Retimers Presence Detect Supported bit set to 0b are permitted to hardwire this bit to 0b. For Multi-Function Devices associated with an
- Upstream Port, this bit must be implemented in Function 0 and RsvdZ in all
other Functions. Note: This register field is sticky.
- RO
0x0 PCIE_CAP_RETIMER_PRE_DET:
- Retimer Presence Detected. When set to 1b, this bit indicates that a
- Retimer was present during the most recent Link negotiation. For more
details, see section 4.2.6.3.5.1 of PCI Express Base Specification. This bit is required for Ports that have the Retimer Presence Detect Supported bit of the Link Capabilities 2 register set to 1b. For Ports that have the Retimer
- Presence Detect Supported bit set to 0b, the controller hardwires this bit
to 0b. For Multi-Function Devices associated with an Upstream Port, this bit must be implemented in Function 0 and is RsvdZ in all other Functions. Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_LINK_EQ_REQ:
- Link Equalization Request 8.0 GT/s. This bit is set by hardware to request
the 8.0 GT/s Link equalization process to be performed on the Link. For more details, see sections 4.2.3 and 4.2.6.4.2 of PCI Express Base
- Specification. For Multi-Function Upstream Port, this bit must be
implemented in Function 0 and RsvdZ in other Functions. For components that only support speeds below 8.0 GT/s, the controller hardwires this bit to 0b.
- RO
0x0 PCIE_CAP_EQ_CPL_P3:
- EEqualization 8.0 GT/s Phase 3 Successful. When set to 1b, this bit
indicates that Phase 3 of the 8.0 GT/s Transmitter Equalization procedure has successfully completed. Details of the Transmitter Equalization process and when this bit needs to be set to 1b is provided in section
