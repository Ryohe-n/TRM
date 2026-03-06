# 1 About this Release

## 1.1 About this Release
1. Introduction
- Getting Started
- About this Release
2. Memory Architecture and Memory Mapped I/O
- Memory Subsystem (MSS)
- Address Map
- Address Space Translation (AST)
- Control Plane UPDATED
- General Purpose Direct Memory Access (DMA) Engines
- System Memory Management Unit (SMMU)
3. Boot and Power Management
- Boot Process
- Power Management Controller (PMC)
- Boot and Power Management Processor (BPMP)
4. CPU Complex 5. GPU 6. Multimedia Complex
- Host Controller

- About this Release
- MIPI Camera Serial Interface (CSI) UPDATED
- Video Input (VI)
- Real-Time Camera Engine (RCE)
- Display Control Engine (DCE)
- Image Signal Processor (ISP)
- Video Image Compositor (VIC)
- High Definition Audio (HDA)
- Display Controller
- Consumer Electronics Control (CEC)
- Audio Processing Engine (APE) UPDATED
- Always On Digital Microphone (AODMIC)
- Pixel Memory Formats
7. Computer Vision Acceleration
- Deep Learning Accelerator (DLA)
- Programmable Computer-Vision Accelerator (PVA)
8. System Components
- Always-On Cluster (AON) and SPE
- Clock and Reset Controller (CAR)
- Interrupt Controllers
- Timers
- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) UPDATED
- GPIO Controllers
- Activity Monitor (ACTMON)
- Hardware Synchronization Primitives (HSP)
- Thermal Sensor and Thermal Throttling Controller
- In-System Test Controller (IST)
- Design for Debugging (DFD) UPDATED
- System Registers
- Hardware Performance Monitor (HWPM)
9. I/O Controllers and Interfaces
- High-Speed I/O Cluster
- USB Complex UPDATED
- Universal Flash Storage Complex (UFS)
- MIPI M-PHY
- PCI Express (PCIe) Controller UPDATED
1G Ethernet Controller (RGMII)

- Change Log
- MAC Security (MACsec)
10G Ethernet Controller (XFI) UPDATED
- Controller Area Network (CAN)
- SDMMC Controller UPDATED
- I2C Controller (I2C)
- Universal Asynchronous Receiver/Transmitter (UART)
- Server Based System Architecture (SBSA) UART
- Serial Peripheral Interface (SPI)
- Quad Serial Peripheral Interface (QSPI)
- Pulse Width Modulator (PWM) UPDATED
- Fan Tachometer
10. Functional Safety
- Error Reporting
- Hardware Safety Manager (HSM)
- Functional Safety Island (FSI)
- Safety Cluster Engine (SCE)
## 1.2 Change Log
This change log identifies technical changes and/or significant modification to already released materials, it does not include editorial changes made for readability.
- All Sections - Ongoing
- Correcting KB notation where appropriate; updating to KiB. This follows the IEEE and NIST
convention using an 'i' to indicate the binary convention, and its absence to indicate decimal: i.e., 1 KiB is 210 or 1,024 bytes, and 1 KB is 103 or 1,000 bytes.
### 1.2.1 20230929 (Version 1.2)
- Memory Architecture and Memory Mapped I/O
- Control Backbone (CBB) Error Monitor; Removed/updated error monitor and error notifier
information throughout; other minor updates
- Multimedia Complex
- MIPI Camera Serial Interface (CSI); Changed VI 5.0 and ISP 5.0 both to 6.0
APE Registers; updates to the following register files:
- Audio Crossbar (AXBAR) Registers

