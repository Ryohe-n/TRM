# 2 Overview

## 2.1 Overview
(SoC) functions; and is a guide for writing, understanding, and modifying code that controls those functions. It contains functional descriptions of how the Orin hardware works, and also describes the registers and related programming interfaces. Not all the units in Orin are described in detail here; as some, like the GPU, are only intended to be used with NVIDIA supplied drivers. This document is intended to provide deep technical detail where appropriate, users should first refer to the datasheets and other published information for an overview of Orin.
- Refer to the datasheet for supported features and speeds. This document may describe
hardware features and functionality not currently supported on specific Orin product SKUs, and may describe clock speeds or data rates that cannot be achieved on all SKUs. Refer to the appropriate Orin product data sheet as this is the primary authority for supported features, functionality, and operating speeds of a particular product SKU.
- Refer to software documentation for supported features. This document may describe
hardware features not supported by NVIDIA software. Description of a hardware capability in this document does not imply software support for that function. Refer to the appropriate BSP or software release notes for detailed information about currently supported software functionality.

- Getting Started
**Figure 2.1 Orin Series SoC Block Diagram**
### 2.1.1 Reading Register Tables
Every register table has an address line followed by a table containing the bit descriptions for that register. The address line contains:
- Offset: the address of the register within the specific module. Refer to the system memory
map for the start address of the module; apply the offset at the top of the table to get the register address. Read/Write: the register access type. If a register table contains the R/W column, individual bits within the register will have different R/W properties. If there is no R/W column, all bits in that register have the same R/W property. Values are RO (read only), R/W (read/write), WO (write only, and RWC (read/write to clear). Parity Protection: per register parity diagnostic in hardware implemented by safety critical IPs. The parity diagnostic detects random faults in the register fields. ‘Y’ indicates that the field is continuously checked by the parity diagnostic of the register. Single bit flips in the register, if not intended, are reported as a fault. ‘N’ indicates that the field is not checked by the parity diagnostic of the register.
- If all fields of the register have Parity Protection column as 'N', the register does not
implement any hardware based parity diagnostic.

- Getting Started
Reset: gives the power-on reset value in 32-bit binary. A value of x implies that the register bit has an undefined value at reset. A hexadecimal value is listed for convenience, where appropriate. Default: only displayed when the default setting is different from the Reset value. Unspecified bits may not appear in tables (see example below). Unspecified bits should be written with their Reset values, while reads return an unknown value.

- Getting Started

- Getting Started
### 2.1.2 Units
This TRM follows the IEEE and NIST conventions for multiplying prefixes. Among other things, this convention uses an 'i' to indicate the binary convention, and its absence to indicate decimal. So, 1 KiB is 210 or 1,024 bytes, and 1 KB is 103 or 1,000 bytes. Similarly it uses:
- Mi for 220 and M for 106
- Gi for 230 and G for 109
- Ti for 240 and T for 1012
### 2.1.3 Glossary
This glossary is intended to cover the acronyms used in this document; along with some others related to the Arm SoC world. Many other acronyms in this document are in broad engineering use and are not documented here.
- Term
- Definition
32K or 32k 32,768 Hz oscillator clock. Any references to 32k, 32 kHz, 32 KHz, or 32K in the context of this clock should always be interpreted as referring to a frequency of 32,768 Hz. 444/422/420 Pixel storage formats. 444 refers to formats where there are equal amounts of information for all three elements, 422 and 420 refer to formats where the color difference information is stored at half-resolution in either one direction or both.
- ADAS
Advanced Driving Assistance System.
- ADSP
Audio DSP. Refers to the Cortex-A9 processor in the APE.
- ADX
Audio Demultiplexer. Part of the Audio Hub used to demultiplex multiple audio streams.
- AMBA
Advanced Microcontroller Bus Architecture. A set of standard buses defined by ARM.
- AMX
Audio Multiplexer. Part of the Audio Hub used to multiplex multiple audio streams together.
- AO or AON
Always-On power domain. This part of the chip is always powered on, even in the deepest sleep state, except complete processor shutdown. See also SPE.
- AON I/O rails
- Inputs/Outputs in VDDIO_SYS, VDDIO_AO, and VDDIO_AO_HV serving the AON cluster logic
- AONPG
- Always-On Non-Power Gated. Used to indicate when an AO partition has no power gating
implemented.
- AOPG
Always-On Power Gated. Used to indicate whether an AO partition has power gating implemented.
- AOPM
- Always-On Cluster Power Management Module. Power management module implements/manages
the Cortex-R5 power state transitions. AOPM manages power state transitions for the SPE Cortex- R5 and its subsystem.
- AOTAG
Always-On Thermal Alarm Generator.

- Getting Started
- Term
- Definition
- AOVC
Always-On Voltage Controller.
- AP
Applications Processor. Refers to the Orin device, means the same as SoC.
- APB
AMBA Peripheral Bus. Arm defined simple 32-bit single master bus for peripheral devices.
- APE
Audio Processing Engine.
- Aperture
A named region of address space.
- APS
Auxiliary processor subsystem. Refers to an implementation boundary that is shared across Cortex- R5 clusters on the chip.
- ARM
Arm is a company provides the CPU architectural specification for Orin. Arm is also Architecture Reference Manual, as in (the second Arm of) ARM ARM, which defines the CPU architecture.
- AST
Address Space Translator. A subunit associated with some of the embedded Arm cores that does address translation from local addresses to system addresses along with appending some AXI attributes.
- AUTOSAR
- Automotive Open System Architecture
(an OS used in automotives)
- AXI
AMBA Advanced eXtensible Interface. A more advanced bus than AHB defined as part of AMBA 3 by ARM.
- AVIC
Arm PL192 Vectored Interrupt Controller. Used as the Cortex-R5 interrupt controller for all the Cortex-R5 processors (SPE, SCE, and BPMP).
- Bayer
A type of image sampling pattern invented by Dr. Bryce E. Bayer of Eastman Kodak. The pattern consists of quads of pixels with two green samples, one red sample, and one blue sample.
- BCT
Boot Configuration Table. Stored on external boot device, contains config parameters for boot decisions.
- BIT
Boot Information Table. Maintained internally by Boot ROM in RAM for boot path/error tracking and logging.
- BKV
Best Known Value. Configurations determined by system characterization.
- BOM
Bottom of Memory. Refers to the lowest address in an address map.
- BPMP
Boot and Power Management Processor.
- BPMP-FW
- BPMP Firmware. This refers to the power management firmware that would be executed on BPMP
(post-boot). This is also stored in external boot media.
- BR
Boot ROM. Power-on start boot code. Stored/burnt in chip IROM, executes from BPMP.
- Brick
Input/output interface block with analog and other special functions.
- CAR
Clock and Reset module. Controls clocks and resets to the various parts of Orin.
- CBB
Control Backbone.
- CCPLEX
CPU complex (i.e., CPU subsystem).
- CDE
Color Decompression Engine.

- Getting Started
- Term
- Definition
- CEC
Consumer Electronics Control. A part of the HDMI interface specification used for sending device control commands, often from a remote control.
- CID
Client ID.
- CIL
Control and Interface Logic.
- Cold boot
The SoC partition power transitions from OFF to ON with no previous state available. Software must construct all states from scratch. Boot ROM is executed. DRAM is brought on-line.
- CoT
Chain of trust. A security term used to denote any code that is trusted because it is loaded securely from the root of trust (Boot ROM).
- CP
Color Parser. C-PHY A MIPI standard physical layer that can carry CSI data. Clocks are transmitted along with data; data lanes are three wires.
- CPU
CPU generally refers to the main CPUs unless specified otherwise.
- CRC
Cyclic Redundancy Check.
- CSI
MIPI Camera Serial Interface. A standard high-speed serial interface for connecting cameras to Orin.
- CUDA
Compute Unified Device Architecture.
- CVC
Central Voltage Controller.
- CV Cluster
Computer Vision Cluster. A partition in Orin that includes NVDLA, PVA, and CVNAS.
- CVNAS
Computer Vision NoC and SRAM.
- CVNOC
A subblock within CVNAS–the NoC portion of CVNAS.
- CVSRAM
A subblock within CVNAS–the memory storage portion of CVNAS.
- CZ
Controlled-output impedance MPIO pads.
- DBC
Dead Battery Charging.
- DBP
Dead Battery Provisions.
- DBB
Data Back-Bone.
- DCLS
Dual Core Lock Step, a technique used for functional safety where two processing cores receive the same inputs, and the outputs are compared to detect errors. Usually one of the cores is delayed with respect to the other.
- DDA
Digital Differential Analyzer. A technique commonly used in graphics for interpolation of variables over an interval between start and end point, and also applied to other problems.
- DDIC
- Display Driver Integrated Circuit
- Deep Sleep
See SC7.
- DFD
- Design for Debug
- DFS
- Dynamic Frequency Scaling

- Getting Started
- Term
- Definition
- DFT
- Design for Test
dGPU or DGPU Discrete GPU. Refers to an attached GPU that is external to the Orin SoC, as opposed to the internal GPU.
- DLA
- Deep Learning Accelerator
- DLS
- Delayed Lock-Step
- DMIC
Digital microphone interface. Supports direct attach of PDM microphones.
- DPD
Deep Power Down. A mode in which the pad can tolerate VDD_CORE being turned off. D-PHY A MIPI standard physical layer that can carry CSI data. Clocks are transmitted separately from data; data lanes are two wires and clock lanes are two wires.
- DRCM
Debug Recovery Mode (also known as RCM-exit-to-JTAG).
- DSI
MIPI Display Serial Interface. A standard high-speed serial interface for connecting displays to Orin.
- DVC
Dynamic Voltage Controller block.
- DVFS
Dynamic Voltage and Frequency Scaling.
- EAVB
Ethernet Audio Video Bridging. Includes extension of the Ethernet standard supporting real-time streaming; more recently referred to as Time-Sensitive Networking.
- EC
- Error Collator
- ECC
Error Correction Code. eDP Embedded DisplayPort™.
- EMC
External Memory Controller. A block that interfaces with external DDR/LPDDR devices.
- EOF
End of Frame. Refers to the last non-cropped long packet in a frame, or to an ISP EOF packet.
- EVP
Exception Vector Pointer.
- FA
Failure Analysis.
- FCM
Full Custom Macro.
- FE
Frame End. Refers to the NVCSI short packet.
- FIQ
Fast Interrupt Request.
- FMEA
Failure Mode and Effects Analysis.
- FMON
Frequency Monitoring logic.
- FS
Frame Start. Refers to the NVCSI short packet.
- FSI
- Functional Safety Island
- FSM
Finite State Machine. This is a hardware engineering phrase used to describe a hardware block that controls the operation of some logic function.

- Getting Started
- Term
- Definition
- GIC
Generic Interrupt Controller. Normally used to describe an Arm supplied interrupt controller used for a specific set of processors.
- GPIO
General Purpose Input/Output. An I/O signal uncommitted to a specific role and controlled by software.
- GTE
- Generic Timestamping Engine
- HDMI
High-Definition Multimedia Interface. A digital connection carrying video and audio at high speed over a single connector.
- HDR
High Dynamic Range. Usually a reference to cameras or displays using a higher dynamic range for pixel values.
- HSIO
High-Speed I/O Interfaces. See the corresponding chapter of this TRM for more details.
- HSM
Hardware Safety Manager.
- HV
- Hypervisor
- HVC
Hardware Vmin Control. The hardware initiated flow to enter/exit the Vmin state on VDD_CPU. Now referred to as CC3.
- ICG
- Internal Clock Gate
iGPU or IGPU Internal GPU. Refers to the GPU within the Orin SoC.
- IRAM
Internal RAM used by the boot process until DRAM is configured; now deprecated, and replaced by TCMs and SysRAM.
- IROM
Internal chip ROM which contains the Boot ROM code and data.
- IPI
Inter-Processor Interrupt.
- IPT
Inverse Perspective Transform.
- IRQ
Interrupt Request.
- ISP
Image Signal Processor. A hardware engine that is part of the camera processing pipeline.
- ISR
- Interrupt Service Routine
- JTAG
Joint Test Action Group Standard for Test Access Port and Boundary Scan Architecture. A serial bus used to external devices used for debug and testing.
- KMD
Kernel mode driver.
- LDC
- Lens Distortion Correction
- LIC
"Legacy" interrupt controller, a central interrupt controller in Orin.
- LP1
Low Power 1 state. Devices are power-gated, SoC clock domains are set to the minimum frequency (12 MHz and 38.4 MHz), the flow controller is configured to monitor "LP1 exit wake events," DRAM is put in self-refresh, and the VDD_CPU rail is powered off. Also known as the Suspend state.
- LSIO
- Low-Speed I/O
- LV
Low-voltage MPIO pads.

- Getting Started
- Term
- Definition
- MB1 and MB2
Microboot stages 1 and 2, stored on external boot media. Refer to the Boot chapter for more details.
- MC
Memory Controller. Handles requests from internal clients and arbitrates among them to allocate memory bandwidth. Also referred to as MSS.
- MCA
- Machine Check Architecture
- MCCIF or MC-
- CIF
Memory Controller Client Interface. The standard interface block between the memory controller subsystem fabric and the client device. Note that some modules may have multiple client interfaces.
- MDMM
Multi-drop multi-merge.
- MIPI
The Mobile Industry Processor Interface. An industry alliance promoting a number of standard interfaces for mobile devices.
- MMIO
Memory-Mapped I/O (transactions).
- MODS
Modular Diagnostic Software. It is a powerful software program that allows users to test the NVIDIA hardware. MODS is used for three primary purposes–chip and board functional validation, chip and board failure analysis and debug, and architectural verification.
- MPCORE
Multiprocessor CPU core. A generic term for a CPU capable of operating as part of an SMP group. M-PHY or MPHY MIPI M-PHY. An embedded-clock serial-interface technology with high bandwidth capabilities.
- MPIO
Multi-purpose Input/Output.
- MSI
Message Signaled Interrupt.
- MSS
Memory Subsystem. Refer to the corresponding chapter.
- MTS
An alternate name for the Carmel CPU Microcode generated by Dynamic Code Optimization.
- NOC
- Network On Chip (referring to the backbone architecture of the SoC)
- NVDEC
NVIDIA Video Decoder engine.
- NVENC
NVIDIA Video Encoder engine.
- NVJPG
NVIDIA JPEG engine.
- NVM
Non-Volatile memory. Data retained even after power is turned off. All boot media have non-volatile memory storage.
- OD
Open Drain MPIO pads.
- OGL
- Open Graphics Library (also known as OpenGL). An API supported on Orin and accelerated in
hardware by dedicated 3D and 2D engines.
- PA
Physical Address.
- Partition
A physical sub-region of the Orin device. Power gating is usually applied at the partition level.
- PCIe
Peripheral Component Interconnect Express. A high-speed interface for connecting to external devices.
- PG
- Power Gating; Power Gate-able

- Getting Started
- Term
- Definition
- PMIC
Power Management Integrated Control (synonymous with PMU).
- PMC
Power Management Controller. Controls the various power management features in the system.
- PMIC
Power management IC. Off-die module that controls various voltage regulators, provides the 32 kHz (32.768 kHz) clock source and provides the main system reset to the SoC.
- POR
Power On Reset.
- PPC
Pixels Per Clock.
- PPI
Private Peripheral Interrupt within an Arm processor core.
- PWFM
Pulse Width Frequency Modulation. Generates programmed pulse widths typically used to control backlight in display panels.
- PVA
Programmable Vision Accelerator. Custom computer vision DSP, Orin has two of them.
- PVT
Process, Voltage, and Temperature.
- R5
Cortex-R5 is a mid-range ARMv7 CPU cluster used for multiple engines in the SoC.
- RAZ
Read As Zero.
- RCE
Real-time Camera-control Engine. See the corresponding chapter.
- RCM
Recovery Mode. Used for re-flashing the external boot device image.
- RGB
Name given to pixels with red, green, and blue color components. This is the pixel format typically found in most display technologies because each color component corresponds to the colors of the filters or phosphors used in the display device.
- RISC
Reduced Instruction Set Computer. The CPU architecture used by Arm CPUs.
- RMMI
Reference M-PHY Module Interface. R/O Read only.
- RTC
- Real Time Clock (as in VDD_RTC)
R/W Read write.
- SATA
Serial Advanced Technology Attachment (ATA).
- SC7
Low power 0 state in which DRAM is put in self-refresh. The system state is saved in the PMC and in DRAM. VDD_CORE and VDD_CPU rails are powered off, and PMC is configured to monitor "LP0 wake events" that trigger LP0 exit. Also known as Deep-Sleep state.
- SCE
Safety Cluster Engine. See the corresponding chapter.
- SCF
System Coherency Fabric.
- SCR
Security Control Register.
- SE
Security Engine. Used for hardware acceleration of authentication and decryption steps.
- SGI
Software Generated Interrupt.

- Getting Started
- Term
- Definition
- SDMMC
SD and MMC Controller. An I/O controller supporting both the SD/SDIO interface standards and the eMMC standard.
- SFIO
- Special Function Input/Output
- SLCG
Second Level Clock Gating. A hardware technique to reduce power.
- SLINK
Serial Link. A legacy and now obsolete name for the SPI controller.
- SM
- Security Master
- SMMU
System Memory Management Unit. Block within the memory controller used to map from a virtual address space to physical addresses for device DMA.
- SMP
Symmetric Multi-Processing.
- SNIC
System Network InterConnect. Used to refer to the control fabric in SoC.
- SoC
System on a Chip. An integrated circuit containing a CPU, memory controller and the peripheral devices needed for a computing system.
- SOF
Start of Frame. Used to refer to the first non-cropped long packet in a frame, or to an ISP SOF packet.
- SOR
Serial Output Resource. SOR is GPU IP for driving HDMI/DP/LVDS. It converts the output of the display to a more modern high-speed serial protocol. DSI is not included since it's not GPU IP based. S/PDIF Sony/Philips Digital Interconnect Format.
- SPE
Sensor Processing Engine. See the Always-On Cluster chapter.
- SPI
(a) Serial Peripheral Interface Bus. A synchronous serial data link, that operates in full-duplex mode. (b) A Shared Peripheral Interrupt within an Arm core.
- ST
Standard MPIO pads.
- Sub-aperture
An aperture whose address space is a subset of another aperture and whose accessibility is also a subset of another aperture.
- SysRAM
Name for the shared on-chip memory.
- TBSA
Trusted Base System Architecture (an Arm specification).
- TCM
Tightly Coupled Memory. This refers to internal local RAM that is associated with some of the Arm CPU Cores. These are used as local, low-latency scratch pad memory.
- Tegra
- The name formerly used to describe the NVIDIA family of SoCs, and now used only in certain
applications. References to Tegra that still exist in this TRM, such as Tegra Host or Tegra pixel formats, may be considered to apply to all the NVIDIA family of SoCs, up to and including Orin.
- THI
Host Interface.
- TNR
Temporal Noise Reduction.
- TOM
Top of Memory. Refers to the highest address in an address map.
- TOS
Trusted OS.

- Getting Started
- Term
- Definition
- TS
- TimeStamp
- TSC
Timestamp System Counter.
- TSEC
- Security co-processor. An embedded security processor used mainly to manage the HDCP
encryption and keys on the HDMI link.
- TSOSC
Ring oscillator based thermal sensors.
- TZ
TrustZone® is a secure operating environment of the Arm CPU architecture and the related secure parts of the SoC backbone and devices.
- TZRAM
TrustZone secured RAM on the SoC.
- UFS
Universal Flash Storage.
- UFSHC
UFS Host Controller.
- Uncore
The CPU related logic outside of the CPU processing core itself.
- UniPro
MIPI Unified Protocol, a link layer communication protocol. U-PHY or UPHY Universal PHY, and NVIDIA reference to a multi-mode Serializer-Deserializer (SerDes) with analog pads for high-speed signaling to support various protocols.
- VA
Virtual address.
- VDD_CORE
SoC power rail.
- VDD_CPU
CPU power rail.
- VDD_RTC
Always-On power rail. vGPIO Virtual General-Purpose Input/Output. vGIC
- Virtualization capable Generic Interrupt Controller
- VI
Video Input. The acronym used to describe the Orin block used for camera and related pixel input functions.
- VIC
(a) Video Image Compositor. A SoC block that implements video post-processing functions needed by a video playback application to produce the final image for the player window. (b) The Arm name for the PL192 Vectored Interrupt Controller; used alongside the Cortex-R5 cores. Also referred to here as AVIC to avoid a name-space conflict with the previous entry.
- VM
- Virtual Machine
- VPR
Video Protect Region.
- Warm boot
Exit from SC7 state.
- WDT
Watchdog Timer. These timers can generate interrupts or resets to attempt to break the AP out of undesirable states.
- WFE
Wait For Event (an Arm instruction).
- WFI
Wait For Interrupt (an Arm instruction).

- Getting Started
- Term
- Definition
- WID
Write ID (from the AXI specification).
- W1C
Write as 1 to Clear. xHCI eXtensible Host Controller Interface for USB.
- XIP
eXecute In Place. Debug-only scheme where the primary IROM code is bypassed, and external code is fetched instead at reset, to test out Boot ROM code. This code is executed in-place from the external device, i.e., executed per instruction without fetching the entire code chunk.
- YCbCr
An alternative pixel representation that can take advantage of the properties of the human psycho- perceptual vision system and store the color difference information with lower spatial resolution. It consists of a luminance channel Y and two color difference signals Cb and Cr. See the definition of 444/422/420.
- YUV
See YCbCr. U and V are equivalent to Cb and Cr, respectively.
- ZSL
Zero Shutter Lag.

- Memory Architecture and Memory Mapped I/O
3. Memory Architecture and Memory Mapped I/O
## 2.25 Gsps*4
## 5.14 Gbps
## 20.57 Gbps
## 321.5 MHz
## 642.9 MHz
- 1: 10.28G/32 ~= 321.25 M
- 2: 20.57G/32 ~= 642.9 M
- 3: 20.57G*7/16/3 ~= 3 G
- 4: 20.57G*7/16/4 ~= 2.25 G
## 2.0 and SS ports according to the platform specific configuration:
- XUSB_PADCTL_USB2_OC_MAP_0[PORT2_OC_PIN]
- XUSB_PADCTL_USB2_OC_MAP_0[PORT1_OC_PIN]
- XUSB_PADCTL_USB2_OC_MAP_0[PORT0_OC_PIN]
- XUSB_PADCTL_SS_OC_MAP_0[PORT2_OC_PIN]
- XUSB_PADCTL_SS_OC_MAP_0[PORT1_OC_PIN]
- XUSB_PADCTL_SS_OC_MAP_0[PORT0_OC_PIN]
- XUSB_PADCTL_VBUS_OC_MAP_0[VBUS_ENABLE1_OC_MAP]
- XUSB_PADCTL_VBUS_OC_MAP_0[VBUS_ENABLE0_OC_MAP]
2. Write ‘1’ to the following XUSB PADCTL register bits to clear possible false reporting of over current events before the over current signal mappings are properly programmed:
- XUSB_PADCTL_OC_DET_0[OC_DETECTED2]
- XUSB_PADCTL_OC_DET_0[OC_DETECTED1]
- XUSB_PADCTL_OC_DET_0[OC_DETECTED0]
- XUSB_PADCTL_OC_DET_0[OC_DETECTED_VBUS_PAD2]
- XUSB_PADCTL_OC_DET_0[OC_DETECTED_VBUS_PAD1]
- XUSB_PADCTL_OC_DET_0[OC_DETECTED_VBUS_PAD0]
3. Wait 1 us 4. Set the following XUSB PADCTL register bits to ‘1’ to enable the VBUS of the host ports:
- XUSB_PADCTL_VBUS_OC_MAP_0[VBUS_ENABLE1]
- XUSB_PADCTL_VBUS_OC_MAP_0[VBUS_ENABLE0]
- Step 8
xHCI platform driver sets up StreamID of XUSB Host’s physical function, enabled virtual functions, and firmware loading state machine.

- USB Programming Guidelines
1. Program the following XUSB AO registers to set up StreamID:
- XUSB_AO_IFR_AXI_STREAMID_0[IFR_STREAMID]
2. Program the following XUSB PADCTL registers to set up StreamID:
- XUSB_PADCTL_HOST_AXI_STREAMID_PF_0[PF_STREAMID]
- XUSB_PADCTL_HOST_AXI_STREAMID_VF_0[VF_STREAMID]
- XUSB_PADCTL_HOST_AXI_STREAMID_VF_1[VF_STREAMID]
- XUSB_PADCTL_HOST_AXI_STREAMID_VF_2[VF_STREAMID]
- XUSB_PADCTL_HOST_AXI_STREAMID_VF_3[VF_STREAMID]
xHCI platform driver sets up StreamID of XUSB Device’s physical function. 3. Program the following XUSB PADCTL registers to set up StreamID:
- XUSB_PADCTL_DEV_AXI_STREAMID_PF_0[PF_STREAMID]
xHCI platform driver initializes XUSB Host’s configuration registers. 4. Program the following XUSB Host configuration registers to initialize XUSB:
- NV_PROJ__XUSB_CFG_1_BUS_MASTER to ‘1’
- NV_PROJ__XUSB_CFG_1_MEMORY_SPACE to ‘1’
- NV_PROJ__XUSB_CFG_4_BASE_ADDRESS to ‘0x500000’
xHCI Device driver initializes XUSB Device’s configuration registers. 5. Program the following XUSB Device configuration registers to initialize XUSB:
- NV_PROJ__XUSB_DEV_CFG_1_BUS_MASTER to ‘1’
- NV_PROJ__XUSB_DEV_CFG_1_MEMORY_SPACE to ‘1’
- NV_PROJ__XUSB_DEV_CFG_4_BASE_ADDRESS to ‘0x450000’
xHCI Device driver enables XUSB Device controller. 6. Program the following XUSB Device MMIO registers to enable XUSB Device:
- NV_PROJ__XUSB_DEV_XHCI_CTRL_0_ENABLE to ‘1’
#### 2.2.6.4 and section 2.4 of PCI Express Base Specification). For a function
that never sets the Relaxed Ordering attribute in transactions it initiates as a Requester, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W
- RW
0x0 PCIE_CAP_UNSUPPORT_REQ_REP_EN:
- Unsupported Request Reporting Enable. This bit, in conjunction with
other bits, controls the signaling of Unsupported Request Errors by sending error Messages (for more details, see section 6.2.5 and section
### 2.3.1 of PCI Express Base Specification). Note: The access attributes
of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W (Sticky) else R (Sticky) Note: This register field is sticky. 15:5
- RO
0x0 RSVDP_5: Reserved for future use.
- RW
0x0 PCIE_CAP_CRS_SW_VISIBILITY_EN:
- CRS Software Visibility Enable. When set, this bit enables the Root
- Port to return Configuration Request Retry Status (CRS) Completion
- Status to software (for more details, see section 2.3.1 of PCI Express
- Base Specification). For Root Ports that do not implement this
capability, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi:
- ROOT_CONTROL_ROOT_CAPABILITIES_REG.PCIE_CAP_CRS_SW_VISIB
- ILITY ? RW : RO
- RW
0x0 PCIE_CAP_PME_INT_EN:
- PME Interrupt Enable. When set, this bit enables PME interrupt
generation upon receipt of a PME Message as reflected in the PME
- Status bit (for more details, see Table 7-29 of PCI Express Base
- Specification). A PME interrupt is also generated if the PME Status bit
is set when this bit is changed from clear to set.
- RW
0x0 PCIE_CAP_SYS_ERR_ON_FATAL_ERR_EN:
- System Error on Fatal Error Enable. If set, this bit indicates that a
- System Error should be generated if a Fatal error (ERR_FATAL) is
reported by any of the devices in the Hierarchy Domain associated with this Root Port, or by the Root Port itself. The mechanism for signaling a System Error to the system is system specific.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_SYS_ERR_ON_NON_FATAL_ERR_EN:
- System Error on Non-Fatal Error Enable. If set, this bit indicates that a
- System Error should be generated if a Non-fatal error
(ERR_NONFATAL) is reported by any of the devices in the Hierarchy
- Domain associated with this Root Port, or by the Root Port itself. The
mechanism for signaling a System Error to the system is system specific.
- RW
0x0 PCIE_CAP_SYS_ERR_ON_CORR_ERR_EN:
- System Error on Correctable Error Enable. If set, this bit indicates
that a System Error should be generated if a correctable error (ERR_COR) is reported by any of the devices in the Hierarchy Domain associated with this Root Port, or by the Root Port itself. The mechanism for signaling a System Error to the system is system specific.
- PCIE_X<i>_RC_PF0_PCIE_CAP_ROOT_STATUS_REG_0
where <i> = 1, 4, 8. Description: The Root Status register provides information about PCI Express device specific parameters.
- PCIE_X1_RC_PF0_PCIE_CAP_ROOT_STATUS_REG_0
- PCIE_X4_RC_PF0_PCIE_CAP_ROOT_STATUS_REG_0
- PCIE_X8_RC_PF0_PCIE_CAP_ROOT_STATUS_REG_0
- Offset: 0x90
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:18
- RO
0x0 RSVDP_18: Reserved for future use.
- RO
0x0 PCIE_CAP_PME_PENDING:
- PME Pending. This bit indicates that another PME is pending when
the PME Status bit is s et. When the PME Status bit is cleared by software; the PME is delivered by hardware by setting the PME
- Status bit again and updating the PME Requester ID field
appropriately. The PME Pending bit is cleared by hardware if no more PMEs are pending.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_PME_STATUS:
- PME Status. This bit indicates that PME was asserted by the PME
- Requester indicated in the PME Requester ID field. Subsequent
- PMEs are kept pending until the status register is cleared by
software by writing a 1b. 15:0
- RO
0x0 PCIE_CAP_PME_REQ_ID:
- PME Requester ID. This field indicates the PCI Requester ID of the
last PME Requester. This field is only valid when the PME Status bit is set.
- PCIE_X<i>_RC_PF0_PCIE_CAP_DEVICE_CAPABILITIES2_REG_0
where <i> = 1, 4, 8. Description: This register identifies PCI Express device specific capabilities; in addition to the Device Capabilities Register.
- PCIE_X1_RC_PF0_PCIE_CAP_DEVICE_CAPABILITIES2_REG_0
- PCIE_X4_RC_PF0_PCIE_CAP_DEVICE_CAPABILITIES2_REG_0
- PCIE_X8_RC_PF0_PCIE_CAP_DEVICE_CAPABILITIES2_REG_0
- Offset: 0x94
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00010c3f (0bx000,0000,xxxx,xx01,xx00,1100,0011,1111)
- Bit
R/W
- Reset
- Description
30:24
- RO
0x0 RSVDP_24: Reserved for future use.
- RO
0x0 PCIE_CAP2_10_BIT_TAG_REQ_SUPPORT: 10-Bit Tag Requester Supported. If this bit is set, the Function supports 10-Bit Tag Requester capability; otherwise, the Function does not. This bit must not be set if the 10-Bit Tag Completer Supported bit is clear.
- Note: 10-Bit Tag field generation must be enabled by the 10-Bit Tag
- Requester Enable bit in the Device Control 2 register of the Requester
- Function before 10-Bit Tags can be generated by the Requester. For
more details, see section 2.2.6.2. of PCI Express Base Specification.
- RO
0x1 PCIE_CAP2_10_BIT_TAG_COMP_SUPPORT: 10-Bit Tag Completer Supported. If this bit is set, the Function supports 10-Bit Tag Completer capability; otherwise, the Function does not. For more details, see section 2.2.6.2. of PCI Express Base Specification.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x0 PCIE_CAP_TPH_CMPLT_SUPPORT_1: TPH Completer Supported Bit 1.
- RO
0x0 PCIE_CAP_TPH_CMPLT_SUPPORT_0:
- TPH Completer Supported Bit 0. Value of this bit along with TPH
- Completer Supported Bit 1 indicates Completer support for TPH or
- Extended TPH. Applicable only to Root Ports and Endpoints. For all other
- Functions, this field is Reserved. When TPH completer support bit 0 is
clear. When TPH completer support bit 1 is set. For more details, see section 6.17 of PCI Express Base Specification.
- RW
0x1 PCIE_CAP_LTR_SUPP:
- LTR Mechanism Supported. A value of 1b indicates support for the
optional Latency Tolerance Reporting (LTR) mechanism. Root Ports,
- Switches and Endpoints are permitted to implement this capability. For
a Multi-Function Device associated with an Upstream Port, each
- Function must report the same value for this bit. For Bridges and other
- Functions that do not implement this capability, the controller hardwires
this bit to 0b. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(Sticky) else
R(Sticky) Note: This register field is sticky.
- RO
0x1 PCIE_CAP_NO_RO_EN_PR2PR_PAR:
- No RO-enabled PR-PR Passing. If this bit is set, the routing element
never carries out the passing permitted by Table 2-39 of PCI Express
- Base Specification entry A2b that is associated with the Relaxed
- Ordering Attribute field being Set. This bit applies only for Switches and
- RCs that support peer-to-peer traffic between Root Ports. This bit
applies only to Posted Requests being forwarded through the Switch or
- RC and does not apply to traffic originating or terminating within the
- Switch or RC itself. All Ports on a Switch or RC must report the same
value for this bit. For all other functions, this bit must be 0b.
- RO
0x0 PCIE_CAP_128_CAS_CPL_SUPP: 128-bit CAS Completer Supported. Applicable to Functions with Memory Space BARs as well as all Root Ports; must be 0b otherwise.
- This bit must be set to 1b if the Function supports this optional
capability. For more details, see section 6.15 of PCI Express Base Specification.
- RO
0x0 PCIE_CAP_64_ATOMIC_CPL_SUPP: 64-bit AtomicOp Completer Supported. Applicable to Functions with Memory Space BARs as well as all Root Ports; must be 0b otherwise.
- Includes FetchAdd, Swap, and CAS AtomicOps. This bit must be set to
1b if the Function supports this optional capability. For more details on additional RC requirements, see section 6.15.3.1 of PCI Express Base Specification.
- RO
0x0 PCIE_CAP_32_ATOMIC_CPL_SUPP: 32-bit AtomicOp Completer Supported. Applicable to Functions with Memory Space BARs as well as all Root Ports; must be 0b otherwise.
- Includes FetchAdd, Swap, and CAS AtomicOps. This bit must be set to
1b if the Function supports this optional capability. For more details on additional RC requirements, see section 6.15.3.1 of PCI Express Base Specification.
- RO
0x0 PCIE_CAP_ATOMIC_ROUTING_SUPP:
- AtomicOp Routing Supported. Applicable only to Switch Upstream Ports,
- Switch Downstream Ports, and Root Ports; must be 0b for other
- Function types. This bit must be set to 1b if the Port supports this
optional capability. For more details, see section 6.15 of PCI Express Base Specification.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x1 PCIE_CAP_ARI_FORWARD_SUPPORT:
- ARI Forwarding Supported. Applicable only to Switch Downstream Ports
and Root Ports; must be 0b for other Function types. This bit must be set to 1b if a Switch Downstream Port or Root Port supports this optional capability. For more details, see section 6.13 of PCI Express Base Specification.
- RO
0x1 PCIE_CAP_CPL_TIMEOUT_DISABLE_SUPPORT:
- Completion Timeout Disable Supported. A value of 1b indicates support
for the Completion Timeout Disable mechanism. The Completion
- Timeout Disable mechanism is required for Endpoints that issue
- Requests on their own behalf and PCI Express to PCI/PCI-X Bridges that
take ownership of Requests issued on PCI Express. This mechanism is optional for Root Ports. For all other Functions this field is Reserved and the controller hardwires this bit to 0b. 3:0
- RO
0xf PCIE_CAP_CPL_TIMEOUT_RANGE:
- Completion Timeout Ranges Supported. This field indicates device
- Function support for the optional Completion Timeout programmability
mechanism. This mechanism allows system software to modify the
- Completion Timeout value. This field is applicable only to Root Ports,
- Endpoints that issue Requests on their own behalf, and PCI Express to
- PCI/PCI-X Bridges that take ownership of Requests issued on PCI
- Express. For all other Functions this field is Reserved and must be
hardwired to 0000b. Four time value ranges are defined: - Range A: 50 us to 10 ms - Range B: 10 ms to 250 ms - Range C: 250 ms to 4 s - Range D: 4 s to 64 s Bits are set according to the list below to show timeout value ranges supported. All encodings other than the defined encodings are reserved. It is strongly recommended that the Completion Timeout mechanism not expire in less than 10 ms.
- PCIE_X<i>_RC_PF0_PCIE_CAP_DEVICE_CONTROL2_DEVICE_STATUS2_REG_0
where <i> = 1, 4, 8. Description: This register controls PCI Express device specific parameters and provides information about PCI Express device (function) specific parameters; in addition to the Device Control and Device Status Register.
- PCIE_X1_RC_PF0_PCIE_CAP_DEVICE_CONTROL2_DEVICE_STATUS2_REG_0
- PCIE_X4_RC_PF0_PCIE_CAP_DEVICE_CONTROL2_DEVICE_STATUS2_REG_0
- PCIE_X8_RC_PF0_PCIE_CAP_DEVICE_CONTROL2_DEVICE_STATUS2_REG_0
- Offset: 0x98
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,x0xx,xx00,0000)

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description
0x0 PCIE_CAP_LTR_EN:
- LTR Mechanism Enable. When set to 1b, this bit enables Upstream Ports to send LTR
messages and Downstream Ports to process LTR Messages. For a Multi-Function
- Device associated with an Upstream Port of a device that implements LTR, the bit in
- Function 0 is RW, and only Function 0 controls the component's Link behavior. In all
other Functions of that device, this bit is RsvdP. Functions that do not implement the
- LTR mechanism are permitted to hardwire this bit to 0b. For Downstream Ports, this bit
must be reset to the default value if the Port goes to DL_Down status. The write value is gated with the PCIE_CAP_LTR_SUPP field of DEVICE_CAPABILITIES2_REG. Note: RW for function #0 and RsdvP for all other functions. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (pf=0 &&
- DEVICE_CAPABILITIES2_REG.PCIE_CAP_LTR_SUPP) then R/W else R
0x0 PCIE_CAP_ARI_FORWARD_SUPPORT_CS:
- ARI Forwarding Enable. When set, the Downstream Port disables its traditional Device
- Number field being 0 enforcement when turning a Type 1 Configuration Request into a
- Type 0 Configuration Request, permitting access to Extended Functions in an ARI
- Device immediately below the Port. For more details, see Section 6.13 of PCI Express
- Base Specification. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: R/W 0x0 PCIE_CAP_CPL_TIMEOUT_DISABLE:
- Completion Timeout Disable. When set, this bit disables the Completion Timeout
mechanism. This bit is required for all Functions that support the Completion Timeout
- Disable Capability. Functions that do not support this optional capability are permitted
to hardwire this bit to 0b Software is permitted to set or clear this bit at any time.
- When set, the Completion Timeout detection mechanism is disabled. If there are
outstanding Requests when the bit is cleared, it is permitted but not required for hardware to apply the completion timeout mechanism to the outstanding Requests. If this is done, it is permitted to base the start time for each Request on either the time this bit was cleared or the time each Request was issued. 3:0 0x0 PCIE_CAP_CPL_TIMEOUT_VALUE:
- Completion Timeout Value. In device Functions that support Completion Timeout
programmability, this field allows system software to modify the Completion Timeout value. This field is applicable to Root Ports, Endpoints that issue Requests on their own behalf, and PCI Express to PCI/PCI-X Bridges that take ownership of Requests issued on PCI Express. For all other Functions this field is Reserved and controller hardwires it to 0000b. A Function that does not support this optional capability must hardwire this field to 0000b and is required to implement a timeout value in the range 50 us to 50 ms. Functions that support Completion Timeout programmability must support the values given below corresponding to the programmability ranges indicated in the
- Completion Timeout Ranges Supported field. All encodings other than the defined
encodings are reserved. It is strongly recommended that the Completion Timeout mechanism not expire in less than 10 ms. Values available if Range A (50 us to 10 ms) programmability range is supported: Values available if Range B (10 ms to 250 ms) programmability range is supported: Values available if Range C (250 ms to 4 s) programmability range is supported: Values available if the Range D (4 s to 64 s) programmability range is supported: Software is permitted to change the value in this field at any time. For Requests already pending when the Completion Timeout Value is changed, hardware is permitted to use either the new or the old value for the outstanding Requests, and is permitted to base the start time for each Request either on when this value was changed or on when each request was issued. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W
- PCIE_X<i>_RC_PF0_PCIE_CAP_LINK_CAPABILITIES2_REG_0
where <i> = 1, 4, 8.

