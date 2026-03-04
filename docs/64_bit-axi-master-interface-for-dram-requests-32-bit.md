# 64 -bit AXI master interface for DRAM requests 32-bit AXI master interface for MMIO requests 32-bit AHB master interface for AVIC access

- AXI slave interface for DMA access to the local SRAM
#### 9.13.2.2 Processor Configuration
The AON Cluster Cortex-R5 is implemented with the following features: 32 KB instruction cache 32 KB data cache 256 KB of SRAM attached to TCMB as two banks of 128 KB SRAM
- TCMA base address set to 0
- Init low vectors
- Processor version r1p3
- Floating-Point Unit extensions including double-precision capability
#### 9.13.2.3 Interrupt Controller
The Cortex-R5 does not have an integrated interrupt controller. A pair of ARM PL192 vectored interrupt controllers on the local bus serve as the interrupt controller for the AON Cortex-R5. The SoC implements PL192 version r0p0.
#### 9.13.2.4 Processor and Interrupt Controller Documentation
Detailed documentation for the Cortex-R5 Processor and the PL192 Interrupt Controller are readily available from ARM, and may be downloaded from the ARM web site. A good starting point is these documents:

- AON Cluster Functional Description
- Document DDI 0273A
This TRM assumes access to these documents, and does not reproduce information from them.
#### 9.13.2.5 Timers
The Cortex-R5 does not have any integrated timers. Timers for the AON Cluster are provided by a separate timer block in the AON Cluster.
#### 9.13.2.6 TCM Interface
- Cortex-R5 provides two tightly coupled memory ports. These ports, named ATCM and BTCM are
meant to provide low latency access to the Cortex-R5 processor. The ATCM hosts the EVP interface (see below) and the BTCM hosts a 256 KB RAM.
**Figure 9.97 Cortex-R5 TCM interface**
The following pin and build configurations define the ATCM and BTCM configurations.

- AON Cluster Functional Description
#### 9.13.2.7 ATCM Interface
The Cortex-R5 ATCM interface hosts the Exception Vector Table module. The EVP is wrapped in the ATCM Wrapper that provides the ATCM interface to Cortex-R5.
##### 9.13.2.7.1 Exception Vector Pointers (EVP)
When Cortex-R5 takes an exception (including the reset exception), processor execution is forced to an address that corresponds to the type of exception. These addresses are called the exception vectors. By default, the exception vectors are eight consecutive word-aligned memory addresses, starting at an exception base address (which is reset default to 0x0000_0000 for the AON Cortex- R5 since VINITHI is tied to 0). The EVP module is implemented through a set of 16 registers starting at address 0x0. The table below shows the default organization of the EVP coming out of reset. The programmability of EVP allows the processor to jump to an arbitrary address space in the entire memory space that is accessible to the AON Cortex-R5.
- Table 9.98 EVP Register Table
- Offset
- Data
- Description
0x00
- LDR, PC, [PC+0x18]
- Reset vector. According to the ARM Architecture
manual, the PC reads an address equals current instruction + 8. 0x04
- LDR, PC, [PC+0x18]
- Undefined exception
0x08
- LDR, PC, [PC+0x18]
- SWI (also known as SVC) exception
0x0C
- LDR, PC, [PC+0x18]
- Prefetch abort
0x10
- LDR, PC, [PC+0x18]
- Data abort
0x14
- LDR, PC, [PC+0x18]
- Reserved
0x18
- LDR, PC, [PC+0x18]
- IRQ
0x1C
- LDR, PC, [PC+0x18]
- FIQ
0x20
- NV_ADDRESS_MAP_AON_BTCM
- TCMB Base Address
0x24
- NV_ADDRESS_MAP_AON_BTCM + 4
0x28
- NV_ADDRESS_MAP_AON_BTCM + 8
0x2C
- NV_ADDRESS_MAP_AON_BTCM + 12
0x30
- NV_ADDRESS_MAP_AON_BTCM + 16
0x34
- NV_ADDRESS_MAP_AON_BTCM + 20
0x38
- NV_ADDRESS_MAP_AON_BTCM + 24

