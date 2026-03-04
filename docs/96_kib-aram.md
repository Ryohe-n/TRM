# 96 KiB ARAM

#### 7.7.2.7 APE Interrupt Controller
The APE Interrupt Controller (AGIC) serves as the Interrupt controller in the APE. It aggregates the Interrupt lines from all the APE modules and distributes them to ADSP and the system. AGIC is an implementation of the Arm GIC-400 Generic Interrupt Controller, revision r0p1. Details downloaded from their website, http://arm.com.

- Audio Processing Engine (APE)
**Figure 7.74 AGIC Functional Diagram**
##### 7.7.2.7.1 Shared Peripheral Interrupts
There are two Interrupt lines (FIQ/IRQ) per channel. Interrupts that are mapped to FIQ should use group 0. Interrupts that are mapped to IRQ should use group 1. Group 0 is recommended for higher priority Interrupts.
- Table 7.111 Interrupts Signals to GIC
- Signal
- ID
I/O
- Edge/Level
- Description
(not relevant) 31:0 I
- Level
- Software-Generated Interrupts (SGI's)

- Audio Processing Engine (APE)
- Signal
- ID
I/O
- Edge/Level
- Description
adma_eot[31:0] 63:32 I
- Level
- ADMA Channel End of Transfer Interrupt
ahsp_mbox_full[7:0] 71:64 I
- Level
- AHSP Mailbox Full Interrupt
ahsp_mbox_empty[7:0] 79:72 I
- Level
- AHSP Mailbox Empty Interrupt
ashp_shrd_intr[4:0] 84:80 I
- Level
- AHSP Shared Interrupt
adsp_pmuirq I
- Level
- ADSP/PTM Performance Monitoring Unit Interrupt
adsp_wdresetreq I
- Edge
- ADSP Watchdog Timer Reset Request
adsp_l2ccintr I
- Level
- ADSP L2 Cache Controller Interrupt
ahub_err I
- Level
- AHUB Error Interrupt
amc_err I
- Level
- AMC Error Interrupt
adma_err[3:0] 93:90 I
- Level
- ADMA Error Interrupts
adsp_standbywfi I
- Level
- ADSP Standby WFI. ADSP in idle mode. Waiting for
- Interrupt
adsp_standbywfe I
- Level
- ADSP Standby WFE. ADSP in idle mode. Waiting for
- Event
adsp_ctiirq I
- Level
- Interrupt request by Cortex-A9 debug trigger interface
ape_actmon I
- Level
- Activity monitoring on ADSP. This Interrupt is from
- AMISC
- Reserved