- Change Log
- Digital Microphone Control (DMIC) Registers
- Audio De-Multiplexer (ADX) Control Registers
- Audio Miscellaneous (AMISC Control Registers
- Audio Generic Interrupt Control (AGIC) Registers
- System Components
- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) Registers
- G3 PAD Control Registers; Updated note to use Block Name (PADCTL_A0) to find the Base
- Address of these registers in the System Address Map
- UFS PAD Control Registers; Updated note to use Block Name (PADCTL_A17) to find the
- Base Address of these registers in the System Address Map
- Design for Debugging (DFD); Updates to FSI TSC section: added FSI_CSITE_TSINTP Render
- Configuration, Connectivity, Calculating Time-Interval Using Timestamps subsections
I/O Controllers and Interfaces
- USB Complex; Changed PADCTRL_G2_CTL_ to PADCTRL_EDP_
- PCIe Registers (PCIe Root Port); Updated PCIE_RP_APPL_DEBUG_0: added encoding
definition to SMLH_LTSSM_STATE 10G Ethernet Controller (XFI) 10G Ethernet Registers; Added notes regarding base addresses and reset/prod hex value 10G Ethernet Controller Wrapper Registers; Added:
- PCS_WRAP_UPHY_HW_INIT_CONTROL_0_0; PCS_WRAP_UPHY_STATUS_0_0;
- PCS_WRAP_INTERRUPT_STATUS_0
- SDMMC Controller; Removed Boot ROM support
- Pulse Width Modulator (PWM); PinMux naming changed to soc_gpio37 for PWM8 interface
in Table 1.1

- Getting Started
2. Getting Started
## 1.5 Ki 98-bit entries, 4-way Skewed-Associative L0 Macro-OP (MOP) Cache.
Separate 64-KiB 4-way Set-Associative L1 Data and Instruction Cache. ECC and parity protection on L1 Cache memory. Private unified 256-KiB 8-way Set-Associative Data and Instruction L2 Cache. ECC and parity protection on L2 Cache memory. L2 transaction queue size of 48 entries (24 entries per L2 bank). A Memory Management Unit (MMU).
- An integrated execution unit that implements the advanced SIMD and floating-point
architecture support. Generic Interrupt Controller (GICv4) CPU interface to connect to an external distributor. Generic Timers interface supporting 64-bit count input from an external system counter.
- Split/Lock feature with the ability to choose amongst Split, Lock, and Hybrid mode at the
Cluster level based on CEMODE input during Cluster's cold Reset. Performance Monitoring Unit (PMU). Activity Monitoring Unit (AMU). Embedded Trace Macrocell (ETM) supporting instruction trace only. The following table lists the execution modes specifics supported by the Orin CCPLEX.
- Table 5.1 Execution Modes
- Cluster Mode
- CPU Mode
- DSU Mode
- Description
- Split
- Split
- Split
- Each CPU core executes independently as
appeared to the operating system, with four CPU cores in a Cluster.
- Lock
- Lock
- Lock
- Two CPU cores execute the same software
concurrently.
- Their execution state is compared every clock
cycle and any divergence (mismatched result) is reported.
- These two physical CPU cores appear as one
logical CPU core to the operating system for a total of four CPU cores in a Cluster.

- CCPLEX Functional Description
- Cluster Mode
- CPU Mode
- DSU Mode
- Description
- Hybrid
- Split
- Lock
- Cluster Hybrid mode means that CPUs operate in
Split mode while the DSU operates in Lock mode.
- DSU logic is duplicated as a primary and
redundant logic.
- Each CPU’s outputs are fed into the primary and
redundant DSU logic.
- Primary and redundant DSU logic are compared in
- Lock mode and mismatched results generate RAS
errors.
- This Cluster Hybrid mode is useful for Safety
applications where CPU cores can be in Split mode (thereby improving performance with more CPUs available) while the DSU is in Lock mode.
- Permanent fault coverage for the CPU cores is
done using online IST (In-System Test) for coverage metrics.
- DSU-AE
The architectural overview of the DSU-AE Cluster showing its one CPU core-pair and the DSU-AE with major functional blocks is presented in the diagram below.

