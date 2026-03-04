# 5 -dimensional addressing control

- Transfer mode control
5D (five dimensions) tile transfer engine per channel
- Address and boundary padding control per channel
- Burst control per channel
- DMA channel scheduler
- MISR control block
- - -
- Accelerated PVA Software functional BIST
- Covers permanent faults for functional safety (mainly for VPU and DMA)
- Certifies the health of VPU at a programmable interval
- Channel Arbitration
- -
- Source and Destination Arbitration
- SRAM request Arbitration
DMA AXI Control is Responsible for AXI Transactions:
- Queuing and buffering
- AXI Muxing/De-muxing
- MISR updates on the AXI interface
- Outstanding request control
- Configurable Surface Transfer format (Block Linear or Pitch Linear)
DMA VMEM Control Block is Responsible for Issuing SRAM Transactions:
- Read Write arbitration
- Pad and boundary Control (Constant or extended padding values)
DMA Configuration Block to Configure:

- Programmable Computer-Vision Accelerator (PVA)
- Global registers
- Channel registers
- Interrupt handling
- Error and Safety control
- Performance Monitors
- Descriptor RAM
#### 8.2.2.6 PVA_PROC: Cortex-R5 Subsystem
The PVA_PROC (Cortex-R5 subsystem) consists of one Cortex-R5F processor with double precision floating point processor, its associated TCMs (ATCM and BTCM) and associated I-cache/D-cache.
- PVA_PROC also connects to a vectored interrupt controller (PL192 ARM or AVIC). Cortex-R5
subsystem also shares PVA cluster peripheral including timers, mailboxes, and debug logic.
##### 8.2.2.6.1 Cortex-R5 Configuration
The Cortex-R5 is configured with the following features:
- ARMv7-R ISA
- Instruction cache and data cache of 16 KB each