- PCIe x1/x4/x8 Root Complex
Description: This register identifies PCI Express Link specific capabilities; in addition to the Link Capabilities Register.
- PCIE_X1_RC_PF0_PCIE_CAP_LINK_CAPABILITIES2_REG_0
- PCIE_X4_RC_PF0_PCIE_CAP_LINK_CAPABILITIES2_REG_0
- PCIE_X8_RC_PF0_PCIE_CAP_LINK_CAPABILITIES2_REG_0
- Offset: 0x9c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0180001e (0bx000,0001,1000,0000,0000,0000,0001,1110)
- Bit
R/W
- Reset
- Description
30:25
- RO
0x0 RSVDP_25: Reserved for future use.
- RW
0x1 PCIE_CAP_TWO_RETIMERS_PRE_DET_SUPPORT:
- Two Retimers Presence Detect Supported. When set to 1b, this bit
indicates that the associated Port supports detection and reporting of two Retimers presence. This bit must be set to 1b in a Port when the
- Supported Link Speeds Vector of the Link Capabilities 2 register
indicates support for a Link speed of 16.0 GT/s or higher. It is permitted to be set to 1b regardless of the supported Link speeds if the Retimer
- Presence Detect Supported bit is also set to 1b. Multi-Function Devices
associated with an Upstream Port must report the same value in this field for all Functions. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky)
- RW
0x1 PCIE_CAP_RETIMER_PRE_DET_SUPPORT:
- Retimer Presence Detect Supported. When set to 1b, this bit indicates
that the associated Port supports detection and reporting of Retimer presence. This bit must be set to 1b in a Port when the Supported Link
- Speeds Vector of the Link Capabilities 2 register indicates support for a
- Link speed of 16.0 GT/s or higher. It is permitted to be set to 1b
regardless of the supported Link speeds. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all Functions. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) 22:9
- RO
0x0 RSVDP_9: Reserved for future use.

