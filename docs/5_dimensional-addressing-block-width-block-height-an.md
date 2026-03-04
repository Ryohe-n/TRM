# 5 -dimensional addressing (block width, block height, and three outer iteration dimensions that can be mapped to horizontal block stepping, vertical block stepping, and depth stepping) A pool of 64 DMA descriptors 16 independent hardware engines (channels) 32 hardware and software events to trigger the DMA channels. Hardware events are driven from local VPU events and DMA channels. Software events can be initiated by the local Cortex-R5 core.

- Circular addressing on both external memory and local memory
- Software sequencing (Software linked descriptors)
- Hardware sequencing for fetching and storing frame data
#### 8.2.1.4 Cortex-R5 Subsystem
A Cortex®-R5 RISC CPU core configures, controls, and monitors VPU and DMA tasks that are needed for PVA functions. The Cortex-R5 processor runs an RTOS and interacts with host CPU and other CV system engines including ISP, hardware accelerators (NVENC), GPU, and NVDLA. The Cortex-R5 subsystem includes an instruction cache, a data cache, and tightly coupled memory (TCM). The subsystem also has other peripheral blocks that are mapped to the PVA cluster address space. These blocks include: A mailbox for asynchronous communications with other PVA control back-bone (CBB) masters A host controller synchronization block A central safety and event controller for error and event aggregation/generation A Network-on-Chip (NoC) for interconnect access An interrupt controller for internal and external interrupts with a global timestamp control A set of general purpose watchdog timers A debug block to handle DFD A local power management block for handling clock and reset control. The block is placed in PVA for local reset and clock gating control for some PVA units.

- Programmable Computer-Vision Accelerator (PVA)
**Figure 8.18 PVA Block Diagram**
#### 8.2.1.5 Feature List
- Feature Category
- Features
- Feature Description
- Vector Processor
- Two VPUs + Two VMEMs
- Main vector engine for PVA cluster
- DLUT
- Two DLUT units
- Decoupled Lookup Unit
- Control and Monitor
- Processor
- Cortex-R5 + TCM
- For scheduling, safety control, and scalar operations
- DMA
- Two DMA engines
- To move data between VMEMs, TCM, MMIO, CVNAS,
and memory controller (MC)
- Local interface
- Local data backbone interconnect