- CCPLEX Functional Description
**Figure 5.4 DSU-AE Cluster Showing one CPU Core-pair and the DSU Core with Architectural**
- Details
- The DynamIQ™ Shared Unit (DSU-AE) comprises a Snoop Control Unit (SCU) with an L3 Memory
- System, DSU-AE Asynchronous Bridges (CPU Bridges), and other control logic as shown in the
diagram above. The DSU-AE features are summarized as follows: Dual ACE (AXI Coherency Extensions) Interfaces (AMBA5 ACE main bus interfaces) to ACI. 48-bit Physical Address (PA) support, where only 40 bits are used in Orin, i.e. PA[47:40] = 8'b0 always. Reliability, Availability and Serviceability (RAS) support. Data poisoning on a 64-bit granule. 2-MiB 16-way Set-Associative L3 Cache. 64-byte Cache line throughput. L3 Cache partitioning - 2 slices. ECC support on Cache RAMs.

- CCPLEX Functional Description
SCU maintains coherency between Caches in the cores and the DSU Cache. Split, Lock, and Hybrid mode support. Interface Protection Safety feature through Parity for the external interfaces of the DSU-AE Cluster.

- GPU
6. GPU
## 1.68 Gsps
## 1.0 AMISC module. AHSP is configured as follows:
- Eight Shared Mailboxes
- Four Shared Semaphores
- Five Interrupts
AHSP is an APB slave connected to ACONNECT. It uses 320 KiB of address space.