- PCIe x1/x4/x8 Root Complex
- Bit
R/W
- Reset
- Description
- RO
0x0 PCIE_CAP_CROSS_LINK_SUPPORT:
- Crosslink Supported. When set to 1b, this bit indicates that the
associated Port supports crosslinks (for more details, see section
#### 2.2.6.4 and section 2.4 of PCI Express Base Specification). For a function
that never sets the Relaxed Ordering attribute in transactions it initiates as a Requester, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: R/W - Dbi: R/W
- RW
0x0 PCIE_CAP_UNSUPPORT_REQ_REP_EN:
- Unsupported Request Reporting Enable. This bit, in conjunction with
other bits, controls the signaling of Unsupported Request Errors by sending error Messages (for more details, see section 6.2.5 and section
#### 2.3.1.1 of PCI Express Base Specification for the definition of the
parameter RCB. Configuration software must only set this bit if the Root
- Port Upstream from the Endpoint or Bridge reports an RCB value of 128
bytes (a value of 1b in the Read Completion Boundary bit). For functions that do not implement this feature, the controller hardwires this bit to 0b.
- Note: The access attributes of this field are as follows: - Wire: R/W - Dbi: R/
W
- RO
0x0 RSVDP_2: Reserved for future use. 1:0
- RW
0x0 PCIE_CAP_ACTIVE_STATE_LINK_PM_CONTROL:
- Active State Power Management (ASPM) Control. This field controls the
level of ASPM enabled on the given PCI Express Link. See section 5.4.1.3 of PCI Express Base Specification for requirements on when and how to enable ASPM. Note: "L0s Entry Enabled" enables the Transmitter to enter
- L0s. If L0s is supported, the Receiver must be capable of entering L0s
even when the Transmitter is disabled from entering L0s (00b or 10b).
- ASPM L1 must be enabled by software in the Upstream component on a
- Link prior to enabling ASPM L1 in the Downstream component on that
- Link. When disabling ASPM L1, software must disable ASPM L1 in the
- Downstream component on a Link prior to disabling ASPM L1 in the
- Upstream component on that Link. ASPM L1 must only be enabled on the
Downstream component if both components on a Link support ASPM L1.
- For Multi-Function Devices (including ARI Devices), it is recommended that
software program the same value for this field in all Functions. For non-
- ARI Multi-Function Devices, only capabilities enabled in all Functions are
enabled for the component as a whole. For ARI Devices, ASPM Control is determined solely by the setting in Function0, regardless of Function 0's D-state. The settings in the other Functions always return whatever value software programmed for each, but otherwise are ignored by the component. Software must not enable L0s in either direction on a given
- Link unless components on both sides of the Link each support L0s;
otherwise, the result is undefined.
- PCIE_X<j>_EP_PF0_PCIE_CAP_DEVICE_CAPABILITIES2_REG_0
where <j> = 4, 8. Description:This register identifies PCI Express device specific capabilities; in addition to the Device Capabilities Register.
- PCIE_X4_EP_PF0_PCIE_CAP_DEVICE_CAPABILITIES2_REG_0
- PCIE_X8_EP_PF0_PCIE_CAP_DEVICE_CAPABILITIES2_REG_0
- Offset: 0x94
- Read/Write: See table below

- PCIe x4/x8 Endpoint
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0001081f (0bx000,0000,xxxx,xx01,0000,1000,0001,1111)
- Bit
R/W
- Reset
- Description
30:24
- RO
0x0 RSVDP_24: Reserved for future use.
- RO
0x0 PCIE_CAP2_10_BIT_TAG_REQ_SUPPORT: 10-Bit Tag Requester Supported. If this bit is set, the Function supports 10-Bit Tag Requester capability; otherwise, the Function does not. This bit must not be set if the 10-Bit Tag Completer Supported bit is clear.
- Note: 10-Bit Tag field generation must be enabled by the 10-Bit Tag
- Requester Enable bit in the Device Control 2 register of the Requester
- Function before 10-Bit Tags can be generated by the Requester. For
more details, see section 2.2.6.2. of PCI Express Base Specification.
- RO
0x1 PCIE_CAP2_10_BIT_TAG_COMP_SUPPORT: 10-Bit Tag Completer Supported. If this bit is set, the Function supports 10-Bit Tag Completer capability; otherwise, the Function does not. For more details, see section 2.2.6.2. of PCI Express Base Specification. 15:14
- RO
0x0 PCIE_CAP2_LN_SYS_CLS:
- LN System CLS. Applicable only to Root Ports and RCRBs; must be 00b
for all other Function types. This field indicates if the Root Port or RCRB supports LN protocol as an LN Completer, and if so, what cacheline size is in effect. All encodings other than the defined encodings are reserved. Note: This register field is sticky.
- RO
0x0 PCIE_CAP_TPH_CMPLT_SUPPORT_1: TPH Completer Supported Bit 1.
- RO
0x0 PCIE_CAP_TPH_CMPLT_SUPPORT_0:
- TPH Completer Supported Bit 0. Value of this bit along with TPH
- Completer Supported Bit 1 indicates Completer support for TPH or
- Extended TPH. Applicable only to Root Ports and Endpoints. For all other
- Functions, this field is Reserved. When TPH completer support bit 0 is
clear. When TPH completer support bit 1 is set. For more details, see section 6.17 of PCI Express Base Specification.
- RW
0x1 PCIE_CAP_LTR_SUPP:
- LTR Mechanism Supported. A value of 1b indicates support for the
optional Latency Tolerance Reporting (LTR) mechanism. Root Ports,
- Switches and Endpoints are permitted to implement this capability. For
a Multi-Function Device associated with an Upstream Port, each
- Function must report the same value for this bit. For Bridges and other
- Functions that do not implement this capability, the controller hardwires
this bit to 0b. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(Sticky) else
R(Sticky) Note: This register field is sticky.
- RO
0x0 PCIE_CAP_NO_RO_EN_PR2PR_PAR:
- No RO-enabled PR-PR Passing. If this bit is set, the routing element
never carries out the passing permitted by Table 2-39 of PCI Express
- Base Specification entry A2b that is associated with the Relaxed
- Ordering Attribute field being Set. This bit applies only for Switches and
- RCs that support peer-to-peer traffic between Root Ports. This bit
applies only to Posted Requests being forwarded through the Switch or
- RC and does not apply to traffic originating or terminating within the
- Switch or RC itself. All Ports on a Switch or RC must report the same
value for this bit. For all other functions, this bit must be 0b.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RO
0x0 PCIE_CAP_128_CAS_CPL_SUPP: 128-bit CAS Completer Supported. Applicable to Functions with Memory Space BARs as well as all Root Ports; must be 0b otherwise.
- This bit must be set to 1b if the Function supports this optional
capability. For more details, see section 6.15 of PCI Express Base Specification.
- RO
0x0 PCIE_CAP_64_ATOMIC_CPL_SUPP: 64-bit AtomicOp Completer Supported. Applicable to Functions with Memory Space BARs as well as all Root Ports; must be 0b otherwise.
- Includes FetchAdd, Swap, and CAS AtomicOps. This bit must be set to
1b if the Function supports this optional capability. For more details on additional RC requirements, see section 6.15.3.1 of PCI Express Base Specification.
- RO
0x0 PCIE_CAP_32_ATOMIC_CPL_SUPP: 32-bit AtomicOp Completer Supported. Applicable to Functions with Memory Space BARs as well as all Root Ports; must be 0b otherwise.
- Includes FetchAdd, Swap, and CAS AtomicOps. This bit must be set to
1b if the Function supports this optional capability. For more details on additional RC requirements, see section 6.15.3.1 of PCI Express Base Specification.
- RO
0x0 PCIE_CAP_ATOMIC_ROUTING_SUPP:
- AtomicOp Routing Supported. Applicable only to Switch Upstream Ports,
- Switch Downstream Ports, and Root Ports; must be 0b for other
- Function types. This bit must be set to 1b if the Port supports this
optional capability. For more details, see section 6.15 of PCI Express Base Specification.
- RO
0x0 PCIE_CAP_ARI_FORWARD_SUPPORT:
- ARI Forwarding Supported. Applicable only to Switch Downstream Ports
and Root Ports; must be 0b for other Function types. This bit must be set to 1b if a Switch Downstream Port or Root Port supports this optional capability. For more details, see section 6.13 of PCI Express Base Specification.
- RO
0x1 PCIE_CAP_CPL_TIMEOUT_DISABLE_SUPPORT:
- Completion Timeout Disable Supported. A value of 1b indicates support
for the Completion Timeout Disable mechanism. The Completion
- Timeout Disable mechanism is required for Endpoints that issue
- Requests on their own behalf and PCI Express to PCI/PCI-X Bridges that
take ownership of Requests issued on PCI Express. This mechanism is optional for Root Ports. For all other Functions this field is Reserved and the controller hardwires this bit to 0b. 3:0
- RO
0xf PCIE_CAP_CPL_TIMEOUT_RANGE:
- Completion Timeout Ranges Supported. This field indicates device
- Function support for the optional Completion Timeout programmability
mechanism. This mechanism allows system software to modify the
- Completion Timeout value. This field is applicable only to Root Ports,
- Endpoints that issue Requests on their own behalf, and PCI Express to
- PCI/PCI-X Bridges that take ownership of Requests issued on PCI
- Express. For all other Functions this field is Reserved and must be
hardwired to 0000b. Four time value ranges are defined: - Range A: 50 us to 10 ms - Range B: 10 ms to 250 ms - Range C: 250 ms to 4 s - Range D: 4 s to 64 s Bits are set according to the list below to show timeout value ranges supported. All encodings other than the defined encodings are reserved. It is strongly recommended that the Completion Timeout mechanism not expire in less than 10 ms.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_PCIE_CAP_DEVICE_CONTROL2_DEVICE_STATUS2_REG_0
where <j> = 4, 8. Description:This register controls PCI Express device specific parameters and provides information about PCI Express device (function) specific parameters; in addition to the Device Control and Device Status Register.
- PCIE_X4_EP_PF0_PCIE_CAP_DEVICE_CONTROL2_DEVICE_STATUS2_REG_0
- PCIE_X8_EP_PF0_PCIE_CAP_DEVICE_CONTROL2_DEVICE_STATUS2_REG_0
- Offset: 0x98
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,x0xx,xx00,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 PCIE_CAP_LTR_EN:
- LTR Mechanism Enable. When set to 1b, this bit enables Upstream Ports to
send LTR messages and Downstream Ports to process LTR Messages. For a
- Multi-Function Device associated with an Upstream Port of a device that
implements LTR, the bit in Function 0 is RW, and only Function 0 controls the component's Link behavior. In all other Functions of that device, this bit is
- RsvdP. Functions that do not implement the LTR mechanism are permitted to
hardwire this bit to 0b. For Downstream Ports, this bit must be reset to the default value if the Port goes to DL_Down status. The write value is gated with the PCIE_CAP_LTR_SUPP field of DEVICE_CAPABILITIES2_REG. Note: RW for function #0 and RsdvP for all other functions. Note: The access attributes of this field are as follows: - Wire: if (pf=0 &&
- DEVICE_CAPABILITIES2_REG.PCIE_CAP_LTR_SUPP) then R/W else R - Dbi: if
(pf=0 && DEVICE_CAPABILITIES2_REG.PCIE_CAP_LTR_SUPP) then R/W else R
- RO
0x0 PCIE_CAP_ARI_FORWARD_SUPPORT_CS:
- ARI Forwarding Enable. When set, the Downstream Port disables its traditional
- Device Number field being 0 enforcement when turning a Type 1
- Configuration Request into a Type 0 Configuration Request, permitting access
to Extended Functions in an ARI Device immediately below the Port. For more details, see Section 6.13 of PCI Express Base Specification.
- RW
0x0 PCIE_CAP_CPL_TIMEOUT_DISABLE:
- Completion Timeout Disable. When set, this bit disables the Completion
- Timeout mechanism. This bit is required for all Functions that support the
- Completion Timeout Disable Capability. Functions that do not support this
optional capability are permitted to hardwire this bit to 0b Software is permitted to set or clear this bit at any time. When set, the Completion
- Timeout detection mechanism is disabled. If there are outstanding Requests
when the bit is cleared, it is permitted but not required for hardware to apply the completion timeout mechanism to the outstanding Requests. If this is done, it is permitted to base the start time for each Request on either the time this bit was cleared or the time each Request was issued.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
3:0
- RW
0x0 PCIE_CAP_CPL_TIMEOUT_VALUE:
- Completion Timeout Value. In device Functions that support Completion
- Timeout programmability, this field allows system software to modify the
- Completion Timeout value. This field is applicable to Root Ports, Endpoints
that issue Requests on their own behalf, and PCI Express to PCI/PCI-X Bridges that take ownership of Requests issued on PCI Express. For all other
- Functions this field is Reserved and controller hardwires it to 0000b. A
- Function that does not support this optional capability must hardwire this
field to 0000b and is required to implement a timeout value in the range 50 us to 50 ms. Functions that support Completion Timeout programmability must support the values given below corresponding to the programmability ranges indicated in the Completion Timeout Ranges Supported field. All encodings other than the defined encodings are reserved. It is strongly recommended that the Completion Timeout mechanism not expire in less than 10 ms. Values available if Range A (50 us to 10 ms) programmability range is supported:
- Values available if Range B (10 ms to 250 ms) programmability range is
supported: Values available if Range C (250 ms to 4 s) programmability range is supported: Values available if the Range D (4 s to 64 s) programmability range is supported: Software is permitted to change the value in this field at any time. For Requests already pending when the Completion Timeout Value is changed, hardware is permitted to use either the new or the old value for the outstanding Requests, and is permitted to base the start time for each
- Request either on when this value was changed or on when each request was
issued. Note: The access attributes of this field are as follows: - Wire: R/W -
- Dbi: R/W
- PCIE_X<j>_EP_PF0_PCIE_CAP_LINK_CAPABILITIES2_REG_0
where <j> = 4, 8. Description:This register identifies PCI Express Link specific capabilities; in addition to the Link Capabilities Register.
- PCIE_X4_EP_PF0_PCIE_CAP_LINK_CAPABILITIES2_REG_0
- PCIE_X8_EP_PF0_PCIE_CAP_LINK_CAPABILITIES2_REG_0
- Offset: 0x9c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0180001e (0bx000,0001,1000,0000,0000,0000,0001,1110)
- Bit
R/W
- Reset
- Description
30:25
- RO
0x0 RSVDP_25: Reserved for future use.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x1 PCIE_CAP_TWO_RETIMERS_PRE_DET_SUPPORT:
- Two Retimers Presence Detect Supported. When set to 1b, this bit
indicates that the associated Port supports detection and reporting of two Retimers presence. This bit must be set to 1b in a Port when the
- Supported Link Speeds Vector of the Link Capabilities 2 register
indicates support for a Link speed of 16.0 GT/s or higher. It is permitted to be set to 1b regardless of the supported Link speeds if the Retimer
- Presence Detect Supported bit is also set to 1b. Multi-Function Devices
associated with an Upstream Port must report the same value in this field for all Functions. Note: The access attributes of this field are as follows: - Wire: HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- RW
0x1 PCIE_CAP_RETIMER_PRE_DET_SUPPORT:
- Retimer Presence Detect Supported. When set to 1b, this bit indicates
that the associated Port supports detection and reporting of Retimer presence. This bit must be set to 1b in a Port when the Supported Link
- Speeds Vector of the Link Capabilities 2 register indicates support for a
- Link speed of 16.0 GT/s or higher. It is permitted to be set to 1b
regardless of the supported Link speeds. Multi-Function Devices associated with an Upstream Port must report the same value in this field for all Functions. Note: The access attributes of this field are as follows: - Wire: HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 22:9
- RO
0x0 RSVDP_9: Reserved for future use.
- RO
0x0 PCIE_CAP_CROSS_LINK_SUPPORT:
- Crosslink Supported. When set to 1b, this bit indicates that the
associated Port supports crosslinks (for more details, see section
## 2.5 G CAR Divisor Programming Changes:
Program the following fields in CLK_RST_CONTROLLER_GBE_UPHY_MGBE0_CLK_CTRL_0 register. 1. 2. 3.
- GBE_UPHY_MGBE0_MAC_CLK_DIV_RATIO = 3 Divide by N+1 makes it Divide by 4
- GBE_UPHY_MGBE0_TX_PCS_CLK_DIV_RATIO = 3 Divide by N+1 makes it Divide by 4
- GBE_UPHY_MGBE0_TX_CLK_DIV_RATIO = 1 Divide by N+1 makes it Divide by 2

10G Ethernet Programming Guidelines
## 2.000000001 second needs to be subtracted with the system time, the TSS field
in the MAC Timestamp Seconds update register must be 0xFFFF_FFFE (for instance, 2^32 - 2), ADDSUB bit in this register must be set, and the TSSS field must be 0x3B9A_C9FF (for instance, 10^9 - 1).
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_ADDEND_0
The Timestamp Addend register is present only when the IEEE 1588 Timestamp feature is selected without external timestamp input. This register value is used only when the system time is configured for Fine Update mode (TSCFUPDT bit in the MAC_Timestamp_Control register). The

10G Ethernet Controller Core Registers cont'd 1 content of this register is added to a 32-bit accumulator in every clock cycle (of clk_ptp_ref_i) and the system time is updated when the accumulator overflows.
- Offset: 0xd18
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 TSAR:
- Timestamp Addend Register. This field indicates the 32-bit time value to
be added to the Accumulator register to achieve time synchronization.
- MGBE_DWCXG_CORE_MAC_SYSTEM_TIME_HIGHER_WORD_SECONDS_0
The System Time - Higher Word Seconds register is present only when the IEEE 1588 Timestamp feature is selected without an external timestamp input.
- Offset: 0xd1c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved. 15:0
- RW
0x0 TSHWR:
- Timestamp Higher Word Register. This field contains the most-
significant 16-bits of timestamp seconds value. This register is optional. You can add this register by selecting the Add IEEE 1588
- Higher Word Register option. This register is directly written to
initialize the value and it is incremented when there is an overflow from 32-bits of the System Time - Seconds register.
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_STATUS_0
The Timestamp Status register is present only when the IEEE 1588 Timestamp feature is selected. All bits except Bits[29:25] gets cleared when the application reads this register.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0xd20
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:30 0x0 Reserved_31_30: Reserved. 29:25 0x0 ATSNS:
- Number of Auxiliary Timestamp Snapshots. This field indicates the number of
- Snapshots available in the FIFO. A value equal to the selected depth of FIFO (4, 8,
or 16) indicates that the Auxiliary Snapshot FIFO is full. These bits are cleared (to 00000) when the Auxiliary snapshot FIFO clear bit is set. This bit is valid only if the Add IEEE 1588 Auxiliary Snapshot option is selected. 0x0 ATSSTM:
- Auxiliary Timestamp Snapshot Trigger Missed. This bit is set when the Auxiliary
timestamp snapshot FIFO is full and external trigger was set. This indicates that the latest snapshot is not stored in the FIFO. This bit is valid only if the Add IEEE 1588 Auxiliary Snapshot option is selected. 23:20 0x0 Reserved_23_20: Reserved. 19:16 0x0 ATSSTN:
- Auxiliary Timestamp Snapshot Trigger Identifier. These bits identify the Auxiliary
trigger inputs for which the timestamp available in the Auxiliary Snapshot register is applicable. When more than one bit is set at the same time, it means that corresponding auxiliary triggers are sampled at the same clock. These bits are applicable only if the number of Auxiliary snapshots is more than one. One bit is assigned for each trigger as shown in the following list: - Bit 16: Auxiliary trigger 0 - Bit 17: Auxiliary trigger 1 - Bit 18: Auxiliary trigger 2 - Bit 19: Auxiliary trigger 3 The software can read this register to find the triggers that are set when the timestamp is taken. 0x0 TXTSC:
- Tx Timestamp Captured. When set, this bit indicates that a timestamp of the
current packet being transmitted by the MAC is available in
- MAC_TxTimestamp_Status_Seconds and
- MAC_TxTimestamp_Status_Nanoseconds registers. This bit is cleared on reading
(byte 3 or byte 0 in little or big endian mode respectively) the
- MAC_TxTimestamp_Status_Seconds register. When Tx Timestamp Status FIFO
depth selected is more than 1, this bit is set as long as Tx Timestamp status
- FIFO has Tx Timestamp status entries. It is cleared when Seconds field
corresponding to last entry is read (byte 3 or byte 0 in little or big endian mode respectively) from MAC_TxTimestamp_Status_Seconds register. Access restriction applies.This bit is cleared on reading (byte 3 or byte 0 in little or big endian mode respectively) the MAC_TxTimestamp_Status_Seconds register (or write to corresponding byte of MAC_Tx_Timestamp_Status_Seconds register when RCWE bit of MAC_CSR_SW_Ctrl register is set).

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
14:10 0x0 TTSNS:
- Number of Tx Timestamp Snapshots. This field indicates the number of Tx
- Timestamp Snapshots available in the FIFO. A value equal to the selected depth
of FIFO (2, 4, 8, or 16) indicates that the Tx Timestamp Snapshot FIFO is full. The
- Tx Timestamp Snapshot FIFO is implemented as synchronous FIFO in the CSR
clock domain. This field is incremented along with the Tx Timestamp Snapshot write command to the FIFO. This field is decremented along with the Tx
- Timestamp Snapshot read command (issued when byte 3 or byte 0 of
- MAC_TxTimestamp_Status_Seconds register is read in little or big endian mode
respectively) to the FIFO. If both write and read command is issued simultaneously, this field is not changed. This field is valid only if the "Enable IEEE 1588 Timestamp Support" option is selected. 0x0 TSTRGTERR3:
- Timestamp Target Time Error. This bit is set when the latest target time
programmed in the MAC_PPS3_Target_Time_Seconds and
- MAC_PPS3_Target_Time_Nanoseconds registers has already elapsed. The bit is
also set when the PPS command programmed cannot be executed due to earlier programmed target time has already elapsed. This bit is cleared when the application reads this bit. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 TSTARGT3:
- Timestamp Target Time Reached for Target Time PPS3. When this bit is set, it
indicates that the value of system time is greater than or equal to the value specified in the MAC_PPS3_Target_Time_Seconds and MAC_PPS3_Target_Time_Nanoseconds registers. Access restriction applies.
- Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is
set). Self-set to 1 on internal event. 0x0 TSTRGTERR2:
- Timestamp Target Time Error. This bit is set when the latest target time
programmed in the MAC_PPS2_Target_Time_Seconds and
- MAC_PPS2_Target_Time_Nanoseconds registers has already elapsed. The bit is
also set when the PPS command programmed cannot be executed due to earlier programmed target time has already elapsed. This bit is cleared when the application reads this bit. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 TSTARGT2:
- Timestamp Target Time Reached for Target Time PPS2. When set, this bit
indicates that the value of system time is greater than or equal to the value specified in the MAC_PPS2_Target_Time_Seconds and MAC_PPS2_Target_Time_Nanoseconds registers. Access restriction applies.
- Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is
set). Self-set to 1 on internal event. 0x0 TSTRGTERR1:
- Timestamp Target Time Error. This bit is set when the latest target time
programmed in the MAC_PPS1_Target_Time_Seconds and
- MAC_PPS1_Target_Time_Nanoseconds registers has already elapsed. The bit is
also set when the PPS command programmed cannot be executed due to earlier programmed target time has already elapsed. This bit is cleared when the application reads this bit. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 TSTARGT1:
- Timestamp Target Time Reached for Target Time PPS1. When set, this bit
indicates that the value of system time is greater than or equal to the value specified in the MAC_PPS1_Target_Time_Seconds and MAC_PPS1_Target_Time_Nanoseconds registers. Access restriction applies.
- Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is
set). Self-set to 1 on internal event. 0x0 TSTRGTERR0:
- Timestamp Target Time Error. This bit is set when the latest target time
programmed in the MAC_PPS0_Target_Time_Seconds and
- MAC_PPS0_Target_Time_Nanoseconds registers has already elapsed. The bit is
also set when the PPS command programmed cannot be executed due to earlier programmed target time has already elapsed. This bit is cleared when the application reads this bit. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 AUXTSTRIG:
- Auxiliary Timestamp Trigger Snapshot. This bit is set high when the auxiliary
snapshot is written to the FIFO. This bit is valid only if the Add IEEE 1588
- Auxiliary Snapshot option is selected. Access restriction applies. Clears on read
(or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 TSTARGT0:
- Timestamp Target Time Reached. When set, this bit indicates that the value of
system time is greater than or equal to the value specified in the
- MAC_PPS0_Target_Time_Seconds and MAC_PPS0_Target_Time_Nanoseconds
registers. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 TSSOVF:
- Timestamp Seconds Overflow. When this bit is set, it indicates that the seconds
value of the timestamp (when supporting version 2 format) has overflowed beyond 32'hFFFF_FFFF. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event.
- MGBE_DWCXG_CORE_MAC_TX_TIMESTAMP_STATUS_NANOSECONDS_0
- The MAC_TxTimestamp_Status_Nanoseconds register, along with
- MAC_TxTimestamp_Status_Seconds, gives the 64-bit timestamp captured for the PTP packet
successfully transmitted by the MAC. This value is considered to be read by the application when the last byte of MAC_Tx_Timestamp_Status_Seconds is read. In the little-endian mode, this means bits[31:24] are read; in big-endian mode, bits[7:0] are read. If the application does not read these registers and timestamp of another packet is captured, then either the current timestamp is lost (overwritten) or the new timestamp is lost (dropped), depending on the setting of the TXTSSTSM bit of the MAC_Timestamp_Control register. The status bit TXTSC bit [15] in MAC_Timestamp_Status register is set when the MAC transmitter captures the timestamp.
- Offset: 0xd30
- Read/Write: RO
- Parity Protection: N

10G Ethernet Controller Core Registers cont'd 1
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 TXTSSMIS:
- Transmit Timestamp Status Missed. When this bit is set, it indicates one of
the following: - The timestamp of the current packet is ignored if TXTSSTSM bit of the MAC_Timestamp_Control register is reset - The timestamp of the previous packet is overwritten with timestamp of the current packet if TXTSSTSM bit of the MAC_Timestamp_Control register is set. 30:0 0x0 TXTSSLO:
- Transmit Timestamp Status Low. This field contains the 31 bits of the
Nanoseconds field of the Transmit packet's captured timestamp.
- MGBE_DWCXG_CORE_MAC_TX_TIMESTAMP_STATUS_SECONDS_0
- The register contains the higher 32 bits of the timestamp (in seconds) captured when a PTP
packet is transmitted.
- Offset: 0xd34
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 TXTSSTSHI:
- Transmit Timestamp Status High. This field contains the lower 32 bits of
the Seconds field of Transmit packet's captured timestamp.
- MGBE_DWCXG_CORE_MAC_TX_TIMESTAMP_STATUS_PKTID_0
- This register contains the PTP packet ID corresponding to the Tx Timestamp Status in
- MAC_TxTimestamp_Status_Nanoseconds and MAC_TxTimestamp_Status_Seconds registers. This
register is available when IEEE 1588 Tx Timestamp Status FIFO Depth is greater than 1. The correct reading sequence of these registers is as follows: - MAC_TxTimestamp_Status_PktID register -
- MAC_TxTimestamp_Status_Nanoseconds register - MAC_TxTimestamp_Status_Seconds register
This is because, all the 3 registers are updated to a new value when the application reads the last byte of the MAC_TxTimestamp_Status_Seconds register.
- Offset: 0xd38
- Read/Write: RO

10G Ethernet Controller Core Registers cont'd 1
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:10 0x0 Reserved_31_10: Reserved. 9:0 0x0 PKTID:
- Packet ID. The field contains the packet ID corresponding to the Tx
- Timestamp status in MAC_TxTimestamp_Status_Nanoseconds and
- MAC_TxTimestamp_Status_Seconds registers. Note: The value of 0 for
- Packet ID is reserved, it is used by DWC_xgmac for indicating timestamp
status of packets for which Packet ID was not provided by Software or for PTP response packets generated by the hardware PTP Offload engine.
- MGBE_DWCXG_CORE_MAC_AUXILIARY_CONTROL_0
The Auxiliary Timestamp Control register controls the Auxiliary Timestamp snapshot.
- Offset: 0xd40
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 Reserved_31_8: Reserved.
- RO
0x0 Reserved_ATSEN3: Reserved.
- RO
0x0 Reserved_ATSEN2: Reserved.
- RO
0x0 Reserved_ATSEN1: Reserved.
- RW
0x0 ATSEN0:
- Auxiliary Snapshot 0 Enable. This bit controls the capturing of
- Auxiliary Snapshot Trigger 0. When this bit is set, the auxiliary
snapshot of the event on ptp_aux_trig_i[0] input is enabled. When this bit is reset, the events on this input are ignored. 3:1
- RO
0x0 Reserved_3_1: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 ATSFC:
- Auxiliary Snapshot FIFO Clear. When set, this bit resets the pointers
of the Auxiliary Snapshot FIFO. This bit is cleared when the pointers are reset and the FIFO is empty. When this bit is high, the auxiliary snapshots are stored in the FIFO.
- MGBE_DWCXG_CORE_MAC_AUXILIARY_TIMESTAMP_NANOSECONDS_0
The Auxiliary Timestamp - Nanoseconds register, along with MAC_Auxiliary_Timestamp_Seconds, gives the 64-bit timestamp stored as auxiliary snapshot. These two registers form the read port of a 64-bit wide FIFO with a depth of 4, 8, or 16 as selected while configuring the controller. You can store multiple snapshots in this FIFO. Bits[29:25] in MAC_Timestamp_Status indicate the fill-level of the FIFO. The top of the FIFO is removed only when the last byte of
- MAC_Auxiliary_Timestamp_Seconds register is read. In the Little-endian mode, this means
- Bits[31:24] are read and in Big-endian mode, Bits[7:0] are read. This register and
MAC_Auxiliary_Timestamp_Seconds register are present only when you select the Add IEEE 1588 Auxiliary Snapshot option while configuring the controller.
- Offset: 0xd48
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 Reserved_31: Reserved. 30:0 0x0 AUXTSLO:
- Auxiliary Timestamp Low. Contains the lower 31 bits (nanoseconds
field) of the auxiliary timestamp.
- MGBE_DWCXG_CORE_MAC_AUXILIARY_TIMESTAMP_SECONDS_0
The Auxiliary Timestamp - Seconds register contains the lower 32 bits of the Seconds field of the auxiliary timestamp register.
- Offset: 0xd4c
- Read/Write: RO
- Parity Protection: N
- Shadow: N

10G Ethernet Controller Core Registers cont'd 1
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 AUXTSHI:
- Auxiliary Timestamp High. Contains the lower 32 bits of the Seconds
field of the auxiliary timestamp.
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_INGRESS_ASYM_CORR_0
MAC_TIMESTAMP_INGRESS_ASYM_CORR offset(decimal)=3408/0xd50 size=32 (32'bit reset value: 0x0 Description: The MAC Timestamp Ingress Asymmetry Correction register contains the Ingress Asymmetry Correction value to be used while updating correction field in some PTP messages.
- Ideally, Ingress Asymmetry correction needs to be done in the receive side, when the
corresponding packet is received. But when one-step time stamping is enabled, the controller performs ingress asymmetry correction on the transmit (egress) side, which still holds good for packets that are received and transmitted on the same port (for example, Pdelay Resp, which is sent for a Pdelay Request received in the same port). In other cases (for example, transparent bridge), this feature can still be used if all receive ports have the same ingress correction value. If not, then OSTIAC must be programmed to 0x0.)
- Offset: 0xd50
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 OSTIAC:
- One-Step Timestamp Ingress Asymmetry Correction. This field contains the
ingress path asymmetry value to be added to correctionField of Sync and
- Pdelay_Resp PTP packet. The programmed value should be in units of
nanoseconds and multiplied by 2^16. For example, 2.5 ns is represented as 0x00028000. The value can also be negative and then is represented in twos complement form with bit 31 representing the sign bit.
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_EGRESS_ASYM_CORR_0
- The MAC Timestamp Egress Asymmetry Correction register contains the Egress Asymmetry
Correction value to be used while updating the correction field in for some PTP message types.
- Offset: 0xd54
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

10G Ethernet Controller Core Registers cont'd 1
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 OSTEAC:
- One-Step Timestamp Egress Asymmetry Correction. This field contains the
egress path asymmetry value to be subtracted from correctionField of
- Delay_Req and Pdelay_Req PTP packet. The programmed value must be the
negated value in units of nanoseconds multiplied by 2^16. For example, if the required correction is +2.5 ns, then the programmed value must be 0xFFFD_8000, which is twos complement of 0x0002_8000 (2.5 * 2^16).
- Similarly, if the required correction is -3.3 ns, then the programmed value is
0x0003_4CCC (3.3 * 2^16).
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_INGRESS_CORR_NANOSECOND_0
The MAC Timestamp Ingress Correction Nanosecond register contains the correction value to be used with the captured timestamp value in the ingress path. This is used to compensate the errors due to timestamp synchronization from the PTP clock domain to the MAC Rx clock domain, and the latency incurred between the message timestamp point and the point at which the timestamp snapshot is taken.
- Offset: 0xd58
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 TSIC:
- Timestamp Ingress Correction. This field contains the ingress path
correction value in nanoseconds as defined by the "Ingress Correction" expression.
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_INGRESS_CORR_SUBNANOSECOND_0
- The MAC Timestamp Ingress Correction Sub-Nanosecond register contains the sub-nanosecond
part of the correction value to be used with the captured timestamp value, for ingress directions.
- Offset: 0xd5c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

10G Ethernet Controller Core Registers cont'd 1
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved. 15:8
- RW
0x0 TSICSNS:
- Timestamp Ingress Correction, sub-nanoseconds. This field
contains the sub-nanoseconds part of the ingress path correction value as defined by the "Ingress Correction" expression. 7:0
- RO
0x0 Reserved_7_0: Reserved.
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_EGRESS_CORR_NANOSECOND_0
The MAC Egress Timestamp Correction Nanosecond register contains the correction value to be used with the captured timestamp value in the egress path. This is used to compensate the errors due to timestamp synchronization from PTP clock domain to MAC Tx clock domain, and the latency incurred between the point at which the timestamp snapshot is taken and the message timestamp point.
- Offset: 0xd60
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 TSEC:
- Timestamp Egress Correction. This field contains the nanoseconds part of
the egress path correction value as defined by the "Egress Correction" expression,
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_EGRESS_CORR_SUBNANOSECOND_0
- The MAC Timestamp Correction Egress Sub-nanosecond register contains the sub-nanosecond
part of the correction value to be used with the captured timestamp value, for egress directions.
- Offset: 0xd64
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

10G Ethernet Controller Core Registers cont'd 1
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved. 15:8
- RW
0x0 TSECSNS:
- Timestamp Egress Correction, sub-nanoseconds. This field
contains the sub-nanoseconds part of the egress path correction value as defined by the "Egress Correction" expression. 7:0
- RO
0x0 Reserved_7_0: Reserved.
- MGBE_DWCXG_CORE_MAC_PPS_CONTROL_0
The PPS Control register is present only when the Timestamp feature is selected and External Timestamp is not enabled. Bits[30:24] of this register are valid only when four Flexible PPS outputs are selected. Bits[22:16] are valid only when three or more Flexible PPS outputs are selected. Bits[14:8] are valid only when two or more Flexible PPS outputs are selected. Bits[6:4] are valid only when Flexible PPS feature is selected.
- Offset: 0xd70
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 Reserved_31: Reserved. 30:29
- RO
0x0 Reserved_TRGTMODSEL3: Reserved. 28:27
- RO
0x0 Reserved_28_27: Reserved. 26:24
- RO
0x0 Reserved_PPSCMD3: Reserved.
- RO
0x0 Reserved_23: Reserved. 22:21
- RO
0x0 Reserved_TRGTMODSEL2: Reserved. 20:19
- RO
0x0 Reserved_20_19: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
18:16
- RO
0x0 Reserved_PPSCMD2: Reserved.
- RO
0x0 Reserved_15: Reserved. 14:13
- RW
0x0 TRGTMODSEL1:
- Target Time Register Mode for PPS1 Output. This field indicates the Target
- Time registers mode for PPS1 output signal. This field is similar to the
TRGTMODSEL0 field. 12:11
- RO
0x0 Reserved_12_11: Reserved. 10:8
- RW
0x0 PPSCMD1:
- Flexible PPS1 Output Control. This field controls the flexible PPS1 output
(ptp_pps_o[1]) signal. This field is similar to the PPSCMD0 field.
- RO
0x0 Reserved_7: Reserved. 6:5
- RW
0x0 TRGTMODSEL0:
- Target Time Register Mode for PPS0 Output. This field indicates the Target
- Time registers mode for PPS0 output signal: - 00: Target Time registers are
programmed only for generating the interrupt event. The Flexible PPS function must not be enabled in this mode, otherwise spurious transitions might be observed on the corresponding ptp_pps_o output port - 01:
- Reserved - 10: Target Time registers are programmed for generating the
interrupt event and starting or stopping the PPS0 output signal generation. - 11: Target Time registers are programmed only for starting or stopping the PPS0 output signal generation. No interrupt is asserted.
- RW
0x0 PPSEN0:
- Flexible PPS Output Mode Enable. When this bit is set, Bits[3:0] function as
- PPSCMD. When this bit is reset, Bits[3:0] function as PPSCTRL (Fixed PPS
mode).

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
3:0
- RW
0x0 PPSCTRL0_PPSCMD0:
- PPSCMD0: Flexible PPS Output (ptp_pps_o[0]) Control Programming these
bits with a non-zero value instructs the MAC to initiate an event. When the command is transferred or synchronized to the PTP clock domain, these bits get cleared automatically. The software should ensure that these bits are programmed only when they are all-zero. The following list describes the values of PPSCMD0: - 0000: No Command - 0001: START Single Pulse This command generates a single pulse rising at the start point defined in Target Time registers and of a duration defined in the PPS0 Width register. - 0010:
- START Pulse Train This command generates the train of pulses rising at the
start point defined in the Target Time registers and of a duration defined in the PPS0 Width register and repeated at interval defined in the PPS Interval register. By default, the PPS pulse train is free-running unless stopped by the "Stop Pulse train at time" or "Stop Pulse Train immediately" commands. - 0011: Cancel START This command cancels the START Single Pulse and
- START Pulse Train commands if the system time has not crossed the
programmed start time. - 0100: STOP Pulse train at time This command stops the train of pulses initiated by the START Pulse Train command (PPSCMD = 0010) after the time programmed in the Target Time registers elapses. - 0101: STOP Pulse Train immediately This command immediately stops the train of pulses initiated by the START Pulse Train command (PPSCMD = 0010). - 0110: Cancel STOP Pulse train This command cancels the STOP pulse train at time command if the programmed stop time has not elapsed. The PPS pulse train becomes free-running on the successful execution of this command. - 0111-1111: Reserved This field can be the PPS
- Output Frequency Control (PPSCTRL0) or the Flexible PPS Output
(ptp_pps_o[0]) Control (PPSCMD0) PPSCTRL0: PPS Output Frequency
- Control This field controls the frequency of the PPS0 output (ptp_pps_o[0])
signal. The default value of PPSCTRL is 0000, and the PPS output is 1 pulse (of width clk_ptp_ref_i) every second. For other values of PPSCTRL, the PPS output becomes a generated clock of following frequencies: - 0001: The binary rollover is 2 Hz, and the digital rollover is 1 Hz. - 0010: The binary rollover is 4 Hz, and the digital rollover is 2 Hz. - 0011: The binary rollover is 8
- Hz, and the digital rollover is 4 Hz. - 0100: The binary rollover is 16 Hz, and the
digital rollover is 8 Hz. - ... - 1111: The binary rollover is 32.768 KHz and the digital rollover is 16.384 KHz. In the binary rollover mode, the PPS output (ptp_pps_o) has a duty cycle of 50 percent with these frequencies. In the digital rollover mode, the PPS output frequency is an average number. The actual clock is of different frequency that gets synchronized every second.
- For example: When PPSCTRL = 0001, the PPS (1 Hz) has a low period of 537
ms and a high period of 463 ms When PPSCTRL = 0010, the PPS (2 Hz) is a sequence of: - One clock of 50 percent duty cycle and 537 ms period -
- Second clock of 463 ms period (268 ms low and 195 ms high) When
- PPSCTRL = 0011, the PPS (4 Hz) is a sequence of: - Three clocks of 50
percent duty cycle and 268 ms period - Fourth clock of 195 ms period (134 ms low and 61 ms high) This behavior is because of the non-linear toggling of bits in the digital rollover mode in the MAC_System_Time_Nanoseconds register.
- MGBE_DWCXG_CORE_MAC_PPS0_TARGET_TIME_SECONDS_0
The PPS0 Target Time Seconds register, along with PPS0 Target Time Nanoseconds register, is used to schedule an interrupt event [Bit 1 of MAC_Timestamp_Status] when the system time exceeds the value programmed in these registers. This register is present only when more than one Flexible PPS output is selected while configuring the controller.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0xd80
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 TSTRH0: PPS0 Target Time Seconds Register. This field stores the time in seconds.
- When the timestamp value matches or exceeds both Target Timestamp
registers, the MAC starts or stops the PPS signal output and generates an interrupt (if enabled) based on Bits[6:5] of MAC_PPS_Control register.
- MGBE_DWCXG_CORE_MAC_PPS0_TARGET_TIME_NANOSECONDS_0
- The PPS0 Target Time Nanoseconds register is present only when more than one Flexible PPS
output is selected.
- Offset: 0xd84
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 TRGTBUSY0:
- PPS0 Target Time Register Busy. The MAC sets this bit when the PPSCMD0 field
in the MAC_PPS_Control register is programmed to 010 or 011. Programming the PPSCMD0 field to 010 or 011 instructs the MAC to synchronize the Target
- Time registers to the PTP clock domain. The MAC clears this bit after
synchronizing the Target Time registers to the PTP clock domain The application must not update the Target Time registers when this bit is read as 1.
- Otherwise, the synchronization of the previous programmed time gets
corrupted. 30:0 0x0 TTSL0:
- Target Time Low for PPS0 Register. This register stores the time in (signed)
nanoseconds. When the value of the timestamp matches the value in both
- Target Timestamp registers, the MAC starts or stops the PPS signal output and
generates an interrupt (if enabled) based on the TRGTMODSEL0 field (Bits [6:5]) in MAC_PPS_Control. When the TSCTRLSSR bit is set in the MAC_Timestamp_Control register, this value should not exceed 0x3B9A_C9FF.
- The actual start or stop time of the PPS signal output might have an error
margin up to one unit of sub-second increment value.
- MGBE_DWCXG_CORE_MAC_PPS0_INTERVAL_0

10G Ethernet Controller Core Registers cont'd 1 The PPS0 Interval register contains the number of units of sub-second increment value between the rising edges of PPS0 signal output (ptp_pps_o[0]).
- Offset: 0xd88
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PPSINT0:
- PPS0 Output Signal Interval. These bits store the interval between the rising
edges of PPS0 signal output. The interval is stored in terms of number of units of sub-second increment value. You need to program one value less than the required interval. For example, if the PTP reference clock is 50 MHz (period of 20 ns), and desired interval between the rising edges of PPS0 signal output is 100 ns (that is, five units of sub-second increment value), you should program value 4 (5 - 1) in this register.
- MGBE_DWCXG_CORE_MAC_PPS0_WIDTH_0
The PPS0 Width register contains the number of units of sub-second increment value between the rising and corresponding falling edges of PPS0 signal output (ptp_pps_o[0]).
- Offset: 0xd8c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PPSWIDTH0:
- PPS0 Output Signal Width. These bits store the width between the rising edge
and corresponding falling edge of PPS0 signal output. The width is stored in terms of number of units of sub-second increment value. You need to program one value less than the required interval. For example, if PTP reference clock is 50 MHz (period of 20 ns), and width between the rising and corresponding falling edges of PPS0 signal output is 80 ns (that is, four units of sub-second increment value), you should program value 3 (4 - 1) in this register. Note: The value programmed in this register must be lesser than the value programmed in MAC_PPS0_Interval.
- MGBE_DWCXG_CORE_MAC_PPS1_TARGET_TIME_SECONDS_0

10G Ethernet Controller Core Registers cont'd 1 The PPS1 Target Time Seconds register, along with PPS1 Target Time Nanoseconds register, is used to schedule an interrupt event [Bit 1 of MAC_Timestamp_Status] when the system time exceeds the value programmed in these registers. This register is present only when more than one Flexible PPS output is selected while configuring the controller.
- Offset: 0xd90
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 TSTRH1:
- PPS1 Target Time Seconds. This field stores the time in seconds. When the
timestamp value matches or exceeds both Target Timestamp registers, the
- MAC starts or stops the PPS signal output and generates an interrupt (if
enabled) based on Bits[14:13] of MAC_PPS_Control register.
- MGBE_DWCXG_CORE_MAC_PPS1_TARGET_TIME_NANOSECONDS_0
This register is present only when more than one Flexible PPS output is selected while configuring the controller.
- Offset: 0xd94
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 TRGTBUSY1:
- PPS1 Target Time Register Busy. The MAC sets this bit when the PPSCMD1 field
in MAC_PPS_Control register is programmed to 010 or 011. Programming the
- PPSCMD1 field to 010 or 011 instructs the MAC to synchronize the Target Time
registers to the PTP clock domain. The MAC clears this bit after synchronizing the Target Time registers to the PTP clock domain The application must not update the Target Time registers when this bit is read as 1. Otherwise, the synchronization of the previous programmed time gets corrupted. 30:0 0x0 TTSL1:
- Target Time Low for PPS1 Register. This register stores the time in (signed)
nanoseconds. When the value of the timestamp matches the both Target
- Timestamp registers, then based on the TRGTMODSEL1 field in the
- MAC_PPS_Control register, the MAC starts or stops the PPS signal output and
generates an interrupt (if enabled). This value should not exceed 0x3B9A_C9FF when the TSCTRLSSR field is set in the MAC_Timestamp_Control register. The actual start or stop time of the PPS signal output might have an error margin up to one unit of sub-second increment value.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_CORE_MAC_PPS1_INTERVAL_0
The PPS1 Interval register contains the number of units of sub-second increment value between the rising edges of PPS1 signal output (ptp_pps_o[1]).
- Offset: 0xd98
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PPSINT1:
- PPS1 Output Signal Interval. These bits store the interval between the rising
edges of PPS1 signal output. The interval is stored in terms of number of units of sub-second increment value. You need to program one value less than the required interval. For example, if the PTP reference clock is 50 MHz (period of 20 ns), and desired interval between the rising edges of PPS1 signal output is 100 ns (that is, five units of sub-second increment value), you should program value 4 (5 - 1) in this register.
- MGBE_DWCXG_CORE_MAC_PPS1_WIDTH_0
The PPS1 Width register contains the number of units of sub-second increment value between the rising and corresponding falling edges of PPS1 signal output (ptp_pps_o[1]).
- Offset: 0xd9c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 PPSWIDTH1:
- PPS1 Output Signal Width. These bits store the width between the rising edge
and corresponding falling edge of PPS1 signal output. The width is stored in terms of number of units of sub-second increment value. You need to program one value less than the required interval. For example, if PTP reference clock is 50 MHz (period of 20 ns), and width between the rising and corresponding falling edges of PPS1 signal output is 80 ns (that is, four units of sub-second increment value), you should program value 3 (4 - 1) in this register. Note: The value programmed in this register must be lesser than the value programmed in MAC_PPS1_Interval.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_CORE_MAC_PTO_CONTROL_0
This register controls the PTP Offload Engine operation. This register is available only when the Enable PTP Timestamp Offload feature is selected.
- Offset: 0xdc0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved. 15:8
- RW
0x0 DN:
- Domain Number. This field indicates the domainNumber in which the
PTP node operates.
- RW
0x0 PDRDIS:
- Disable Peer Delay Response response generation When this bit is
set, the Peer Delay Response (Pdelay_Resp) response is not generated for received Peer Delay Request (Pdelay_Req) request packet, as required by the programmed mode. Note: Setting this bit to 1 affects the normal PTP Offload operation and the time synchronization. So, this bit must be set only if there is problem with Pdelay_Resp generation in hardware and/or Pdelay_Resp generation is handled by Software.
- RW
0x0 DRRDIS:
- Disable PTO Delay Request/Response response generation. When this
bit is set, the Delay Request and Delay response is not generated for received SYNC and Delay request packet respectively, as required by the programmed mode.
- RW
0x0 APDREQTRIG:
- Automatic PTP Pdelay_Req message Trigger. When this bit is set, one
- PTP Pdelay_Req message is transmitted. This bit is automatically
cleared after the PTP Pdelay_Req message is transmitted. The application should set the APDREQEN bit for this operation.
- RW
0x0 ASYNCTRIG:
- Automatic PTP SYNC message Trigger. When this bit is set, one PTP
- SYNC message is transmitted. This bit is automatically cleared after
the PTP SYNC message is transmitted. The application should set the ASYNCEN bit for this operation.
- RO
0x0 Reserved_3: Reserved.
- RW
0x0 APDREQEN:
- Automatic PTP Pdelay_Req message Enable. When this bit is set, PTP
- Pdelay_Req message is generated periodically based on interval
programmed or trigger from application, when the MAC is programmed to be in Peer-to-Peer Transparent mode.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 ASYNCEN:
- Automatic PTP SYNC message Enable. When this bit is set, PTP SYNC
message is generated periodically based on interval programmed or trigger from application, when the MAC is programmed to be in Clock Master mode.
- RW
0x0 PTOEN:
- PTP Offload Enable. When this bit is set, the PTP Offload feature is
enabled.
- MGBE_DWCXG_CORE_MAC_SOURCE_PORT_IDENTITY0_0
This register along with MAC_Source_Port_Identity1 and MAC_Source_Port_Identity2 contains the 80-bit Source Port Identity of the PTP node. These registers are available only when the Enable PTP Timestamp Offload feature is selected.
- Offset: 0xdc4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 SPI0:
- Source Port Identity 0. This field indicates bits [31:0] of
sourcePortIdentity of PTP node.
- MGBE_DWCXG_CORE_MAC_SOURCE_PORT_IDENTITY1_0
This register along with MAC_Source_Port_Identity0 and MAC_Source_Port_Identity2 contains the 80-bit Source Port Identity of the PTP node. These registers are available only when the Enable PTP Timestamp Offload feature is selected.
- Offset: 0xdc8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
31:0 0x0 SPI1:
- Source Port Identity 1. This field indicates bits [63:32] of
sourcePortIdentity of PTP node.
- MGBE_DWCXG_CORE_MAC_SOURCE_PORT_IDENTITY2_0
This register along with MAC_Source_Port_Identity0 and MAC_Source_Port_Identity1 contains the 80-bit Source Port Identity of the PTP node. These registers are available only when the Enable PTP Timestamp Offload feature is selected. Note: The values written in MAC_Source_Port_Identity0,
- MAC_Source_Port_Identity1 and MAC_Source_Port_Identity2 registers is updated in the PTP
Offload logic when MAC_Source_Port_Identity2 register is written, so MAC_Source_Port_Identity2 register must be written after MAC_Source_Port_Identity0 and MAC_Source_Port_Identity1 registers are written.
- Offset: 0xdcc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved. 15:0
- RW
0x0 SPI2:
- Source Port Identity 2. This field indicates bits [79:64] of
sourcePortIdentity of PTP node.
- MGBE_DWCXG_CORE_MAC_LOG_MESSAGE_INTERVAL_0
This register contains the periodic intervals for automatic PTP packet generation. This register is available only when the Enable PTP Timestamp Offload feature is selected.
- Offset: 0xdd0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:24
- RW
0x0 LMPDRI:
- Log Min Pdelay_Req Interval. This field indicates
logMinPdelayReqInterval of PTP node. This is used to schedule the periodic Pdelay request packet transmission. Allowed values are -15 to 15. Negative value must be represented in twos complement form. For example, if the required value is -1, the value programmed must be 0xFF. 23:11
- RO
0x0 Reserved_23_11: Reserved. 10:8
- RW
0x0 DRSYNCR:
- Delay_Req to SYNC Ratio. In Slave mode, this is used to control the
frequency of Delay_Req messages transmitted. - 'x0: DelayReq generated for every received SYNC messages - 'x1: DelayReq generated for every alternate reception of SYNC messages - 'x2: DelayReq generated for every 4 SYNC messages - 'x3: DelayReq generated for every 8 SYNC messages - 'x4: DelayReq generated for every 16 SYNC messages - 'x5: DelayReq generated for every 32 SYNC messages - 'x6-'x7: Reserved The master sends this information (logMinDelayReqInterval) in the DelayResp PTP messages to the slave.
- The DWC_xgmac Receiver processes this value from received DelayResp
messages and updates this field accordingly. In Slave mode, the host must not write/update this register unless it wants to override the received value. In Master mode, the sum of this field and logSyncInterval (LSI) field is provided in the logMinDelayReqInterval field of the generated multicast Delay_Resp PTP message. 7:0
- RW
0x0 LSI:
- Log Sync Interval. This field indicates the periodicity of the
automatically generated SYNC message when the PTP node is Master.
- Allowed values are -15 to 15. Negative value must be represented in
twos complement form. For example, if the required value is -1, the value programmed must be 0xFF.
- MGBE_DWCXG_MTL_MTL_OPERATION_MODE_0
- The Operation Mode register establishes the Transmit and Receive operating modes and
commands.
- Offset: 0x1000
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 FRPE:
- Flexible Receive Parser Enable. - 1: Flexible Receive Parser is
enabled. - 0: Flexible Receive Parser is disabled. However, when parsing is in progress, parser is disabled after completing the parsing of the current packet. When the Flexible Receive Parser is enabled, it is enabled for the next immediate packet. 14:7
- RO
0x0 Reserved_14_7: Reserved. 6:5
- RW
0x0 ETSALG:
- ETS Algorithm. This field selects the type of ETS algorithm to be
applied for traffic classes whose transmission selection algorithm (TSA) is set to ETS: - 2'b00: WRR algorithm - 2'b01: WFQ algorithm when Data Center Bridging feature is selected. Otherwise, reserved
- 2'b10: DWRR algorithm when Data Center Bridging feature is
selected. Otherwise, reserved. - 2'b11: Reserved 4:3
- RO
0x0 Reserved_4_3: Reserved.
- RW
0x0 RAA:
- Receive Arbitration Algorithm. This field is used to select the
arbitration algorithm for the Rx side. - 0: Strict Priority (SP) Queue 0 has the lowest priority and the last queue has the highest priority. - 1: Weighted Strict Priority (WSP)
- RO
0x0 Reserved_FTS: Reserved.
- RO
0x0 Reserved_0: Reserved.
- MGBE_DWCXG_MTL_MTL_DEBUG_CONTROL_0
The FIFO Debug Access Control and Status register controls the operation mode of FIFO debug access. Note: Consecutive write or read to this register should be performed after at least 16 clock cycles of the slowest clock among MAC Transmitter/Receiver clock and Application/CSR clock.
- Offset: 0x1008
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:19
- RO
0x0 Reserved_31_19: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 EIEC:
- ECC Inject Error Control for Tx, Rx ,TSO and Descriptor Cache
memories When EIEE bit of this register is set, following errors are inserted based on the value encoded in this field.
- RW
0x0 EIAEE:
- ECC Inject Address Error Enable for Tx, Rx ,TSO and Descriptor Cache
memories When set, enables the ECC Address error injection feature. When reset, disables the ECC Address error injection feature.
- RW
0x0 EIEE:
- ECC Inject Error Enable for Tx, Rx ,TSO and Descriptor Cache memories
- When set, enables the ECC error injection feature. If EIAEE is set,
enables the ECC Address Error Injection, otherwise, enables the ECC
- Data/Check Bits Error Injection (See EIM and BLEI field in
- MTL_DPP_ECC_EIC Register). When reset, disables the ECC error
injection feature.
- RO
0x0 Reserved_15: Reserved.
- RW
0x0 PKTIE:
- Receive Packet Available Interrupt Status Enable. When this bit is set,
an interrupt is generated when EOP of received packet is written by the MAC to the Rx FIFO. 13:12
- RW
0x0 FIFOSEL:
- FIFO Selected for Access. This field indicates the FIFO selected for
debug access: - 00: Tx FIFO - 01: Descriptor cache (only when DBGMOD
- 1) - 10: TSO FIFO (only when DBGMOD = 1) - 11: Rx FIFO
- RW
0x0 FIFOWREN:
- FIFO Write Enable. When this bit is set, it enables the Write operation
on selected FIFO.
- RW
0x0 FIFORDEN:
- FIFO Read Enable. When this bit is set, it enables the Read operation on
selected FIFO.
- RW
0x0 RSTSEL:
- Reset Pointers of Selected FIFO. When this bit is set, the pointers of
the currently-selected FIFO are reset.
- RW
0x0 RSTALL:
- Reset All Pointers. When this bit is set, the pointers of all FIFOs are
reset.
- RO
0x0 Reserved_7: Reserved. 6:5
- RW
0x0 PKTSTATE:
- Write Control Type. This field is used to decide the tag bits along with
the data being written into the FIFO. When the TxFIFO is written in
- Slave mode or Debug mode, this field marks the type of data written
as follows: - 00: Packet Data - 01: Control Word - 10: SOP Data - 11:
- EOP Data When the Rx FIFO is being written in slave mode, this field
marks the type of data written as follows: - 00: Packet Data - 01:
- Normal Status - 10: Last Status - 11: EOP
- RO
0x0 Reserved_4: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
3:2
- RW
0x0 BYTEEN:
- Write Data Byte Enable. This field indicates the number of data bytes
valid in the data register during Write operation. This is valid only when
- PKTSTATE is 2'b11 (EOP) and Tx FIFO or Rx FIFO is selected. - 00: Byte 0
valid - 01: Byte 0 and Byte 1 are valid - 10: Byte 0, Byte 1, and Byte 2 are valid - 11: All four bytes are valid
- RW
0x0 DBGMOD:
- Debug Mode Access to FIFO. When this bit is set, it indicates that the
current access to the FIFO is debug access. Data transfers from Tx
- FIFO to MAC Transmitter and from MAC Receiver to Rx FIFO is
disabled. In this mode, the following access types are allowed: - Direct
- Read and Write access to all locations of Tx FIFO, TSO, Descriptor
- Cache and Rx FIFO memories. When this bit is reset, it indicates the Tx
and Rx FIFO operate in slave mode. The software can directly write packets to Tx FIFO for transmission and read received packets from Rx
- FIFO. In this mode, the following access are allowed: Packet Write
access to the Tx FIFO Packet Read access to the Rx FIFO
- RW
0x0 FDBGEN:
- FIFO Debug Access Enable. When this bit is set, it indicates that the
debug mode access to the FIFO is enabled. When this bit is reset, it indicates that the FIFO can be accessed only through a master interface (ATI, ARI, DMA).
- MGBE_DWCXG_MTL_MTL_DEBUG_STATUS_0
The FIFO Debug Status register contains the status of FIFO debug access. Note: Consecutive write or read to this register should be performed after at least 16 clock cycles of the slowest clock among MAC Transmitter/Receiver clock and Application/CSR clock.
- Offset: 0x100c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000018 (0b0000,0000,0000,0000,0000,0000,0001,1000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 LOCR:
- Remaining Locations in the FIFO. Slave Access Mode: This field
indicates the space available in selected FIFO. Debug Access Mode:
- This field contains the Write or Read pointer value of the selected
FIFO during Write or Read operation, respectively. 15:9
- RO
0x0 Reserved_15_9: Reserved.
- RW
0x0 PKTI:
- Receive Packet Available Interrupt Status. When set, this bit
indicates that MAC layer has written the EOP of received packet to the Rx FIFO. This bit is reset when 1 is written to this bit.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
7:5
- RO
0x0 Reserved_7_5: Reserved. 4:3
- RO
0x3 BYTEEN:
- Read Data Byte Enable. This field indicates the number of data bytes
valid in the MTL_FIFO_Debug_Data register during Read operation.
- This is valid only when PKTSTATE is 2'b11 (EOP). - 00: Byte 0 valid -
01: Byte 0 and Byte 1 are valid - 10: Byte 0, Byte 1, and Byte 2 are valid - 11: All four bytes are valid 2:1
- RO
0x0 PKTSTATE:
- Read Control Type. This field indicates the tag bits read along with
the data being read from the selected FIFO. When the TxFIFO is read in Debug mode, this field marks the type of data read as follows: - 00: Packet Data - 01: Control Word - 10: SOP Data - 11: EOP Data
- When the RxFIFO is read in Debug or Slave mode, this field marks
the type of data read as listed as follows: - 00: Packet Data - 01:
- Normal Status - 10: Last Status - 11: EOP
- RO
0x0 FIFOBUSY:
- FIFO Busy. When set, this bit indicates that a FIFO operation is in
progress in the MAC and content of the following fields is not valid: -
- All other fields of this register - All fields of the
- MTL_FIFO_Debug_Data register
- MGBE_DWCXG_MTL_MTL_FIFO_DEBUG_DATA_0
The FIFO Debug Data register contains the data to be written to or read from the FIFOs. Note: Consecutive write or read to this register should be performed after at least 16 clock cycles of the slowest clock among MAC Transmitter/Receiver clock and Application/CSR clock.
- Offset: 0x1010
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 FDBGDATA:
- FIFO Debug Data. During debug or slave access write operation, this field
contains the data to be written to the Tx FIFO, Rx FIFO, or TSO FIFO. During debug or slave access read operation, this field contains the data read from the Tx FIFO, Rx FIFO, or TSO FIFO.
- MGBE_DWCXG_MTL_MTL_INTERRUPT_STATUS_0

10G Ethernet Controller Core Registers cont'd 1 The software driver (application) reads this register during interrupt service routine or polling to determine the interrupt status of MTL queues and the MAC.
- Offset: 0x1020
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 Reserved_31_24: Reserved. 0x0 MTLPIS:
- MTL Rx-Parser Interrupt Status This bit indicates that there is an interrupt
from Rx Parser Block. To reset this bit, the application must read the
- MTL_RXP_Interrupt_Control_Status register to get the exact cause of the
interrupt and clear its source. 22:21 0x0 Reserved_22_21: Reserved. 0x0 Reserved_SGFIS: Reserved. 0x0 TINS:
- TBS Interrupt Status This bit is set when a frame is dropped in any of the
queues in TBS. Access restriction applies. Clears on write of 1. 0x0 ESTIS:
- EST (TAS- IEEE 802.1Qbv) Interrupt Status This bit indicates an interrupt
event during the operation of IEEE 802.1Qbv. To reset this bit, the application must clear the error/event that has caused the interrupt. 0x0 DBGIS:
- Debug Interrupt Status. This bit indicates an interrupt event during the
slave access. To reset this bit, the software must read the FIFO Debug
- Access Status register to get the exact cause of the interrupt and clear its
source. 0x0 MACIS:
- MAC Interrupt Status. This bit indicates an interrupt event in the MAC. To
reset this bit to 1'b0, the software must read the corresponding register in the MAC to get the exact cause of the interrupt and clear its source. 0x0 Q15IS:
- Queue 15 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 15. To reset this bit, the software must read Queue 15 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q14IS:
- Queue 14 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 14. To reset this bit, the software must read Queue 14 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 Q13IS:
- Queue 13 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 13. To reset this bit, the software must read Queue 13 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q12IS:
- Queue 12 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 12. To reset this bit, the software must read Queue 12 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q11IS:
- Queue 11 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 11. To reset this bit, the software must read Queue 11 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q10IS:
- Queue 10 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 10. To reset this bit, the software must read Queue 10 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q9IS:
- Queue 9 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 9. To reset this bit, the software must read Queue 9 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q8IS:
- Queue 8 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 8. To reset this bit, the software must read Queue 8 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q7IS:
- Traffic Class/Queue 7 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 7. To reset this bit, the software must read Traffic Class/Queue 7 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q6IS:
- Traffic Class/Queue 6 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 6. To reset this bit, the software must read Traffic Class/Queue 6 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q5IS:
- Traffic Class/Queue 5 Interrupt Status. This bit indicates that there is an
interrupt from traffic Class/Queue 5. To reset this bit, the software must read traffic Class/Queue 5 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q4IS:
- Traffic Class/Queue 4 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 4. To reset this bit, the software must read Traffic Class/Queue 4 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 Q3IS:
- Traffic Class/Queue 3 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 3. To reset this bit, the software must read Traffic Class/Queue 3 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q2IS:
- Traffic Class/Queue 2 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 2. To reset this bit, the software must read Traffic Class/Queue 2 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q1IS:
- Traffic Class/Queue 1 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 1. To reset this bit, the software must read Traffic Class/Queue 1 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q0IS:
- Traffic Class/Queue 0 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 0. To reset this bit, the software must read Traffic Class/Queue 0 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source.
- MGBE_DWCXG_MTL_MTL_RXQ_DMA_MAP0_0
The Receive Queue and DMA Channel Mapping 0 register controls the static or dynamic mapping of Receive Queues 0-3 to Receive DMA Channels.
- Offset: 0x1030
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 Q3DDMACH:
- Receive Queue 3 Enabled for Dynamic DMA Channel Selection When set,
this bit indicates that each packet received in Receive Queue 3 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address registers or VLAN filter registers. When reset, this bit indicates that all packets received in Receive Queue 3 are routed to the DMA Channel programmed in the Q3MDMACH field. 30:28
- RO
0x0 Reserved_30_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
27:24
- RW
0x0 Q3MDMACH:
- Receive Queue 3 Mapped to DMA Channel This field controls the routing
of the received packet in Receive Queue 3 to the DMA channel. This field is valid when the Q3DDMACH field is reset. - 4'b0000: DMA Channel 0 - 4'b0001: DMA Channel 1 - 4'b0010: DMA Channel 2 - 4'b0011: DMA
- Channel 3 - 4'b0100: DMA Channel 4 - 4'b0101: DMA Channel 5 -
4'b0110: DMA Channel 6 - 4'b0111: DMA Channel 7 - 4'b1000: DMA
- Channel 8 - 4'b1001: DMA Channel 9 - 4'b1010: DMA Channel 10 -
4'b1011: DMA Channel 11 - 4'b1100: DMA Channel 12 - 4'b1101: DMA
- Channel 13 - 4'b1110: DMA Channel 14 - 4'b1111: DMA Channel 15 The
width of this field depends on the number of Receive DMA channels, therefore all values might not be valid in certain configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- RW
0x0 Q2DDMACH:
- Receive Queue 2 Enabled for Dynamic MA Channel Selection When set,
this bit indicates that each packet received in Receive Queue 2 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address registers or VLAN filter registers. When reset, this bit indicates that all packets received in Receive Queue 2 are routed to the DMA Channel programmed in the Q2MDMACH field. 22:20
- RO
0x0 Reserved_22_y: Reserved. 19:16
- RW
0x0 Q2MDMACH:
- Receive Queue 2 Mapped to DMA Channel This field controls the routing
of the received packet in Receive Queue 2 to the DMA channel. This field is valid when the Q2DDMACH field is reset. The encoding is the same as
- Q3MDMACH of this register. The width of this field depends on the
number of Receive DMA channels, therefore all values might not be valid in certain configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- RW
0x0 Q1DDMACH:
- Receive Queue 1 Enabled for Dynamic DMA Channel Selection When set,
this bit indicates that each packet received in Receive Queue 1 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address registers or VLAN filter registers. When reset, this bit indicates that all packets received in Receive Queue 1 are routed to the DMA Channel programmed in the Q1MDMACH field. 14:12
- RO
0x0 Reserved_14_y: Reserved. 11:8
- RW
0x0 Q1MDMACH:
- Receive Queue 1 Mapped to DMA Channel This field controls the routing
of the received packet in Receive Queue 1 to the DMA channel. This field is valid when the Q1DDMACH field is reset. The encoding is the same as
- Q3MDMACH of this register. The width of this field depends on the
number of Receive DMA channels, therefore all values might not be valid in certain configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 Q0DDMACH:
- Receive Queue 0 Enabled for Dynamic DMA Channel Selection When set,
this bit indicates that each packet received in Receive Queue 0 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address or VLAN filter registers. When reset, this bit indicates that all packets received in Receive Queue 0 are routed to the DMA Channel programmed in the Q0MDMACH field. 6:4
- RO
0x0 Reserved_6_y: Reserved. 3:0
- RW
0x0 Q0MDMACH:
- Receive Queue 0 Mapped to DMA Channel This field controls the routing
of the packet received in Receive Queue 0 to the DMA channel. This field is valid when the Q0DDMACH field is reset. The encoding is the same as
- Q3MDMACH of this register. The width of this field depends on the
number of Receive DMA channels, therefore all values might not be valid in certain configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- MGBE_DWCXG_MTL_MTL_RXQ_DMA_MAP1_0
The Receive Queue and DMA Channel Mapping 1 register controls the static or dynamic mapping of Receive Queues 4-7 to Receive DMA Channels.
- Offset: 0x1034
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 Q7DDMACH:
- Receive Queue 7 Enabled for Dynamic DMA Channel Selection When
set, this bit indicates that each packet received in Receive Queue 7 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers,
- RSS lookup table, the Ethernet DA address registers or VLAN filter
registers. When reset, this bit indicates that all packets received in
- Receive Queue 7 are routed to the DMA Channel programmed in the
Q7MDMACH field. 30:28
- RO
0x0 Reserved_30_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
27:24
- RW
0x0 Q7MDMACH:
- Receive Queue 7 Mapped to DMA Channel This field controls the
routing of the received packet in Receive Queue 7 to the DMA channel. This field is valid when the Q7DDMACH field is reset. The encoding is the same as Q3MDMACH of MTL_RxQ_DMA_Map0 register. The width of this field depends on the number of Receive
- DMA channels, therefore all values might not be valid in certain
configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- RW
0x0 Q6DDMACH:
- Receive Queue 6 Enabled for Dynamic MA Channel Selection When
set, this bit indicates that each packet received in Receive Queue 6 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers,
- RSS lookup table, the Ethernet DA address registers or VLAN filter
registers. When reset, this bit indicates that all packets received in
- Receive Queue 6 are routed to the DMA Channel programmed in the
Q6MDMACH field. 22:20
- RO
0x0 Reserved_22_y: Reserved. 19:16
- RW
0x0 Q6MDMACH:
- Receive Queue 6 Mapped to DMA Channel This field controls the
routing of the received packet in Receive Queue 6 to the DMA channel. This field is valid when the Q6DDMACH field is reset. The encoding is the same as Q3MDMACH of MTL_RxQ_DMA_Map0 register. The width of this field depends on the number of Receive
- DMA channels, therefore all values might not be valid in certain
configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- RW
0x0 Q5DDMACH:
- Receive Queue 5 Enabled for Dynamic DMA Channel Selection When
set, this bit indicates that each packet received in Receive Queue 5 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers,
- RSS lookup table, the Ethernet DA address registers or VLAN filter
registers. When reset, this bit indicates that all packets received in
- Receive Queue 5 are routed to the DMA Channel programmed in the
Q5MDMACH field. 14:12
- RO
0x0 Reserved_14_y: Reserved. 11:8
- RW
0x0 Q5MDMACH:
- Receive Queue 5 Mapped to DMA Channel This field controls the
routing of the received packet in Receive Queue 5 to the DMA channel. This field is valid when the Q5DDMACH field is reset. The encoding is the same as Q3MDMACH of MTL_RxQ_DMA_Map0 register. The width of this field depends on the number of Receive
- DMA channels, therefore all values might not be valid in certain
configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 Q4DDMACH:
- Receive Queue 4 Enabled for Dynamic DMA Channel Selection When
set, this bit indicates that each packet received in Receive Queue 4 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address or VLAN filter registers.
- When reset, this bit indicates that all packets received in Receive
- Queue 4 are routed to the DMA Channel programmed in the
Q4MDMACH field. 6:4
- RO
0x0 Reserved_6_y: Reserved. 3:0
- RW
0x0 Q4MDMACH:
- Receive Queue 4 Mapped to DMA Channel This field controls the
routing of the packet received in Receive Queue 4 to the DMA channel. This field is valid when the Q4DDMACH field is reset. The encoding is the same as Q3MDMACH of MTL_RxQ_DMA_Map0 register. The width of this field depends on the number of Receive
- DMA channels, therefore all values might not be valid in certain
configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- MGBE_DWCXG_MTL_MTL_RXQ_DMA_MAP2_0
The Receive Queue and DMA Channel Mapping 2 register controls the static or dynamic mapping of Receive Queues 8-11 to Receive DMA Channels.
- Offset: 0x1038
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 Reserved_Q11DDMACH: Reserved. 30:28
- RO
0x0 Reserved_30_y: Reserved. 27:24
- RO
0x0 Reserved_Q11MDMACH: Reserved.
- RO
0x0 Reserved_Q10DDMACH: Reserved. 22:20
- RO
0x0 Reserved_22_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
19:16
- RO
0x0 Reserved_Q10MDMACH: Reserved.
- RW
0x0 Q9DDMACH:
- Receive Queue 9 Enabled for Dynamic DMA Channel Selection When
set, this bit indicates that each packet received in Receive Queue 9 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers,
- RSS lookup table, the Ethernet DA address registers or VLAN filter
registers. When reset, this bit indicates that all packets received in
- Receive Queue 9 are routed to the DMA Channel programmed in the
Q9MDMACH field. 14:12
- RO
0x0 Reserved_14_y: Reserved. 11:8
- RW
0x0 Q9MDMACH:
- Receive Queue 9 Mapped to DMA Channel This field controls the
routing of the received packet in Receive Queue 9 to the DMA channel. This field is valid when the Q9DDMACH field is reset. The encoding is the same as Q3MDMACH of MTL_RxQ_DMA_Map0 register. The width of this field depends on the number of Receive
- DMA channels, therefore all values might not be valid in certain
configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- RW
0x0 Q8DDMACH:
- Receive Queue 8 Enabled for Dynamic DMA Channel Selection When
set, this bit indicates that each packet received in Receive Queue 8 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address or VLAN filter registers.
- When reset, this bit indicates that all packets received in Receive
- Queue 8 are routed to the DMA Channel programmed in the
Q8MDMACH field. 6:4
- RO
0x0 Reserved_6_y: Reserved. 3:0
- RW
0x0 Q8MDMACH:
- Receive Queue 8 Mapped to DMA Channel This field controls the
routing of the packet received in Receive Queue 8 to the DMA channel. This field is valid when the Q8DDMACH field is reset. The encoding is the same as Q3MDMACH of MTL_RxQ_DMA_Map0 register. The width of this field depends on the number of Receive
- DMA channels, therefore all values might not be valid in certain
configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- MGBE_DWCXG_MTL_MTL_TC_PRTY_MAP0_0
This register contains the priority values assigned to traffic classes 0 to 3.
- Offset: 0x1040
- Read/Write: R/W

10G Ethernet Controller Core Registers cont'd 1
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 PSTC3: Priorities Mapped to Traffic Class 3. This field is similar to the PSTC0. 23:16 0x0 PSTC2: Priorities Mapped to Traffic Class 2. This field is similar to the PSTC0. 15:8 0x0 PSTC1: Priorities Mapped to Traffic Class 1. This field is similar to the PSTC0. 7:0 0x0 PSTC0:
- Priorities Mapped to Traffic Class 0. This field holds the priorities assigned to
traffic class 0, programmed by the application. This field determines if the transmit queues associated with the traffic class 0 should be blocked from transmitting for the specified pause time when a PFC packet is received with priorities matching the priorities programmed in this field. Each bit corresponds to a priority. For example, PSTC0[7] corresponds to priority 7 and so on. If the content of this field is not mutually exclusive to the corresponding fields of other traffic classes, that is, if the same priority is mapped to multiple traffic classes, DWC_xgmac blocks all queues with matching priority for a specified time.
- MGBE_DWCXG_MTL_MTL_TC_PRTY_MAP1_0
This register contains the priority values assigned to traffic classes 4 to 7.
- Offset: 0x1044
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 PSTC7:
- Priorities Mapped to Traffic Class 7. This field is similar to the PSTC0
field of the MTL_TC_Prty_Map0 register. 23:16 0x0 PSTC6:
- Priorities Mapped to Traffic Class 6. This field is similar to the PSTC0
field of the MTL_TC_Prty_Map0 register. 15:8 0x0 PSTC5:
- Priorities Mapped to Traffic Class 5. This field is similar to the PSTC0
field of the MTL_TC_Prty_Map0 register.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
7:0 0x0 PSTC4:
- Priorities Mapped to Traffic Class 4. This field is similar to the PSTC0
field of the MTL_TC_Prty_Map0 register.
- MGBE_DWCXG_MTL_MTL_TBS_CTRL_0
This register controls the operation of Time Based Scheduling.
- Offset: 0x1048
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RW
0x0 LEOS:
- Launch Expiry Offset The value in units of 256 nanoseconds that
has to be added to the Launch time to compute the Launch Expiry time. Value valid only when LEOV is set. Max value: 999,999,999 ns, additionally should be smaller than CTR-1 value when ESTM mode is set, as this value is a modulo CTR value.
- RO
0x0 Reserved_7: Reserved. 6:4
- RW
0x0 LEGOS:
- Launch Expiry GSN Offset The number GSN slots that has to be
added to the Launch GSN to compute the Launch Expiry time. Value valid only when LEOV is set.
- RO
0x0 Reserved_3: Reserved.
- RW
0x0 TIEN:
- TBS Interrupt Enable When set indicates that TBS interrupt (occurs
due to frame drop) is enabled. Value valid only when TIEN is set.
- RW
0x0 LEOV:
- Launch Expiry Offset Valid When set indicates the LEOS field is
valid. When not set, indicates the Launch Expiry Offset is not valid and the MTL must not check for Launch expiry time.
- RW
0x0 ESTM:
- EST offset Mode When this bit is set, the Launch Time value used in
- Time Based Scheduling is interpreted as an EST offset value and is
added to the Base Time Register (BTR) of the current list. When reset, the Launch Time value is used as an absolute value that should be compared with the System time [39:8].

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_MTL_TBS_STATS_0
This register provides the One Hot encoded Queue numbers that have the frame drop related error
- Offset: 0x104c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:10
- RO
0x0 Reserved_31_x: Reserved. 9:0
- RW
0x0 EDQN:
- Expiry drop Queue number EDQN can have multiple bits set
corresponding to the Queue numbers that have experienced error described in TINS field of status register. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1.
- MGBE_DWCXG_MTL_MTL_EST_CONTROL_0
This register controls the operation of Enhancements to Scheduled Transmission (IEEE 802.1Qbv).
- Offset: 0x1050
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:23
- RW
0x0 PTOV:
- PTP Time Offset Value The value of PTP Clock period multiplied by 9 in
nanoseconds. This value is needed to avoid transmission overruns at the beginning of the installation of a new GCL. 22:11
- RW
0x0 CTOV:
- Current Time Offset Value Provides a 12 bit time offset value in
nanosecond that is added to the current time to compensate for all the implementation pipeline delays such as the CDC sync delay, buffering delays, data path delays, and so on. This offset helps to ensure that the impact of gate controls is visible on the line exactly at the pre- determined schedule (or as close to the schedule as possible).

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
10:8
- RW
0x0 TILS:
- Time Interval Left Shift Amount This field provides the left shift amount
for the programmed Time Interval values used in the Gate Control Lists.
- 000: No left shift needed (equal to x1ns) - 001: Left shift TI by 1 bit
(equal to x2ns) - 010: Left shift TI by 2 bits (equal to x4ns) - ... - 111: Left shift TI by 7 bits (equal to x128ns) Based on the configuration, one or more bits of this field must be treated as Reserved/Read-Only. 7:6
- RW
0x0 LCSE:
- Loop Count to report Scheduling Error Programmable number of GCL
list iterations before reporting an HLBS error defined in EST_Status register.
- RW
0x0 DFBS:
- Drop Frames causing Scheduling Error When set frames reported to
cause HOL Blocking due to not getting scheduled (HLBS field of
- EST_Status register) after 4,8,16,32 (based on LCSE field of this
register) GCL iterations are dropped.
- RW
0x0 DDBF:
- Do not Drop frames during Frame Size Error When set, frames are not
dropped during Head-of-Line blocking due to Frame Size Error (HLBF field of EST_Status register).
- RW
0x0 QHLBF:
- Quick Assertion of HLBF Error When set, Time Window for Head-of-
- Line blocking due to Frame Size Error is 1 to 2 loop count of GCL list.On
reset,Time Window for Head-of-Line blocking due to Frame Size Error is 2 to 3 loop counts of GCL list.
- RO
0x0 Reserved_2: Reserved.
- RW
0x0 SSWL:
- Switch to software owned list When set, indicates that the software
has programmed the list that it currently owns (SWOL) and DWC_xgmac should switch to the new list based on the new BTR.
- Hardware clears this bit when the switch to the SWOL happens to
indicate the completion of the switch or an non-recoverable BTR error (BTRL = "11111111" indicates the iterations exceeded the value of 512 and DWC_xgmac was not able to update New BTR to be equal to or greater than Current Time.) is set. When BTRE is set this bit is cleared but SWOL is not updated as the switch was not successful. The write to this bit is effective only when EEST bit is set to 1 along with it or EEST bit is previously set to 1. Access restriction applies. Writing 1 sets the bit. Self-cleared. Writing 0 has no effect.
- RW
0x0 EEST:
- Enable EST When reset, the gate control list processing is halted and all
gates are assumed to be in Open state. Should be set for DWC_xgmac to start processing the gate control lists. During the toggle from 0 to 1, the gate control list processing starts only after the SSWL bit is set.
- When ECC is selected during the configuration, if an uncorrectable
error is detected in the GCL memory, DWC_xgmac resets this bit and disables the EST function.
- MGBE_DWCXG_MTL_MTL_EST_OVERHEAD_0
This register indicates the value of Overhead.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0x1054
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:21
- RO
0x0 Reserved_31_21: Reserved. 20:16
- RO
0x0 Reserved_ABYT: Reserved. 15:8
- RO
0x0 Reserved_15_8: Reserved. 7:0
- RW
0x0 OVHD:
- Overhead Bytes Value Fixed overhead to be programmed for
all the frames to account for Scheduler Delay.
- MGBE_DWCXG_MTL_MTL_EST_STATUS_0
This register provides Status related to Enhancements to Scheduled Transmission (IEEE 802.1Qbv).
- Offset: 0x1058
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:20
- RO
0x0 Reserved_31_20: Reserved. 19:16
- RO
0x0 CGSN: Current GCL Slot Number. Indicates the slot number of the GCL list.
- Slot number is a modulo 16 count of the GCL List loops executed so
far. Even if a new GCL list is installed, the count is incremental. 15:8
- RO
0x0 BTRL:
- BTR Error Loop Count Provides the minimum count (N which is divided
by 4) for which the equation, Current Time =< New BTR + (N * 4 * New
- Cycle Time) becomes true. N = "11111111" indicates that the iterations
exceeded the value of 512 and DWC_xgmac is unable to update New
- BTR to be equal to or greater than Current Time. Software intervention
is needed to update the New BTR. This field is cleared when BTRE field of this register is cleared.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RO
0x0 SWOL:
- Software Owned List When this field is 0, indicates that the Gate
control list number 0 is owned by software. When this field is 1, indicates that the Gate Control list 1 is owned by the software. Any reads/writes by the software (using indirect access through GCL_Control) is directed to the list indicated by this value, by default.
- The inverse of this value is treated as HWOL. R/W operations
performed by DWC_xgmac are directed to the list pointed by HWOL, by default. 6:5
- RO
0x0 Reserved_6_5: Reserved.
- RW
0x0 CGCE:
- Constant Gate Control Error This error occurs when the programmed
- Time Interval (TI) value after the optional Left Shifting is more than or
equal to the Cycle Time (CTR). These programming guidelines imply that Gates are either always Closed or always Open based on the Gate
- Control values; the same effect can be achieved by other simpler (non
- TSN) programming mechanisms. As the implementation does not
support such a programming mechanism, an error is reported. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.
- RO
0x0 HLBS:
- Head-Of-Line Blocking due to Scheduling Set when the frame is not
able to win arbitration and get scheduled even after 4 iterations of the
- GCL. Indicates to software a potential programming error. The one-hot
encoded values of the Queue Numbers that are not able to make progress are indicated in the MTL_EST_Sch_Error register. Bit cleared when MTL_EST_Sch_Error register is all zeros.
- RO
0x0 HLBF:
- Head-Of-Line Blocking due to Frame Size This field is set when HOL
- Blocking is noticed on one or more Queues when none of the Time
- Intervals of open-gates in the GCL is greater than or equal to the
duration needed for frame (or frame fragment size when preemption is enabled) transmission. The one-hot encoded Queue numbers that are experiencing HLBF are indicated in the MTL_EST_Frm_Size_Error register. Additionally, the first Queue number that experienced HLBF along with the frame size is captured in MTL_EST_Frm_Size_Capture register. Bit cleared when MTL_EST_Frame_Size_Error register is all zeros.
- RW
0x0 BTRE:
- BTR Error When this field is set, indicates a programming error in the
- BTR of SWOL where the programmed value is less than current time. If
the BTRL = "11111111", SWOL is not updated and software should reprogram the BTR to a value greater than current time and set the
- SSWL bit to re-initiate the switch to SWOL. Otherwise, if the value of
- BTRL < "11111111", SWOL is updated and this field indicates the
number of iterations (of + CycleTime) taken by DWC_xgmac to update the BTR to a value greater than Current Time. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.
- RW
0x0 SWLC:
- Switch to Software Owned List Complete When this field is set,
indicates that DWC_xgmac has successfully switched to the SWOL, and the SWOL bit is updated to that effect. This field is cleared when the SSWL field of EST_Control register transitions from 0 to 1, or on a software write. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_MTL_EST_SCH_ERROR_0
This register provides the One Hot encoded Queue numbers that have the scheduling related error (timeout).
- Offset: 0x1060
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 Reserved_31_x: Reserved. 7:0
- RW
0x0 SETN:
- Schedule Error TC Number SETN can have multiple bits set
corresponding to the TC numbers that have experienced error/ timeout described in HLBS field of status register. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.
- MGBE_DWCXG_MTL_MTL_EST_FRM_SIZE_ERROR_0
This register provides the One Hot encoded Queue numbers that have the Frame Size related error.
- Offset: 0x1064
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:8
- RO
0x0 Reserved_31_x: Reserved. 7:0
- RW
0x0 FETN:
- Frame Size Error TC Number FETN can have multiple bits set
corresponding to the TC numbers that have experienced error described in HLBF field of status register. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_MTL_EST_FRM_SIZE_CAPTURE_0
This register captures the Frame Size and Queue Number of the first occurrence of the Frame Size related error. Upon clearing, this register captures the data of the next occurrence of a similar error.
- Offset: 0x1068
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:19 0x0 Reserved_31_x: Reserved. 18:16 0x0 HBFQ:
- Queue Number of HLBF Captures the binary value of the of the first Queue
(number) experiencing HLBF error (see HLBF field of MTL_EST_status register). Value once written is not altered by any subsequent queue errors of similar nature. Once cleared, the queue number of the next occurring HLBF error is captured. Width is based on the number of Tx Queues configured; remaining bits are Read-Only. Cleared when MTL_EST_Frm_Size_Error register is all zeros. 0x0 Reserved_15: Reserved. 14:0 0x0 HBFS:
- Frame Size of HLBF Captures the Frame Size of the dropped frame of the
queue number indicated in the HBFQ field of this register. Contents of this register should be considered invalid, if this field is zero. Cleared when MTL_EST_Frm_Size_Error register is all zeros.
- MGBE_DWCXG_MTL_MTL_EST_INTR_ENABLE_0
- This register implements the Interrupt Enable bits for the various events that generate an
interrupt. Bit positions have a 1- to-1 correspondence with the status bit positions in MTL_EST_Status register.
- Offset: 0x1070
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:5
- RO
0x0 Reserved_31_5: Reserved.
- RW
0x0 CGCE:
- Interrupt Enable for CGCE When set, generates interrupt when the
Constant Gate Control Error occurs and is indicated in the status. When reset, this event does not generate an interrupt.
- RW
0x0 IEHS:
- Interrupt Enable for HLBS When set, generates interrupt when the
- Head-of-Line Blocking due to Scheduling issue and is indicated in
the status. When reset, this event does not generate an interrupt.
- RW
0x0 IEHF:
- Interrupt Enable for HLBF When set, generates interrupt when the
- Head-of-Line Blocking due to Frame Size error occurs and is
indicated in the status. When reset, this event does not generate an interrupt.
- RW
0x0 IEBE:
- Interrupt Enable for BTR Error When set, generates interrupt when
the BTR Error occurs and is indicated in the status. When reset, this event does not generate an interrupt.
- RW
0x0 IECC:
- Interrupt Enable for Switch List When set, generates interrupt
when the configuration change is successful and DWC_xgmac has switched to the new list. When reset, this event does not generate an interrupt.
- MGBE_DWCXG_MTL_MTL_GCL_CONTROL_0
This register provides the control information for reading/writing to the Gate Control lists.
- Offset: 0x1080
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:24
- RO
0x0 Reserved_31_24: Reserved.
- RW
0x0 GCLEIEC:
- ECC Inject Error Control for GCL Memory When GCLEIEE bit of this
register is set, following are the errors inserted based on the value encoded in this field.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 GCLEIAEE:
- GCL ECC Inject Address Error Enable When set along with EEST bit of
- MTL_EST_Control register, enables the ECC error injection feature. When
reset, disables the ECC Address error injection feature.
- RW
0x0 GCLEIEE:
- GCL ECC Inject Error Enable When set along with EEST bit of
- MTL_EST_Control register, enables the ECC error injection feature. If
- GCLEIAEE is set, enables the ECC Address Error Injection, otherwise,
enables the ECC Data/Check Bits Error Injection (See the EIM and BLEI fields of the MTL_DPP_ECC_EIC Register). When reset, disables the ECC error injection feature. 20:16
- RO
0x0 Reserved_20_y: Reserved. 15:8
- RW
0x0 ADDR:
- Gate Control List Address: (GCLA when GCRR is 0). Provides the address
(row number) of the Gate Control List at which the R/W operation has to be performed. By default the Gate Control List pointed by SWOL of
- MTL_EST_Status is selected for R/W. However, if the DBGM bit of this
register is set, a debug mode access is given to R/W from DBGB. The width of this field is dependent on GCL Depth selected; unused bits should be treated as read-only. Gate Control list Related Registers
- Address: (GCRA when GCRR is 1). By default, the GCL related register set
pointed by SWOL of MTL_EST_Status is selected for R/W. However, if the
- DBGM bit of this register is set, a debug mode access is given to R/W
from DBGB. Only the lower 3 bits are used in this mode. Higher order bits are treated as dont care values. - 000: BTR Low (31:0) - 001: BTR High (63:31) - 010: CTR Low (31:0) - 011: CTR High (39:32) - 100: TER (m:0) (m=GCL Width selected+7-1) - 101: LLR (n:0) (where n is (log{GCL Depth selected} / log2)) - Others: Reserved Range Variable[x]:GCL Memory
- Address Width of One logical partition + 7
7:6
- RO
0x0 Reserved_7_6: Reserved.
- RW
0x0 DBGB:
- Debug Mode Bank Select When this field is set to 0, indicates R/W in
debug mode should be directed to Bank 0 (GCL0 and corresponding Time related registers). When set to 1, indicates R/W in debug mode should be directed to Bank 1 (GCL1 and corresponding Time related registers). This value is used when DBGM is set and overrides the value of SWOL, which is normally used.
- RW
0x0 DBGM:
- Debug Mode When this field is set to 1, indicates R/W in debug mode
where the memory bank (for GCL and Time related registers) is explicitly provided by DBGB value. When set to 0, SWOL bit is used to determine which bank to use.
- RO
0x0 Reserved_GCLS: Reserved.
- RW
0x0 GCRR:
- Gate Control Related Registers When this field is set to 1, indicates that
the R/W access is for the GCL related registers (BTR, CTR, TER, LLR) whose address is provided by GCRA. When 0, indicates that R/W should be directed to GCL from the address provided by GCLA.
- RW
0x0 R1W0:
- Read 1, Write 0: - When set to 1: Read Operation - When set to 0: Write
Operation.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 SRWO:
- Start Read/Write Op - When this field is set, indicates that a Read/Write
operation has started and is in progress. - When this field is reset by
- DWC_xgmac, indicates that the R/W operation is complete or an error
has occurred. - Reads: Data can be read from MTL_GCL_Data register after this bit is reset. - Writes: MTL_GCL_Data should be programmed with write data before setting SRWO bit. Access restriction applies. Writing 1 sets the bit. Self-cleared. Writing 0 has no effect.
- MGBE_DWCXG_MTL_MTL_GCL_DATA_0
This register holds the read data or write data in case of reads and writes respectively.
- Offset: 0x1084
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 GCD:
- Gate Control Data The data corresponding to the address selected in the
GCL_Control register. Used for both Read and Write operations.
- MGBE_DWCXG_MTL_MTL_FPE_CTRL_STS_0
This register controls the operation of, and provides status for Frame Preemption (IEEE 802.1Qbu/ 802.3br).
- Offset: 0x1090
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RO
0x0 HRS:
- Hold/Release Status - 1: Indicates a Set-and-Hold-MAC operation
was last executed and the pMAC is in Hold State. - 0: Indicates a Set- and-Release-MAC operation was last executed and the pMAC is in Release State. 27:16
- RO
0x0 Reserved_27_16: Reserved. 15:8
- RW
0x0 PEC:
- Preemption Classification When set indicates the corresponding
- Queue must be classified as preemptable, when '0' Queue is
classified as express. When both EST (Qbv) and Preemption are enabled, Queue-0 is always assumed to be preemptable. When EST (Qbv) is enabled Queues categorized as preemptable here are always assumed to be in "Open" state in the Gate Control List.
- RW
0x0 LBHT:
- Level Based Hold Transition When set to 1, enables hold operation in
second row of EST GCL if hold request is set in second GCL row for first loop of new GCL, even though hold request is also set in the first GCL row. This is deviation from original behavior where a transition from release request to hold request is required. When set to 0, enables hold operation only on transition from release request to hold request. 6:2
- RO
0x0 Reserved_6_2: Reserved. 1:0
- RW
0x0 AFSZ:
- Additional Fragment Size Used to indicate, in units of 64 bytes, the
minimum number of bytes over 64 bytes required in non-final fragments of preempted frames. The minimum non-final fragment size is (AFSZ +1) * 64 bytes
- MGBE_DWCXG_MTL_MTL_FPE_ADVANCE_0
This register holds the Hold and Release Advance time.
- Offset: 0x1094
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0x0 RADV:
- Release Advance The maximum time in nanoseconds that can elapse
between issuing a RELEASE to the MAC and the MAC being ready to resume transmission of preemptable frames, in the absence of there being any express frames available for transmission.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
15:0 0x0 HADV:
- Hold Advance The maximum time in nanoseconds that can elapse between
issuing a HOLD to the MAC and the MAC ceasing to transmit any preemptable frame that is in the process of transmission or any preemptable frames that are queued for transmission.
- MGBE_DWCXG_MTL_MTL_RXP_CONTROL_STATUS_0
This is the main Control and Status register for Flexible Receive Parser.
- Offset: 0x10a0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x50ff00ff (0b0101,0000,1111,1111,0000,0000,1111,1111)
- Bit
R/W
- Reset
- Description
- RO
0x0 RXPI:
- Rx Parser is Active This status bit is set to 1 when the Rx parser is in
- Active state. This bit can be used as a handshake with the software
when the parser gets disabled/enabled. 30:28
- RO
0x5 PIPE:
- Number of Parallel Instruction Processor Engines support. This field is
read-only. 27:24
- RW
0x0 SNPS_RSVD:
- Synopsys Reserved. All the bits must be set to 0. This field is reserved
for Synopsys Internal use, and must always be set to 0 unless instructed by Synopsys. Setting any bit to 1 might cause unexpected behavior in the IP. 23:16
- RW
0xff NPE:
- Number of Parsable Entries in the Instruction Table. This field
indicates the number of parsable entries in the Instruction Table. This field is used in Rx-Parser logic to detect programming error. If the number of parsed entries for a packet is more than this value, NPEOVIS bit in the MTL_RXP_Interrupt_Control_Status register is set.
- Note: - A value of 0 value implies 1 Instruction. Value of 255 implies
256 instructions. - Program this field with a value between 0 and
- Maximum Entries of Parser Instruction Table-1. Read the value after
programming this field. 15:12
- RW
0x0 FPE_RCH:
- Frame Preemption Residue Channel This field holds the Rx Channel
number to which the residual preemption frames must be forwarded.
- Preemption frames which pass RXP filtering, are routed based on
- Instruction Table. All other frames are treated as residual frames and
are routed to the channel number mentioned in this field. Channel-0 is used as a default Channel for express residual frames, so this field should not be programmed to a value 0.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 OKI_DME:
- Instruction's OK Index Dual Meaning Enable When this field is set to 1,
it indicates Instruction's OK Index field has dual meaning. It is used for specific purpose when SGF or PC is enabled. For more detail refer respective feature section. 10:8
- RO
0x0 Reserved_10_8:
- Reserved
7:0
- RW
0xff NVE:
- Number Valid Entries in the Instruction table. This field indicates the
last valid entry in the Instruction Table. This is used by the Rx-Parser logic to detect programming errors. While parsing the table, if the address is more than this entry, NVEOVIS bit in the
- MTL_RXP_Interrupt_Control_Status register is set. Note: - Value of 0
implies, 1st Instruction; a value of 255 implies 256th instruction. -
- Program this field with a value between 0 and Maximum Entries of
- Parser Instruction Table-1. Read the value after programming this
field.
- MGBE_DWCXG_MTL_MTL_RXP_INTERRUPT_CONTROL_STATUS_0
This is Interrupt Control and Status register for Flexible Receive Parser.
- Offset: 0x10a4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:20
- RO
0x0 Reserved_31_20:
- Reserved
- RW
0x0 PDRFIE:
- Packet Drop due to RF Interrupt Enable When this bit is set, the
- PDRFIS interrupt is enabled. When this bit is reset, the PDRFIS
interrupt is disabled.
- RW
0x0 FOOVIE:
- Frame Offset Overflow Interrupt Enable When this bit is set, the
- FOOVIS interrupt is enabled. When this bit is reset, the FOOVIS
interrupt is disabled.
- RW
0x0 NPEOVIE:
- Number of Parsable Entries Overflow Interrupt Enable When this bit
is set, the NPEOVIS interrupt is enabled. When this bit is reset, the NPEOVIS interrupt is disabled.
- RW
0x0 NVEOVIE:
- Number of Valid Entries Overflow Interrupt Enable When this bit is
set, the NVEOVIS interrupt is enabled. When this bit is reset, the NVEOVIS interrupt is disabled.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
15:4
- RO
0x0 Reserved_15_4:
- Reserved
- RW
0x0 PDRFIS:
- Packet Dropped due to RF Interrupt Status When the Rx-Parser
requests a packet-drop (by setting RF=1 in the instruction table), this bit is set to 1. This bit is cleared when the software writes 1 to this bit. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.
- RW
0x0 FOOVIS:
- Frame Offset Overflow Interrupt Status During parsing, if the
- Instruction table entry's 'Frame Offset' is found to be more than
- EOF offset, this bit is set. This bit is cleared when the software
writes 1 to this bit. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.
- RW
0x0 NPEOVIS:
- Number of Parsable Entries Overflow Interrupt Status While
parsing, if the number of parsed entries is found to be more than
- NPE[] (Number of Parsable Entries in MTL_RXP_Control register),
this bit is set to 1. This bit is cleared when the application writes 1 to this bit. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.
- RW
0x0 NVEOVIS:
- Number of Valid Entries Overflow Interrupt Status While parsing, if
the instruction address is found to be more than NVE (Number of
- Valid Entries in MTL_RXP_Control register), this bit is set to 1. This
bit is cleared when the software writes 1 to this bit. Access restriction applies. Self-set to 1 on internal event. Clears on write of 1. Writing 0 has no effect.
- MGBE_DWCXG_MTL_MTL_INDIRECT_ACC_CONTROL_STATUS_0
This is Control and Status register to Access MTL indirect registers/tables. For example, Flexible Receive Parser's Instruction-Table/Indirect-Register-Blocks, DMA List indirect registers, and so on.
- Offset: 0x10b0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 STARTBUSY:
- Indirect Access Busy When this bit is set to 1 by the software, it
indicates to start the Read/Write operation from/to selected ACCSEL.
- Software should read this bit as 0 before issuing read or write request
to access the selected ACCSEL. This field, when set, indicates that
- DWC_xgmac is busy until it is cleared by hardware. Software should not
issue any read or write operation, until this bit is cleared.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
30:26
- RO
0x0 Reserved_30_26:
- Reserved
25:24
- RW
0x0 ACCSEL:
- Indirect Access Selection This field is used to select the indirect table/
register block to access. Software can select what to access from following selection option.
- RO
0x0 Reserved_23:
- Reserved
22:21
- RW
0x0 RXPEIEC:
- ECC Inject Error Control. This field is valid only when Instruction Table
(ACC_IT) is selected in the ACCSEL field. When RXPEIEE bit of this register is set, following errors are inserted based on the value encoded in this field.
- RW
0x0 RXPEIEE:
- ECC Inject Error Enable. This field is valid only when Instruction Table
(ACC_IT) is selected in ACCSEL field. When set, enables the ECC error injection feature. When reset, disables the ECC error injection feature.
- Note: Hardware injects error when this bit is set and software has
directed to read ACCSEL.
- RO
0x0 Reserved_19:
- Reserved
- RW
0x0 CRWEN:
- Continuous Read/Write Mode Enable This field is valid only when
- Instruction Table (ACC_IT) or ACC_RCHLIST is selected in the ACCSEL
field. When this bit set, continuous read/write mode is enabled. This bit is qualifier for CRWSEL. CRWSEL selects either Read or Write continuous mode. In this mode, software has to set ADDR, STARTBUSY once and along with this mode enable. For subsequent write/read operations, it is not required to set ADDR and STARTBUSY. Hardware sets STARTBUSY and increments ADDR for next 32bit write/read data.
- To disable this mode, set this bit to 0. Note: Byte wise Write/Read is not
supported.
- RW
0x0 CRWSEL:
- Continuous Read/Write Mode Select This field is valid only when
Instruction Table (ACC_IT) or ACC_RCHLIST is selected in ACCSEL field.
- When CRWEN is set, CRWSEL is valid. Software can select which
continuous mode to use, either Write or Read.
- RW
0x0 WRRDN:
- Read Write Control When this bit is set to 1, indicates the write
operation is selected for ACCSEL. When this bit is set to 0, indicates the read operation is selected for ACCSEL. 15:10
- RO
0x0 Reserved_15_x:
- Reserved

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
9:0
- RW
0x0 ADDR:
- Indirect Access Write/Read Address This field indicates the address of
each 32-bit data/register of the selected ACCSEL. ACCSEL Value Usage of this Field - ACC_IT: used for Instruction Table's 32 bits dataword address. - ACC_IFR: used for Indirect FRP Register Block. Indirect FRP Register Block Address Map. 1) 0x0 : For MTL_RXP_Drop_Cnt. 2) 0x1 :
- For MTL_RXP_Error_Cnt. 3) 0x2 : For MTL_RXP_Bypass_Cnt. 4) 0x40 +
(0x10 * i + 0x0): For DMA_CH_RXP_Accept_Cnt where i = DMA Channel
- No. Software can write this before issuing any Read/Write command. -
- ACC_RCHLIST: used for receive channel list indirect register array. Refer
respective register description for more detail about addressing. Note: Use valid address according to the ACCSEL selection.
- MGBE_DWCXG_MTL_MTL_INDIRECT_ACC_DATA_0
This is the data register to Access MTL indirect registers/tables. For example, Flexible Receive Parser's Instruction-Table/Indirect-Register-Blocks, DMA List indirect registers, and so on.
- Offset: 0x10b4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:0 0x0 DATA:
- Indirect Access Write/Read Data Software should write this register before
issuing any write command. DWC_xgmac provides the read data from selected ACCSEL for read operation when STARTBUSY =0 after read command.
- MGBE_DWCXG_MTL_MTL_ECC_CONTROL_0
- The MTL_ECC_Control register establishes the operating mode of ECC related to MAC & MTL
memories.
- Offset: 0x10c0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RO
0x0 Reserved_RXFED: Reserved. 15:9
- RO
0x0 Reserved_15_9: Reserved.
- RW
0x0 MEEAO:
- MAC/MTL ECC Error Address Status Override When set, the
following error address fields hold the last valid address where the error is detected. When reset, the following error address fields hold the first address where the error is detected. EUEAS/ECEAS of MTL_ECC_Err_Addr_Status register. 7:6
- RO
0x0 Reserved_7_6: Reserved.
- RW
0x0 DESCED:
- DCACHE memory ECC Checker Disable When set to 1, disables the
- ECC Checker for DCACHE memory in DMA. When set to 0, enables
the ECC Checker for DCACHE memory in DMA.
- RW
0x0 TSOED:
- TSO memory ECC Checker Disable When set to 1, disables the ECC
- Checker for TSO memory in DMA. When set to 0, enables the ECC
Checker for TSO memory in DMA.
- RW
0x0 MRXPED:
- MTL Rx Parser ECC Checker Disable When set to 1, disables the
- ECC Checker for Rx Parser memory. When set to 0, enables the
ECC Checker for Rx Parser memory.
- RW
0x0 MGCLED:
- MTL GCL ECC Checker Disable When set to 1, disables the ECC
- Checker for GCL memory. When set to 0, enables the ECC Checker
for GCL memory.
- RW
0x0 MRXED:
- MTL Rx FIFO ECC Checker Disable When set to 1, disables the ECC
- Checker for MTL Rx FIFO memory. When set to 0, enables the ECC
Checker for MTL Rx FIFO memory.
- RW
0x0 MTXED:
- MTL Tx FIFO ECC Checker Disable When set to 1, disables the ECC
- Checker for MTL Tx FIFO memory. When set to 0, enables the ECC
Checker for MTL Tx FIFO memory.
- MGBE_DWCXG_MTL_MTL_SAFETY_INTERRUPT_STATUS_0
The MTL_Safety_Interrupt_Status registers provide Safety interrupt status.
- Offset: 0x10c4
- Read/Write: RO
- Parity Protection: N