- AON Cluster Functional Description
- Offset
- Data
- Description
0x3C
- NV_ADDRESS_MAP_AON_BTCM + 30
The EVP table above assumes that the TCMB starts at address NV_ADDRESS_MAP_AON_BTCM. The redirection of exception vectors enables BPMP to execute an ISR handler in the entire memory space accessible by it. The following steps are performed to handle EVP requests: 1. 2. The Cortex-R5 issues a read for exception vector address (@0x0000_00XX). EVP decodes exception vector aperture, and generates read-response. a. Returns LD PC, [PC + 0x18] instruction as return data. 3. This results in PC getting loaded with pointer to exception vector. Notes: 1. Cortex-R5 additionally supports vectored exception handling specifically for IRQ interrupts.
- This is supported in conjunction with the PL192 VIC interrupt controller. When an IRQ
exception is triggered by the VIC, it can optionally send out a pointer to the interrupt handler to service that particular interrupt. In case of vectored interrupts through VIC, the EVP table is not referenced by the Cortex-R5.
- EVP in earlier chips supported vectorization of interrupts. This is deprecated since the
required vectorization support is already provided through VIC interface.
- EVP reset is decoupled from the Cortex-R5 CPU reset. This enables the Cortex-R5 to be
independently reset without affecting the content of EVP registers. 2. 3.
#### 9.13.2.8 Error Checking and Signaling
When access is not allowed by the ATCM interface, it signals an error. When bit[0] of the Auxiliary Control Register (ACTLR.ATCMECEN) is set to 1, the error triggers an undefined exception on Cortex-R5 accesses or AXI slave error on AXI slave requests by asserting the ATCERROR. ATCERROR is asserted when any of the following happens:
- ATCADDR address does not decode into the address space implemented within the ATCM
wrapper. Whenever write access is made from the ARM ATCM interface to the ATCM.
- ATCLATEERROR is not used to trigger an error since the ATCLATEERROR response is
discarded by the AXI slave interface.

- AON Cluster Functional Description
#### 9.13.2.9 BTCM Interface
BTCM hosts the Cortex-R5 tightly coupled 256 KB RAM. BTCM is split internally into two ports,
- B0TCM and B1TCM. The address range for the BTCM is defined in the
NV_ADDRESS_MAP_AON_BTCM define in the global AMAP. The BTCM has two ports for two reasons:
- One can be used by the processor and the other by the AON DMA. Cortex-R5 can work on
one bank of the BTCM while AON DMA can page in data/code to/from the other.
- If the code and data space can be separated between B0TCM and B1TCM, then instruction
and data accesses from Cortex-R5 can be done independently. 1. 2.
#### 9.13.2.10 BTCM RAM Configuration
The 128 KB of RAM on each BTCM channel is constructed of eight banks of 16 KB RAM. The BTCM
- RAM banks are logically configured into eight 32 KB power-gating groups. Since the BTCM
interface is operating in interleaved mode one bank from B0TCM and one bank from B1TCM are in each power-gating group. Bank 0 starts at the bottom 32 KB of the BTCM address space.
#### 9.13.2.11 Error Checking and Signaling
Accesses to the BTCM signal an error when the particular access isn't allowed by BTCM interface.
- When bit 1 and bit 2 of the Auxiliary Control Register (ACTLR.B0TCMECEN and
ACTLR.B1TCMECEN) are set to 1, the error triggers an undefined exception on Cortex-R5 accesses or AXI slave error on AXI slave requests by asserting the B0TCERROR or B1TCERROR. An error is asserted when any of the following occurs:
- The SD, SLP, or DSLP port for a TCM RAM bank is asserted and the TCM RAM bank is
accessed.
#### 9.13.2.12 Interrupts
The interrupt sources from/to the SPE (Cortex-R5) in the AON block are comprised of the following components: {Vector/Scalar} interrupts are driven through a pair of daisy-chained ARM Vectored Interrupt
- Controllers (AVIC)
1.
- Specific peripherals such as TKE, DMA, etc., (which are exclusively owned by the SPE) have
their interrupts connected to AVIC.
- Other I/O peripherals which can be owned by the SPE and other system masters, such as
the CCPLEX, send their interrupts to AVIC as well as to top level LIC, depending on the usage model software can mask the interrupts in unused path.

