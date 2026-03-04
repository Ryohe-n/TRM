# 2 -pin UART

- USB2 (D+/D-)
- Closed Box Debug over USB2
- PEX-UPHY Lane-0
(HSIO UPHY Brick)
- TX+/TX-
- HSSTP
- USB3.1 Port-0 (TX+/
- TX-)
- HSSTP

- Design for Debugging (DFD)
- Interface
- Pins
- Protocol
- Pins over which
muxed
- Description
- PEX-UPHY Lane-1
(HSIO UPHY Brick)
- TX+/TX-
- HSSTP
- USB3.1 Port-1 (TX+/
- TX-)
- HSSTP
- PEX-UPHY Lane-4
(HSIO UPHY Brick)
- TX+/TX-
- HSSTP
- SD7.0/UFS (TX+/TX-)
- HSSTP
- PEX-UPHY Lane-5
(HSIO UPHY Brick)
- TX+/TX-
- HSSTP
- NVMe Cartridge
(TX+/TX-)
- HSSTP
- SWD
- SWCLK, SWDIO
- SWD
- USB2 (D+/D-)
- Closed Box Debug over USB2
- NVJTAG_SEL
- NVJTAG_SEL
- -
- NVJTAG over Dedicated JTAG
interface
- NVDBG_SEL
- NVDBG_SEL
- -
- NVJTAG over USB2/SWD
interface
- CCLA_LA_TRIGGER_
- MUX
- GPIO
- -
- Trigger output from CCLA for
external Benchtop Logic
- Analyzer. (Requires GPIO to
route the trigger) For details of the debugging environment settings, refer to the Selection Matrix in the USB2 and Dedicated JTAG Ports section.
##### 9.10.2.2.5 Cross Trigger Events
The Cross Trigger Interface allows collection of events from various components and facilitates communication using these events among the participants using Cross Trigger Matrix. The following table lists connectivity of various CTI events in the system.
- Table 9.81 CTI0 Mappings in CoreSight
- CTI Trigger
- Signal Name of Connected
- Module
- Connected Module
- Comments
- CTITRIGIN0
- FULL
- ETF
- CTITRIGIN1
- ACQCOMP
- ETF
- CTITRIGIN2
- FULL
- ETR
- CTITRIGIN3
- ACQCOMP
- ETR
- CTITRIGIN4
- ASYNCOUT
- STM
- CTITRIGIN5
- TRIGOUTSPTE
- STM
- CTITRIGIN6
- TRIGOUTSW
- STM
- CTITRIGIN7
- -
- CTITRIGOUT0
- TRIGIN
- ETF