10G Ethernet Controller Core Registers cont'd 1
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 MCSIS:
- MAC Safety Unrecoverable Interrupt Status Indicates an unrecoverable
safety related interrupt is set in the MAC. MAC_DPP_FSM_Interrupt_Status and DMA_DPP_Interrupt_Status registers should be read when this bit is set, to get the cause of the safety interrupt in MAC. 30:2 0x0 Reserved_30_2: Reserved. 0x0 MEUIS:
- MAC/MTL ECC Uncorrectable error Interrupt Status This bit indicates that
an uncorrectable error interrupt event in the MAC/MTL ECC safety feature.
- To get the exact cause of the interrupt, the application should read the
MTL_ECC_Interrupt_Status register. 0x0 MECIS:
- MAC/MTL ECC Correctable error Interrupt Status This bit indicates that a
correctable error interrupt event in the MAC/MTL ECC safety feature. To get the exact cause of the interrupt, the application should read the MTL_ECC_Interrupt_Status register.
- MGBE_DWCXG_MTL_MTL_ECC_INTERRUPT_ENABLE_0
The MTL_ECC_Interrupt_Enable register provides enable bits for the ECC interrupts.
- Offset: 0x10c8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00001111 (0b0000,0000,0000,0000,0001,0001,0001,0001)
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RO
0x0 Reserved_RXFCEIE: Reserved. 15:13
- RO
0x0 Reserved_15_13: Reserved.
- RW
0x1 RPCEIE:
- Rx Parser memory Correctable Error Interrupt Enable When set,
generates an interrupt when an correctable error is detected at the
- Rx Parser memory interface. It is indicated in RPCES status bit of
- MTL_ECC_Interrupt_Status register. When reset, this event does
not generate an interrupt.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
11:9
- RO
0x0 Reserved_11_9: Reserved.
- RW
0x1 GCEIE:
- GCL memory Correctable Error Interrupt Enable When set,
generates an interrupt when a correctable error is detected at the
- MTL GCL memory interface(EST/SGF). It is indicated in the GCES
and SCES bits of MTL_ECC_Interrupt_Status register. When reset, this event does not generate an interrupt. 7:5
- RO
0x0 Reserved_7_5: Reserved.
- RW
0x1 RXCEIE:
- Rx memory Correctable Error Interrupt Enable When set, generates
an interrupt when a correctable error is detected at the MTL Rx memory interface. It is indicated in the RXCES bit of
- MTL_ECC_Interrupt_Status register. When reset, this event does
not generate an interrupt. 3:1
- RO
0x0 Reserved_3_1: Reserved.
- RW
0x1 TXCEIE:
- Tx memory Correctable Error Interrupt Enable When set, generates
an interrupt when a correctable error is detected at the MTL Tx memory interface. It is indicated in the TXCES bit of
- MTL_ECC_Interrupt_Status register. When reset, this event does
not generate an interrupt.
- MGBE_DWCXG_MTL_MTL_ECC_INTERRUPT_STATUS_0
The MTL_ECC_Interrupt_Status register provides MAC/MTL ECC Interrupt Status.
- Offset: 0x10cc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:23
- RO
0x0 Reserved_31_23: Reserved.
- RO
0x0 Reserved_RXFUES: Reserved.
- RO
0x0 Reserved_RXFAMS: Reserved.
- RO
0x0 Reserved_RXFCES: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RO
0x0 Reserved_19: Reserved.
- RO
0x0 Reserved_SUES: Reserved.
- RO
0x0 Reserved_SAMS: Reserved.
- RO
0x0 Reserved_SCES: Reserved.
- RO
0x0 Reserved_15: Reserved.
- RW
0x0 RPUES:
- Rx Parser memory Uncorrectable Error Status This field, when
set, indicates that an uncorrectable error is detected at Rx Parser memory interface.
- RW
0x0 RPAMS:
- MTL Rx Parser memory Address Mismatch Status This field,
when set, indicates that address mismatch is found for address bus of Rx Parser memory.
- RW
0x0 RPCES:
- MTL Rx Parser memory Correctable Error Status This field,
when set, indicates that correctable error is detected at Rx Parser memory interface.
- RO
0x0 Reserved_11: Reserved.
- RW
0x0 GUES:
- MTL EST GCL memory Uncorrectable Error Status This field,
when set, indicates that an uncorrectable error is detected at MTL EST GCL memory interface.
- RW
0x0 GAMS:
- MTL EST GCL memory Address Mismatch Status This field,
when set, indicates that address mismatch is found for address bus of MTL EST GCL memory.
- RW
0x0 GCES:
- MTL EST GCL memory Correctable Error Status This field, when
set, indicates that correctable error is detected at the MTL EST GCL memory.
- RO
0x0 Reserved_7: Reserved.
- RW
0x0 RXUES:
- MTL Rx memory Uncorrectable Error Status When set,
indicates that an uncorrectable error is detected at the MTL Rx memory interface.
- RW
0x0 RXAMS:
- MTL Rx memory Address Mismatch Status This field, when set,
indicates that address mismatch is found for address bus of the MTL Rx memory.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 RXCES:
- MTL Rx memory Correctable Error Status This field, when set,
indicates that correctable error is detected at the MTL Rx memory.
- RO
0x0 Reserved_3: Reserved.
- RW
0x0 TXUES:
- MTL Tx memory Uncorrectable Error Status When set, indicates
that an uncorrectable error is detected at the MTL Tx memory interface.
- RW
0x0 TXAMS:
- MTL Tx memory Address Mismatch Status This field, when set,
indicates that address mismatch is found for address bus of the MTL Tx memory.
- RW
0x0 TXCES:
- MTL Tx memory Correctable Error Status This field, when set,
indicates that a correctable error is detected at the MTL Tx memory.
- MGBE_DWCXG_MTL_MTL_ECC_ERR_STS_RCTL_0
The MTL_ECC_Err_Sts_Rctl register establishes the control for ECC Error status capture.
- Offset: 0x10d0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:6
- RO
0x0 Reserved_31_6: Reserved.
- RW
0x0 CUES:
- Clear Uncorrectable Error Status When this bit is set along with EESRE
bit of this register, based on the EMS field of this register, the respective memory's uncorrectable error address and uncorrectable error count values are cleared upon reading. Hardware resets this bit when all the error status values are cleared.
- RW
0x0 CCES:
- Clear Correctable Error Status When this bit is set along with EESRE
bit of this register, based on the EMS field of this register, the respective memory's correctable error address and correctable error count values are cleared upon reading. Hardware resets this bit when all the error status values are cleared.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
3:1
- RW
0x0 EMS:
- MAC/MTL ECC Memory Selection When EESRE bit of this register is
set, this field indicates which memory's error status value to be read. The memory selection encoding is as follows: Values: 0x0 (TX_MEM):
- MTL Tx memory 0x1 (RX_MEM): MTL Rx memory 0x2 (EST_MEM): MTL
- EST GCL memory 0x3 (RXP_MEM): MTL Rx Parser memory 0x4
(TSO_MEM): DMA TSO memory 0x5 (DCACHE_MEM): DMA DCACHE memory 0x6 (SGF_MEM): MTL SGF GCL memory 0x7 (RXF_MEM): MAC
- RXF memory
- RW
0x0 EESRE:
- MAC/MTL ECC Error Status Read Enable When this bit is set, based on
the EMS field of this register, the respective memory's error status values is captured as follows: - The correctable and uncorrectable error count values are captured in the MTL_ECC_Err_Cnt_Status register. -
- The address locations of correctable and uncorrectable errors are
captured in the MTL_ECC_Err_Addr_Status register. Hardware resets this bit when all the status values are captured in the MTL_ECC_Err_Cnt_Status and MTL_ECC_Err_Addr_Status registers.
- MGBE_DWCXG_MTL_MTL_ECC_ERR_ADDR_STATUS_0
- The MTL_ECC_Err_Addr_Status register provides the memory addresses for the correctable and
uncorrectable errors.
- Offset: 0x10d4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0x0 EUEAS:
- MAC/MTL ECC Uncorrectable Error Address Status Based on the EMS field of
- MTL_ECC_Err_Sts_Rctl register, this field holds the respective memory's
address locations for which an uncorrectable error or address mismatch is detected. When MEEAO bit of MTL_ECC_Control register is set, this field holds the last valid address of memory for which either an uncorrectable error or an address mismatch is detected. When MEEAO bit of MTL_ECC_Control register is reset, this field holds the first address of the memory for which either an uncorrectable error or address mismatch is detected. 15:0 0x0 ECEAS:
- MAC/MTL ECC Correctable Error Address Status Based on the EMS field of
- MTL_ECC_Err_Sts_Rctl register, this field holds the respective memory's
address locations for which a correctable error is detected. When MEEAO bit of MTL_ECC_Control register is set, this field holds the last valid address of memory for which correctable error or address mismatch is detected. When
- MEEAO bit of MTL_ECC_Control register is reset, this field holds the first
address of the memory for which correctable error is detected.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_MTL_ECC_ERR_CNTR_STATUS_0
- The MTL_ECC_Err_Cntr_Status register provides ECC Error count for Correctable and
uncorrectable errors.
- Offset: 0x10d8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:20 0x0 Reserved_31_20: Reserved. 19:16 0x0 EUECS:
- MAC/MTL ECC Uncorrectable Error Counter Status Based on the EMS
field of MTL_ECC_Err_Cntr_Rctl register, this field holds the respective memory's uncorrectable error count value. 15:8 0x0 Reserved_15_8: Reserved. 7:0 0x0 ECECS:
- MAC/MTL ECC Correctable Error Counter Status Based on the EMS field
of MTL_ECC_Err_Cntr_Rctl register, this field holds the respective memory's correctable error count value.
- MGBE_DWCXG_MTL_MTL_DPP_CONTROL_0
The MTL_DPP_Control establishes the operating mode of Data Parity protection and error injection.
- Offset: 0x10e0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RO
0x0 Reserved_IPEASR: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RO
0x0 Reserved_IPECW: Reserved.
- RW
0x0 IPEMRRC:
- Insert Parity Error in MTL RRC data path Parity Checker When set to 1,
parity/data bit of first valid input parity/data of the MAC RRC output data (or at PC7) is flipped. Based on the EIM/BLEI field of
- MTL_DPP_ECC_EIC register, software can corrupt any one bit of parity/
data. Hardware clears this bit after the respective parity bit is flipped.
- RW
0x0 IPEMRWC:
- Insert Parity error in MTL RWC data path Parity Checker When set to 1,
parity/data bit of first valid input parity/data of the MTL RWC input data (or at PC6) is flipped. Based on the EIM/BLEI field of
- MTL_DPP_ECC_EIC register, software can corrupt any one bit of parity/
data. Hardware clears this bit after the respective parity bit is flipped.
- RW
0x0 IPEAR:
- Insert Parity error in Insert Parity Error in Application Receive interface
data path Parity Checker When set to 1, parity/data bit of first valid input parity/data of Application Receive Interface Parity Checker is flipped. Following checkers based on the system configuration as described below - In MTL configuration (DWCXG = 1), parity checker (PC-b) at ARI interface. - In AXI configuration (DWCXG = 2), parity checker (PC-a) at AXI master interface. Based on the EIM/BLEI field of
- MTL_DPP_ECC_EIC register, software can corrupt any one bit of parity/
data. Hardware clears this bit after the respective parity bit is flipped.
- RW
0x0 IPEMTFC:
- Insert Parity error in MAC TFC data path Parity checker When set to 1,
parity/data bit of first valid input parity/data of the MAC TFC input data (or at PC5) is flipped. Based on the EIM/BLEI field of
- MTL_DPP_ECC_EIC register, software can corrupt any one bit of parity/
data. Hardware clears this bit after the respective parity bit is flipped.
- RW
0x0 IPEMTBU:
- Insert Parity error in MAC TBU data path Parity checker When set to 1,
parity/data bit of first valid input parity/data of the MAC TBU input data on mti interface (or at PC4) is flipped. Based on the EIM/BLEI field of MTL_DPP_ECC_EIC register, software can corrupt any one bit of parity/data. Hardware clears this bit after the respective parity bit is flipped.
- RO
0x0 Reserved_IPEMTS: Reserved.
- RW
0x0 IPEMTD:
- Insert Parity Error in MTL data path Parity checker When set to 1,
parity/data bit of first valid input parity/data of the MTL transmit write controller parity checker (or at PC2) is flipped. Based on the EIM/BLEI field of MTL_DPP_ECC_EIC register, software can corrupt any one bit of parity/data. Hardware clears this bit after the respective parity bit is flipped.
- RW
0x0 IPETSO:
- Insert Parity Error in TSO header(before replacement) data path Parity
checker When set to 1, parity/data bit of first valid input parity/data of the DMA TSO parity checker (or at PC1-hdr) is flipped. Based on the
- EIM/BLEI field of MTL_DPP_ECC_EIC register, software can corrupt any
one bit of parity/data. Hardware clears this bit after the respective parity bit is flipped.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 IPETSODC:
- Insert Parity Error in TSO or Descriptor Cache data path Parity checker
- When set to 1, parity/data bit of first valid input parity/data of the
- DMA TSO parity checker (or at PC-hdr) is flipped. When set to 1,
parity/data bit of first valid input data of the DMA TSO parity checker (or at PC-hdr/PC-desc) is flipped. Based on the EIM/BLEI field of
- MTL_DPP_ECC_EIC register, software can corrupt any one bit of parity/
data. Hardware clears this bit after the respective parity bit is flipped.
- RW
0x0 IPEDC:
- Insert Parity Error in Descriptor Cache data path Parity checker When
set to 1, parity/data bit of first valid input parity/data of the Descriptor
- Cache parity checker (or at PC-desc) is flipped. Based on the EIM/BLEI
field of MTL_DPP_ECC_EIC register, software can corrupt any one bit of parity/data. Hardware clears this bit after the respective parity bit is flipped.
- RO
0x0 Reserved_IPEAT: Reserved.
- RO
0x0 Reserved_3: Reserved.
- RO
0x0 Reserved_EPSI: Reserved.
- RW
0x0 OPE:
- Odd Parity Enable When set to 1, enables odd parity protection on all
the external interfaces. When set to 0, enables even parity protection on all the external interfaces. OPE default value (up on reset) is based on the Enable Odd Parity ports on External Application interface feature selection, which checks if external interface parity should be odd or even).
- RW
0x0 DDPP:
- Disable Data path Parity Protection When set to 0, enables the parity
protection for XGMAC datapath by generating and checking the parity on XGMAC datapath. When set to 1, disables the parity protection for XGMAC datapath.
- MGBE_DWCXG_MTL_MTL_DPP_ECC_EIC_0
The MTL_DPP_ECC_EIC establishes the operating mode of ECC/DPP error injection.
- Offset: 0x10e4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 EIM:
- Error Injection Mode - 0: Indicates error injection on data - 1: Indicates
error injection on ECC/Parity bits (Check that the address error injection mode is disabled). 15:8
- RO
0x0 Reserved_15_8: Reserved. 7:0
- RW
0x0 BLEI:
- Bit Location of error injection This field indicates the bit location of
- DPP/ECC error injection, determination of error in Parity/ECC bits or
Data (being protected) depends on the Error Injection Mode (EIM field).
- Depending on the interface being used for error injection not all bits of
this field are valid. Example, for error injection on a 64 bit data interface this field should be programmed to a value between 63 and 0.
- In case of 2-bit error injection bit 0 is always included in error injection
and this field should represent the second bit selection for error injection.If the second bit is programed at bit 0 when 2-bit error injection is enabled, DUT inserts only a 1-bit error at bit 0.
- MGBE_DWCXG_MTL_TCQ0_MTL_TXQ0_OPERATION_MODE_0
The Queue 0 Transmit Operation Mode register establishes the Transmit queue operating modes and commands.
- Offset: 0x1100
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved. 25:16
- RW
0x0 TQS:
- Transmit Queue Size. This field indicates the size of the allocated
- Transmit queues in blocks of 256 bytes. The sixteenth bit is the
starting bit of this field. The width of this field depends on the Tx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) =
- LOG2(8) = 3 bits A value of 0 indicates 256 bytes. When this queue is
enabled (TXQEN=10), a minimum value of 7 (size = 2048) is recommended so that the queue can store more than a complete max- sized Ethernet packet. This field is reserved and RO in single queue configuration, and its reset value corresponds to the transmit FIFO size 15:11
- RO
0x0 Reserved_15_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
10:8
- RW
0x0 Q2TCMAP:
- Queue to Traffic Class Mapping. This field is used to map Queue0 to a
traffic class (TC). The actual width of this field depends on the number of traffic classes selected during configuration. - 3'b000: TC0 - 3'b001: TC1 - 3'b010: TC2 - 3'b011: TC3 - 3'b100: TC4 - 3'b101: TC5 - 3'b110:
- TC6 - 3'b111: TC7
- RO
0x0 Reserved_7: Reserved. 6:4
- RW
0x0 TTC:
- Transmit Threshold Control. These bits control the threshold level of
the MTL Tx Queue. Transmission starts when the packet size within the
- MTL Tx Queue is larger than the threshold. In addition, full packets
with length less than the threshold are also transmitted. These bits are used only when the TSF bit is reset. - 3'b000: 64 - 3'b001: Reserved - 3'b010: 96 - 3'b011: 128 - 3'b100: 192 - 3'b101: 256 - 3'b110: 384 - 3'b111: 512 3:2
- RW
0x0 TXQEN:
- Transmit Queue Enable. This field is used to enable/disable the
transmit queue. - 2'b00: Not enabled - 2'b01: Audio Video Bridging - 2'b10: Enabled - 2'b11: Reserved The queue is enabled by default in single queue configuration. Therefore, this field is reserved when the number of transmit queues selected is one and has a reset value of 2'b10. In multiple Tx queues configuration, all the queues are disabled by default. Enable the Tx queue by programming this field.
- RW
0x0 TSF:
- Transmit Store and Forward. When this bit is set, the transmission
starts when a full packet resides in the MTL Tx Queue. When this bit is set, the values specified in the TTC field are ignored. This bit should be changed only when the transmission is stopped.
- RW
0x0 FTQ:
- Flush Transmit Queue. When this bit is set, the Tx Queue Controller
logic is reset to its default values. Therefore, all the data in the Tx queue is lost or flushed. This bit is internally reset when the flushing operation is complete. You should not write to this register until this bit is reset. The data which is already accepted by the MAC transmitter is not flushed. It is scheduled for transmission and results in underflow and runt packet transmission. Note: The flush operation is complete only when the Tx queue is empty. To complete this flush operation, the PHY Tx clock (clk_tx_312pt5_i) must be active.
- MGBE_DWCXG_MTL_TCQ0_MTL_TXQ0_UNDERFLOW_0
- The Queue 0 Underflow Counter register contains the counter for packets aborted because of
Transmit queue underflow.
- Offset: 0x1104
- Read/Write: RO
- Parity Protection: N
- Shadow: N