- AON Cluster Functional Description
2. Interrupts from the Legacy Interrupt Controller (LIC) that feed into the AVIC.
- There are four such interrupts coming from LIC. There are a few peripherals and interrupt
sources connected to LIC can be managed by the SPE by properly enabling the routing to AON cluster channel in LIC and finally routing the aggregated interrupt to AVIC. 3.
- AON Interrupts to other Clusters
There are a few peripherals that are controlled by other clusters though they are instanced in the AON cluster (e.g., CAN, UART). For example, specific instances of the UART have usage models where they are controlled by the Safety Cluster Engine (SCE) or the Boot and
- Power Management Processor (BPMP). These peripherals interrupt are connected to the
- AON cluster and to the other clusters apart from LIC; they are fanned out to LIC and other
respective clusters. 4.
- Interrupts to AON from SoC Domain Peripherals
- UART6 and UART8 from the SoC domain send interrupts to AON cluster. These interfaces
could be repurposed as Debug UART in closed system debug; interrupts from these UART instances are routed to AVIC so that the Debug UART driver running in SPE (which various debug routines interact) is getting the correct interrupt. 5.
- Secure Interrupts Routing
- Secure interrupts are generally routed to LIC and subsequently handled by the
TrustZone Interrupt handler. Secure Interrupt is also routed as a fault to the HSM via error loggers in the AON cluster NoC.
- There are cases where the secure interrupt could be overloaded with normal functional
scenarios (e.g., APB slave indicates a security access violation, such as SCR, or other violations such as an address hole via SLAVE_ERR). If the secure interrupt become overloaded, the AON Fabric asserts the Secure Interrupt to be resolved by the TrustZone software.

- AON Cluster Functional Description
**Figure 9.98 Interrupt Structure**
Like any other APB peripherals in AON, AVIC access and configuration spaces are accessed via
- MMIO path. The AVIC port of Cortex-R5 interfaces to the PL192 and enables the following
functions in hardware to minimize software overhead of servicing the interrupt. 1. 2. 3. Determine from the interrupt controller which interrupt source is requesting service. Determine where the service routine for that interrupt source is loaded.
- Masks that interrupt source, before re-enabling processor interrupts to permit another
interrupt to be taken. Interrupt connections to PL192 include: 1.
- Local interrupts originating from within the AON cluster are connected to PL192 interrupt
inputs; these are vectored (i.e., mapped to IRQ for low interrupt latency). Four external interrupts are connected from the LIC. Each interrupt can be an aggregation of one or more interrupts. Interrupts from selective SoC peripherals like UARTs and Doorbell units. 2. 3.

- AON Cluster Functional Description
- AON Fabric
The AON cluster uses a single FlexNoC IP for routing access to DRAM via DBB and MMIO requests (via CBB to SoC peripherals and peripherals in AON).
##### 9.13.2.12.1 AON Cluster Fabric
The AON cluster fabric uses various Software entities to access various IP’s register space. The AON Cluster fabric supports: MMIO requests from various AON initiators to SoC peripherals (via CBB), and to peripherals in AON. MMIO requests from various CBB initiators to IPs in the AON cluster.
- AON DMA accesses to DRAM, AON TCMs, and various MMIO requests to IPs in AON and SoC
domains. 1. 2. 3.
- AON Cluster Fabric Topology
The AON cluster fabric supports the initiators mentioned below as per the protocol and data widths. Each of the below initiator is connected to an initiator node inside the cluster fabric.
- Initiator
- Protocol
- Data-Width
- Power Domain of the
initiator node
- Comments
- SPE R5’s Periphery
port
- AXIv3