- Design for Debugging (DFD)
- CTI Trigger
- Signal Name of Connected
- Module
- Connected Module
- Comments
- CTITRIGOUT1
- FLUSHIN
- ETF
- CTITRIGOUT2
- TRIGIN
- ETR
- CTITRIGOUT3
- FLUSHIN
- ETR
- CTITRIGOUT4
- TRIGIN
- TPIU (in HSSTP)
- CTITRIGOUT5
- FLUSHIN
- TPIU (in HSSTP)
- CTITRIGOUT6
- DLY_TRIG0
- HSSTP
- CTITRIGOUTACK is driven by non-
delayed version of corresponding CTITRIGOUT.
- CTITRIGOUT7
- - Notes: Unused CTITRIGINACK[7:0] outputs from CTI are left unconnected.
- Unused CTITRIGOUTACK[7:0] inputs to CTI are tied to '1.'
- Table 9.82 CTI1 Mappings in CoreSight
- CTI Trigger
- Signal Name of
- Connected Module
- Connected Module
- Comments
- CTITRIGIN0
pmc2dfd_CSYSREQ_inv
- PMC
- CTITRIGIN1
- NVFFCR[SW_TRIG_OUT]
- HSSTP
- CTITRIGIN2
- CORESIGHT_CFG_HSSTP_
- INTERRUPT[INT_0]
- DFD
(CSITE-CFG)
- ACK is not connected. Software or
debugger is expected to clear the interrupt source.
- CTITRIGIN3
(SOC-HWPM's pmm2dfd_trigger output)
- SOC-HWPM,
(i)GPU-HWPM
- Chaining SOC-DFD, SOC-HWPM and
(i)GPU-HWPM trigger networks. CTITRIGINACK is left unconnected.
- The source is expected to keep the
trigger asserted for a long time and it is acceptable if a trigger is missed due to its existence for a very short duration.
- CTITRIGIN4-7
[ private ]
- NVCDC1
- CTITRIGOUT0
ccplex_timer_freeze_trig
- CCPLEX Timer Freeze/
- Unfreeze Request Generator
in CoreSight Major Used to generate timer freeze request.
- CTITRIGOUTACK0 is driven from Timer
- Freeze/Unfreeze Request Generator
logic in CoreSight Major
- CTITRIGOUT1
ccplex_timer_unfreeze_tri g
- CCPLEX Timer Freeze/
- Unfreeze Request Generator
in CoreSight Major
- Used to generate timer unfreeze
request.
- CTITRIGOUTACK1 is driven from Timer
- Freeze/Unfreeze Request Generator
logic in CoreSight Major

- Design for Debugging (DFD)
- CTI Trigger
- Signal Name of
- Connected Module
- Connected Module
- Comments
- CTITRIGOUT2
- DLY_TRIG1
- HSSTP
- CTITRIGOUTACK is driven by non-
delayed version of corresponding CTITRIGOUT.
- CTITRIGOUT3
(SOC-HWPM's pmm2dfd_trigger output) (CTI trigout from DFD)
- SOC-HWPM,
(i)GPU-HWPM
- Chaining SOC-DFD, SOC-HWPM and
(i)GPU-HWPM trigger networks. CTITRIGOUTACK is tied to ‘0’.
- CTITRIGOUT4-7
[ private ]
- NVCDC1
- CTI Mappings in Cortex-R5 CoreSight PILs
Applicable for BPMP, SPE, SCE, RCE, DCE, and PVA0's Cortex-R5 clusters. The following table provides information, but for more details refer to the Cortex-R5 CoreSight PIL specification.
- Table 9.83 CTI Mappings in Cortex-R5 CoreSight
- CTI Trigger
- Signal Name of
- Connected Module
- Connected Module
- Comments
- CTITRIGIN0
- DBGTRIGGER
- Cortex-R5
- PIL logic ensures CTITRIGIN0 can be
asserted by DBGTRIGGER only if CTITRIGINACK0 is LOW.
- CTITRIGIN0 held using PIL-logic (even if
source deasserts trigger) until CTITRIGINACK0 is asserted by CTI.
- CTITRIGIN1
nPMUIRQ
- Cortex-R5's PMU
- Trigger input to CTI held using PIL-logic
(even if source deasserts trigger) until corresponding CTITRIGINACK is asserted by CTI
- CTITRIGIN2
- ETMEXTOUT[0]
- ETM in Cortex-R5
- CoreSight PIL
(same as above)
- CTITRIGIN3
- ETMEXTOUT[1]
- ETM in Cortex-R5
- CoreSight PIL
(same as above)
- CTITRIGIN4
- COMMRX
- Cortex-R5
(same as above)
- CTITRIGIN5
- COMMTX
- Cortex-R5
(same as above)
- CTITRIGIN6
- ETMTRIGGER
- ETM in Cortex-R5
- CoreSight PIL
- CTITRIGINACK6 connected to ETM's
- TRIGGERACK by PIL-logic
- CTITRIGIN7
- Tied-off
- CTITRIGINACK7 is left unconnected

- Design for Debugging (DFD)
- CTI Trigger
- Signal Name of
- Connected Module
- Connected Module
- Comments
- CTITRIGOUT0
- EDBGRQ
- Cortex-R5
- CTITRIGOUT0 is be OR-ed with
- EDBGRQ_<P> signal (corresponding to
the processor/cluster) from DFD.
- The OR-ed output is then connected to
EDBGRQ input of the processor.
- CTITRIGOUTACK0 is tied to '0' and CTI
relies of clearing CTITRIGOUT0 via
- Software ACK
- CTITRIGOUT1
- ETMEXTIN[0]
- ETM in Cortex-R5
- CoreSight PIL
- CTITRIGOUTACK1 is driven by
- CTITRIGOUT1
- CTITRIGOUT2
- ETMEXTIN[1]
- ETM in Cortex-R5
- CoreSight PIL
- CTITRIGOUTACK2 is driven by
- CTITRIGOUT2
- CTITRIGOUT3
nCTIIRQ
- VIC in Cortex-R5
- Cluster
- Interrupt from Cortex-R5 PIL connected
to local VIC in Cortex-R5 cluster.
- CTITRIGOUTACK3 is tied to '0'
- CTITRIGOUT4
-
- Not connected
- CTITRIGOUTACK4 is tied to '0'
- CTITRIGOUT5
-
- Not connected
- CTITRIGOUTACK5 is tied to '0'
- CTITRIGOUT6
-
- Not connected
- CTITRIGOUTACK6 is tied to '0'
- CTITRIGOUT7
- DBGRESTART
- Cortex-R5
- CTITRIGOUTACK7 is driven from
- DBGRESTARTED signal from Cortex-R5
- CTI Mappings in R52 Cluster
The following connections apply for each R52 core and its associated CTI.
- Table 9.84 CTI Mappings in R52 Cluster
- CTI Trigger
- Signal Name of
- Connected Module
- Connected Module
- Comments
- CTITRIGIN0
- DBGTRIGGER
- R52 Core Debug
- CTI operates on the same clock as R52
core, PMU and ETM. Hence, triggers can be captured in single clock cycle (CTITRIGINACKs and CTITRIGOUTACKs are not documented here).
- CTITRIGIN1
nPMUIRQ
- PMU
(same as above)
- CTITRIGIN2
(same as above)
- CTITRIGIN3
(same as above)
- CTITRIGIN4
- ETM trace unit external
output 0
- ETM
(same as above)
- CTITRIGIN5
- ETM trace unit external
output 1
- ETM
(same as above)

- Design for Debugging (DFD)
- CTI Trigger
- Signal Name of
- Connected Module
- Connected Module
- Comments
- CTITRIGIN6
- ETM trace unit external
output 2
- ETM
(same as above)
- CTITRIGIN7
- ETM trace unit external
output 3
- ETM
(same as above)
- CTITRIGOUT0
- Requests the processor to
enter debug state
- R52 Core Debug
(same as above)
- CTITRIGOUT1
- Requests the processor to
exit debug state
- R52 Core Debug
(same as above)
- CTITRIGOUT2
- CTI interrupt
- GIC Distributor Unit in
- Governor
(same as above)
- CTITRIGOUT3
- - (same as above)
- CTITRIGOUT4
- ETM trace unit external input
- ETM
(same as above)
- CTITRIGOUT5
- ETM trace unit external input
- ETM
(same as above)
- CTITRIGOUT6
- ETM trace unit external input
- ETM
(same as above)
- CTITRIGOUT7
- ETM trace unit external input
- ETM
(same as above)
- FSI Top CTI Mappings
- Table 9.85 FSI Top CTI Mappings
- CTI Trigger
- Signal Name of Connected
- Module
- Connected Module
- Comments
- CTITRIGIN0
- WDT 3rd expiration (also known
as remote interrupt)
- FSI-TKE-WDT
- FSI-TKE contains five WDTs but
exports only one 3rd expiration common across all WDTs.
- CTITRIGINACK is not connected
(TKE does not expect an ACK for 3rd expiration)
- CTITRIGIN1
- Tied-off
- CTITRIGINACK is not connected
- CTITRIGIN2
- Tied-off
- CTITRIGINACK is not connected
- CTITRIGIN3
- Tied-off
- CTITRIGINACK is not connected
- CTITRIGIN4
- Tied-off
- CTITRIGINACK is not connected
- CTITRIGIN5
- Tied-off
- CTITRIGINACK is not connected
- CTITRIGIN6
- Tied-off
- CTITRIGINACK is not connected
- CTITRIGIN7
- Tied-off
- CTITRIGINACK is not connected

- Design for Debugging (DFD)
- CTI Trigger
- Signal Name of Connected
- Module
- Connected Module
- Comments
- CTITRIGOUT0
-
- Not connected
- CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT1
-
- Not connected
- CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT2
-
- Not connected
- CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT3
-
- Not connected
- CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT4
-
- Not connected
- CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT5
-
- Not connected
- CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT6
-
- Not connected
- CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT7
-
- Not connected
- CTITRIGOUTACK is tied to ‘0’
- CTI Mappings in VPU
VPU natively has the following signals: input cti_stop_req – When this signal is asserted, VPU enters debug mode. output cti_stop_req_ack – VPU asserts this signal to indicate that the positive transition on cti_stop_req has been detected by the VPU and that it enters debug mode. output cti_stopped – VPU asserts this signal when it enters debug mode (irrespective of the reason that caused VPU to enter debug mode). Signal is deasserted when cti_stopped_ack is asserted. input cti_stopped_ack – When this signal is asserted, VPU deasserts cti_stopped. This signal must be asserted for further operation of VPU in debug mode. input cti_run_req – When this signal is asserted, VPU exits debug mode. output cti_run_req_ack – VPU asserts this signal to indicate that the positive transition on cti_run_req has been detected by the VPU and that it exits debug mode. output cti_started – VPU asserts this signal to indicate that it has exited debug mode. input cti_started_ack – This signal must be asserted for VPU to deassert cti_started, so that VPU can resume normal operation. input dbg_ext_break_in – When this signal is asserted, VPU enters debug mode. The signals listed above are connected as shown below.

- Design for Debugging (DFD)
**Figure 9.89 VPU to CTI Connections**
- Summary of Behavior
- VPU enters Debug state when the EDBGRQ signal corresponding to the specific VPU is
asserted.
- The DBGACK signal to DFD remains asserted for the entire duration that the VPU is in Debug
state. Assertion of CTITRIGOUT0 causes VPU to start entering Debug state.
- CTITRIGOUT0 is cleared via software write to CTIINTACK[0] and not by asserting
CTITRIGOUTACK0 (similar to Cortex-R5 CTI connections).
- CTITRIGIN0 is asserted when VPU has started entering Debug state (based on CTITRIGOUT0
request) and remains asserted until CTI ACKs this trigger input.
- CTITRIGIN1 is asserted when VPU has entered Debug state and remains asserted until CTI
ACKs this trigger input.
- Assertion of CTITRIGOUT7 causes the VPU to exit Debug state and this output remains
asserted until ACKed.
- CTITRIGIN7 is asserted when VPU has exited Debug state and remains asserted until CTI
ACKs this trigger input.

- Design for Debugging (DFD)
- Table 9.86 CTI Mappings in APE
- CTI Trigger
- Signal Name of
- Connected Module
- Connected Module
- Comments
- CTITRIGIN0
- DBGTRIGGER
- Cortex-A9
- APE cluster logic ensures CTITRIGIN0
remains asserted until CTITRIGINACK0 is asserted.
- CTITRIGIN1
nPMUIRQ[0]
- APE’s PMU
- Corresponding CTITRIGINACK not
connected
- CTITRIGIN2
- PTMEXTOUT[0]
- PTM in APE cluster
(same as above)
- CTITRIGIN3
- PTMEXTOUT[1]
- PTM in APE cluster
(same as above)
- CTITRIGIN4
- COMMTX
- Cortex-A9 in APE
cluster (same as above)
- CTITRIGIN5
- COMMRX
- Cortex-A9 in APE
cluster (same as above)
- CTITRIGIN6
- PTMTRIGGER
- PTM in APE cluster
(same as above)
- CTITRIGIN7
- Tied-off
(same as above)
- CTITRIGOUT0
- EDBGRQ
- Cortex-A9
(EDBGRQ input to Cortex-A9) = (CTITRIGOUT0) |(EDBGRQ_APE from DFD) |(PTMDBGREQ from APE
- PTM’s) CTITRIGOUTACK0 is tied to ‘0’and
- CTI relies of clearing CTITRIGOUT0 via
software ACK
- CTITRIGOUT[4:1]
- PTMEXTIN[3:0]
- PTM in APE cluster
corresponding CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT5
- CTIEXTTRIG0
- Not connected
- CTITRIGOUTACK5 (also known as
‘CTIEXTTRIGACK0’) is tied to ‘0’.
- CTITRIGOUT6
- CTIIRQ
- GIC in APE cluster
corresponding CTITRIGOUTACK is tied to ‘0’
- CTITRIGOUT7
- DBGRESTART
- Cortex-A9
- CTI Mappings in CCPLEX
Refer to the Arm DSU TRM, C1.6 CTI Triggers section for details.
##### 9.10.2.2.6 DFD Interrupts
nCTIIRQ and nPNUIRQ interrupts are connected to the respective clusters local GIC/VIC and do not have dedicated interrupt slots on the LIC. Refer to Interrupt specifications for details on the GIC/ VIC connections to the LIC.

- Design for Debugging (DFD)
##### 9.10.2.2.7 Clocks
- DFD clocks (CSITE, DBGAPB, HSSTP_CLK, and LA) have clock enables implemented in CAR and do
not have second level clock gating implemented on them inside different clusters. The following table lists the clock targets for clocks used by DFD.
- Clock
- Target
- Clock Sources for Clock Mux
- CSITE
625MHz @ 0.72V VDD_{SOC/CPU/RTC} (scaled at other MV targets) clk_s (32kHz), clk_m (default) (=OSC/2=19.2MHz),
- PLLP (408MHz),
- REFPLLE (625MHz),
- PLLC, PLLC2, PLLC3 and PLLC4
- DBGAPB
136MHz @ all PVT corners clk_s (32kHz), clk_m (default) (=OSC/2=19.2MHz),
- PLLP (408MHz)
- REFPLLE (625MHz)
- HSSTP_CLK
500MHz @ 0.72V (SoC)
- UPHY_TX_CLK
- HSSTP_RX_CLK
500MHz @ 0.72V (SoC)
- UPHY_RX_CLK
- JTAG_TCK
(JTAG I/O Clock) 50 MHz @ all corners
- Note: DFT needs this to be 100MHz so DFD
synthesizes/retimes logic on this clock at 100MHz as well
- Derived from TCK clock input on JTAG
interface
- SWD_IP_CLK
(SWD I/O Clock) 10MHz @ all corners
- Derived from SWCLK clock input on SWD
interface. Also referred to as SWCLK in the document.
- Debug APB Clock
- This clock (also referred to as the DBGAPB_CLK) is synthesized to operate at 136MHz at all
process-voltage-temperature (PVT) corners. While this clock can be completely gated to save power, to avoid debug-lockout, the recommendation for power savings is to program DBGAPB_CLK to a lower frequency (e.g., 19.2MHz). DBGAPB_CLK drives PCLK input of the Cortex-A78 AE core/ DSU and they need the input PCLK running to be able to successfully power-up or power-down.
- DBGAPB_CLK also needs to be ON while powering up or powering down CCPLEX or individual CPU
core. Hence, it is recommended to always keep DBGAPB_CLK ON.
- CoreSight ATB Clock
This clock (also referred to as the CSITE_CLK) can be used at frequencies up to 625MHz depending on the rail voltages.

- Design for Debugging (DFD)
- JTAG Clock
This refers to the JTAG interface clock driven by TCK (also referred to as the JTAG_TCK), which works up to 50MHz frequency.
- SWD Clock
This refers to the SWD interface clock driven by SWCLK (also referred to as the SWD_IP_CLK), which works up to 1 0MHz frequency.
##### 9.10.2.2.8 Debug Reset
- DFD uses a configurable L1 warm reset. This reset supports debug features such as DFD-
RAMDUMP and SC7-Debug. Warm reset is expected to be asserted during SC7 exit and then de-asserted. This is an important aspect for DFD. Warm reset must not be asserted while entering SC7 or while in SC7 -- warm reset must only be asserted during SC7 exit and not earlier.
- Also, as L2 reset is sequenced during DFD-RAMDUMP, logic (in DFD, MSS, PMC, PADCTL, etc.)
essential for retaining DRAM in self-refresh must be on L1 warm reset to prevent it from getting reset during L2 reset.
- DP_AUX Port
- Table 9.87 DP_AUX Port
- Inputs
- System State (DPAUX port)
E_I2C CFG
- DPAUX PINMUX CFG
- Controller active on DPAUX pins
x
- Functional (DPAUX)
- Functional (I2C)
- Debug (UART6)
#### 9.10.2.3 Miscellaneous Debug Features
##### 9.10.2.3.1 Reading Device ECID/UID
- To obtain the ECID/UID of the device, place the device in recovery mode. On the Linux host
machine, open a terminal window to check if the device is listed by entering the Isusb command. The system returns a listing similar to the following:

- Design for Debugging (DFD)
- Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
- Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
- Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
- Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
- Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
- Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
- Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
- Bus 008 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
- Bus 001 Device 002: ID 0409:005a NEC Corp. HighSpeed Hub
- Bus 008 Device 002: ID 046d:c05a Logitech, Inc. Optical Mouse M90
- Bus 001 Device 003: ID 0403:6011 Future Technology Devices International, Ltd FT4232H
- Quad HS USB-UART/FIFO IC
- Bus 001 Device 021: ID 0955:7021 NVIDIA Corporation
Execute the following command to obtain the UID of the device. sudo ./tegrarcm_v2 --uid This command returns a 16 Byte string similar to the following:
- BR_CID: 0x018010016419d1871400000009038380
##### 9.10.2.3.2 Accessing CBB and DBB using AXI-AP and ETR
AXI-AP issues transactions for CBB and DBB. ETR can stream trace over DBB to memory. The following subsections describe the connectivity from AXI-AP and ETR to CBB and DBB.
- Network Overview
- CBB does not support a path to memory; therefore, DFD needs to route memory accesses over
DBB and I/O access over CBB.
- CBB versus DBB Address Routing
Control Plane (including PCIe apertures) accesses are routed to CBB. Data Plane accesses are routed to DBB.

- Design for Debugging (DFD)
- DBB User Bit Assignments
- Table 9.88 AXI Initiator Write Request Channel
- AXI-DBB
awuser Bits
- ETR
- AXI-AP
awuser[7:0] = c2mc_StreamID[7:0]
- CORESIGHT_CFG_ETR_MC_WR_CTRL
_0 [ ETR_SID ]
- CORESIGHT_CFG_CSITE_MC_WR_CTR
L_0 [ CSITE_SID ] awuser[8] = Coh_IO_acc
- CORESIGHT_CFG_ETR_MC_WR_CTRL
_0 [ COH ] ^AWDOMAIN[1:0] awuser[9] = wsb_ns
- AWPROT[1]
- AWPROT[1]
awuser[10] = sc2mc_vpr_wr
- CORESIGHT_CFG_ETR_MC_WR_CTRL
_0 [ VPR ]
- CORESIGHT_CFG_CSITE_MC_WR_CTR
L_0 [ VPR ] awuser[15:11] = GSC_AID[4:0]
- CORESIGHT_CFG_ETR_MC_WR_CTRL
_0 [ GSC_AID ]
- CORESIGHT_CFG_CSITE_MC_WR_CTR
L_0 [ GSC_AID ] awuser[17:16] = GSC_AL[1:0]
- CORESIGHT_CFG_ETR_MC_WR_CTRL
_0 [ GSC_AL ]
- CORESIGHT_CFG_CSITE_MC_WR_CTR
L_0 [ GSC_AL ] awuser[18]= user_adr[5]
- AWADDR[5]
awuser[21:19]= { c2mc_adr1[8:6] }
- AWADDR[8:6]
awuser[22]= c2mc_sp_aware
- CORESIGHT_CFG_ETR_MC_WR_CTRL
_0 [SP_AWARE]
- CORESIGHT_CFG_CSITE_MC_WR_CTR
L_0 [SP_AWARE] awuser[25:23]= reserved - - awuser[28:26] = c2mc_user_size
- CORESIGHT_CFG_ETR_MC_WR_CTRL
_0 [ HINT_SIZE ]
- CORESIGHT_CFG_CSITE_MC_WR_CTR
L_0 [ HINT_SIZE ]
- Table 9.89 AXI Initiator Read Request Channel
- AXI-DBB
aruser Bits
- ETR
- AXI-AP
aruser[7:0] = c2mc_StreamID[7:0]
- CORESIGHT_CFG_ETR_MC_RD_CTRL
_0 [ ETR_SID ]
- CORESIGHT_CFG_CSITE_MC_RD_CTRL
_0 [ CSITE_SID ]

- Design for Debugging (DFD)
- AXI-DBB
aruser Bits
- ETR
- AXI-AP
aruser[8] = Coh_IO_acc
- CORESIGHT_CFG_ETR_MC_RD_CTRL
_0 [ COH ] ^ARDOMAIN[1:0] aruser[9] = rsb_ns
- ARPROT[1]
- ARPROT[1]
aruser[10] = sc2mc_vpr_rd
- CORESIGHT_CFG_ETR_MC_RD_CTRL
_0 [ VPR ]
- CORESIGHT_CFG_CSITE_MC_RD_CTRL
_0 [ VPR ] aruser[15:11] = GSC_AID[4:0]
- CORESIGHT_CFG_ETR_MC_RD_CTRL
_0 [ GSC_AID ]
- CORESIGHT_CFG_CSITE_MC_RD_CTRL
_0 [ GSC_AID ] aruser[17:16] = GSC_AL[1:0]
- CORESIGHT_CFG_ETR_MC_RD_CTRL
_0 [ GSC_AL ]
- CORESIGHT_CFG_CSITE_MC_RD_CTRL
_0 [ GSC_AL ] aruser[18]= user_adr[5]
- ARADDR[5]
aruser[21:19]= { c2mc_adr1[8:6] }
- ARADDR[8:6]
aruser[22]= c2mc_sp_aware
- CORESIGHT_CFG_ETR_MC_RD_CTRL
_0 [SP_AWARE]
- CORESIGHT_CFG_CSITE_MC_RD_CTRL
_0 [SP_AWARE] aruser[25:23]= reserved - - aruser[28:26] = c2mc_user_size
- CORESIGHT_CFG_ETR_MC_RD_CTRL
_0 [ HINT_SIZE ]
- CORESIGHT_CFG_CSITE_MC_RD_CTRL
_0 [ HINT_SIZE ]
- AXI Initiator Read Data Channel
The only user bit driven on the Read Data channel is rnv_vpr_resp_user. This signal indicates that this response data was sourced from VPR aperture. This offers a hardware-only mechanism for the Initiator to know if the data is from the VPR region or not. Given that neither AXI-AP nor ETR are allowed to read from the VPR region, this optional bit is not taken in by DFD partition.
- Register Definitions
- The table below lists the register definitions of the CORESIGHT_CFG_{ETR,CSITE}MC{RD,WR}
_CTRL_0.
- Bits
- ETR
- CSITE
[28:26] = c2mc_user_size
- RW=0
- RW=0
[25:23] = reserved
- RW=0 (not used)
- RW=0 (not used)
[22] = SP_AWARE
- RW=0
- RW=0

- Design for Debugging (DFD)
- Bits
- ETR
- CSITE
[21:19] = ADR1_Bit8toBit6
- RW=0
- RW=0
[18] = USER_ADR_5
- RW=0
- RW=0
[17:16] = GSC_AL
- RO=0
- RO=0
[15:11] = GSC_AID
- RW=0
- RW=0
[10] = VPR_{RD,WR}
- RO=0
- RO=0
[9] = {RSB,WSB}_NS
- RW=0 (not used)
- RW=0 (not used)
[8] = COH
- RW=0
- RW=0 (not used)
[7:0] = SID
- RW=0
- RW=0
- Sub-Partition Bits
- Hardware Design Guidelines
- If (sp_aware==0)
{ c2mc_adr1[8:6] = AxADDR[8:6]; user_adr[5] = AxADDR[5]; }
- Else
{ c2mc_adr1[8:6] =
- CORESIGHT_CFG_{CSITE}_MC_{RD,WR}_CTRL_0[ADR1_Bit8toBit6];
user_adr[5] =
- CORESIGHT_CFG_{CSITE}_MC_{RD,WR}_CTRL_0[USER_ADR_5];
}
- Software Usage Guidelines
Software should not program the SP_AWARE field unless it wishes to use the sub-partition feature in MC. To use the sub-partition aware feature for accesses from the AXI-AP (CSITE) port, program the SP_AWARE ADR1_Bit8toBit6 fields in the configuration register corresponding to the access {CSITE}x{RD,WR}. Then make the sp-aware access on DBB.
- CBB User Bit Assignment
- Table 9.90 AXI Initiator Write Request Channel
- AXI-CBB awuser Bits
- CSITE
awuser[16:11] = MSTR_ID[5:0]
- CSITE's MSTR-ID (0xA)
awuser[10:9] = VQC[1:0]
- CORESIGHT_CFG_CSITE_CBB_WR_CTRL_0 [ VQC ]

- Design for Debugging (DFD)
- AXI-CBB awuser Bits
- CSITE
awuser[8:2] = GRPSEC[6:0]
- MISCREG_CSITE_SECURITY_0 [ G7W:G1W ]
awuser[1:0] = FALCONSEC[1:0]
- CORESIGHT_CFG_CSITE_CBB_WR_CTRL_0 [ FALCONSEC ]
- Table 9.91 AXI Initiator Read Request Channel
- AXI-CBB aruser Bits
- CSITE
aruser[16:11] = MSTR_ID[5:0]
- CSITE's MSTR-ID (0xA)
aruser[10:9] = VQC[1:0]
- CORESIGHT_CFG_CSITE_CBB_RD_CTRL_0 [ VQC ]
aruser[8:2] = GRPSEC[6:0]
- MISCREG_CSITE_SECURITY_0 [ G7R:G1R ]
aruser[1:0] = FALCONSEC[1:0]
- CORESIGHT_CFG_CSITE_CBB_RD_CTRL_0 [ FALCONSEC ]
- RO = b'00
- Register Definitions
The following table lists the register definitions of the CORESIGHT_CFG_{CSITE}_CBB_{WR,RD} _CTRL_0 registers described above.
- Bits
- CSITE/AXI-AP
[16:11] = MSTR_ID[5:0]
- RO = 0xA (not used)
[10:9] = VQC[1:0]
- RW = b'00
[8:2] = GRPSEC[6:0]
- RO = b'000_0000 (not used)
[1:0] = FALCONSEC[1:0]
- RO = b'00
CORESIGHT_CFG_CSITE_CBB_{WR,RD}_CTRL_0 are protected by an independent SCR.
- ETR AXI Interface
Although ETR uses an AXI3 interface, it does not support Transaction IDs (AWID, WID, BID, ARID, and RID). The ETR's AXI interface does not have ports for these signals. Since ETR is an initiator on DBB, the Transaction ID signals for ETR must be driven as follows: For the ETR AXI-DBB port, ARID is tied to 0x0 while AWID is tied to 0x1. Ignore BID and RID (as these are driven by target).
- AXI-DBB does not support WID (although it claims to be AXI3 based socket), but the absence
of WID on the ETR interface is not an issue. If AXI-DBB has a WID port, it is tied to 0x1 to indicate that ETR does not support write interleaving.

- Design for Debugging (DFD)
- SMMU Bypass Ability for AXI-AP
MSS restricts non-SMMU translated (PA) accesses only to GSCs. However, for debug purposes, AXI- AP needs the ability to bypass SMMU and still access non-GSC regions using PA, in addition to regular abilities to access GSC regions using PA and non-GSC regions using VA. MSS supports two methods for AXIAP to be able to bypass SMMU and still be able to access a non-GSC region in memory:
- Using AXIAP_SMMU_BYPASS_CARVEOUT_CHECK
- Using AXI_AP_VIRTUAL_CLIENT
- Ensure BCT setting is such that AXIAP_SMMU_BYPASS_CARVEOUT_CHECK is ‘CARVEOUT_ONLY’,
{AXIAPR,AXIAPW}_SMMU_BYPASS_ALLOW are 'DISALLOW'', AXI_AP_VIRTUAL_CLIENT is 'NO_SET_VIRTUAL_CLIENT ' and AXI_AP_VIRTUAL_CLIENT_WRITE_ACCESS=1 (lock)
##### 9.10.2.3.3 Support Coherency Debug via CoreSight AXI-AP
- ACE Lite Background
CoreSight supports ACE-Lite protocol for AXI interface at AXI-AP.
- AxSNOOP and AxBAR Optimization
As CoreSight does not contain a cache of its own, AxSNOOP attribute can be ignored and assumed tied to 0b000. Support for native barrier transactions is absent in DBB, and so AxBAR can also be ignored and assumed tied to 0b0.
- AxDOMAIN Optimization
- When AxSNOOP[3:0]==0b000 and AxBAR[0]==0b0,
^AxDOMAIN[1:0]==0 implies Non Snooping Access and ^AxDOMAIN[1:0]==1 implies Coherent Access.
- AXI-DBB socket does not support the 2-bit signal, AxDOMAIN[1:0] on the read/write address
channels, but rather supports a 1-bit signal, COH_IO_ACC[0] on the read/write address channels.
- COH_IO_ACC==0 generates a Non-Snooping Access whereas
COH_IO_ACC==1 generates a Coherent Access.
- Assigning COH_IO_ACC = ^AxDOMAIN[1:0] is reasonable, but only when SMMU is bypassed. When
a transaction does not bypass SMMU, coherency/snoop is determined by the page table attribute in the SMMU.

- Design for Debugging (DFD)
##### 9.10.2.3.4 Debugging Clusters with DCLS Implementation
For safety reasons, some of the auxiliary Cortex-R5 clusters (e.g., BPMP, SCE, RCE, DCE) have used the Dual-Core Lock-Step Implementation to detect faults using redundancy and comparison. However, as the debug logic external to the Cortex-R5 cores is not replicated, these debug signals are monitored on a Check Not Asserted (CNA) Bus. Assertion of any signal on the CNA bus can be propagated as a fault indication. This can prevent debug because as soon as any debug transaction occurs, it could potentially lead to a fault and thus change the system environment. Also, there could be certain issues that can only be replicated when DCLS is enabled, so the ability to debug while DCLS is enabled is necessary. To support debugging while DCLS is enabled, configurable bits are provided that can disable CNA bus monitoring thus preventing assertion of signals that are monitored on the CNA bus from leading to an error/reset/fault assertion.
- Subsequent subsections describe the guidelines to debug clusters with DCLS enabled for the
Cortex-R5 cores.
- BPMP
Programming the following registers prevents the debug signals from generating any comparator error/fault or trigger a CNA event/error/fault: 1.
- Write "1" to CPU_CNA_ERR field in the BPMP_MISC_ERR_RESET_MASK2 register
(Note: Software usually leaves this field to its reset value (1), so programming this during debug might not be necessary.)
- Write "0" to ERR63_ENABLE field in the
- BPMP_ERROR_COLLATOR_ERRSLICE1_MISSIONERR_ENABLE_0 register
- Write "0" to ERR63_ENABLE field in the
- BPMP_ERROR_COLLATOR_ERRSLICE1_LATENTERR_ENABLE_0 register
2. 3.
- APS_PROC_CFG_DCLS_ENABLE=1 allows the Cortex-R5s to execute in lock-step despite disabling
the debug signal monitoring. This allows for debugging BPMP without disabling lock-step execution of the Cortex-R5-cores.
- SCE
Program the following fields with '0' to prevent debug transactions to SCE from generating errors/ faults: 1.
- ERR77 field in the SCE_EC_REGS_ERRSLICE2_MISSIONERR_ENABLE register in
- SCE_ERR_COLLATOR amap space
- ERR77 field in the SCE_EC_REGS_ERRSLICE2_LATENTERR_ENABLE register in
- SCE_ERR_COLLATOR amap space
- ERR77 field in the SCE_MISC_AUTOLOCK_EC_ERRSLICE2_MISSIONERR_ENABLE register in
- SCE_MISC amap space
- ERR77 field in the SCE_MISC_AUTOLOCK_EC_ERRSLICE2_LATENTERR_ENABLE register in
- SCE_MISC amap space
2. 3. 4.

- Design for Debugging (DFD)
- APS_PROC_CFG_DCLS_ENABLE=1 allows the Cortex-R5s to execute in lock-step despite disabling
the debug signal monitoring. This allows for debugging SCE without disabling lock-step execution of the Cortex-R5 cores.
- RCE
The programming steps are similar to SCE. Replace “SCE” with “RCE” in the programming sequence mentioned in the SCE subsection above.
- DCE
The programming steps are similar to SCE. Replace “SCE” with “DCE” in the programming sequence mentioned in the SCE subsection above.
- FSI
Software programs the following before enabling FSI debug to prevent FSI-debug enablement from generating errors or faults: 1.
- NV_ADDRESS_MAP_FSI_MISC_GEN_CFG_BASE + CHECK_NOT_ASSERTED.CPU_CNA = 0
(reset default)
- NV_ADDRESS_MAP_FSI_MISC_GEN_CFG_BASE + CHECK_NOT_ASSERTED.CPU_CHSM (reset
default) 2. The reset values ensure that during bring-up, faults are disabled by default out of reset.
- In FSI-R52, individual debug enables can be enabled/disabled from generating faults by
programming: 1. 2.
- FSI_HSM_SOC_ERROR_EN_<> [FSI_CPU_CNA_*_UE mod 32] = 0
- FSI_HSM_INT_EN_<> [FSI_CPU_CNA_*_UE mod 32] = 0
Also program the following before issuing any debug transaction to FSI: 1. 2.
- FSI_R5_EC_ERRSLICE1_MISSIONERR_ENABLE_0[ERR44]=DISABLE
- FSI_R5_EC_ERRSLICE1_LATENTERR_ENABLE_0[ERR44]=DISABLE
- Reset Guidelines
Upon reset, debug bus monitoring is disabled. This ensures that DCLS_ENABLE=0 upon reset. Thus, even if the error-enable fields in the error-collator registers are '1' upon reset, that is not an issue as DCLS_ENABLE=0 suppresses all interrupts/errors/resets/faults from being generated due to assertions on the debug bus.

- Design for Debugging (DFD)
##### 9.10.2.3.5 Unified UART
In the SoC, depending on platform requirements, the following UARTs are available for printing debug logs:
- UART3/UARTC
This UART is in AO-Cluster and hence can be used even in low power states like SC7.
- UART6/UARTF
This UART is pinmuxed over the DPAUX0 pins.
- UART8/UARTH
- This UART is pinmuxed over USB2-Port0 and USB2-Port1 and can be available over either of
the two at a time. Refer to the Software Application Note on how multiple processors can print UART logs over a single UART without getting the eventual output log entangled.
##### 9.10.2.3.6 ACCESS_BLOCK and ACCESS_TIMEOUT on Debug-APB
- To not hang the debugger itself while making accesses on the Debug APB, CoreSight has an
internal NV module to: Timeout the Debug APB accesses for each of the debug-APB clients on no response.
- Block the accesses that are guaranteed to result in timeout due to a non-responsive debug
- APB client. Either of these could be non-responsive due to power down, clock gating, or
under reset. Both the timeout and access block features can be separately disabled by using bits, TIMEOUT_EN and BLOCK_ACCESS_EN, in the CORESIGHT_CFG_CTL_0 register.
- In case of Timeout, users have an option between choosing between a long timeout of
0xfffff counts(default) versus a short timeout of 0x200 clock cycles of DBGAPB_CLK. This can be done via the CORESIGHT_CFG_CTL_0. In the event of either a timeout or access block, deadcodes are returned on the prdata bus to immediately identify what caused a particular access to timeout or get blocked. Corresponding pready signal from initiator is also asserted (1’b1). On receiving the plsverr, the debugger clears the sticky status bit in the DAP (this is STICKYERR bit in CTRL/STAT register of JTAG-DP/SW-DP, depending on which external debug interface, JTAG or
- SWD, is being used) and then query the respective CORESIGHT_CFG_<module>_ALIVE_STATUS
register to check the cause of timeout/blocking.
- If the transaction was terminated due to the timeout generated by DFD TIMEOUT logic, then
corresponding .*_DBGAPB_TIMEOUT bit in respective CORESIGHT_CFG_.*_ALIVE_STATUS_0 is set

- Design for Debugging (DFD)
to ‘1’. Only a reset or writing (MMIO write-access to this register[field]) a ‘1’ to this bit clears the bit to ‘0’.
- Note: MMIO writes of ‘0’ to any field in CORESIGHT_CFG_.*_ALIVE_STATUS_0 do not change the
value of that field. Also, apart from .*_DBGAPB_TIMEOUT, all other fields in CORESIGHT_CFG_.*_ALIVE_STATUS_0 should be read-only (‘RO’). The table below lists the accesses that are blocked by CoreSight. Note that for accesses that are not blocked, they result in a timeout over the debug APB if the CPUs are not able to respond before the timeout.
- Yes indicates Accesses Blocked by CoreSight
- Powergated?
- Under Reset?
- Clock gated?
- Cortex-R5 | BPMP
- No
- Yes
- No
- Cortex-R5 | SCE
- No
- Yes
- No
- Cortex-R5 | RCE
- No
- Yes
- No
- Cortex-R5 | DCE
- No
- Yes
- No
- CVPVA
- Yes
- No
- No
- PVA{0}_R5
- Yes
- Yes
- No
- PVA{0}_VPU{0,1}
- Yes
- Yes
- No
- Cortex-R5 | SPE
- Yes
- Yes
- No
- Cortex-A9 | APE
- Yes
- No
- Yes
- HSSTP
- No
- Yes
- No
- FSI
- Yes
- Yes
- Yes
The Cortex-R5s have Processor Integration Layers (PIL) around them that allow access to the debug ROM table even if Cortex-R5s are clock-gated, and therefore cannot be called as non- responsive. For processors with multiple resets, only nsysporresetn and presetdbg are relevant to derive a non-responsive status. The former puts both processor and non-processor logic with debug registers under reset, and the latter impacts the pipe-stages that transport debug signals. APE uses the same reset as DFD (csitel2rstn, which is an L2 warm reset). Accesses to APE do not use its reset status for blocking accesses. However, as APE’s debug-APB interface is on CSITE-CLK, and as there is a possibility of CSITE_CLK being off, accesses to APE are blocked when CSITE_CE=0 (i.e., when CSITE_CLK is OFF).
- For CVPVA, PVA0, and PVA1, the CoreSight accesses are blocked under following
circumstances:

- Design for Debugging (DFD)
a.
- CoreSight accesses to CVPVA, PVA0, and PVA1 are blocked when one of the following
conditions becomes true i.
- CVPVA is rail gated
- Clock gating not applicable as components use DBGAPB and CSITE clocks (same as
- CoreSight)
ii. b.
- CoreSight accesses to entire PVA<p> (includes Cortex-R5 PIL and VPS clusters in
corresponding PVA) are blocked when one of the following conditions becomes true ( <p> ∈ {0,1} ) i.
- PVA<p> is power gated
- PVA<p> debug is under reset (PRESETDBGn associated with corresponding Cortex-R5
cluster in the PVA cluster is asserted)
- Clock gating not applicable as CoreSight components use DBGAPB and CSITE clocks
(same as CoreSight) ii. iii. c.
- CoreSight accesses to a Cortex-R5 cluster inside a PVA<p> cluster are blocked when one
of the following conditions becomes true i.
- PVA<p> Cortex-R5 cluster is under reset (nSYSPORESET associated with the Cortex-R5
cluster is asserted)
- Power gating not applicable because power gating only occurs at entire PVA-level and not
individually for sub-clusters of PVA like Cortex-R5 cluster and VPS-clusters.
- Clock gating not applicable as CoreSight components use DBGAPB or CSITE clocks
(same as CoreSight) ii. iii. d.
- CoreSight accesses to a VPS<p,v> cluster inside a PVA<p> cluster are blocked when one of
the following conditions becomes true (<p,v> ∈ {00,01,10,11}) i.
- VPS<p,v> debug is under reset (VPUPRESETDBGn associated with the VPS<p,v> cluster is
asserted)
- Power gating not applicable because power gating only occurs at entire PVA-level and not
individually for sub-clusters of PVA like Cortex-R5 cluster and VPS-clusters.
- Clock gating not applicable as CoreSight components use DBGAPB or CSITE clocks
(same as CoreSight) ii. iii.
- CVPVA
- PVA<p>
- PVA<p>_R
5PIL
- PVA<p>_V
- PS<v>
- PVA<p>_VP
S<v>
- VPUPRESET
- DBGn
- PVA<p>_
- R5PIL
- SYSPORE
- SETn
- PVA<p>_
- R5PIL
- PRESETD
- BGn
- CV
- Rail Clamp
- PVA<p>
- Power
- Clamp
x x x x
- Blocked
- Blocked
- Blocked
- Blocked
x x x
- ALLOW
- Blocked
- Blocked
- Blocked
x x
- ALLOW
- Blocked
- Blocked
- Blocked
- ALLOW
- ALLOW
- Blocked
- Blocked
- ALLOW
- ALLOW
- ALLOW
- Blocked

- Design for Debugging (DFD)
- CVPVA
- PVA<p>
- PVA<p>_R
5PIL
- PVA<p>_V
- PS<v>
- PVA<p>_VP
S<v>
- VPUPRESET
- DBGn
- PVA<p>_
- R5PIL
- SYSPORE
- SETn
- PVA<p>_
- R5PIL
- PRESETD
- BGn
- CV
- Rail Clamp
- PVA<p>
- Power
- Clamp
- ALLOW
- ALLOW
- Blocked
- ALLOW
- ALLOW
- ALLOW
- ALLOW
- ALLOW
where <p,v> ∈ {00,01,10,11}
- For CCPLEX, CCPLEX logic in SOC-NPG domain on system L2warm reset has its clocks
enabled by default and guaranteed to respond (either with data, RAZ/WI or pslverr) to all transactions. Access blocking is not done for transactions directed towards CCPLEX.
- For HSSTP, the HSSTP CAR reset is used for ACCESS_BLOCK for entire HSSTP-Collator
subsystem. If a transaction is directed to a register under the internal HSSTP reset (e.g., TPIU, which is a subset of HSSTP-Collator subsystem), ACCESS_BLOCK may not always be able to intercept the transaction, and ACCESS_TIMEOUT intervenes. Additionally, when any of the APBICs is in reset, it returns a pslverr, as indicated in Debug APB Interface definition in CoreSight SAS. For FSI, access to a core and its related debug components (PMU, CTI, ETM) is blocked in the following cases:
- Access to entire FSI is blocked if
a.
- FSI Rail Clamp is ‘1’ or
- FSI MV APB Async Bridge’s CSYSREQ is ‘0’
- FSI_CSITE_RSTN=’0’ or
- FSI_CSITE_CE=0
i. ii. iii. iv.
- Access to entire FSI Cluster-0 is blocked if
b.
- FSI Cluster-0’s nSYSPORESET or nPRESETDBG is ‘0’
i.
- Access to entire FSI Cluster-1 is blocked if FSI Cluster-1’s nTOPRESET, or nPRESETDBG is
‘0’.
- Access to an R52 core<x> DBG, PMU and ETM (not CTI) is blocked if corresponding
nCPUPORESET<x> is ‘0’. c. d.
- Interface for CoreSight Deadcodes and Timeouts
CoreSight needs the following sidebands to use in the timeout/access block logic for CoreSight for Cortex-R5:
- Cortex-R5’s sysporreset
- Cortex-R5’s global clock enable
- Cortex-R5’s main powerdown clamp for the cluster
- When blocking is disabled and timeout enabled, the deadcode obtained from Cortex-R5s is
0xdead1002 as opposed to the expected deadcode 0xdead000A (timeout). This is because, when

- Design for Debugging (DFD)
- PG-ed the ports are clamped in such a way that 0xdead1002 is returned with PSLVERR, a read
transaction is issued over Debug APB. So, the access does complete without a timeout and the deadcode is natively returned from the client.
- List of Timeout and Access Block Deadcodes
- Refer to the field description for CORESIGHT_CFG_CTL_0[TIMEOUT_EN] and
CORESIGHT_CFG_CTL_0[BLOCK_ACCESS_EN] for a list of corresponding deadcodes.
- Unit
- TIMEOUT_EN deadcode
- BLOCK_ACCESS_EN
deadcode
- Comments
- CCPLEX
0xdead0002 N/A
- APE
0xdead0004 0xdead0003
- LA
0xdead0006 0xdead0005
- BPMP
0xdead0008 0xdead0007
- SPE
0xdead000A 0xdead0009
- SCE
0xdead000C 0xdead000B
- RCE
0xdead000E 0xdead000D
- DCE
0xdead0010 0xdead0011 - - -
- HSSTP
0xdead0014 0xdead0015
- FSI
0xdead0016 0xdead0017
- All remaining apertures on Major
- APBIC that do not use DBGAPB-CLK
and are not already covered by
- ACCESS-TIMEOUT
(e.g., Major Funnel, ETF, Replicator,
- ETR, STM, CTI-TOP0, CTI-TOP1)
0xdead0018 -
- All remaining apertures on Minor
- APBIC that do not use DBGAPB-CLK
and are not already covered by
- ACCESS-TIMEOUT
(e.g., Minor Funnel) 0xdead0020 -

- Design for Debugging (DFD)
- Unit
- TIMEOUT_EN deadcode
- BLOCK_ACCESS_EN
deadcode
- Comments
- PVA
0xdead0041 – PVA Collator
- RomTable/Funnel Debug APB
- Timed Out
0xdead0043 – PVA0- R5PIL
- Debug APB Timed Out
0xdead0045 – PVA0-VPS0
- Debug APB Timed Out
0xdead0047 – PVA0-VPS1
- Debug APB Timed Out
0xdead0049 – PVA1- R5PIL
- Debug APB Timed Out
0xdead004B – PVA1-VPS0
- Debug APB Timed Out
0xdead004D – PVA1-VPS1
- Debug APB Timed Out
0xdead004F – PVA0 Rom Table
- Timed Out
0xdead0051 – PVA1 Rom Table
- Timed Out
0xdead0040 – PVA Collator
- RomTable/Funnel is
nonresponsive 0xdead0042 – PVA0- R5PIL is nonresponsive 0xdead0044 – PVA0-VPS0 is nonresponsive 0xdead0046 – PVA0-VPS1 is nonresponsive 0xdead0048 – PVA1- R5PIL is nonresponsive 0xdead004A – PVA1-VPS0 is nonresponsive 0xdead004C – PVA1-VPS1 is nonresponsive 0xdead004E – PVA0 Rom Table is nonresponsive 0xdead0050 – PVA1 Rom Table is nonresponsive Note:
- When an SCR blocks an access, a pslverr is returned with deadcode: 0xdead1007. Also, if an
access is made to an unmapped offset in an slvgen based APB-target, deadcode: 0xdead1001 is returned.
- CCPLEX may return a pslverr with deadcode 0xDEADCCAF when ACDI detects timeout on
debug APB bus within CCPLEX. It also sets a bit that prevents further accesses to same target until the EDACR register is read. CCPLEX returns a pslverr with deadcode 0xDEADCCA0 when SCF is in reset.
##### 9.10.2.3.7 EDBGRQ, DBGACK, and Freezing Timers During Debug
- CORESIGHT_CFG_EXTERNAL_DEBUG_REQ_0[EDBGRQ_.*]
- EDBGRQ bits corresponding to the following processors exist in
CORESIGHT_CFG_EXTERNAL_DEBUG_REQ_0:
- APE, SPE
- SCE, RCE, DCE
- PVA0-R5, PVA0-VPU0, PVA0-VPU1
- FSI Cluster-1 Cores [0-3], FSI Cluster-0 Core0

- Design for Debugging (DFD)
If the processor’s debug is enabled, asserting the corresponding EDBGRQ causes the processor to enter debug state.
- EDBGRQ is Not Cleared by DBGACK
- CORESIGHT_CFG_EXTERNAL_DEBUG_REQ_0 contains custom EDBGRQ bits corresponding to
different processors which, if set, can cause the corresponding processor to enter debug mode if the processor’s debug has been allowed by its corresponding debug authentication signals.
- Assertion of a DBGACK bit (observable in CORESIGHT_CFG_DEBUG_ACK_0) does not automatically
clear the corresponding EDBGRQ bit (in CORESIGHT_CFG_EXTERNAL_DEBUG_REQ_0). Hence, if EDBGRQ is used to put a processor in debug mode, it should be cleared before trying to get the processor out of debug mode, else if EDBGRQ is left asserted, the processor does not exit debug mode. Typically, tools are expected to use the CTI registers (accessible over the debug-APB bus) to trigger debug-request to a particular processor rather than using the EDBGRQ bits in CORESIGHT_CFG_EXTERNAL_DEBUG_REQ_0.
- Generating Timer Freeze Request During CCPLEX Debug
- As the DSU wrapper that encapsulates the CCPLEX CPUs does not expose EDBGRQ or DBGACK,
the cross-trigger network is used to propagate the triggers that put CCPLEX CPUs in and out of debug state to a timer freeze request generation logic.
- An assertion on CTI1’s CTITRIGOUT0 is used to assert the timer freeze request from ccplex
( ccplex_freeze_timers_req ) and assertion on CTI1’s CTITRIGOUT1 is used to de-assert ccplex_freeze_timers_req. This request is then merged with qualified timer-freeze requests from the rest of the processors in the SoC to generate a final timer freeze request that is propagated to all the timers. The following figure describes how the CTI1 triggers assert/deassert the timer freeze request.

- Design for Debugging (DFD)
**Figure 9.90 CTI1 Triggers Assert/Deassert Timer Freeze Request**
When ctitrigout0 and ctitrigout1 are asserted simultaneously, ctitrigout0 is given priority. ‘M’ and ‘N’ are a 32-bit value indicating number of additional cticlk-cycle delays to be added on assertion and deassertion paths. ‘M’ is derived from MMIO register CORESIGHT_CFG_TMR_FREEZE_DLY_0[31:0] ‘N’ is derived from MMIO register CORESIGHT_CFG_TMR_UNFREEZE_DLY_0[31:0]
- CORESIGHT_CFG_TMR_{FREEZE,UNFREEZE}_DLY_0 are protected by
CORESIGHT_CFG_SCR_TMR_FREEZE_DLY_0. ‘k’ value is k = 3.
- DBGACK Aggregation
CoreSight collects the DBGACKs from all the CPUs and updates them in its status registers.
- CORESIGHT_CFG_DEBUG_ACK_0[0] – DBGACK CCPLEX (common for all CCPLEX cores)

- Design for Debugging (DFD)
- CORESIGHT_CFG_DEBUG_ACK_0[4:1] – DBGACK FSI R52 cores [3:0]
- CORESIGHT_CFG_DEBUG_ACK_0[5] – DBGACK FSI R5
- CORESIGHT_CFG_DEBUG_ACK_0[16] – DBGACK BPMP
- CORESIGHT_CFG_DEBUG_ACK_0[17] – DBGACK APE
- CORESIGHT_CFG_DEBUG_ACK_0[18] – DBGACK SPE
- CORESIGHT_CFG_DEBUG_ACK_0[19] – DBGACK SCE
- CORESIGHT_CFG_DEBUG_ACK_0[20] – DBGACK RCE
- CORESIGHT_CFG_DEBUG_ACK_0[26:21] – DBGACK PVA
- CORESIGHT_CFG_DEBUG_ACK_0[27] – DBGACK DCE
Unused CORESIGHT_CFG_DEBUG_ACK_0 bits are tied to ‘0’. CORESIGHT_CFG_DEBUG_ACK_QUAL_0 in the CoreSight configuration aperture has a qualifying bit corresponding to each assigned DBGACK bit in CORESIGHT_CFG_DEBUG_ACK_0. When the bit in
- CORESIGHT_CFG_DEBUG_ACK_QUAL_0 is set, the corresponding DBGACK in
CORESIGHT_CFG_DEBUG_ACK_0 participates in the timer freeze, else the effect of that DBGACK is ignored. The enable bit offset in CORESIGHT_CFG_DEBUG_ACK_QUAL_0 must match the corresponding CPU DBGACK in CORESIGHT_CFG_DEBUG_ACK_0. The non-ccplex halt equation then becomes: soc_freeze_timers_req= | ( CORESIGHT_CFG_DEBUG_ACK_0[m:0] &
- CORESIGHT_CFG_DEBUG_ACK_QUAL_0[m:0] )
The global timer halt equation: dfd2all_freeze_timers_req = soc_freeze_timers_req | ccplex_freeze_timers_req Each of the timers internally adds a halt on the debug (HDBG) bit to allow it to halt/continue ticking when the dfd2all_freeze_timers_req is asserted. This register bit in the timer AMAP page can then follow the security attributes for the timer AMAP or add its own security attribute via the Security Control Register.

- Design for Debugging (DFD)
##### 9.10.2.3.8 Logging External Debug Attempts
This feature logs accesses made by an external debugger connected via JTAG or SWD to access the system via CoreSight. It does not log attempts made by external debugger if those attempts are not even able to generate a transaction from DP to AP. Additionally, it also logs the number of times TMS=0.
- Note: The counting above is done on DBGAPB clock. DBGAPB clock is always expected to be
running (although at lower frequencies ~9.6MHz or ~32kHz in mission mode to save energy). If DBGAPB clock is turned off, the above counters are stalled. Similarly, TMS is usually used by logic on TCK. Hence, if TMS and TCK are toggled such that TMS manages to remain ‘1’ during positive edge of DBGAPB clock, then TMS=0 will not get logged. Logging TCK is not feasible as that is left floating unlike TMS, which has a weak pullup to have a steady value when unused.
- Algorithm
- Let,
invalid_attempt = ((‘dapenables’ input of DAPBUS interconnect == ‘1’) && (global_jtag_enable==0)) valid_attempt = ((‘dapenables’ input of DAPBUS interconnect == ‘1’) && (global_jtag_enable==1))
- If ‘invalid_attempt’ transitions from 0->1 on DBGAPB_CLK increment
- CORESIGHT_CFG_CSITE_INVALID_ATTEMPT_LOG (that is, if ‘invalid_attempt’ sampled on previous
clock cycle is ‘0’ and on current clock cycle is ‘1’, increment CORESIGHT_CFG_CSITE_INVALID_ATTEMPT_LOG).
- If ‘valid_attempt’ transitions from 0->1 on DBGAPB_CLK increment
CORESIGHT_CFG_CSITE_VALID_ATTEMPT_LOG. If ‘TMS’ value transitions from 1->0 on DBGAPB_CLK increment CORESIGHT_CFG_CSITE_TMS_LOG.
- Given <p> ∈ { INVALID_ATTEMPT,VALID_ATTEMPT,TMS },
- CORESIGHT_CFG_CSITE_<p>_<k> is conceptual 64 bit representation of two physical MMIO