10G Ethernet Controller Core Registers cont'd 1
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0x0 Reserved_31_16: Reserved. 0x0 UFCNTOVF:
- Overflow Bit for Underflow Packet Counter. This bit is set every time the Tx
- Queue Underflow Packet Counter field overflows, that is, it has crossed the
maximum count. In such a scenario, the overflow packet counter is reset to all-zeros and this bit indicates that the rollover happened. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 UFPKTCNT:
- Underflow Packet Counter. This field indicates the number of packets
aborted by the controller because of Transmit Queue Underflow. This counter is incremented each time the MAC aborts an outgoing packet because of underflow. The counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ0_MTL_TXQ0_DEBUG_0
The Queue 0 Transmit Debug register gives the debug status of various blocks related to the Transmit Queue 0 and Traffic Class 0.
- Offset: 0x1108
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:6 0x0 Reserved_31_6: Reserved. 0x0 TRCPSTS:
- MTL TRC Pending Status When this bit is high, it indicates that the MTL Tx
Read Controller (TRC) has a pending status from MAC. 0x0 TXQSTS:
- MTL Tx Queue Not Empty Status. When this bit is high, it indicates that the
MTL Tx Queue is not empty and some data is left for transmission. 0x0 TWCSTS:
- MTL Tx Queue Write Controller Status. When high, this bit indicates that the
- MTL Tx Queue Write Controller is active, and it is transferring the data to the
Tx Queue.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
2:1 0x0 TRCSTS:
- MTL Tx Queue Read Controller Status. This field indicates the state of the Tx
- Queue Read Controller: - 2'b00: Idle state - 2'b01: Read state (transferring
data to the MAC transmitter) - 2'b10: Waiting for pending Tx Status from the
- MAC transmitter - 2'b11: Flushing the Tx queue because of the Packet Abort
request from the MAC 0x0 TCPAUSED:
- Traffic Class in Pause. When this bit is high and the Rx flow control is enabled,
it indicates that the Traffic Class 0 is in the Pause condition because of the following: - Reception of the PFC packet for the priorities assigned to the
- Traffic Class 0 when PFC is enabled - Reception of IEEE 802.3-2018 Pause
packet when Priority Based Flow Control (PFC) is disabled
- MGBE_DWCXG_MTL_TCQ0_MTL_TC0_ETS_CONTROL_0
This register configures the transmission selection algorithm, for Traffic Class 0.This register is not available in single traffic class configuration.
- Offset: 0x1110
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:7
- RO
0x0 Reserved_31_7: Reserved. 6:4
- RO
0x0 Reserved_SLC: Reserved.
- RO
0x0 Reserved_CC: Reserved.
- RO
0x0 CBSEN:
- Credit Based Shaper Enable This field indicates that TSA field of
this register is enabled for CBS 1:0
- RW
0x0 TSA:
- Transmission Selection Algorithm. This field is used to assign a
transmission selection algorithm for this traffic class. - 2'b00:
- Strict priority - 2'b01: CBS - 2'b10: ETS - 2'b11: Reserved
- MGBE_DWCXG_MTL_TCQ0_MTL_TC0_ETS_STATUS_0