- Audio Processing Engine (APE)
Refer to the Hardware Synchronization Primitives (HSP) chapter for more information about HSP modules.
## 1.5 cycles per feature point
(cyc/pt)
- Sorting 32-bit
- Host_sort_int
4096 32-bit data points 3 cyc/pt
- FP matrix-vector
multiply 64 x 64 matrix multiplying 64 x 1 vector
## 1.6 FP MAdds /cyc
- SGM
480 x 270 16-bit image, 64 disparities, 5x5 census transform, 3x3 HD, fast LR check, round/clip to store path cost and sum-of-path- cost in 8-bit 1 + 41.2 + 34.3) * 1.3 cyc/pix
- DBSCAN
- Host_dbscan_usho
rt 2048 input bounding boxes, 170 past thresholding 120K cycles
## 1.8 V
- Schmitt (300 mV)
& CMOS
- Push-Pull
& Open Drain (emulation mode) 50 KΩ +/- 15%
- No
5 bits (up and down)
- BDPGLPHVIN
_* (OD [2])
## 1.8 V
- Schmitt (200/190
mV) [5] & CMOS
- Push-Pull
& Open Drain 50 KΩ +/- 15%
- Yes
5 bits (up and down)
- BDSDMEM_*
(CZ [3]) 1.8/3.3 V
- Schmitt
& CMOS
- Push-Pull
& Open Drain (emulation mode) 20 KΩ +/- 35% 2 bits (up and down) 7 bits (up and down)
- BDSDMEMLV
_* (LV_CZ [4]) 1.2/1.8 V
- Schmitt
& CMOS
- Push-Pull
18 KΩ +/- 30% 2 bits (up and down) 5 bits (up and down)
- BILPRST_*
(ST type input only)
## 1.8 V
- Schmitt
& CMOS
- Push-Pull
& Open Drain (emulation mode) 50 KΩ +/- 15%
- No
- No
NOTES:

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
[1] The ST (Standard) MPIO pad is the most common pad on the chip. It is used for typical General Purpose I/Os (GPIOs) and various other slow-speed (< 100 MHz) interfaces. [2] The OD (Open-Drain) MPIO pad is similar to the ST pad with the additional provision of tolerating I/O voltage level up to 3.3 V when the pad’s output driver is set to Open-Drain mode for Interfaces like I2C, USB VBUS, PCIe side bands, HDMI CEC, and Display HPD signals. Special power-sequencing steps must be taken when using this feature to ensure that the pad operates without any damage or reliability concerns. [3] The CZ (Controlled output Impedance) MPIO pad is optimized for use in applications requiring tightly controlled output impedance for high I/O frequencies (100 ~ 300 MHz). It is similar to the ST pad with the additional Dual-Driver (1.8 V or 3.3 V I/O swing) support and changes in drive strength circuitry of the weak pull-up/down. [4] The LV_CZ (Low Voltage Controlled Impedance) pad is a variation of the CZ pad with dual voltage selection between 1.8 V or 1.2 V I/O swing. [5] (E_IO_HV == 0), 200 mV & (E_IO_HV == 1), 190 mV. (See the corresponding PinMux registers.)
## 1.8 V
eMMC
- Calibratio
n Pads Same as MEM_COMP but can operated at lower I/O voltage.
- Circuitry within the Orin SoC continuously matches the
output impedance of the LV-CZ pad to the on-board pull-up resistors attached to the LV_CZ_COMP pad.
- BSDMEMLVCOM
P_*

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
- Brief Description
- Pad Name
- Pad
I/O Rail
- Voltage
- Functio
nal
- Name
- JT_RST
## 1.8 V
- JTAG and
- Reset
- Pads
(Input
- Only)
Used for JTAG (except JTAG TDO) and Reset interface.
- Has a special mode of operation called VDD only mode where
in the pad becomes operational without having the I/O rail up. This mode of operation is needed for Reset pads which must propagate the Reset before I/O rails are up. This is achieved by Logic0 tie-off to RCVR_SEL pin of this pad.
- Beyond SYS_RESET_N pin, JTAG pin, JTAG mode selection
pins also follow similar usage with tie-off to RCVR_SEL pad input.
- BILPRST_*
## 1.8 V tolerant, 1.8 V fail-safe, and 1.8 V Back-Drive capable (i.e. when Orin is powered off, it is
okay for these I/Os to be pulled HIGH to 1.8 V without any Back-Drive current). Not 3.3 V fail-safe (i.e. when Orin is powered off, I/O cannot be pulled HIGH to 3.3 V to avoid over-voltage damage of the transistors). In Orin, such back-drive capable pads are used for a sub-set of low-speed interface ports:
- UART
- I2C
- SPI
GPIOs for Orin power sequencing and management. All of the high-speed pads are not back-drive capable, but instead have the capability for voltage tolerance or Fail-safe. A summary of I/O pads with back-drive capabilities along with voltage tolerance and fail-safe capabilities is provided in the following table.
- Table 9.48 I/O Voltage Tolerance, Fail-safe, Back Drive Capability Overall Summary
- IO Voltage
- Tolerance
- Fail-Safe Voltage
- Tolerance
- Back-Drive
- Capability
- Back-
- Drive
- Current
I/O Name
- IO
- Supply
- Voltage
- BILPRST_*
(Both variants Core-Only, and Core and IO)
## 1.8 V
## 1.8 V
## 1.8 V
- Yes
< 20 μA
- BDPGLP_*,
- BDSDMEMLV_*
## 1.8 V
## 1.8 V
## 1.8 V
- No
N/A
- BDPGLHVIN_*
## 1.8 V
1.8v for push-pull, 3.3.v for open-drain
## 1.8 V
- Yes
< 20 μA

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
- IO Voltage
- Tolerance
- Fail-Safe Voltage
- Tolerance
- Back-Drive
- Capability
- Back-
- Drive
- Current
I/O Name
- IO
- Supply
- Voltage
- BDSDMEM*
1.8/3.3 V
## 1.8 V
- No
N/A
- BDUSB2*
1.8/3.3 V
## 1.8 V
## 1.8 V
- Yes
< 20 μA
- BOPEXCLK*
## 1.8 V
## 1.8 V
## 1.8 V
- No
N/A
- UPHYDS*
0.975/1.3 5 V
## 1.35 V
- No
- No
N/A
- DP_SINGLE*
## 0.95 V
## 0.95 V
## 0.95 V
- No
N/A
- BDMIPI16X*
## 1.2 V
## 1.2 V
## 1.2 V
- No
N/A
- LP5_*
1.1/0.5/0. 6 V 1.1/0.5/0.6 V
- No
- No
N/A
## 1.8 V Tolerance and Open-drain Operation
To emulate open drain in 1.8V mode of operation: have the platform design float the pad with external pull-up, or program (PADCTL_<padctl_group>_<ball_name>.PUPD = PULLUP). To configure the Pad for 1.8V swing tolerance: setting (PADCTL_<padctl_group>_<ball_name>.E_IO_HV = 0). To drive high Impedance into the pad set: (PADCTL_<pactcl_group>_<ball_ame>_*.TRISTATE = TRISTATE).
## 1.8 V Tolerance/Driving and Push-Pull Operation
Since DD pads can be operated in normal push pull mode as well as open drain mode to emulate the push-pull mode the following configuration is followed. To put the open-drain pad in 1.8 V push-pull mode operation: Set (PADCTL_<padctl_group>_<ball_name>.E_IO_HV = DISABLE).
- Set (PADCTL_<padctl_group>_<ball_name>_* .TRISTATE = PASSTHROUGH) to enable
functional logic driving/sampling the I/O.
- Set (PADCTL_<padctl_group>_<ball_name>_* .E_INPUT = ENABLE) for bi-directional mode of
operation. The specific I/O controllers driving the I/O is configured and activated.

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
## 1.8 V
8b

