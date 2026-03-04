# 32 -bit AXI-4 compliant slave interface to ACONNECT

- Secure access to AGIC registers
##### 7.7.2.7.3 Programming Sequence
- Identifying the Supported Interrupts
This section discusses how to discover which Interrupts are supported. 1.
- Read GICD_TYPER. The ITLinesNumber field identifies the number of implemented
GICD_ISENABLERns.
- Write to GICD_CTLR to disable forwarding of Interrupts from distributor to the CPU
interfaces For each implemented GICD_ISENABLERn, starting with GICD_ISENABLER0: 2. 3. Write (GICD_ISENABLERn = 0xffffffff). Read (GICD_ISENABLERn). Bits that read as 1 correspond to supported Interrupt IDs.
- Discovering Permanently Enabled Interrupts
1. 2. Write (GICD_ICENABLERn = 0xffffffff) to disable all Interrupts that can be disabled. Read (GICD_ICENABLERn). Bits that read as 1 correspond to Interrupts that are permanently enabled.
- Write (GICD_ISENABLERn[i] = 1),
where i corresponds to Interrupts that must be re-enabled. 3.
- Routing an SPI Interrupt to CPU/ADSP through FIQ using Group 1
1. 2. 3. Write (GICD_ICENABLERn = 0xffffffff) to disable all Interrupts that can be disabled. Write (GICD_CTLR = 0x2) to enable Grp1 Interrupts. Write to Interrupt Configuration Registers, GICD_ICFGRn, to configure Interrupt type (level or edge).
- Write (GICD_IGROUPR[i] = 1) to set the intended Interrupt to Group1,
where i corresponds to the intended Interrupt position.
- Write to Interrupt Priority Registers, GICD_IPRIORITYRn, to assign Interrupt priority if
necessary. Write to GICD Priority Masked Interrupt, GICD_PMR, to set the Interrupt mask level.
- Write to Interrupt Processor Target Registers, GICD_ITARGETSRn, to direct the Interrupt to
CPU. 4. 5. 6. 7.

- Audio Processing Engine (APE)
8. 9. Write to Interrupt Set-Enable Register, GICD_ISENABLERn, to enable the Interrupts. Enable CPU Interface Control Register (GICC_CTLR) of the destined CPU. AGIC is based on generic Interrupt controller Arm IP GIC400. It serves as the APE Interrupt controller, which detects, manages, and distributes Interrupts. The GIC-400 complies to
- AMBA AXI4 protocol and Version 2 of the Arm GIC Architecture Specification. The GIC-400
implements the GICv2 Security Extension. GIC does not support virtual extension. The feature is implemented in GIC-400 but is not used or verified. Cortex-A9 doesn't support virtualization architecture. FIQEn <= 1.
- Routing an SPI Interrupt to CPU/ADSP through FIQ using Group 0
1. 2. 3. Write (GICD_ICENABLERn = 0xffffffff) to disable all Interrupts that can be disabled. Write (GICD_CTLR = 0x1) to enable Grp0 Interrupts. Write to Interrupt Configuration Registers, GICD_ICFGRn, to configure Interrupt type (level or edge).
- Write (GICD_IGROUPR[i] = 1) to set the intended Interrupt to Group0,
where i corresponds to the intended Interrupt position. Write to Interrupt Priority Registers, GICD_IPRIORITYRn, to assign Interrupt priority by if necessary. Write to GICD Priority Masked Interrupt, GICD_PMR, to set the Interrupt mask level.
- Write to Interrupt Processor Target Registers, GICD_ITARGETSRn, to direct the Interrupt to
CPU. Write to Interrupt Set-Enable Register, GICD_ISENABLERn, to enable the Interrupts . Enable CPU Interface Control Register (GICC_CTLR) of the destined CPU. See Arm GIC Architecture Specification version 2, Table 2-2 and 2-3 for IRQ and FIQ behavior. 4. 5. 6. 7. 8. 9. FIQEn <= 1.
- EnableGrp0 <= 1. Enable Group 0 Interrupts using the FIQ signal. Group1 Interrupts always
uses IRQ signal.
#### 7.7.2.8 Audio Miscellaneous (AMISC)
This module contains ADSP configuration registers, timestamp registers for EAVB synchronization, key slots, ACTMON and debug registers.
##### 7.7.2.8.1 AMISC Features
- Secure ADSP Configuration Registers
- Four 128-bit key slots
- EAVB Timestamp Registers
- APB4 bus interface to ACONNECT
- TSC terminal node

- Audio Processing Engine (APE)