10G Ethernet Controller Core Registers cont'd 1 This register contains the information of average bits transmitted over a slot interval of 10 million bit times, for Traffic Class 0.
- Offset: 0x1114
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 Reserved_31_24: Reserved. 23:0 0x0 ABS:
- Average Bits per Slot. This field contains the average transmitted bits per
slot computed over every slot of 10 million bit times (1ms in 10G mode, 10ms in 1G mode). The maximum value is 0x989680.
- MGBE_DWCXG_MTL_TCQ0_MTL_TC0_QUANTUM_WEIGHT_0
The TC1 Quantum or Weights register provides the average traffic transmitted in Traffic Class 1. For TCn, where n = 1 to 7, this register is not available when the number of traffic classes selected is less than n + 1 This register is not available in corresponding Queues 8-15 registers.
- Offset: 0x1118
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:21
- RO
0x0 Reserved_31_21: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
20:0
- RW
0x0 QW: idleSlopeCredit, Quantum or Weights. - idleSlopeCredit -- When Audio
- Video Bridging feature is enabled, this field contains the idleSlopeCredit
value required for the credit-based shaper algorithm for Queue 1. This is the rate of change of credit in bits per cycle (3.2 ns for 2.5/10 Gbps; 8 ns for 1000 Mbps) when the credit is increasing. The software should program this field with computed credit in bits per cycle scaled by 1024.
- The maximum value is portTransmitRate, that is, 0x2000 in 1000/2500
- Mbps mode and 0x8000 in 10 Gbps mode. Bits[20:16] must be written to
zero. - Quantum -- When the TSA is set to ETS and ETSALG is set to DWRR algorithm for Traffic Class 1 traffic, this field contains the quantum value in bytes to be added to credit during every queue scanning cycle. The maximum value is 0x1312D0 bytes. - Weights -- When TSA is set to ETS and ETSALG is set to WFQ algorithm for Traffic Class1 traffic, this field contains the weight for this queue. The maximum value is 0x3FFF where weight of 0 indicates 100% bandwidth. Bits [20:14] must be written to zero. -- When TSA is set to ETS and ETSALG is set to WRR algorithm for
- Traffic Class 1 traffic, this field contains the weight for this queue. The
maximum value is 0x64. Bits[20:7] must be written to zero. This field is reserved and RO when the number of traffic classes selected is less than two. This field is reserved in corresponding Queues 8-15 register.
- MGBE_DWCXG_MTL_TCQ0_MTL_RXQ0_OPERATION_MODE_0
The Queue 0 Receive Operation Mode register establishes the Receive queue operating modes and command.
- Offset: 0x1140
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved. 25:16
- RW
0x0 RQS:
- Receive Queue Size. This field indicates the size of the allocated
- Receive queues in blocks of 256 bytes. The sixteenth bit is the starting
bit of this field. The width of this field depends on the Rx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) = LOG2(8) = 3 bits A value of 0 indicates 256 bytes. This field is reserved and RO in single queue configuration, and its reset value corresponds to the receive
- FIFO size. When this queue is used, a minimum value of 7 (size = 2048)
is recommended so that the queue can store more than a complete max-sized Ethernet packet. 15:8
- RO
0x0 Reserved_15_8: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 EHFC:
- Enable Hardware Flow Control. When this bit is set, the flow control
signal operation, based on the fill-level of Rx queue, is enabled. When reset, the flow control operation is disabled. This bit is not used (reserved and always reset) when the Rx queue is less than 4 KB.
- RW
0x0 DIS_TCP_EF:
- Disable Dropping of TCP/IP Checksum Error Packets. - When this bit is
set, the MAC does not drop the packets which only have the errors detected by the Receive Checksum Offload engine. Such packets have errors only in the encapsulated payload. There are no errors (including
- FCS error) in the Ethernet packet received by the MAC. - When this bit
is reset, all error packets are dropped if the FEF bit is reset.
- RW
0x0 RSF:
- Receive Queue Store and Forward. When this bit is set, DWC_xgmac
reads a packet from the Rx queue only after the complete packet has been written to it, ignoring the RTC field of this register. When this bit is reset, the Rx queue operates in the Threshold (cut-through) mode, subject to the threshold specified by the RTC field of this register.
- RW
0x0 FEF:
- Forward Error Packets. - When this bit is reset, the Rx queue drops
packets with error status (CRC error, GMII_ER, watchdog timeout, or overflow). However, if the start byte (write) pointer of a packet is already transferred to the read controller side (in Threshold mode), the packet is not dropped. - When this bit is set, all packets except the runt error packets are forwarded to the application or DMA. If the RSF bit is set and the Rx queue overflows when a partial packet is written, the packet is dropped irrespective of the setting of this bit. However, if the RSF bit is reset and the Rx queue overflows when a partial packet is written, a partial packet might be forwarded to the application or DMA.
- RW
0x0 FUF:
- Forward Undersized Good Packets. When this bit is set, the Rx queue
forwards the undersized good packets (with no Invalid-code/GMII/CRC/
- Length errors and length less than 64 bytes at Rx (X)GMII interface),
including pad-bytes and CRC. When this bit is reset, the Rx queue drops all packets of length less than 64 bytes.
- RO
0x0 Reserved_2: Reserved. 1:0
- RW
0x0 RTC:
- Receive Queue Threshold Control. These bits control the threshold level
of the MTL Rx queue (in bytes): - 2'b00: 64 - 2'b01: Reserved - 2'b10: 96
- 2'b11: 128 The received packet is transferred to the application or
- DMA when the packet size within the MTL Rx queue is larger than the
threshold. In addition, full packets with length less than the threshold are automatically transferred. The value of 11 is not applicable if the size of the configured Rx Queue is 128 bytes. This field is valid only when the RSF bit is zero. This field is ignored when the RSF bit is set to 1.
- MGBE_DWCXG_MTL_TCQ0_MTL_RXQ0_MISSED_PKT_OVERFLOW_CNT_0

10G Ethernet Controller Core Registers cont'd 1
- The Queue 0 Overflow Counter register contains the counter for packets missed because of
Receive queue packet flush and packets discarded because of Receive queue overflow.
- Offset: 0x1144
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 MISCNTOVF:
- Missed Packet Counter Overflow Bit. When set, this bit indicates that the
Rx Queue Missed Packet Counter crossed the maximum limit. 30:27 0x0 Reserved_30_27: Reserved. 26:16 0x0 MISPKTCNT:
- Missed Packet Counter. This field indicates the number of packets missed
by DWC_xgmac because the application asserted ari_pkt_flush_i[] for this queue. This counter is incremented each time the application issues ari_pkt_flush_i[] for this queue. This counter is reset when this register is read with mci_be_i[0] at 1'b1. 0x0 OVFCNTOVF:
- Overflow Counter Overflow Bit. When set, this bit indicates that the Rx
Queue Overflow Packet Counter field crossed the maximum limit. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 OVFPKTCNT:
- Overflow Packet Counter. This field indicates the number of packets
discarded by DWC_xgmac because of Receive queue overflow. This counter is incremented each time DWC_xgmac discards an incoming packet because of overflow. This counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ0_MTL_RXQ0_DEBUG_0
- The Queue 0 Receive Debug register gives the debug status of various blocks related to the
Receive queue.
- Offset: 0x1148
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
31:30 0x0 Reserved_31_30: Reserved. 29:16 0x0 PRXQ:
- Number of Packets in Receive Queue. This field indicates the current
number of packets in the Rx Queue. The theoretical maximum value for this field is 256KB/16B = 16K Packets, that is, Max_Queue_Size/ Min_Packet_Size. 15:6 0x0 Reserved_15_6: Reserved. 5:4 0x0 RXQSTS:
- MTL Rx Queue Fill-Level Status. This field gives the status of the fill-level of
the Rx Queue: - 2'b00: Rx Queue empty - 2'b01: Rx Queue fill-level below flow-control deactivate threshold - 2'b10: Rx Queue fill-level above flow- control activate threshold - 2'b11: Rx Queue full 0x0 Reserved_3: Reserved. 2:1 0x0 RRCSTS:
- MTL Rx Queue Read Controller State. This field gives the state of the Rx
queue Read controller: - 2'b00: Idle state - 2'b01: Reading packet data - 2'b10: Reading packet status (or timestamp) - 2'b11: Flushing the packet data and status 0x0 RWCSTS:
- MTL Rx Queue Write Controller Active Status. When high, this bit indicates
that the MTL Rx queue Write controller is active, and it is transferring a received packet to the Rx Queue.
- MGBE_DWCXG_MTL_TCQ0_MTL_RXQ0_CONTROL_0
The Queue 0 Receive Control register controls the receive arbitration and passing of received packets to the application.
- Offset: 0x114c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:4
- RO
0x0 Reserved_31_4: Reserved.
- RW
0x0 RXQ_PKT_ARBIT:
- Receive Queue Packet Arbitration Control. When this bit is set, the
- MTL enables the packet-level arbitration. When this bit is reset, the
MTL enables the PBL based arbitration.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
2:0
- RW
0x0 RXQ_WEGT:
- Receive Queue Weight. This field indicates the weight assigned to
the Rx Queue 0. The weight is used as the number of continuous
- PBL requests or contiguous packets (depending on the
RXQ_PKT_ARBIT) allocated to the queue in one arbitration cycle.
- MGBE_DWCXG_MTL_TCQ0_MTL_RXQ0_FLOW_CONTROL_0
This register controls the activation and de-activation threshold in the queue for PAUSE/PFC flow control.
- Offset: 0x1150
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:23
- RO
0x0 Reserved_31_y: Reserved. 22:17
- RW
0x0 RFD:
- Threshold for deactivating Flow Control. These bits control the
threshold (fill-level of RxQ0) at which the flow control is de-asserted once it is activated. - 6'b000000: RQS value minus 1 KB, that is, FULL - 1024 bytes - 6'b000001: RQS value minus 1.5 KB, that is, FULL - 1536 bytes - 6'b000010: RQS value minus 2 KB, that is, FULL - 2048 bytes.
- ... - 6'b111111: RQS value minus 32.5 KB, that is, FULL - 33280 bytes
- The de-assertion is effective only after flow control is asserted as per
the setting of RFA field. Note that the value to be programmed should be such that the threshold is positive number. 16:7
- RO
0x0 Reserved_16_y: Reserved. 6:1
- RW
0x0 RFA:
- Threshold for activating Flow Control. These bits control the threshold
(fill-level of RxQ0) at which the flow control is activated - 6'b000000:
- RQS value minus 1 KB, that is, FULL - 1024 bytes - 6'b000001: RQS
value minus 1.5 KB, that is, FULL - 1536 bytes - 6'b000010: RQS value minus 2 KB, that is, FULL - 2048 bytes. - ... - 6'b111111: RQS value minus 32.5 KB, that is, FULL - 33280 bytes The flow control is triggered when EHFC=1 and the queue size (RQS value in MTL_RxQ0_Operation
- Mode register) is equal to or more than 4KB. Note that the value to be
programmed in RFA should be such that the threshold is positive number.
- RO
0x0 Reserved_0: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_TCQ0_MTL_Q0_INTERRUPT_ENABLE_0
This register contains the interrupt enable bits for Traffic class/Queue 0.
- Offset: 0x1170
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RW
0x0 RXOIE:
- Receive Queue Overflow Interrupt Enable. - 1: Receive Queue
- Overflow interrupt is enabled. - 0: Receive Queue Overflow interrupt
is disabled. 15:2
- RO
0x0 Reserved_15_2: Reserved.
- RW
0x0 ABPSIE:
- Average Bits Per Slot Interrupt Enable. When this bit is set, average
bits per slot interrupt is enabled for Traffic Class 0. An interrupt is generated when the average bits per slot status is updated for this traffic class. This bit is reserved and RO when the number of traffic classes selected is less than 0. This field in the corresponding Queues 8 - 15 registers is always reserved.
- RW
0x0 TXUIE:
- Transmit Queue Underflow Interrupt Enable. - 1: Transmit Queue
- Underflow interrupt is enabled. - 0: Transmit Queue Underflow
interrupt is disabled.
- MGBE_DWCXG_MTL_TCQ0_MTL_Q0_INTERRUPT_STATUS_0
This register contains the interrupt status bits for Traffic class/Queue 0.
- Offset: 0x1174
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RW
0x0 RXOVFIS:
- Receive Queue Overflow Interrupt Status. This bit indicates that the
- Receive Queue had an Overflow during packet reception. If partial
packet is transferred to the application, the overflow status is set in the corresponding Rx status. This bit is cleared when the application writes a 1 to this bit. 15:2
- RO
0x0 Reserved_15_2: Reserved.
- RW
0x0 ABPSIS:
- Average Bits Per Slot Interrupt Status. When set, this bit indicates
that the MAC has updated the ABS value for this traffic class. This bit is cleared when the application writes a 1 to this bit. This bit is reserved and RO when the number of traffic classes selected is less than 0. This field in corresponding Queues 8 - 15 registers is reserved and RO.
- RW
0x0 TXUNFIS:
- Transmit Queue Underflow Interrupt Status. This bit indicates that
the Transmit Queue had an Underflow during packet transmission. Transmission is suspended and an Underflow Error TDES3[2] is set. This bit is cleared when the application writes a 1 to this bit.
- MGBE_DWCXG_MTL_TCQ1_MTL_TXQ1_OPERATION_MODE_0
The Queue 1 Transmit Operation Mode register establishes the Transmit queue operating modes and commands.
- Offset: 0x1180
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
25:16
- RW
0x0 TQS:
- Transmit Queue Size. This field indicates the size of the allocated
- Transmit queues in blocks of 256 bytes. The sixteenth bit is the
starting bit of this field. The width of this field depends on the Tx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) =
- LOG2(8) = 3 bits A value of 0 indicates 256 bytes. When this queue is
enabled (TXQEN=10), a minimum value of 7 (size = 2048) is recommended so that the queue can store more than a complete max- sized Ethernet packet. This field is reserved and RO in single queue configuration, and its reset value corresponds to the transmit FIFO size 15:11
- RO
0x0 Reserved_15_y: Reserved. 10:8
- RW
0x0 Q2TCMAP:
- Queue to Traffic Class Mapping. This field is used to map Queue0 to a
traffic class (TC). The actual width of this field depends on the number of traffic classes selected during configuration. - 3'b000: TC0 - 3'b001: TC1 - 3'b010: TC2 - 3'b011: TC3 - 3'b100: TC4 - 3'b101: TC5 - 3'b110:
- TC6 - 3'b111: TC7
- RO
0x0 Reserved_7: Reserved. 6:4
- RW
0x0 TTC:
- Transmit Threshold Control. These bits control the threshold level of
the MTL Tx Queue. Transmission starts when the packet size within the
- MTL Tx Queue is larger than the threshold. In addition, full packets
with length less than the threshold are also transmitted. These bits are used only when the TSF bit is reset. - 3'b000: 64 - 3'b001: Reserved - 3'b010: 96 - 3'b011: 128 - 3'b100: 192 - 3'b101: 256 - 3'b110: 384 - 3'b111: 512 3:2
- RW
0x0 TXQEN:
- Transmit Queue Enable. This field is used to enable/disable the
transmit queue. - 2'b00: Not enabled - 2'b01: Audio Video Bridging - 2'b10: Enabled - 2'b11: Reserved The queue is enabled by default in single queue configuration. Therefore, this field is reserved when the number of transmit queues selected is one and has a reset value of 2'b10. In multiple Tx queues configuration, all the queues are disabled by default. Enable the Tx queue by programming this field.
- RW
0x0 TSF:
- Transmit Store and Forward. When this bit is set, the transmission
starts when a full packet resides in the MTL Tx Queue. When this bit is set, the values specified in the TTC field are ignored. This bit should be changed only when the transmission is stopped.
- RW
0x0 FTQ:
- Flush Transmit Queue. When this bit is set, the Tx Queue Controller
logic is reset to its default values. Therefore, all the data in the Tx queue is lost or flushed. This bit is internally reset when the flushing operation is complete. You should not write to this register until this bit is reset. The data which is already accepted by the MAC transmitter is not flushed. It is scheduled for transmission and results in underflow and runt packet transmission. Note: The flush operation is complete only when the Tx queue is empty. To complete this flush operation, the PHY Tx clock (clk_tx_312pt5_i) must be active.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_TCQ1_MTL_TXQ1_UNDERFLOW_0
- The Queue 1 Underflow Counter register contains the counter for packets aborted because of
Transmit queue underflow.
- Offset: 0x1184
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0x0 Reserved_31_16: Reserved. 0x0 UFCNTOVF:
- Overflow Bit for Underflow Packet Counter. This bit is set every time the Tx
- Queue Underflow Packet Counter field overflows, that is, it has crossed the
maximum count. In such a scenario, the overflow packet counter is reset to all-zeros and this bit indicates that the rollover happened. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 UFPKTCNT:
- Underflow Packet Counter. This field indicates the number of packets
aborted by the controller because of Transmit Queue Underflow. This counter is incremented each time the MAC aborts an outgoing packet because of underflow. The counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ1_MTL_TXQ1_DEBUG_0
The Queue 1 Transmit Debug register gives the debug status of various blocks related to the Transmit Queue 1 and Traffic Class 0.
- Offset: 0x1188
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:6 0x0 Reserved_31_6: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 TRCPSTS:
- MTL TRC Pending Status When this bit is high, it indicates that the MTL Tx
Read Controller (TRC) has a pending status from MAC. 0x0 TXQSTS:
- MTL Tx Queue Not Empty Status. When this bit is high, it indicates that the
MTL Tx Queue is not empty and some data is left for transmission. 0x0 TWCSTS:
- MTL Tx Queue Write Controller Status. When high, this bit indicates that the
- MTL Tx Queue Write Controller is active, and it is transferring the data to the
Tx Queue. 2:1 0x0 TRCSTS:
- MTL Tx Queue Read Controller Status. This field indicates the state of the Tx
- Queue Read Controller: - 2'b00: Idle state - 2'b01: Read state (transferring
data to the MAC transmitter) - 2'b10: Waiting for pending Tx Status from the
- MAC transmitter - 2'b11: Flushing the Tx queue because of the Packet Abort
request from the MAC 0x0 TCPAUSED:
- Traffic Class in Pause. When this bit is high and the Rx flow control is enabled,
it indicates that the Traffic Class 0 is in the Pause condition because of the following: - Reception of the PFC packet for the priorities assigned to the
- Traffic Class 0 when PFC is enabled - Reception of IEEE 802.3-2018 Pause
packet when Priority Based Flow Control (PFC) is disabled
- MGBE_DWCXG_MTL_TCQ1_MTL_TC1_ETS_CONTROL_0
This register configures the transmission selection algorithm, for Traffic Class 0.This register is not available in single traffic class configuration.
- Offset: 0x1190
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:7
- RO
0x0 Reserved_31_7: Reserved. 6:4
- RW
0x0 SLC:
- Slot Count. If the credit-based shaper algorithm is enabled, the
software can program the number of slots (of 125 us duration) over which the average transmitted bits per slot, provided in the
- MTL_TC<n>_ETS_Status register, need to be computed for TC<n>. The
encoding is as follows: - 3'b000: 1 Slot - 3'b001: 2 Slots - 3'b010: 4 Slots
- 3'b011: 8 Slots - 3'b100: 16 Slots - 3'b101-3'b111: Reserved

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 CC:
- Credit Control. When this bit is set, the accumulated credit parameter
in the credit-based shaper algorithm logic is not reset to zero when there is positive credit and no packet to transmit in TC<n>. The credit accumulates even when there is no packet waiting in TC<n> and another TC is transmitting. When this bit is reset, the accumulated credit parameter in the credit-based shaper algorithm logic is set to zero when there is positive credit and no packet to transmit in TC<n>.
- When there is no packet waiting in TC<n> and other TC is transmitting,
no credit is accumulated.
- RO
0x0 CBSEN:
- Credit Based Shaper Enable This field indicates that TSA field of this
register is enabled for CBS 1:0
- RW
0x0 TSA:
- Transmission Selection Algorithm. This field is used to assign a
transmission selection algorithm for this traffic class. - 2'b00: Strict priority - 2'b01: CBS - 2'b10: ETS - 2'b11: Reserved
- MGBE_DWCXG_MTL_TCQ1_MTL_TC1_ETS_STATUS_0
This register contains the information of average bits transmitted over a slot interval of 10 million bit times, for Traffic Class 0.
- Offset: 0x1194
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 Reserved_31_24: Reserved. 23:0 0x0 ABS:
- Average Bits per Slot. This field contains the average transmitted bits per
slot computed over every slot of 10 million bit times (1ms in 10G mode, 10ms in 1G mode). The maximum value is 0x989680.
- MGBE_DWCXG_MTL_TCQ1_MTL_TC1_QUANTUM_WEIGHT_0
The TC1 Quantum or Weights register provides the average traffic transmitted in Traffic Class 1. For TCn, where n = 1 to 7, this register is not available when the number of traffic classes selected is less than n + 1 This register is not available in corresponding Queues 8-15 registers.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0x1198
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:21
- RO
0x0 Reserved_31_21: Reserved. 20:0
- RW
0x0 QW: idleSlopeCredit, Quantum or Weights. - idleSlopeCredit -- When Audio
- Video Bridging feature is enabled, this field contains the idleSlopeCredit
value required for the credit-based shaper algorithm for Queue 1. This is the rate of change of credit in bits per cycle (3.2 ns for 2.5/10 Gbps; 8 ns for 1000 Mbps) when the credit is increasing. The software should program this field with computed credit in bits per cycle scaled by 1024.
- The maximum value is portTransmitRate, that is, 0x2000 in 1000/2500
- Mbps mode and 0x8000 in 10 Gbps mode. Bits[20:16] must be written to
zero. - Quantum -- When the TSA is set to ETS and ETSALG is set to DWRR algorithm for Traffic Class 1 traffic, this field contains the quantum value in bytes to be added to credit during every queue scanning cycle. The maximum value is 0x1312D0 bytes. - Weights -- When TSA is set to ETS and ETSALG is set to WFQ algorithm for Traffic Class1 traffic, this field contains the weight for this queue. The maximum value is 0x3FFF where weight of 0 indicates 100% bandwidth. Bits [20:14] must be written to zero. -- When TSA is set to ETS and ETSALG is set to WRR algorithm for
- Traffic Class 1 traffic, this field contains the weight for this queue. The
maximum value is 0x64. Bits[20:7] must be written to zero. This field is reserved and RO when the number of traffic classes selected is less than two. This field is reserved in corresponding Queues 8-15 register.
- MGBE_DWCXG_MTL_TCQ1_MTL_TC1_SENDSLOPECREDIT_0
MTL registers for traffic classes and queues 1 registers.
- Offset: 0x119c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
15:0
- RW
0x0 SSC: sendSlopeCredit Value. - When Audio Video Bridging operation is enabled, this field contains the sendSlopeCredit value required for credit-based shaper algorithm for TC<n>. The software should program this field with computed credit in bits per cycle scaled by 1024. This field should be programmed with absolute sendSlopeCredit value. The credit-based shaper logic subtracts it from the accumulated credit when TC<n> is selected for transmission. See the application note for more details on programming this value.
- MGBE_DWCXG_MTL_TCQ1_MTL_TC1_HICREDIT_0
This register contains the hiCredit value required for the credit-based shaper algorithm for TC1.
- Offset: 0x11a0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved. 28:0
- RW
0x0 HC: hiCredit Value. - When the Audio Video Bridging feature is enabled, this field contains the hiCredit value required for the credit-based shaper algorithm. This is the maximum value that can be accumulated in the credit parameter. This is specified in bits scaled by 1024. The maximum value is maxInterferenceSize, that is, best- effort maximum packet size (16384 bytes or 131072 bits). The value to be specified is 131072 * 1024 = 134217728 or 0x0800_0000
- MGBE_DWCXG_MTL_TCQ1_MTL_TC1_LOCREDIT_0
This register contains the loCredit value required for the credit-based shaper algorithm for TC1.
- Offset: 0x11a4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved. 28:0
- RW
0x0 LC: loCredit Value. - When Audio Video Bridging operation is enabled, this field contains the loCredit value required for the credit-based shaper algorithm. This is the minimum value that can be accumulated in the credit parameter. This is specified in bits scaled by 1024. The maximum value is maxPacketSize transmitted from this queue, that is, 16384 * 8 * 1024 = 134217728 or 0x0800_0000. Because it is a negative value, the programmed value is twos complement of the value, that is, 0x1800_0000.
- MGBE_DWCXG_MTL_TCQ1_MTL_RXQ1_OPERATION_MODE_0
The Queue 1 Receive Operation Mode register establishes the Receive queue operating modes and command.
- Offset: 0x11c0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved. 25:16
- RW
0x0 RQS:
- Receive Queue Size. This field indicates the size of the allocated
- Receive queues in blocks of 256 bytes. The sixteenth bit is the starting
bit of this field. The width of this field depends on the Rx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) = LOG2(8) = 3 bits A value of 0 indicates 256 bytes. This field is reserved and RO in single queue configuration, and its reset value corresponds to the receive
- FIFO size. When this queue is used, a minimum value of 7 (size = 2048)
is recommended so that the queue can store more than a complete max-sized Ethernet packet. 15:8
- RO
0x0 Reserved_15_8: Reserved.
- RW
0x0 EHFC:
- Enable Hardware Flow Control. When this bit is set, the flow control
signal operation, based on the fill-level of Rx queue, is enabled. When reset, the flow control operation is disabled. This bit is not used (reserved and always reset) when the Rx queue is less than 4 KB.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 DIS_TCP_EF:
- Disable Dropping of TCP/IP Checksum Error Packets. - When this bit is
set, the MAC does not drop the packets which only have the errors detected by the Receive Checksum Offload engine. Such packets have errors only in the encapsulated payload. There are no errors (including
- FCS error) in the Ethernet packet received by the MAC. - When this bit
is reset, all error packets are dropped if the FEF bit is reset.
- RW
0x0 RSF:
- Receive Queue Store and Forward. When this bit is set, DWC_xgmac
reads a packet from the Rx queue only after the complete packet has been written to it, ignoring the RTC field of this register. When this bit is reset, the Rx queue operates in the Threshold (cut-through) mode, subject to the threshold specified by the RTC field of this register.
- RW
0x0 FEF:
- Forward Error Packets. - When this bit is reset, the Rx queue drops
packets with error status (CRC error, GMII_ER, watchdog timeout, or overflow). However, if the start byte (write) pointer of a packet is already transferred to the read controller side (in Threshold mode), the packet is not dropped. - When this bit is set, all packets except the runt error packets are forwarded to the application or DMA. If the RSF bit is set and the Rx queue overflows when a partial packet is written, the packet is dropped irrespective of the setting of this bit. However, if the RSF bit is reset and the Rx queue overflows when a partial packet is written, a partial packet might be forwarded to the application or DMA.
- RW
0x0 FUF:
- Forward Undersized Good Packets. When this bit is set, the Rx queue
forwards the undersized good packets (with no Invalid-code/GMII/CRC/
- Length errors and length less than 64 bytes at Rx (X)GMII interface),
including pad-bytes and CRC. When this bit is reset, the Rx queue drops all packets of length less than 64 bytes.
- RO
0x0 Reserved_2: Reserved. 1:0
- RW
0x0 RTC:
- Receive Queue Threshold Control. These bits control the threshold level
of the MTL Rx queue (in bytes): - 2'b00: 64 - 2'b01: Reserved - 2'b10: 96
- 2'b11: 128 The received packet is transferred to the application or
- DMA when the packet size within the MTL Rx queue is larger than the
threshold. In addition, full packets with length less than the threshold are automatically transferred. The value of 11 is not applicable if the size of the configured Rx Queue is 128 bytes. This field is valid only when the RSF bit is zero. This field is ignored when the RSF bit is set to 1.
- MGBE_DWCXG_MTL_TCQ1_MTL_RXQ1_MISSED_PKT_OVERFLOW_CNT_0
- The Queue 1 Overflow Counter register contains the counter for packets missed because of
Receive queue packet flush and packets discarded because of Receive queue overflow.
- Offset: 0x11c4
- Read/Write: RO
- Parity Protection: N