- SDMMC Registers
Notes: 1. There is no voltage switching supported in Boot ROM. It uses fuses to select the voltage rail for the bootable SDMMC interfaces. If required, bootloader can do voltage switching later on. Boot ROM uses 8-bit data bus width.
- Reset output available: Yes in the column means that there is a dedicated reset output
available for this interface that can be connected to eMMC card. Higher speed modes of eMMC (HS200 or HS400) are not supported by the boot ROM.
- Boot ROM uses external clock frequency of 375 kHz for initialization of card. For data
transfer, it uses 51 MHz depending on speed supported.
- Boot ROM uses PLLP_OUT0 as the clock source for SDMMC and sets the divisor as need to
achieve the desired frequency: Frequency selection for low-speed mode and high-speed mode: 2. 3. 4. 5. 6. 7. a. For <= EMMC v4.0, v4.1, v4.2: i.
- Low-speed mode < 20 MHz
- High-speed mode >=20 MHz
ii. b. For EMMC v4.3 and above: i.
- Low-speed mode < 26 MHz
- High-speed mode >=26 MHz
ii. 8.
- Boot ROM doesn’t set SDMMCAB_POWER_CONTROL_HOST_0.HIGH_SPEED_EN bit for any
speed mode.
## 1.5 stop bit support
N
- Stop bits
2 stop bit support Y
- RX error detection
- Rx FIFO
- Overrun error
Y
- Character
- Parity error
Y
- Character
- Break error
Y
- Character
- Framing error
Y
- Baud rates
- Baud Rates supported
9600/57600/115200/460800/3M/4M/ 12M Y
- Baud tolerance
support +/- tolerance range +-2%
- Mode
- FIFO mode (32-character
- FIFO's)
Y non-FIFO mode Y
- DMA mode
Y
- Flow control
- CTS
- Flow control in Tx path
N
- RTS
- Flow control in Rx path
N
- Flush
- Tx path
- Tx Flush
Y
- Rx path
- Rx Flush
Y
- SW Based Force
conditions
- Set Break condition - Tx to send
continuous zeroes to indicate BREAK Y
- Force Parity
Y
- Break during data transmission
Y
- Force RTS
Y

- Server Base System Architecture (SBSA) UART
S. No
- Feature
- Sub-feature
- Details
- Orin Support
- FIFO level trigger
- RX_FIFO trigger
different trigger levels Y
- TX_FIFO trigger
different trigger levels Y
- Loopback
- Internal loopback
- Internal loopback between Tx and Rx
paths Y
- Compliance
- ACPI/SBSA/Standard OS
boot Y
- Interrupts
- Tx Interrupt
Y
- Rx interrupt
Y
- Rx Timeout interrupt
Y
- Overrun error interrupt
Y
- Parity error interrupt
Y
- Break error interrupt
Y
- Framing error interrupt
Y
- EORD interrupt (end of
receive data interrupt) N
- Modem support
- Modem related pins support
- DCD/DRI/DSR/DCTS/RI
N
- Polarity
invert_TXD N invert_RXD N invert_CTS N invert_RTS N
- SIR encoder/decoder
- Pulse width
- PWT=3/16th Baud Pulse
N
- Pulse width
- PWT=4/16th Baud Pulse
N