10G Ethernet Controller Core Registers cont'd 1
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 MISCNTOVF:
- Missed Packet Counter Overflow Bit. When set, this bit indicates that the
Rx Queue Missed Packet Counter crossed the maximum limit. 30:27 0x0 Reserved_30_27: Reserved. 26:16 0x0 MISPKTCNT:
- Missed Packet Counter. This field indicates the number of packets missed
by DWC_xgmac because the application asserted ari_pkt_flush_i[] for this queue. This counter is incremented each time the application issues ari_pkt_flush_i[] for this queue. This counter is reset when this register is read with mci_be_i[0] at 1'b1. 0x0 OVFCNTOVF:
- Overflow Counter Overflow Bit. When set, this bit indicates that the Rx
Queue Overflow Packet Counter field crossed the maximum limit. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 OVFPKTCNT:
- Overflow Packet Counter. This field indicates the number of packets
discarded by DWC_xgmac because of Receive queue overflow. This counter is incremented each time DWC_xgmac discards an incoming packet because of overflow. This counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ1_MTL_RXQ1_DEBUG_0
- The Queue 1 Receive Debug register gives the debug status of various blocks related to the
Receive queue.
- Offset: 0x11c8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:30 0x0 Reserved_31_30: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
29:16 0x0 PRXQ:
- Number of Packets in Receive Queue. This field indicates the current
number of packets in the Rx Queue. The theoretical maximum value for this field is 256KB/16B = 16K Packets, that is, Max_Queue_Size/ Min_Packet_Size. 15:6 0x0 Reserved_15_6: Reserved. 5:4 0x0 RXQSTS:
- MTL Rx Queue Fill-Level Status. This field gives the status of the fill-level of
the Rx Queue: - 2'b00: Rx Queue empty - 2'b01: Rx Queue fill-level below flow-control deactivate threshold - 2'b10: Rx Queue fill-level above flow- control activate threshold - 2'b11: Rx Queue full 0x0 Reserved_3: Reserved. 2:1 0x0 RRCSTS:
- MTL Rx Queue Read Controller State. This field gives the state of the Rx
queue Read controller: - 2'b00: Idle state - 2'b01: Reading packet data - 2'b10: Reading packet status (or timestamp) - 2'b11: Flushing the packet data and status 0x0 RWCSTS:
- MTL Rx Queue Write Controller Active Status. When high, this bit indicates
that the MTL Rx queue Write controller is active, and it is transferring a received packet to the Rx Queue.
- MGBE_DWCXG_MTL_TCQ1_MTL_RXQ1_CONTROL_0
The Queue 1 Receive Control register controls the receive arbitration and passing of received packets to the application.
- Offset: 0x11cc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:4
- RO
0x0 Reserved_31_4: Reserved.
- RW
0x0 RXQ_PKT_ARBIT:
- Receive Queue Packet Arbitration Control. When this bit is set, the
- MTL enables the packet-level arbitration. When this bit is reset, the
MTL enables the PBL based arbitration.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
2:0
- RW
0x0 RXQ_WEGT:
- Receive Queue Weight. This field indicates the weight assigned to
the Rx Queue 1. The weight is used as the number of continuous
- PBL requests or contiguous packets (depending on the
RXQ_PKT_ARBIT) allocated to the queue in one arbitration cycle.
- MGBE_DWCXG_MTL_TCQ1_MTL_RXQ1_FLOW_CONTROL_0
This register controls the activation and de-activation threshold in the queue for PAUSE/PFC flow control.
- Offset: 0x11d0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:23
- RO
0x0 Reserved_31_y: Reserved. 22:17
- RW
0x0 RFD:
- Threshold for deactivating Flow Control. These bits control the
threshold (fill-level of RxQ0) at which the flow control is de-asserted once it is activated. - 6'b000000: RQS value minus 1 KB, that is, FULL - 1024 bytes - 6'b000001: RQS value minus 1.5 KB, that is, FULL - 1536 bytes - 6'b000010: RQS value minus 2 KB, that is, FULL - 2048 bytes.
- ... - 6'b111111: RQS value minus 32.5 KB, that is, FULL - 33280 bytes
- The de-assertion is effective only after flow control is asserted as per
the setting of RFA field. Note that the value to be programmed should be such that the threshold is positive number. 16:7
- RO
0x0 Reserved_16_y: Reserved. 6:1
- RW
0x0 RFA:
- Threshold for activating Flow Control. These bits control the threshold
(fill-level of RxQ0) at which the flow control is activated - 6'b000000:
- RQS value minus 1 KB, that is, FULL - 1024 bytes - 6'b000001: RQS
value minus 1.5 KB, that is, FULL - 1536 bytes - 6'b000010: RQS value minus 2 KB, that is, FULL - 2048 bytes. - ... - 6'b111111: RQS value minus 32.5 KB, that is, FULL - 33280 bytes The flow control is triggered when EHFC=1 and the queue size (RQS value in MTL_RxQ1_Operation
- Mode register) is equal to or more than 4KB. Note that the value to be
programmed in RFA should be such that the threshold is positive number.
- RO
0x0 Reserved_0: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_TCQ1_MTL_Q1_INTERRUPT_ENABLE_0
This register contains the interrupt enable bits for Traffic class/Queue 1.
- Offset: 0x11f0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RW
0x0 RXOIE:
- Receive Queue Overflow Interrupt Enable. - 1: Receive Queue
- Overflow interrupt is enabled. - 0: Receive Queue Overflow interrupt
is disabled. 15:2
- RO
0x0 Reserved_15_2: Reserved.
- RW
0x0 ABPSIE:
- Average Bits Per Slot Interrupt Enable. When this bit is set, average
bits per slot interrupt is enabled for Traffic Class 1. An interrupt is generated when the average bits per slot status is updated for this traffic class. This bit is reserved and RO when the number of traffic classes selected is less than 1. This field in the corresponding Queues 8 - 15 registers is always reserved.
- RW
0x0 TXUIE:
- Transmit Queue Underflow Interrupt Enable. - 1: Transmit Queue
- Underflow interrupt is enabled. - 0: Transmit Queue Underflow
interrupt is disabled.
- MGBE_DWCXG_MTL_TCQ1_MTL_Q1_INTERRUPT_STATUS_0
This register contains the interrupt status bits for Traffic class/Queue 1.
- Offset: 0x11f4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RW
0x0 RXOVFIS:
- Receive Queue Overflow Interrupt Status. This bit indicates that the
- Receive Queue had an Overflow during packet reception. If partial
packet is transferred to the application, the overflow status is set in the corresponding Rx status. This bit is cleared when the application writes a 1 to this bit. 15:2
- RO
0x0 Reserved_15_2: Reserved.
- RW
0x0 ABPSIS:
- Average Bits Per Slot Interrupt Status. When set, this bit indicates
that the MAC has updated the ABS value for this traffic class. This bit is cleared when the application writes a 1 to this bit. This bit is reserved and RO when the number of traffic classes selected is less than 1. This field in corresponding Queues 8 - 15 registers is reserved and RO.
- RW
0x0 TXUNFIS:
- Transmit Queue Underflow Interrupt Status. This bit indicates that
the Transmit Queue had an Underflow during packet transmission. Transmission is suspended and an Underflow Error TDES3[2] is set. This bit is cleared when the application writes a 1 to this bit.
- MGBE_DWCXG_MTL_TCQ2_MTL_TXQ2_OPERATION_MODE_0
The Queue 2 Transmit Operation Mode register establishes the Transmit queue operating modes and commands.
- Offset: 0x1200
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
25:16
- RW
0x0 TQS:
- Transmit Queue Size. This field indicates the size of the allocated
- Transmit queues in blocks of 256 bytes. The sixteenth bit is the
starting bit of this field. The width of this field depends on the Tx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) =
- LOG2(8) = 3 bits A value of 0 indicates 256 bytes. When this queue is
enabled (TXQEN=10), a minimum value of 7 (size = 2048) is recommended so that the queue can store more than a complete max- sized Ethernet packet. This field is reserved and RO in single queue configuration, and its reset value corresponds to the transmit FIFO size 15:11
- RO
0x0 Reserved_15_y: Reserved. 10:8
- RW
0x0 Q2TCMAP:
- Queue to Traffic Class Mapping. This field is used to map Queue0 to a
traffic class (TC). The actual width of this field depends on the number of traffic classes selected during configuration. - 3'b000: TC0 - 3'b001: TC1 - 3'b010: TC2 - 3'b011: TC3 - 3'b100: TC4 - 3'b101: TC5 - 3'b110:
- TC6 - 3'b111: TC7
- RO
0x0 Reserved_7: Reserved. 6:4
- RW
0x0 TTC:
- Transmit Threshold Control. These bits control the threshold level of
the MTL Tx Queue. Transmission starts when the packet size within the
- MTL Tx Queue is larger than the threshold. In addition, full packets
with length less than the threshold are also transmitted. These bits are used only when the TSF bit is reset. - 3'b000: 64 - 3'b001: Reserved - 3'b010: 96 - 3'b011: 128 - 3'b100: 192 - 3'b101: 256 - 3'b110: 384 - 3'b111: 512 3:2
- RW
0x0 TXQEN:
- Transmit Queue Enable. This field is used to enable/disable the
transmit queue. - 2'b00: Not enabled - 2'b01: Audio Video Bridging - 2'b10: Enabled - 2'b11: Reserved The queue is enabled by default in single queue configuration. Therefore, this field is reserved when the number of transmit queues selected is one and has a reset value of 2'b10. In multiple Tx queues configuration, all the queues are disabled by default. Enable the Tx queue by programming this field.
- RW
0x0 TSF:
- Transmit Store and Forward. When this bit is set, the transmission
starts when a full packet resides in the MTL Tx Queue. When this bit is set, the values specified in the TTC field are ignored. This bit should be changed only when the transmission is stopped.
- RW
0x0 FTQ:
- Flush Transmit Queue. When this bit is set, the Tx Queue Controller
logic is reset to its default values. Therefore, all the data in the Tx queue is lost or flushed. This bit is internally reset when the flushing operation is complete. You should not write to this register until this bit is reset. The data which is already accepted by the MAC transmitter is not flushed. It is scheduled for transmission and results in underflow and runt packet transmission. Note: The flush operation is complete only when the Tx queue is empty. To complete this flush operation, the PHY Tx clock (clk_tx_312pt5_i) must be active.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_TCQ2_MTL_TXQ2_UNDERFLOW_0
- The Queue 2 Underflow Counter register contains the counter for packets aborted because of
Transmit queue underflow.
- Offset: 0x1204
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0x0 Reserved_31_16: Reserved. 0x0 UFCNTOVF:
- Overflow Bit for Underflow Packet Counter. This bit is set every time the Tx
- Queue Underflow Packet Counter field overflows, that is, it has crossed the
maximum count. In such a scenario, the overflow packet counter is reset to all-zeros and this bit indicates that the rollover happened. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 UFPKTCNT:
- Underflow Packet Counter. This field indicates the number of packets
aborted by the controller because of Transmit Queue Underflow. This counter is incremented each time the MAC aborts an outgoing packet because of underflow. The counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ2_MTL_TXQ2_DEBUG_0
The Queue 2 Transmit Debug register gives the debug status of various blocks related to the Transmit Queue 2 and Traffic Class 0.
- Offset: 0x1208
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:6 0x0 Reserved_31_6: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 TRCPSTS:
- MTL TRC Pending Status When this bit is high, it indicates that the MTL Tx
Read Controller (TRC) has a pending status from MAC. 0x0 TXQSTS:
- MTL Tx Queue Not Empty Status. When this bit is high, it indicates that the
MTL Tx Queue is not empty and some data is left for transmission. 0x0 TWCSTS:
- MTL Tx Queue Write Controller Status. When high, this bit indicates that the
- MTL Tx Queue Write Controller is active, and it is transferring the data to the
Tx Queue. 2:1 0x0 TRCSTS:
- MTL Tx Queue Read Controller Status. This field indicates the state of the Tx
- Queue Read Controller: - 2'b00: Idle state - 2'b01: Read state (transferring
data to the MAC transmitter) - 2'b10: Waiting for pending Tx Status from the
- MAC transmitter - 2'b11: Flushing the Tx queue because of the Packet Abort
request from the MAC 0x0 TCPAUSED:
- Traffic Class in Pause. When this bit is high and the Rx flow control is enabled,
it indicates that the Traffic Class 0 is in the Pause condition because of the following: - Reception of the PFC packet for the priorities assigned to the
- Traffic Class 0 when PFC is enabled - Reception of IEEE 802.3-2018 Pause
packet when Priority Based Flow Control (PFC) is disabled
- MGBE_DWCXG_MTL_TCQ2_MTL_TC2_ETS_CONTROL_0
This register configures the transmission selection algorithm, for Traffic Class 0.This register is not available in single traffic class configuration.
- Offset: 0x1210
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:7
- RO
0x0 Reserved_31_7: Reserved. 6:4
- RW
0x0 SLC:
- Slot Count. If the credit-based shaper algorithm is enabled, the
software can program the number of slots (of 125 us duration) over which the average transmitted bits per slot, provided in the
- MTL_TC<n>_ETS_Status register, need to be computed for TC<n>. The
encoding is as follows: - 3'b000: 1 Slot - 3'b001: 2 Slots - 3'b010: 4 Slots
- 3'b011: 8 Slots - 3'b100: 16 Slots - 3'b101-3'b111: Reserved

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 CC:
- Credit Control. When this bit is set, the accumulated credit parameter
in the credit-based shaper algorithm logic is not reset to zero when there is positive credit and no packet to transmit in TC<n>. The credit accumulates even when there is no packet waiting in TC<n> and another TC is transmitting. When this bit is reset, the accumulated credit parameter in the credit-based shaper algorithm logic is set to zero when there is positive credit and no packet to transmit in TC<n>.
- When there is no packet waiting in TC<n> and other TC is transmitting,
no credit is accumulated.
- RO
0x0 CBSEN:
- Credit Based Shaper Enable This field indicates that TSA field of this
register is enabled for CBS 1:0
- RW
0x0 TSA:
- Transmission Selection Algorithm. This field is used to assign a
transmission selection algorithm for this traffic class. - 2'b00: Strict priority - 2'b01: CBS - 2'b10: ETS - 2'b11: Reserved
- MGBE_DWCXG_MTL_TCQ2_MTL_TC2_ETS_STATUS_0
This register contains the information of average bits transmitted over a slot interval of 10 million bit times, for Traffic Class 0.
- Offset: 0x1214
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 Reserved_31_24: Reserved. 23:0 0x0 ABS:
- Average Bits per Slot. This field contains the average transmitted bits per
slot computed over every slot of 10 million bit times (1ms in 10G mode, 10ms in 1G mode). The maximum value is 0x989680.
- MGBE_DWCXG_MTL_TCQ2_MTL_TC2_QUANTUM_WEIGHT_0
The TC1 Quantum or Weights register provides the average traffic transmitted in Traffic Class 1. For TCn, where n = 1 to 7, this register is not available when the number of traffic classes selected is less than n + 1 This register is not available in corresponding Queues 8-15 registers.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0x1218
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:21
- RO
0x0 Reserved_31_21: Reserved. 20:0
- RW
0x0 QW: idleSlopeCredit, Quantum or Weights. - idleSlopeCredit -- When Audio
- Video Bridging feature is enabled, this field contains the idleSlopeCredit
value required for the credit-based shaper algorithm for Queue 1. This is the rate of change of credit in bits per cycle (3.2 ns for 2.5/10 Gbps; 8 ns for 1000 Mbps) when the credit is increasing. The software should program this field with computed credit in bits per cycle scaled by 1024.
- The maximum value is portTransmitRate, that is, 0x2000 in 1000/2500
- Mbps mode and 0x8000 in 10 Gbps mode. Bits[20:16] must be written to
zero. - Quantum -- When the TSA is set to ETS and ETSALG is set to DWRR algorithm for Traffic Class 1 traffic, this field contains the quantum value in bytes to be added to credit during every queue scanning cycle. The maximum value is 0x1312D0 bytes. - Weights -- When TSA is set to ETS and ETSALG is set to WFQ algorithm for Traffic Class1 traffic, this field contains the weight for this queue. The maximum value is 0x3FFF where weight of 0 indicates 100% bandwidth. Bits [20:14] must be written to zero. -- When TSA is set to ETS and ETSALG is set to WRR algorithm for
- Traffic Class 1 traffic, this field contains the weight for this queue. The
maximum value is 0x64. Bits[20:7] must be written to zero. This field is reserved and RO when the number of traffic classes selected is less than two. This field is reserved in corresponding Queues 8-15 register.
- MGBE_DWCXG_MTL_TCQ2_MTL_TC2_SENDSLOPECREDIT_0
MTL registers for traffic classes and queues 1 registers.
- Offset: 0x121c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
15:0
- RW
0x0 SSC: sendSlopeCredit Value. - When Audio Video Bridging operation is enabled, this field contains the sendSlopeCredit value required for credit-based shaper algorithm for TC<n>. The software should program this field with computed credit in bits per cycle scaled by 1024. This field should be programmed with absolute sendSlopeCredit value. The credit-based shaper logic subtracts it from the accumulated credit when TC<n> is selected for transmission. See the application note for more details on programming this value.
- MGBE_DWCXG_MTL_TCQ2_MTL_TC2_HICREDIT_0
This register contains the hiCredit value required for the credit-based shaper algorithm for TC1.
- Offset: 0x1220
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved. 28:0
- RW
0x0 HC: hiCredit Value. - When the Audio Video Bridging feature is enabled, this field contains the hiCredit value required for the credit-based shaper algorithm. This is the maximum value that can be accumulated in the credit parameter. This is specified in bits scaled by 1024. The maximum value is maxInterferenceSize, that is, best- effort maximum packet size (16384 bytes or 131072 bits). The value to be specified is 131072 * 1024 = 134217728 or 0x0800_0000
- MGBE_DWCXG_MTL_TCQ2_MTL_TC2_LOCREDIT_0
This register contains the loCredit value required for the credit-based shaper algorithm for TC1.
- Offset: 0x1224
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved. 28:0
- RW
0x0 LC: loCredit Value. - When Audio Video Bridging operation is enabled, this field contains the loCredit value required for the credit-based shaper algorithm. This is the minimum value that can be accumulated in the credit parameter. This is specified in bits scaled by 1024. The maximum value is maxPacketSize transmitted from this queue, that is, 16384 * 8 * 1024 = 134217728 or 0x0800_0000. Because it is a negative value, the programmed value is twos complement of the value, that is, 0x1800_0000.
- MGBE_DWCXG_MTL_TCQ2_MTL_RXQ2_OPERATION_MODE_0
The Queue 2 Receive Operation Mode register establishes the Receive queue operating modes and command.
- Offset: 0x1240
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved. 25:16
- RW
0x0 RQS:
- Receive Queue Size. This field indicates the size of the allocated
- Receive queues in blocks of 256 bytes. The sixteenth bit is the starting
bit of this field. The width of this field depends on the Rx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) = LOG2(8) = 3 bits A value of 0 indicates 256 bytes. This field is reserved and RO in single queue configuration, and its reset value corresponds to the receive
- FIFO size. When this queue is used, a minimum value of 7 (size = 2048)
is recommended so that the queue can store more than a complete max-sized Ethernet packet. 15:8
- RO
0x0 Reserved_15_8: Reserved.
- RW
0x0 EHFC:
- Enable Hardware Flow Control. When this bit is set, the flow control
signal operation, based on the fill-level of Rx queue, is enabled. When reset, the flow control operation is disabled. This bit is not used (reserved and always reset) when the Rx queue is less than 4 KB.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 DIS_TCP_EF:
- Disable Dropping of TCP/IP Checksum Error Packets. - When this bit is
set, the MAC does not drop the packets which only have the errors detected by the Receive Checksum Offload engine. Such packets have errors only in the encapsulated payload. There are no errors (including
- FCS error) in the Ethernet packet received by the MAC. - When this bit
is reset, all error packets are dropped if the FEF bit is reset.
- RW
0x0 RSF:
- Receive Queue Store and Forward. When this bit is set, DWC_xgmac
reads a packet from the Rx queue only after the complete packet has been written to it, ignoring the RTC field of this register. When this bit is reset, the Rx queue operates in the Threshold (cut-through) mode, subject to the threshold specified by the RTC field of this register.
- RW
0x0 FEF:
- Forward Error Packets. - When this bit is reset, the Rx queue drops
packets with error status (CRC error, GMII_ER, watchdog timeout, or overflow). However, if the start byte (write) pointer of a packet is already transferred to the read controller side (in Threshold mode), the packet is not dropped. - When this bit is set, all packets except the runt error packets are forwarded to the application or DMA. If the RSF bit is set and the Rx queue overflows when a partial packet is written, the packet is dropped irrespective of the setting of this bit. However, if the RSF bit is reset and the Rx queue overflows when a partial packet is written, a partial packet might be forwarded to the application or DMA.
- RW
0x0 FUF:
- Forward Undersized Good Packets. When this bit is set, the Rx queue
forwards the undersized good packets (with no Invalid-code/GMII/CRC/
- Length errors and length less than 64 bytes at Rx (X)GMII interface),
including pad-bytes and CRC. When this bit is reset, the Rx queue drops all packets of length less than 64 bytes.
- RO
0x0 Reserved_2: Reserved. 1:0
- RW
0x0 RTC:
- Receive Queue Threshold Control. These bits control the threshold level
of the MTL Rx queue (in bytes): - 2'b00: 64 - 2'b01: Reserved - 2'b10: 96
- 2'b11: 128 The received packet is transferred to the application or
- DMA when the packet size within the MTL Rx queue is larger than the
threshold. In addition, full packets with length less than the threshold are automatically transferred. The value of 11 is not applicable if the size of the configured Rx Queue is 128 bytes. This field is valid only when the RSF bit is zero. This field is ignored when the RSF bit is set to 1.
- MGBE_DWCXG_MTL_TCQ2_MTL_RXQ2_MISSED_PKT_OVERFLOW_CNT_0
- The Queue 2 Overflow Counter register contains the counter for packets missed because of
Receive queue packet flush and packets discarded because of Receive queue overflow.
- Offset: 0x1244
- Read/Write: RO
- Parity Protection: N

10G Ethernet Controller Core Registers cont'd 1
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 MISCNTOVF:
- Missed Packet Counter Overflow Bit. When set, this bit indicates that the
Rx Queue Missed Packet Counter crossed the maximum limit. 30:27 0x0 Reserved_30_27: Reserved. 26:16 0x0 MISPKTCNT:
- Missed Packet Counter. This field indicates the number of packets missed
by DWC_xgmac because the application asserted ari_pkt_flush_i[] for this queue. This counter is incremented each time the application issues ari_pkt_flush_i[] for this queue. This counter is reset when this register is read with mci_be_i[0] at 1'b1. 0x0 OVFCNTOVF:
- Overflow Counter Overflow Bit. When set, this bit indicates that the Rx
Queue Overflow Packet Counter field crossed the maximum limit. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 OVFPKTCNT:
- Overflow Packet Counter. This field indicates the number of packets
discarded by DWC_xgmac because of Receive queue overflow. This counter is incremented each time DWC_xgmac discards an incoming packet because of overflow. This counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ2_MTL_RXQ2_DEBUG_0
- The Queue 2 Receive Debug register gives the debug status of various blocks related to the
Receive queue.
- Offset: 0x1248
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:30 0x0 Reserved_31_30: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
29:16 0x0 PRXQ:
- Number of Packets in Receive Queue. This field indicates the current
number of packets in the Rx Queue. The theoretical maximum value for this field is 256KB/16B = 16K Packets, that is, Max_Queue_Size/ Min_Packet_Size. 15:6 0x0 Reserved_15_6: Reserved. 5:4 0x0 RXQSTS:
- MTL Rx Queue Fill-Level Status. This field gives the status of the fill-level of
the Rx Queue: - 2'b00: Rx Queue empty - 2'b01: Rx Queue fill-level below flow-control deactivate threshold - 2'b10: Rx Queue fill-level above flow- control activate threshold - 2'b11: Rx Queue full 0x0 Reserved_3: Reserved. 2:1 0x0 RRCSTS:
- MTL Rx Queue Read Controller State. This field gives the state of the Rx
queue Read controller: - 2'b00: Idle state - 2'b01: Reading packet data - 2'b10: Reading packet status (or timestamp) - 2'b11: Flushing the packet data and status 0x0 RWCSTS:
- MTL Rx Queue Write Controller Active Status. When high, this bit indicates
that the MTL Rx queue Write controller is active, and it is transferring a received packet to the Rx Queue.
- MGBE_DWCXG_MTL_TCQ2_MTL_RXQ2_CONTROL_0
The Queue 2 Receive Control register controls the receive arbitration and passing of received packets to the application.
- Offset: 0x124c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:4
- RO
0x0 Reserved_31_4: Reserved.
- RW
0x0 RXQ_PKT_ARBIT:
- Receive Queue Packet Arbitration Control. When this bit is set, the
- MTL enables the packet-level arbitration. When this bit is reset, the
MTL enables the PBL based arbitration.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
2:0
- RW
0x0 RXQ_WEGT:
- Receive Queue Weight. This field indicates the weight assigned to
the Rx Queue 2. The weight is used as the number of continuous
- PBL requests or contiguous packets (depending on the
RXQ_PKT_ARBIT) allocated to the queue in one arbitration cycle.
- MGBE_DWCXG_MTL_TCQ2_MTL_RXQ2_FLOW_CONTROL_0
This register controls the activation and de-activation threshold in the queue for PAUSE/PFC flow control.
- Offset: 0x1250
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:23
- RO
0x0 Reserved_31_y: Reserved. 22:17
- RW
0x0 RFD:
- Threshold for deactivating Flow Control. These bits control the
threshold (fill-level of RxQ0) at which the flow control is de-asserted once it is activated. - 6'b000000: RQS value minus 1 KB, that is, FULL - 1024 bytes - 6'b000001: RQS value minus 1.5 KB, that is, FULL - 1536 bytes - 6'b000010: RQS value minus 2 KB, that is, FULL - 2048 bytes.
- ... - 6'b111111: RQS value minus 32.5 KB, that is, FULL - 33280 bytes
- The de-assertion is effective only after flow control is asserted as per
the setting of RFA field. Note that the value to be programmed should be such that the threshold is positive number. 16:7
- RO
0x0 Reserved_16_y: Reserved. 6:1
- RW
0x0 RFA:
- Threshold for activating Flow Control. These bits control the threshold
(fill-level of RxQ0) at which the flow control is activated - 6'b000000:
- RQS value minus 1 KB, that is, FULL - 1024 bytes - 6'b000001: RQS
value minus 1.5 KB, that is, FULL - 1536 bytes - 6'b000010: RQS value minus 2 KB, that is, FULL - 2048 bytes. - ... - 6'b111111: RQS value minus 32.5 KB, that is, FULL - 33280 bytes The flow control is triggered when EHFC=1 and the queue size (RQS value in MTL_RxQ2_Operation
- Mode register) is equal to or more than 4KB. Note that the value to be
programmed in RFA should be such that the threshold is positive number.
- RO
0x0 Reserved_0: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_TCQ2_MTL_Q2_INTERRUPT_ENABLE_0
This register contains the interrupt enable bits for Traffic class/Queue 2.
- Offset: 0x1270
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RW
0x0 RXOIE:
- Receive Queue Overflow Interrupt Enable. - 1: Receive Queue
- Overflow interrupt is enabled. - 0: Receive Queue Overflow interrupt
is disabled. 15:2
- RO
0x0 Reserved_15_2: Reserved.
- RW
0x0 ABPSIE:
- Average Bits Per Slot Interrupt Enable. When this bit is set, average
bits per slot interrupt is enabled for Traffic Class 2. An interrupt is generated when the average bits per slot status is updated for this traffic class. This bit is reserved and RO when the number of traffic classes selected is less than 2. This field in the corresponding Queues 8 - 15 registers is always reserved.
- RW
0x0 TXUIE:
- Transmit Queue Underflow Interrupt Enable. - 1: Transmit Queue
- Underflow interrupt is enabled. - 0: Transmit Queue Underflow
interrupt is disabled.
- MGBE_DWCXG_MTL_TCQ2_MTL_Q2_INTERRUPT_STATUS_0
This register contains the interrupt status bits for Traffic class/Queue 2.
- Offset: 0x1274
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RW
0x0 RXOVFIS:
- Receive Queue Overflow Interrupt Status. This bit indicates that the
- Receive Queue had an Overflow during packet reception. If partial
packet is transferred to the application, the overflow status is set in the corresponding Rx status. This bit is cleared when the application writes a 1 to this bit. 15:2
- RO
0x0 Reserved_15_2: Reserved.
- RW
0x0 ABPSIS:
- Average Bits Per Slot Interrupt Status. When set, this bit indicates
that the MAC has updated the ABS value for this traffic class. This bit is cleared when the application writes a 1 to this bit. This bit is reserved and RO when the number of traffic classes selected is less than 2. This field in corresponding Queues 8 - 15 registers is reserved and RO.
- RW
0x0 TXUNFIS:
- Transmit Queue Underflow Interrupt Status. This bit indicates that
the Transmit Queue had an Underflow during packet transmission. Transmission is suspended and an Underflow Error TDES3[2] is set. This bit is cleared when the application writes a 1 to this bit.
- MGBE_DWCXG_MTL_TCQ3_MTL_TXQ3_OPERATION_MODE_0
The Queue 3 Transmit Operation Mode register establishes the Transmit queue operating modes and commands.
- Offset: 0x1280
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
25:16
- RW
0x0 TQS:
- Transmit Queue Size. This field indicates the size of the allocated
- Transmit queues in blocks of 256 bytes. The sixteenth bit is the
starting bit of this field. The width of this field depends on the Tx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) =
- LOG2(8) = 3 bits A value of 0 indicates 256 bytes. When this queue is
enabled (TXQEN=10), a minimum value of 7 (size = 2048) is recommended so that the queue can store more than a complete max- sized Ethernet packet. This field is reserved and RO in single queue configuration, and its reset value corresponds to the transmit FIFO size 15:11
- RO
0x0 Reserved_15_y: Reserved. 10:8
- RW
0x0 Q2TCMAP:
- Queue to Traffic Class Mapping. This field is used to map Queue0 to a
traffic class (TC). The actual width of this field depends on the number of traffic classes selected during configuration. - 3'b000: TC0 - 3'b001: TC1 - 3'b010: TC2 - 3'b011: TC3 - 3'b100: TC4 - 3'b101: TC5 - 3'b110:
- TC6 - 3'b111: TC7
- RO
0x0 Reserved_7: Reserved. 6:4
- RW
0x0 TTC:
- Transmit Threshold Control. These bits control the threshold level of
the MTL Tx Queue. Transmission starts when the packet size within the
- MTL Tx Queue is larger than the threshold. In addition, full packets
with length less than the threshold are also transmitted. These bits are used only when the TSF bit is reset. - 3'b000: 64 - 3'b001: Reserved - 3'b010: 96 - 3'b011: 128 - 3'b100: 192 - 3'b101: 256 - 3'b110: 384 - 3'b111: 512 3:2
- RW
0x0 TXQEN:
- Transmit Queue Enable. This field is used to enable/disable the
transmit queue. - 2'b00: Not enabled - 2'b01: Audio Video Bridging - 2'b10: Enabled - 2'b11: Reserved The queue is enabled by default in single queue configuration. Therefore, this field is reserved when the number of transmit queues selected is one and has a reset value of 2'b10. In multiple Tx queues configuration, all the queues are disabled by default. Enable the Tx queue by programming this field.
- RW
0x0 TSF:
- Transmit Store and Forward. When this bit is set, the transmission
starts when a full packet resides in the MTL Tx Queue. When this bit is set, the values specified in the TTC field are ignored. This bit should be changed only when the transmission is stopped.
- RW
0x0 FTQ:
- Flush Transmit Queue. When this bit is set, the Tx Queue Controller
logic is reset to its default values. Therefore, all the data in the Tx queue is lost or flushed. This bit is internally reset when the flushing operation is complete. You should not write to this register until this bit is reset. The data which is already accepted by the MAC transmitter is not flushed. It is scheduled for transmission and results in underflow and runt packet transmission. Note: The flush operation is complete only when the Tx queue is empty. To complete this flush operation, the PHY Tx clock (clk_tx_312pt5_i) must be active.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_TCQ3_MTL_TXQ3_UNDERFLOW_0
- The Queue 3 Underflow Counter register contains the counter for packets aborted because of
Transmit queue underflow.
- Offset: 0x1284
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0x0 Reserved_31_16: Reserved. 0x0 UFCNTOVF:
- Overflow Bit for Underflow Packet Counter. This bit is set every time the Tx
- Queue Underflow Packet Counter field overflows, that is, it has crossed the
maximum count. In such a scenario, the overflow packet counter is reset to all-zeros and this bit indicates that the rollover happened. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 UFPKTCNT:
- Underflow Packet Counter. This field indicates the number of packets
aborted by the controller because of Transmit Queue Underflow. This counter is incremented each time the MAC aborts an outgoing packet because of underflow. The counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ3_MTL_TXQ3_DEBUG_0
The Queue 3 Transmit Debug register gives the debug status of various blocks related to the Transmit Queue 3 and Traffic Class 0.
- Offset: 0x1288
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:6 0x0 Reserved_31_6: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 TRCPSTS:
- MTL TRC Pending Status When this bit is high, it indicates that the MTL Tx
Read Controller (TRC) has a pending status from MAC. 0x0 TXQSTS:
- MTL Tx Queue Not Empty Status. When this bit is high, it indicates that the
MTL Tx Queue is not empty and some data is left for transmission. 0x0 TWCSTS:
- MTL Tx Queue Write Controller Status. When high, this bit indicates that the
- MTL Tx Queue Write Controller is active, and it is transferring the data to the
Tx Queue. 2:1 0x0 TRCSTS:
- MTL Tx Queue Read Controller Status. This field indicates the state of the Tx
- Queue Read Controller: - 2'b00: Idle state - 2'b01: Read state (transferring
data to the MAC transmitter) - 2'b10: Waiting for pending Tx Status from the
- MAC transmitter - 2'b11: Flushing the Tx queue because of the Packet Abort
request from the MAC 0x0 TCPAUSED:
- Traffic Class in Pause. When this bit is high and the Rx flow control is enabled,
it indicates that the Traffic Class 0 is in the Pause condition because of the following: - Reception of the PFC packet for the priorities assigned to the
- Traffic Class 0 when PFC is enabled - Reception of IEEE 802.3-2018 Pause
packet when Priority Based Flow Control (PFC) is disabled
- MGBE_DWCXG_MTL_TCQ3_MTL_TC3_ETS_CONTROL_0
This register configures the transmission selection algorithm, for Traffic Class 0.This register is not available in single traffic class configuration.
- Offset: 0x1290
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:7
- RO
0x0 Reserved_31_7: Reserved. 6:4
- RW
0x0 SLC:
- Slot Count. If the credit-based shaper algorithm is enabled, the
software can program the number of slots (of 125 us duration) over which the average transmitted bits per slot, provided in the
- MTL_TC<n>_ETS_Status register, need to be computed for TC<n>. The
encoding is as follows: - 3'b000: 1 Slot - 3'b001: 2 Slots - 3'b010: 4 Slots
- 3'b011: 8 Slots - 3'b100: 16 Slots - 3'b101-3'b111: Reserved

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 CC:
- Credit Control. When this bit is set, the accumulated credit parameter
in the credit-based shaper algorithm logic is not reset to zero when there is positive credit and no packet to transmit in TC<n>. The credit accumulates even when there is no packet waiting in TC<n> and another TC is transmitting. When this bit is reset, the accumulated credit parameter in the credit-based shaper algorithm logic is set to zero when there is positive credit and no packet to transmit in TC<n>.
- When there is no packet waiting in TC<n> and other TC is transmitting,
no credit is accumulated.
- RO
0x0 CBSEN:
- Credit Based Shaper Enable This field indicates that TSA field of this
register is enabled for CBS 1:0
- RW
0x0 TSA:
- Transmission Selection Algorithm. This field is used to assign a
transmission selection algorithm for this traffic class. - 2'b00: Strict priority - 2'b01: CBS - 2'b10: ETS - 2'b11: Reserved
- MGBE_DWCXG_MTL_TCQ3_MTL_TC3_ETS_STATUS_0
This register contains the information of average bits transmitted over a slot interval of 10 million bit times, for Traffic Class 0.
- Offset: 0x1294
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 Reserved_31_24: Reserved. 23:0 0x0 ABS:
- Average Bits per Slot. This field contains the average transmitted bits per
slot computed over every slot of 10 million bit times (1ms in 10G mode, 10ms in 1G mode). The maximum value is 0x989680.
- MGBE_DWCXG_MTL_TCQ3_MTL_TC3_QUANTUM_WEIGHT_0
The TC1 Quantum or Weights register provides the average traffic transmitted in Traffic Class 1. For TCn, where n = 1 to 7, this register is not available when the number of traffic classes selected is less than n + 1 This register is not available in corresponding Queues 8-15 registers.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0x1298
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:21
- RO
0x0 Reserved_31_21: Reserved. 20:0
- RW
0x0 QW: idleSlopeCredit, Quantum or Weights. - idleSlopeCredit -- When Audio
- Video Bridging feature is enabled, this field contains the idleSlopeCredit
value required for the credit-based shaper algorithm for Queue 1. This is the rate of change of credit in bits per cycle (3.2 ns for 2.5/10 Gbps; 8 ns for 1000 Mbps) when the credit is increasing. The software should program this field with computed credit in bits per cycle scaled by 1024.
- The maximum value is portTransmitRate, that is, 0x2000 in 1000/2500
- Mbps mode and 0x8000 in 10 Gbps mode. Bits[20:16] must be written to
zero. - Quantum -- When the TSA is set to ETS and ETSALG is set to DWRR algorithm for Traffic Class 1 traffic, this field contains the quantum value in bytes to be added to credit during every queue scanning cycle. The maximum value is 0x1312D0 bytes. - Weights -- When TSA is set to ETS and ETSALG is set to WFQ algorithm for Traffic Class1 traffic, this field contains the weight for this queue. The maximum value is 0x3FFF where weight of 0 indicates 100% bandwidth. Bits [20:14] must be written to zero. -- When TSA is set to ETS and ETSALG is set to WRR algorithm for
- Traffic Class 1 traffic, this field contains the weight for this queue. The
maximum value is 0x64. Bits[20:7] must be written to zero. This field is reserved and RO when the number of traffic classes selected is less than two. This field is reserved in corresponding Queues 8-15 register.
- MGBE_DWCXG_MTL_TCQ3_MTL_TC3_SENDSLOPECREDIT_0
MTL registers for traffic classes and queues 1 registers.
- Offset: 0x129c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
15:0
- RW
0x0 SSC: sendSlopeCredit Value. - When Audio Video Bridging operation is enabled, this field contains the sendSlopeCredit value required for credit-based shaper algorithm for TC<n>. The software should program this field with computed credit in bits per cycle scaled by 1024. This field should be programmed with absolute sendSlopeCredit value. The credit-based shaper logic subtracts it from the accumulated credit when TC<n> is selected for transmission. See the application note for more details on programming this value.
- MGBE_DWCXG_MTL_TCQ3_MTL_TC3_HICREDIT_0
This register contains the hiCredit value required for the credit-based shaper algorithm for TC1.
- Offset: 0x12a0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved. 28:0
- RW
0x0 HC: hiCredit Value. - When the Audio Video Bridging feature is enabled, this field contains the hiCredit value required for the credit-based shaper algorithm. This is the maximum value that can be accumulated in the credit parameter. This is specified in bits scaled by 1024. The maximum value is maxInterferenceSize, that is, best- effort maximum packet size (16384 bytes or 131072 bits). The value to be specified is 131072 * 1024 = 134217728 or 0x0800_0000
- MGBE_DWCXG_MTL_TCQ3_MTL_TC3_LOCREDIT_0
This register contains the loCredit value required for the credit-based shaper algorithm for TC1.
- Offset: 0x12a4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved. 28:0
- RW
0x0 LC: loCredit Value. - When Audio Video Bridging operation is enabled, this field contains the loCredit value required for the credit-based shaper algorithm. This is the minimum value that can be accumulated in the credit parameter. This is specified in bits scaled by 1024. The maximum value is maxPacketSize transmitted from this queue, that is, 16384 * 8 * 1024 = 134217728 or 0x0800_0000. Because it is a negative value, the programmed value is twos complement of the value, that is, 0x1800_0000.
- MGBE_DWCXG_MTL_TCQ3_MTL_RXQ3_OPERATION_MODE_0
The Queue 3 Receive Operation Mode register establishes the Receive queue operating modes and command.
- Offset: 0x12c0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved. 25:16
- RW
0x0 RQS:
- Receive Queue Size. This field indicates the size of the allocated
- Receive queues in blocks of 256 bytes. The sixteenth bit is the starting
bit of this field. The width of this field depends on the Rx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) = LOG2(8) = 3 bits A value of 0 indicates 256 bytes. This field is reserved and RO in single queue configuration, and its reset value corresponds to the receive
- FIFO size. When this queue is used, a minimum value of 7 (size = 2048)
is recommended so that the queue can store more than a complete max-sized Ethernet packet. 15:8
- RO
0x0 Reserved_15_8: Reserved.
- RW
0x0 EHFC:
- Enable Hardware Flow Control. When this bit is set, the flow control
signal operation, based on the fill-level of Rx queue, is enabled. When reset, the flow control operation is disabled. This bit is not used (reserved and always reset) when the Rx queue is less than 4 KB.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 DIS_TCP_EF:
- Disable Dropping of TCP/IP Checksum Error Packets. - When this bit is
set, the MAC does not drop the packets which only have the errors detected by the Receive Checksum Offload engine. Such packets have errors only in the encapsulated payload. There are no errors (including
- FCS error) in the Ethernet packet received by the MAC. - When this bit
is reset, all error packets are dropped if the FEF bit is reset.
- RW
0x0 RSF:
- Receive Queue Store and Forward. When this bit is set, DWC_xgmac
reads a packet from the Rx queue only after the complete packet has been written to it, ignoring the RTC field of this register. When this bit is reset, the Rx queue operates in the Threshold (cut-through) mode, subject to the threshold specified by the RTC field of this register.
- RW
0x0 FEF:
- Forward Error Packets. - When this bit is reset, the Rx queue drops
packets with error status (CRC error, GMII_ER, watchdog timeout, or overflow). However, if the start byte (write) pointer of a packet is already transferred to the read controller side (in Threshold mode), the packet is not dropped. - When this bit is set, all packets except the runt error packets are forwarded to the application or DMA. If the RSF bit is set and the Rx queue overflows when a partial packet is written, the packet is dropped irrespective of the setting of this bit. However, if the RSF bit is reset and the Rx queue overflows when a partial packet is written, a partial packet might be forwarded to the application or DMA.
- RW
0x0 FUF:
- Forward Undersized Good Packets. When this bit is set, the Rx queue
forwards the undersized good packets (with no Invalid-code/GMII/CRC/
- Length errors and length less than 64 bytes at Rx (X)GMII interface),
including pad-bytes and CRC. When this bit is reset, the Rx queue drops all packets of length less than 64 bytes.
- RO
0x0 Reserved_2: Reserved. 1:0
- RW
0x0 RTC:
- Receive Queue Threshold Control. These bits control the threshold level
of the MTL Rx queue (in bytes): - 2'b00: 64 - 2'b01: Reserved - 2'b10: 96
- 2'b11: 128 The received packet is transferred to the application or
- DMA when the packet size within the MTL Rx queue is larger than the
threshold. In addition, full packets with length less than the threshold are automatically transferred. The value of 11 is not applicable if the size of the configured Rx Queue is 128 bytes. This field is valid only when the RSF bit is zero. This field is ignored when the RSF bit is set to 1.
- MGBE_DWCXG_MTL_TCQ3_MTL_RXQ3_MISSED_PKT_OVERFLOW_CNT_0
- The Queue 3 Overflow Counter register contains the counter for packets missed because of
Receive queue packet flush and packets discarded because of Receive queue overflow.
- Offset: 0x12c4
- Read/Write: RO
- Parity Protection: N

10G Ethernet Controller Core Registers cont'd 1
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 MISCNTOVF:
- Missed Packet Counter Overflow Bit. When set, this bit indicates that the
Rx Queue Missed Packet Counter crossed the maximum limit. 30:27 0x0 Reserved_30_27: Reserved. 26:16 0x0 MISPKTCNT:
- Missed Packet Counter. This field indicates the number of packets missed
by DWC_xgmac because the application asserted ari_pkt_flush_i[] for this queue. This counter is incremented each time the application issues ari_pkt_flush_i[] for this queue. This counter is reset when this register is read with mci_be_i[0] at 1'b1. 0x0 OVFCNTOVF:
- Overflow Counter Overflow Bit. When set, this bit indicates that the Rx
Queue Overflow Packet Counter field crossed the maximum limit. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 OVFPKTCNT:
- Overflow Packet Counter. This field indicates the number of packets
discarded by DWC_xgmac because of Receive queue overflow. This counter is incremented each time DWC_xgmac discards an incoming packet because of overflow. This counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ3_MTL_RXQ3_DEBUG_0
- The Queue 3 Receive Debug register gives the debug status of various blocks related to the
Receive queue.
- Offset: 0x12c8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:30 0x0 Reserved_31_30: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
29:16 0x0 PRXQ:
- Number of Packets in Receive Queue. This field indicates the current
number of packets in the Rx Queue. The theoretical maximum value for this field is 256KB/16B = 16K Packets, that is, Max_Queue_Size/ Min_Packet_Size. 15:6 0x0 Reserved_15_6: Reserved. 5:4 0x0 RXQSTS:
- MTL Rx Queue Fill-Level Status. This field gives the status of the fill-level of
the Rx Queue: - 2'b00: Rx Queue empty - 2'b01: Rx Queue fill-level below flow-control deactivate threshold - 2'b10: Rx Queue fill-level above flow- control activate threshold - 2'b11: Rx Queue full 0x0 Reserved_3: Reserved. 2:1 0x0 RRCSTS:
- MTL Rx Queue Read Controller State. This field gives the state of the Rx
queue Read controller: - 2'b00: Idle state - 2'b01: Reading packet data - 2'b10: Reading packet status (or timestamp) - 2'b11: Flushing the packet data and status 0x0 RWCSTS:
- MTL Rx Queue Write Controller Active Status. When high, this bit indicates
that the MTL Rx queue Write controller is active, and it is transferring a received packet to the Rx Queue.
- MGBE_DWCXG_MTL_TCQ3_MTL_RXQ3_CONTROL_0
The Queue 3 Receive Control register controls the receive arbitration and passing of received packets to the application.
- Offset: 0x12cc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:4
- RO
0x0 Reserved_31_4: Reserved.
- RW
0x0 RXQ_PKT_ARBIT:
- Receive Queue Packet Arbitration Control. When this bit is set, the
- MTL enables the packet-level arbitration. When this bit is reset, the
MTL enables the PBL based arbitration.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
2:0
- RW
0x0 RXQ_WEGT:
- Receive Queue Weight. This field indicates the weight assigned to
the Rx Queue 3. The weight is used as the number of continuous
- PBL requests or contiguous packets (depending on the
RXQ_PKT_ARBIT) allocated to the queue in one arbitration cycle.
- MGBE_DWCXG_MTL_TCQ3_MTL_RXQ3_FLOW_CONTROL_0
This register controls the activation and de-activation threshold in the queue for PAUSE/PFC flow control.
- Offset: 0x12d0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:23
- RO
0x0 Reserved_31_y: Reserved. 22:17
- RW
0x0 RFD:
- Threshold for deactivating Flow Control. These bits control the
threshold (fill-level of RxQ0) at which the flow control is de-asserted once it is activated. - 6'b000000: RQS value minus 1 KB, that is, FULL - 1024 bytes - 6'b000001: RQS value minus 1.5 KB, that is, FULL - 1536 bytes - 6'b000010: RQS value minus 2 KB, that is, FULL - 2048 bytes.
- ... - 6'b111111: RQS value minus 32.5 KB, that is, FULL - 33280 bytes
- The de-assertion is effective only after flow control is asserted as per
the setting of RFA field. Note that the value to be programmed should be such that the threshold is positive number. 16:7
- RO
0x0 Reserved_16_y: Reserved. 6:1
- RW
0x0 RFA:
- Threshold for activating Flow Control. These bits control the threshold
(fill-level of RxQ0) at which the flow control is activated - 6'b000000:
- RQS value minus 1 KB, that is, FULL - 1024 bytes - 6'b000001: RQS
value minus 1.5 KB, that is, FULL - 1536 bytes - 6'b000010: RQS value minus 2 KB, that is, FULL - 2048 bytes. - ... - 6'b111111: RQS value minus 32.5 KB, that is, FULL - 33280 bytes The flow control is triggered when EHFC=1 and the queue size (RQS value in MTL_RxQ3_Operation
- Mode register) is equal to or more than 4KB. Note that the value to be
programmed in RFA should be such that the threshold is positive number.
- RO
0x0 Reserved_0: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_TCQ3_MTL_Q3_INTERRUPT_ENABLE_0
This register contains the interrupt enable bits for Traffic class/Queue 3.
- Offset: 0x12f0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RW
0x0 RXOIE:
- Receive Queue Overflow Interrupt Enable. - 1: Receive Queue
- Overflow interrupt is enabled. - 0: Receive Queue Overflow interrupt
is disabled. 15:2
- RO
0x0 Reserved_15_2: Reserved.
- RW
0x0 ABPSIE:
- Average Bits Per Slot Interrupt Enable. When this bit is set, average
bits per slot interrupt is enabled for Traffic Class 3. An interrupt is generated when the average bits per slot status is updated for this traffic class. This bit is reserved and RO when the number of traffic classes selected is less than 3. This field in the corresponding Queues 8 - 15 registers is always reserved.
- RW
0x0 TXUIE:
- Transmit Queue Underflow Interrupt Enable. - 1: Transmit Queue
- Underflow interrupt is enabled. - 0: Transmit Queue Underflow
interrupt is disabled.
- MGBE_DWCXG_MTL_TCQ3_MTL_Q3_INTERRUPT_STATUS_0
This register contains the interrupt status bits for Traffic class/Queue 3.
- Offset: 0x12f4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:17
- RO
0x0 Reserved_31_17: Reserved.
- RW
0x0 RXOVFIS:
- Receive Queue Overflow Interrupt Status. This bit indicates that the
- Receive Queue had an Overflow during packet reception. If partial
packet is transferred to the application, the overflow status is set in the corresponding Rx status. This bit is cleared when the application writes a 1 to this bit. 15:2
- RO
0x0 Reserved_15_2: Reserved.
- RW
0x0 ABPSIS:
- Average Bits Per Slot Interrupt Status. When set, this bit indicates
that the MAC has updated the ABS value for this traffic class. This bit is cleared when the application writes a 1 to this bit. This bit is reserved and RO when the number of traffic classes selected is less than 3. This field in corresponding Queues 8 - 15 registers is reserved and RO.
- RW
0x0 TXUNFIS:
- Transmit Queue Underflow Interrupt Status. This bit indicates that
the Transmit Queue had an Underflow during packet transmission. Transmission is suspended and an Underflow Error TDES3[2] is set. This bit is cleared when the application writes a 1 to this bit.
- MGBE_DWCXG_MTL_TCQ4_MTL_TXQ4_OPERATION_MODE_0
The Queue 4 Transmit Operation Mode register establishes the Transmit queue operating modes and commands.
- Offset: 0x1300
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
25:16
- RW
0x0 TQS:
- Transmit Queue Size. This field indicates the size of the allocated
- Transmit queues in blocks of 256 bytes. The sixteenth bit is the
starting bit of this field. The width of this field depends on the Tx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) =
- LOG2(8) = 3 bits A value of 0 indicates 256 bytes. When this queue is
enabled (TXQEN=10), a minimum value of 7 (size = 2048) is recommended so that the queue can store more than a complete max- sized Ethernet packet. This field is reserved and RO in single queue configuration, and its reset value corresponds to the transmit FIFO size 15:11
- RO
0x0 Reserved_15_y: Reserved. 10:8
- RW
0x0 Q2TCMAP:
- Queue to Traffic Class Mapping. This field is used to map Queue0 to a
traffic class (TC). The actual width of this field depends on the number of traffic classes selected during configuration. - 3'b000: TC0 - 3'b001: TC1 - 3'b010: TC2 - 3'b011: TC3 - 3'b100: TC4 - 3'b101: TC5 - 3'b110:
- TC6 - 3'b111: TC7
- RO
0x0 Reserved_7: Reserved. 6:4
- RW
0x0 TTC:
- Transmit Threshold Control. These bits control the threshold level of
the MTL Tx Queue. Transmission starts when the packet size within the
- MTL Tx Queue is larger than the threshold. In addition, full packets
with length less than the threshold are also transmitted. These bits are used only when the TSF bit is reset. - 3'b000: 64 - 3'b001: Reserved - 3'b010: 96 - 3'b011: 128 - 3'b100: 192 - 3'b101: 256 - 3'b110: 384 - 3'b111: 512 3:2
- RW
0x0 TXQEN:
- Transmit Queue Enable. This field is used to enable/disable the
transmit queue. - 2'b00: Not enabled - 2'b01: Audio Video Bridging - 2'b10: Enabled - 2'b11: Reserved The queue is enabled by default in single queue configuration. Therefore, this field is reserved when the number of transmit queues selected is one and has a reset value of 2'b10. In multiple Tx queues configuration, all the queues are disabled by default. Enable the Tx queue by programming this field.
- RW
0x0 TSF:
- Transmit Store and Forward. When this bit is set, the transmission
starts when a full packet resides in the MTL Tx Queue. When this bit is set, the values specified in the TTC field are ignored. This bit should be changed only when the transmission is stopped.
- RW
0x0 FTQ:
- Flush Transmit Queue. When this bit is set, the Tx Queue Controller
logic is reset to its default values. Therefore, all the data in the Tx queue is lost or flushed. This bit is internally reset when the flushing operation is complete. You should not write to this register until this bit is reset. The data which is already accepted by the MAC transmitter is not flushed. It is scheduled for transmission and results in underflow and runt packet transmission. Note: The flush operation is complete only when the Tx queue is empty. To complete this flush operation, the PHY Tx clock (clk_tx_312pt5_i) must be active.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_MTL_TCQ4_MTL_TXQ4_UNDERFLOW_0
- The Queue 4 Underflow Counter register contains the counter for packets aborted because of
Transmit queue underflow.
- Offset: 0x1304
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:16 0x0 Reserved_31_16: Reserved. 0x0 UFCNTOVF:
- Overflow Bit for Underflow Packet Counter. This bit is set every time the Tx
- Queue Underflow Packet Counter field overflows, that is, it has crossed the
maximum count. In such a scenario, the overflow packet counter is reset to all-zeros and this bit indicates that the rollover happened. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 UFPKTCNT:
- Underflow Packet Counter. This field indicates the number of packets
aborted by the controller because of Transmit Queue Underflow. This counter is incremented each time the MAC aborts an outgoing packet because of underflow. The counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_TCQ4_MTL_TXQ4_DEBUG_0
The Queue 4 Transmit Debug register gives the debug status of various blocks related to the Transmit Queue 4 and Traffic Class 0.
- Offset: 0x130
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:6 0x0 Reserved_31_6: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 TRCPSTS:
- MTL TRC Pending Status When this bit is high, it indicates that the MTL Tx
Read Controller (TRC) has a pending status from MAC. 0x0 TXQSTS:
- MTL Tx Queue Not Empty Status. When this bit is high, it indicates that the
MTL Tx Queue is not empty and some data is left for transmission. 0x0 TWCSTS:
- MTL Tx Queue Write Controller Status. When high, this bit indicates that the
- MTL Tx Queue Write Controller is active, and it is transferring the data to the
Tx Queue. 2:1 0x0 TRCSTS:
- MTL Tx Queue Read Controller Status. This field indicates the state of the Tx
- Queue Read Controller: - 2'b00: Idle state - 2'b01: Read state (transferring
data to the MAC transmitter) - 2'b10: Waiting for pending Tx Status from the
- MAC transmitter - 2'b11: Flushing the Tx queue because of the Packet Abort
request from the MAC 0x0 TCPAUSED:
- Traffic Class in Pause. When this bit is high and the Rx flow control is enabled,
it indicates that the Traffic Class 0 is in the Pause condition because of the following: - Reception of the PFC packet for the priorities assigned to the
- Traffic Class 0 when PFC is enabled - Reception of IEEE 802.3-2018 Pause
packet when Priority Based Flow Control (PFC) is disabled
- MGBE_DWCXG_MTL_TCQ4_MTL_TC4_ETS_CONTROL_0
This register configures the transmission selection algorithm, for Traffic Class 0.This register is not available in single traffic class configuration.
- Offset: 0x1310
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:7
- RO
0x0 Reserved_31_7: Reserved. 6:4
- RW
0x0 SLC:
- Slot Count. If the credit-based shaper algorithm is enabled, the
software can program the number of slots (of 125 us duration) over which the average transmitted bits per slot, provided in the
- MTL_TC<n>_ETS_Status register, need to be computed for TC<n>. The
encoding is as follows: - 3'b000: 1 Slot - 3'b001: 2 Slots - 3'b010: 4 Slots
- 3'b011: 8 Slots - 3'b100: 16 Slots - 3'b101-3'b111: Reserved

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 CC:
- Credit Control. When this bit is set, the accumulated credit parameter
in the credit-based shaper algorithm logic is not reset to zero when there is positive credit and no packet to transmit in TC<n>. The credit accumulates even when there is no packet waiting in TC<n> and another TC is transmitting. When this bit is reset, the accumulated credit parameter in the credit-based shaper algorithm logic is set to zero when there is positive credit and no packet to transmit in TC<n>.
- When there is no packet waiting in TC<n> and other TC is transmitting,
no credit is accumulated.
- RO
0x0 CBSEN:
- Credit Based Shaper Enable This field indicates that TSA field of this
register is enabled for CBS 1:0
- RW
0x0 TSA:
- Transmission Selection Algorithm. This field is used to assign a
transmission selection algorithm for this traffic class. - 2'b00: Strict priority - 2'b01: CBS - 2'b10: ETS - 2'b11: Reserved
- MGBE_DWCXG_MTL_TCQ4_MTL_TC4_ETS_STATUS_0
This register contains the information of average bits transmitted over a slot interval of 10 million bit times, for Traffic Class 0.
- Offset: 0x1314
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
31:24 0x0 Reserved_31_24: Reserved. 23:0 0x0 ABS:
- Average Bits per Slot. This field contains the average transmitted bits per
slot computed over every slot of 10 million bit times (1ms in 10G mode, 10ms in 1G mode). The maximum value is 0x989680.
- MGBE_DWCXG_MTL_TCQ4_MTL_TC4_QUANTUM_WEIGHT_0
The TC1 Quantum or Weights register provides the average traffic transmitted in Traffic Class 1. For TCn, where n = 1 to 7, this register is not available when the number of traffic classes selected is less than n + 1 This register is not available in corresponding Queues 8-15 registers.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0x1318
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:21
- RO
0x0 Reserved_31_21: Reserved. 20:0
- RW
0x0 QW: idleSlopeCredit, Quantum or Weights. - idleSlopeCredit -- When Audio
- Video Bridging feature is enabled, this field contains the idleSlopeCredit
value required for the credit-based shaper algorithm for Queue 1. This is the rate of change of credit in bits per cycle (3.2 ns for 2.5/10 Gbps; 8 ns for 1000 Mbps) when the credit is increasing. The software should program this field with computed credit in bits per cycle scaled by 1024.
- The maximum value is portTransmitRate, that is, 0x2000 in 1000/2500
- Mbps mode and 0x8000 in 10 Gbps mode. Bits[20:16] must be written to
zero. - Quantum -- When the TSA is set to ETS and ETSALG is set to DWRR algorithm for Traffic Class 1 traffic, this field contains the quantum value in bytes to be added to credit during every queue scanning cycle. The maximum value is 0x1312D0 bytes. - Weights -- When TSA is set to ETS and ETSALG is set to WFQ algorithm for Traffic Class1 traffic, this field contains the weight for this queue. The maximum value is 0x3FFF where weight of 0 indicates 100% bandwidth. Bits [20:14] must be written to zero. -- When TSA is set to ETS and ETSALG is set to WRR algorithm for
- Traffic Class 1 traffic, this field contains the weight for this queue. The
maximum value is 0x64. Bits[20:7] must be written to zero. This field is reserved and RO when the number of traffic classes selected is less than two. This field is reserved in corresponding Queues 8-15 register.
- MGBE_DWCXG_MTL_TCQ4_MTL_TC4_SENDSLOPECREDIT_0
MTL registers for traffic classes and queues 1 registers.
- Offset: 0x131c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:16
- RO
0x0 Reserved_31_16: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
15:0
- RW
0x0 SSC: sendSlopeCredit Value. - When Audio Video Bridging operation is enabled, this field contains the sendSlopeCredit value required for credit-based shaper algorithm for TC<n>. The software should program this field with computed credit in bits per cycle scaled by 1024. This field should be programmed with absolute sendSlopeCredit value. The credit-based shaper logic subtracts it from the accumulated credit when TC<n> is selected for transmission. See the application note for more details on programming this value.
- MGBE_DWCXG_MTL_TCQ4_MTL_TC4_HICREDIT_0
This register contains the hiCredit value required for the credit-based shaper algorithm for TC1.
- Offset: 0x1320
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved. 28:0
- RW
0x0 HC: hiCredit Value. - When the Audio Video Bridging feature is enabled, this field contains the hiCredit value required for the credit-based shaper algorithm. This is the maximum value that can be accumulated in the credit parameter. This is specified in bits scaled by 1024. The maximum value is maxInterferenceSize, that is, best- effort maximum packet size (16384 bytes or 131072 bits). The value to be specified is 131072 * 1024 = 134217728 or 0x0800_0000
- MGBE_DWCXG_MTL_TCQ4_MTL_TC4_LOCREDIT_0
This register contains the loCredit value required for the credit-based shaper algorithm for TC1.
- Offset: 0x1324
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
31:29
- RO
0x0 Reserved_31_29: Reserved. 28:0
- RW
0x0 LC: loCredit Value. - When Audio Video Bridging operation is enabled, this field contains the loCredit value required for the credit-based shaper algorithm. This is the minimum value that can be accumulated in the credit parameter. This is specified in bits scaled by 1024. The maximum value is maxPacketSize transmitted from this queue, that is, 16384 * 8 * 1024 = 134217728 or 0x0800_0000. Because it is a negative value, the programmed value is twos complement of the value, that is, 0x1800_0000.
- MGBE_DWCXG_MTL_TCQ4_MTL_RXQ4_OPERATION_MODE_0
The Queue 4 Receive Operation Mode register establishes the Receive queue operating modes and command.
- Offset: 0x1340
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
31:26
- RO
0x0 Reserved_31_y: Reserved. 25:16
- RW
0x0 RQS:
- Receive Queue Size. This field indicates the size of the allocated
- Receive queues in blocks of 256 bytes. The sixteenth bit is the starting
bit of this field. The width of this field depends on the Rx memory size selected in your configuration. For example, if the memory size is 2048, the width of this field is 3 bits: LOG2(2048/256) = LOG2(8) = 3 bits A value of 0 indicates 256 bytes. This field is reserved and RO in single queue configuration, and its reset value corresponds to the receive
- FIFO size. When this queue is used, a minimum value of 7 (size = 2048)
is recommended so that the queue can store more than a complete max-sized Ethernet packet. 15:8
- RO
0x0 Reserved_15_8: Reserved.
- RW
0x0 EHFC:
- Enable Hardware Flow Control. When this bit is set, the flow control
signal operation, based on the fill-level of Rx queue, is enabled. When reset, the flow control operation is disabled. This bit is not used (reserved and always reset) when the Rx queue is less than 4 KB.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 DIS_TCP_EF:
- Disable Dropping of TCP/IP Checksum Error Packets. - When this bit is
set, the MAC does not drop the packets which only have the errors detected by the Receive Checksum Offload engine. Such packets have errors only in the encapsulated payload. There are no errors (including
- FCS error) in the Ethernet packet received by the MAC. - When this bit
is reset, all error packets are dropped if the FEF bit is reset.
- RW
0x0 RSF:
- Receive Queue Store and Forward. When this bit is set, DWC_xgmac
reads a packet from the Rx queue only after the complete packet has been written to it, ignoring the RTC field of this register. When this bit is reset, the Rx queue operates in the Threshold (cut-through) mode, subject to the threshold specified by the RTC field of this register.
- RW
0x0 FEF:
- Forward Error Packets. - When this bit is reset, the Rx queue drops
packets with error status (CRC error, GMII_ER, watchdog timeout, or overflow). However, if the start byte (write) pointer of a packet is already transferred to the read controller side (in Threshold mode), the packet is not dropped. - When this bit is set, all packets except the runt error packets are forwarded to the application or DMA. If the RSF bit is set and the Rx queue overflows when a partial packet is written, the packet is dropped irrespective of the setting of this bit. However, if the RSF bit is reset and the Rx queue overflows when a partial packet is written, a partial packet might be forwarded to the application or DMA.
- RW
0x0 FUF:
- Forward Undersized Good Packets. When this bit is set, the Rx queue
forwards the undersized good packets (with no Invalid-code/GMII/CRC/
- Length errors and length less than 64 bytes at Rx (X)GMII interface),
including pad-bytes and CRC. When this bit is reset, the Rx queue drops all packets of length less than 64 bytes.
- RO
0x0 Reserved_2: Reserved. 1:0
- RW
0x0 RTC:
- Receive Queue Threshold Control. These bits control the threshold level
of the MTL Rx queue (in bytes): - 2'b00: 64 - 2'b01: Reserved - 2'b10: 96
- 2'b11: 128 The received packet is transferred to the application or
- DMA when the packet size within the MTL Rx queue is larger than the
threshold. In addition, full packets with length less than the threshold are automatically transferred. The value of 11 is not applicable if the size of the configured Rx Queue is 128 bytes. This field is valid only when the RSF bit is zero. This field is ignored when the RSF bit is set to 1.
- MGBE_DWCXG_MTL_TCQ4_MTL_RXQ4_MISSED_PKT_OVERFLOW_CNT_0
- The Queue 4 Overflow Counter register contains the counter for packets missed because of
Receive queue packet flush and packets discarded because of Receive queue overflow.
- Offset: 0x1344
- Read/Write: RO
- Parity Protection: N

10G Ethernet Controller Core Registers cont'd 2
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 MISCNTOVF:
- Missed Packet Counter Overflow Bit. When set, this bit indicates that the
Rx Queue Missed Packet Counter crossed the maximum limit. 30:27 0x0 Reserved_30_27: Reserved. 26:16 0x0 MISPKTCNT:
- Missed Packet Counter. This field indicates the number of packets missed
by DWC_xgmac because the application asserted ari_pkt_flush_i[] for this queue. This counter is incremented each time the application issues ari_pkt_flush_i[] for this queue. This counter is reset when this register is read with mci_be_i[0] at 1'b1. 0x0 OVFCNTOVF:
- Overflow Counter Overflow Bit. When set, this bit indicates that the Rx
Queue Overflow Packet Counter field crossed the maximum limit. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 OVFPKTCNT:
- Overflow Packet Counter. This field indicates the number of packets
discarded by DWC_xgmac because of Receive queue overflow. This counter is incremented each time DWC_xgmac discards an incoming packet because of overflow. This counter is reset when this register is read with mci_be_i[0] at 1'b1.
## 2.5 ms and the minimum width that can be programmed in the GPIO filter is 1 ms. If the duty cycle

- Fan Tachometer
goes below 50%, the glitch filter might filter out the entire pulse and so the glitch filter has to be disabled. A basic RPM calculation is as follows: for a two-pulse per revolution (PPR) fan (WIN_LENGTH=1), if the fan returns 60 pulses per second, then it is 30 (60/2) revolutions per second, which is 1800 (30*60) RPM. To capture the time period of the tachometer input for the duration of one window length: In this case, the tachometer counter clock should be programmed to 1 MHz. The figure below shows the RPM calculation in detail.
**Figure 10.164 Tachometer Counter**
The window length is the number of tachometer input periods that are to be monitored. This is programmed by software using the WINDOW_LENGTH field of the TACH_FAN_TACH0 register. As shown in the above figure, the counter starts incrementing on the first rising edge on every window length and resets to 1 at the beginning of each window length. At the end of each window length, the period value is latched into PERIOD [18:0] field of TACH_FAN_TACH0 register. Software periodically reads these registers for RPM calculation. The reason for having WINDOW_LENGTH is that some FANs provide more than one pulse (2/4/8) for a single rotation. To reduce the overhead in software for these calculations, window length can be modified so that the value read from PERIOD is always the time taken for one rotation, making it easier for RPM calculations. When the fan stops spinning, the rising edge of tachometer input cannot be seen, and the window length never ends. The period value reaches its maximum value. The overflow bit of the TACH_FAN_TACH0 register is set to “Detected” until software clears it. Tachometer monitoring is disabled until the next rising edge of the tachometer is detected.

- Fan Tachometer
To start counting, a pulse is generated indicating the detection of the 1st positive edge on the tachometer input. This pulse triggers the counter to start (starting from 0) and latches the period value when the next edge is detected. Since a 1 MHz clock is used to generate the trigger, the positive edge detection and triggering of counter takes one clock (one unit time), and the counter is run for N-1 unit time (N being the total time period of the pulse). So the counter reports N-1 value instead of N.
- Change of the WIN_LENGTH field takes effect only when the current period calculation is
complete. For example, if the current calculation counts four pulses (WIN_LEN = 2) and software programs this field to start counting one pulse (WIN_LEN = 0), the design completes the current PERIOD calculation based on WIN_LEN = 2 and then (for next PERIOD calculation) starts using WIN_LEN = 0.
**Figure 10.165 Overflow Scenario**
