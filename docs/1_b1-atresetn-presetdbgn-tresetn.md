# 1 ’b1 atresetn, presetdbgn, tresetn

- IN
hsstp_reset_rstn extctlin[7:0]
- IN
0x00 extctlout[7:0]
- OUT
- trigin, flushin
- IN
- See the previous section regarding
how signals are masked before driving it to TPIU. triginack, flushinack
- OUT

- Design for Debugging (DFD)
- Signal/Port
- Direction (relative to
- TPIU)
- Connected Module/
- Signal
- Comments
- ATB target port
- IN (TPIU is target)
- Upstream ATB Downsizer
(128:32)
- See the previous section regarding
how atvalid, atready signals are masked before driving it to TPIU.
- APB programming
port
- IN (TPIU is target)
- HSSTP Collator APBIC
- Packing and Framing Stage
- Start and End of Frames
Post reset or after an end-of-frame set has been transmitted, when the first valid 32b formatted data is received from the upstream FIFO, this stage first transmits a /SCP/ pair ( /K28.2/K27.7/ ) joined by two padding octets /P/P/ ( /K28.4/K28.4/ ). This ensures the first set of data transmitted by this stage is aligned to 32b and maintains that alignment on every cycle. After transmitting the start-of-frame set (Byte3=/K28.4/, Byte2=/K28.4/, Byte1=/K27.7/, Byte0=/ K28.2/), the frame length counter begins to increment for every cycle when a valid 32b formatted data from upstream is transmitted downstream.
- Also, an empty frame counter is incremented when the stage does not transmit a valid set
downstream. A valid set either constitutes start-of-frame set, end-of-frame set (which may include CRC) or valid formatted data from upstream forwarded downstream. If a valid set is transmitted downstream, then the empty frame counter is reset. Thus, the empty frame counter provides number of consecutive empty sets encountered.
- If the frame length counter reaches MAX_VALID_FRAME_LENGTH or empty frame counter reaches
MAX_EMPTY_CYCLE_COUNT, end-of-frame set is transmitted and both counters are reset. End-of-frame set consists of /ECP/ pair (/K29.7/K30.7/). Also, if CRC is enabled, this is preceded by CRC octet-pair. If CRC is not enabled, precede /ECP/ by two padding octets (/P/P/). Thus, if no CRC, end-of-frame set appears as follows: Byte3=/K30.7/, Byte2=/K29.7/, Byte1=/K28.4/, Byte0=/K28.4/. If CRC is present, end-of-frame set appears as follows: Byte3=/K30.7/, Byte2=/K29.7/, Byte1=/ CRC2/, Byte0=/CRC1/; where /CRC1/ is lower significant byte of the 16-bit CRC and /CRC2/ is most significant byte of the 16-bit CRC. This ensures that even during end of frame, the 32-bit alignment is maintained. After transmitting end-of-frame set, do not send start-of-frame set until the next valid data is available from the upstream FIFO.
- CRC Calculation
CRC calculation is described in the Arm HSSTP Architecture Specification, Error detection section.
- Trace Data Byte Swizzling

- Design for Debugging (DFD)
- When NVLPCR[ TRACEDATA_FLIP_BYTE_ORDER ]=1’b’1, for the 32b tracedata from TPIU that is
being inserted into the frame, byte-0 and byte-1 of the tracedata are swapped and byte-2 and byte-3 of tracedata are swapped, while being inserted into the frame. Note: The byte-order of the 32’b tracedata that is input to the CRC calculator is not affected by TRACEDATA_FLIP_BYTE_ORDER; only the order in which it is placed into the frame is impacted. Similarly, when NVLPCR[ TRACEDATA_FLIP_BYTE_ORDER ]=1’b’1, and if CRC is being inserted into the frame, Byte-0 and Byte-1 or CRC are swapped while being inserted into the frame. Again, calculation of CRC is not affected by TRACEDATA_FLIP_BYTE_ORDER. Only the way (byte-order) in which the final 16b CRC is inserted into the frame is impacted and too, impact is limited to the halfword location assigned to CRC in that frame. That is, position of CRC and ECP is not swapped; only bytes within the CRC are swapped while being inserted into the frame. Notes: Tracedata seen by CRC calculator is not impacted by TRACEDATA_FLIP_BYTE_ORDER. Byte ordering for bytes within SCP or ECP is not affected by TRACEDATA_FLIP_BYTE_ORDER. Halfword ordering between SCP and the padding octet-pair is not affected. Halfword ordering between ECP and the padding octet-pair is not affected. Halfword ordering between ECP and the CRC is not affected.
- Lane Stripping
This stage tries to distribute the 32-bit wide trace stream received from the previous stage (buffered via intermediate FIFO) over configured HSSTP lanes. There are two configurations in terms of number of lanes used for HSSTP simultaneously: one-lane and two-lanes. Each lane accepts two bytes in parallel from the Lane Stripping stage. Hence, for configurations that support one lane, lower half-word (Byte-1 and Byte-0) are transmitted on first clock cycle and upper half- word (Byte-3 and Byte-2) are transmitted on the subsequent clock cycle before retrieving the next word from upstream FIFO. For configurations that support two lanes, lower half-word are transmitted on HSSTP Lane-0 and upper halfword are transmitted on HSSTP Lane-1. Thus, a new 32-bit data can be processed and stripped over two lanes every cycle as long as there is no back- pressure from downstream/scheduler. The sch2strp_hold signal from the scheduler to Lane Stripping stage indicates whether the stage holds its current output for another cycle if the downstream pipeline is unable to accept its current output. Similarly, the data valid signal indicator, strp2sch_data_valid, which is part of the downstream output interface of Lane Stripping stage indicates to scheduler whether current data is valid or not. This signal allows the scheduler to switch the mux to Idle Symbol Generator when there is no upstream data to be streamed. The strp2isg_send_idle signal is asserted if (sch2strp_hold==0 && strp2sch_data_valid==1 && ((lane0==/P/P/)||(lane1==/P/P/)). Any lane that contains a pair of padding-octets (/P/P/) replaces its contents for that cycle with a pair of idle-octets (/I/I/), that would otherwise have been sent on that

- Design for Debugging (DFD)
cycle, had Idle Symbol Generator had been scheduled. Only the lane having the pair of padding- octets replaces its contents with a pair of idle-octets. In multi-lane modes, lanes that do not have a pair of padding-octets retain their contents and do not replace them with a pair of idle-octets. Note: While interpreting whether a byte contains a padding character or not, also consider whether it is a data or control character. Do not replace /D28.4/D28.4/ with /I/I/. Only replace /K28.4/K28.4/ with /I/I/. For example: 1: In Single lane case, if {L0B1,L0B0}=/P/P/, then replace as {L0B1,L0B0}=/I/I/ 2. In Dual lane case, if {L0B1,L0B0} = /P/P/, then replace as {L0B1,L0B0}=/I/I/. If {L1B1,L1B0} is not a pair of padding-octets, do not replace {L1B1,L1B0}. 3. In Dual lane case, if {L1B1,L1B0} = /P/P/, then replace as {L1B1,L1B0}=/I/I/. If {L0B1,L0B0} is not a pair of padding-octets, do not replace {L0B1,L0B0}. The reason to swap a pair of padding-octets with a pair of idle-octets at the output of Lane Stripper stage, is because in the Packing and Framing stage, it is not clear when a word being created by that stage gets scheduled to be sent, as input to the 8b10b encoder and thus, queued for transmission. Hence, which control character to use is unclear in the Packing and Framing stage. To avoid breaking the K-R-A requirement on idle symbols, the decision of which idle symbols to insert is made at the output of the Lane Stripping stage. The pair of padding-octets inserted at the Packing and Framing stage acts as an unambiguous placeholder; a pair of padding-octets is not expected under any other circumstance.
- Sequence Generator Blocks
- Transmitter Initialization Sequence Generator
This block generates Transmitter Interface’s Lane Initialization, Channel Bonding and Channel Verification Procedure. Given that HSSTP is a multi-lane Serial Simplex Implementation of the Aurora Protocol, receiver related sequences do not apply. Transmitter Initialization Sequence (TIS) refers to performing Transmit Interface Lane Initialization (TILI), followed by Transmit Interface Channel Bonding Procedure (TICB) and finally, Transmit Interface Channel Verification Procedure (TICV). TIS generation is triggered via side-band (sch2tis_en) from the Scheduler Block. Upon reset or after completion of TIS, Transmitter IBV Sequence Generator remains in idle state with its output indicating “(no_symbol)” to be transmitted. If sch2tis_en is deasserted at any time before TIS is completed, it causes TIS to pause while sch2tis_en is deasserted and resume upon assertion. While sending its last symbol, TSI generator block asserts tis2sch_done. This indicates to the scheduler that TIS is completed. In response, scheduler must deassert tis2sch_en and start sending other sequence/symbols as required (e.g., IDLE, Clock Compensation, or User PDUs). The only condition

- Design for Debugging (DFD)
under which TIS is paused/resumed in between is when a clock synchronization sequence needs to be inserted or when downstream FIFO is full. If sch2tis_en is asserted (after deassertion due to completion of TIS), TIS generation is triggered again. As HSSTP is based on the Serial Simplex version of the Aurora Protocol, sections B.5.1 Transmit Interface Lane initialization, B.5.3 Transmit Interface Channel Bonding Procedure and B.5.5 Transmit Interface Channel Verification Procedure describe behavior for Transmitted Initialization Sequence Generator. As there is no feedback path from the HSSTP debugger to the HSSTP controller, the overall lane initialization, channel bonding and channel verification procedure is nothing more than transmitting certain control characters for a configurable duration based on Link Layer Initialization Register (LLIR) and LINK Layer Initialization Register 2 (LLIR2) described in the HSSTP Architecture Specification, Programmer’s Model section. The following is a summary: 1. Lane Initialization: Transmit symbol-set /SP/ for #LaneBytes÷4 times on each lane, where: #LaneBytes = ALIGNMENT_PATTERN_MULTIPLIER*(VERIFY_LEN + 1) where ALIGNMENT_PATTERN_MULTIPLIER is derived from (not equal to) LLIR2.ALIGN_MUL. See the corresponding field description in the Arm HSSTP Architecture Specification (section 6.9 LINK Layer Initialization Register 2, LLIR2) for details. 1.
- Channel Bonding: If the number of lanes is more than one (also see
- NVLPCR[FORCE_SINGLE_LANE_CHANNEL_BONDING] for exception), transmit symbol /I/ for
following number of times on each lane: #BondingBytes = BONDING_PATTERN_MULTIPLIER*(BOND_LEN + 1) where BONDING_PATTERN_MULTIPLIER is derived from (not equal to) LLIR2.BOND_MUL. See the corresponding field description in the Arm HSSTP Architecture Specification (section 6.9 LINK Layer Initialization Register 2, LLIR2) for details. 1.
- Channel Verification: Transmit the set of “60 /I/ symbols followed by /V/ (where one /V/
symbol consists of four characters: /K28.5/D8.7 /D8.7/D8.7/)” for floor(#VerifBytes÷64) times on each lane, where: #VerifBytes = VERIFY_PATTERN_MULTIPLIER*(VERIFY_LEN + 1) where VERIFY_PATTERN_MULTIPLIER is derived from (not equal to) LLIR2.VERIFY_MUL. See the corresponding field description in the Arm HSSTP Architecture Specification (section 6.9 LINK Layer Initialization Register 2, LLIR2) for details. Note: For LLIR2.VERIFY_MUL and LLIR.VERIFY_LEN, #VerifBytes is a multiple of 64 and #VerifBytes is at least 256.

- Design for Debugging (DFD)
- Thus, VERIFY_LEN=63 and VERIFY_MUL=0 (i.e., VERIFY_PATTERN_MULTIPLIER=4) gives
#VerifBytes=4*(63+1)=256 bytes, which is four sets of “60 /I/ symbols followed by /V/”. Thus, #VerifBytes=256 implies 256/64=4 sets of “60 /I/ symbols followed by /V/” are transmitted on each of the lanes.
- If VERIFY_LEN=127 and VERIFY_MUL=0 (i.e., VERIFY_PATTERN_MULTIPLIER=4) gives
#VerifBytes=4*(127+1)=512 bytes, which is eight sets of “60 /I/ symbols followed by /V/”. Thus, #VerifBytes=512 implies 512/64=8 sets of “60 /I/ symbols followed by /V/” are transmitted on each of the lanes. While transmitting /I/, the sequence requirements between /K/, /R/ and /A/ must be met. As the logic to meet these requirements is already present in Idle Symbol Generator block, rather than replicating the logic again in TIS Generator, TIS Generator sends a side-band to scheduler requesting for the Idle Symbol Generator to be scheduled for as long as TIS Generator needs to send /I/. Once TIS Generator deasserts this side-band, scheduler again configures mux to select TIS Generator output to be sent over the mux. While scheduler selects Idle Symbol Generator upon explicit request from TIS Generator, the responsibility to count the idle symbols lies with TIS Generator. To know whether a pair of Idle symbols was accepted into the downstream FIFO, TIS Generator block must monitor input to Idle Symbol Generator Block to determine whether an Idle Symbol Pair was pushed into the downstream FIFO on the current cycle. (No symbol) Generator This block drives the signal pattern that must be ignored by the downstream FIFO. Thus, selecting this mux input prevents new packets from being inserted into the downstream FIFO. The output of this block can be as simple as driving a ‘0’ on the signal/bit-position that indicates whether the current input to FIFO is valid. Thus, when the mux selects this block, new entries do not get added to the FIFO allowing the FIFO to drain. This is typically used to prevent overflows when the downstream FIFO is unable to accept more entries.
- Clock Compensation Generator
This block transmits the Clock Compensation Sequence, which consists of six repetitions of the symbol pair: /CC/ = /CC/1 /CC/2 = /K23.7/K23.7/. Given that each lane accepts two symbols as parallel input, the same pair is transmitted six times. Refer to the Aurora 8b10b protocol specification, Clock Compensation section for details on the symbol and encoding for clock compensation sequences. However, it is the scheduler’s responsibility to ensure that six pairs of /CC/1/CC/2 are transmitted. If the downstream FIFO is full,
- Scheduler may switch to “(No symbol)” and then resume the clock compensation sequence
transmission from where it left off. Also, it is the scheduler’s responsibility to ensure periodic transmission of clock compensation sequences compliant to the specification and configuration requirements.

- Design for Debugging (DFD)
- Idle Symbol Generator
Refer to the Aurora 8b10b protocol specification, Idle Sequence section for details on how to determine whether to output /A/, /K/ or /R/ for a particular cycle. The scheduler decides if the idle symbol is transmitted, which then affects the decision as to which idle symbol to transmit next. A side-band, sch2isg_send_idle, is asserted by the scheduler to indicate to the Idle Symbol Generator as to whether an idle symbol is being selected for transmission. Additionally, strp2isg_send_idle is asserted when the lane-stripping stage is selected by the scheduler and its output contains a pair of padding octets (/P/P/) on any of its lanes. The OR’ed version of sch2isg_send_idle and strp2isg_send_idle is depicted as the input “send_idle.” The “clock” input refers to the CSITE_CLK. The circuit below illustrates a sample implementation. Two idle symbols need to be generated per cycle, as a symbol-pair is transmitted in parallel. If multiple lanes are transmitting idle symbols at a time, then the symbols transmitted on different lanes at a time are always the same. Hence, the decision of which symbol-pair to transmit occurs on every clock cycle. Different lanes, if transmitting idle simultaneously, use the same pair. The down-counter does not progress if the Async-FIFO has back-pressured. This is to ensure that any idle symbol that is scheduled to be sent, does not get skipped because the downstream FIFO has backpressured and hence, unable to accept the idle symbols on that cycle.
- The following sequencing meets the requirements described in the Aurora 8b10b Protocol
specification, Idle Sequence section.

- Design for Debugging (DFD)
send_A_on_pos0 = send_idle & Acntr_eq_zero & send_idle_dlyd send_R_on_pos0 = send_idle & (!Acntr_eq_zero) & send_idle_dlyd & Pos0_KR_sel send_K_on_pos0 = send_idle & (!send_A_on_pos0) & (!send_R_on_pos0) send_R_on_pos1 = send_idle & send_idle_dlyd & Pos1_KR_sel send_K_on_pos1 = send_idle & (!send_R_on_pos1) 8b10b Encoding and Bit/Byte Swizzling
- Refer to the Aurora 8b10b Protocol specification (section 5.4 8B10B Transmission Code and
Appendix A.1 8B/10B Encoding) for converting data and control characters to 10b symbols. Refer to the HSSTP specification (section 5.2 Trace data ordering) for byte/bit ordering during serialization of data.
- During serialization, lower characters/bytes/symbols should be transmitted before higher
characters/bytes/symbols. And within a character/byte/symbol, if the encoding is for a control character, then the most significant bit should be transmitted first. For a data character, if LINK_nDALT is ‘1’ (preferred), the most significant bit should be transmitted first, else if LINK_nDALT is ‘0’, the least significant bit should be transmitted first. In the SoC, LINK_nDALT=’1’, thus both Control and Data characters are sent most significant bit first. Pre 8b10b encoder allows the higher-byte to be sent first followed by the lower-byte by swizzling their positions prior to 8b10b encoder. As post encoding, B0 must be sent first by the downstream serializer. If the higher byte needs to be sent first, swizzling must occur prior to the encoding stage, which is facilitated by NVLPCR[PRE_ENC_FLIP_BYTE_ORDER].

- Design for Debugging (DFD)
**Figure 9.86 8b10b Encoding and Bit/Byte Swizzling Overview**
The goal of post 8b10 encoder bit swizzling (flip_bit_order) and byte swizzling (flip_byte_order) is to make the controller generic to protect it from any changes to PHY – it is not to offer options to send the higher byte first or least significant bit within a byte first. Thus, if PHY changes cause serialization to occur differently than anticipated, using the byte/bit swizzling capability for the 20b/lane parallel input being fed to the PHY, the output of the PHY can be made to match the HSSTP requirements. The bit swizzling applies to bits within the 10b symbol and byte swizzling applies to the two 10b symbols. The disparity resulting from current input to the Async FIFO passes through a delay flop and is used while generating the 8b10b encoding for the next pair of symbols per lane. Output ‘0’ from the delay block indicates negative running disparity (RD-), while output ‘1’ indicates positive running disparity (RD+). The reset value for the delay flop is ‘0’ (RD-). This logic is independent for each lane. (If there are timing issues due to a long combinational path from any of the generators until the Async FIFO, a sync FIFO can be added between the muxes and 8b10b encoding blocks.)
- HSSTP Programming Guidelines
- Enabling HSSTP Overview
The following steps provide a high-level sequence to enable HSSTP over UPHY.
- Part-0a: Enable hot-plug capability
CORESIGHT_CFG_CBDCR_0 is programmed by MB2 based on MB2-BCT.

- Design for Debugging (DFD)
- CORESIGHT_CFG_CBDCR_0[SWD_PORT_SEL] should be programmed 0/1 depending on which
USB2 port (USB2 Port-0 versus USB2 Port-1) is mapped to the USB Type-C connector over which SWD needs to be mapped.
- CORESIGHT_CFG_CBDCR_0[SWDDFD_NVDBGSEL_EN] needs to be ‘1’ for hot-plug capability to
work. CORESIGHT_CFG_CBDCR_0[SWD_JTAG_CFG] should always be programmed ‘0’.
- Enable/unmask HSSTP Interrupt source in BPMP-VIC so that when
- CORESIGHT_CFG_HSSTP_INTERRUPT[INT_0]=1 generates an interrupt to BPMP-VIC, BPMPFW
sees the interrupt. These values should be restored post-SC7 exit as well.
- Part-0b: Disable PLLE spread, enable CSITE-CLK and deassert HSSTP CAR reset
- IF (DT.BPMPFW_SSC_EN==DISABLE)
{
- BPMPFW disables PLLE SSC; // Disable PLLE SSC for HSSTP to work
} else {
- BPMPFW enables PLLE SSC
} Note: DT.BPMPFW_SSC_EN=DISABLE refers to following DT configuration: clocks { clock@plle { clk-id = <TEGRA234_CLK_PLLE>; disable-spread = <1>; }; };
- IF ((!(FUSE_PRODUCTION_MODE_0||FUSE_PRODUCTION_MODE_SHADOW_0)) ||
((PMC_MISC_DEBUG_AUTHENTICATION_0[JTAG_ENABLE] &&
- PMC_MISC_DEBUG_AUTHENTICATION_SHADOW_0[JTAG_ENABLE]) &&
(!(FUSE_ARM_JTAG_DIS_0||FUSE_ARM_JTAG_DIS_SHADOW_0)))) {

- Design for Debugging (DFD)
- CLK_RST_CONTROLLER_CLK_OUT_ENB_CSITE_SET_0[SET_CLK_ENB_CSITE]= ENABLE // This is the reset
default; Do not bump CSITE-CLK to 625MHz at this point. Do that only after a request from debugger or ETR-driver. This step is just to ensure CSITE-CLK is running and not OFF.
- BPMPFW should program CLK_RST_CONTROLLER_RST_DEV_HSSTP_0=0
} Above values from Part-0{a,b} should be restored post-SC7 exit too.
- Background: How HT-DAM hot-plugging works
The settings above do not enable SWD over USB2 port. The port is still usable as USB. These settings cause the USB2 port to switch to SWD controller when NVDBG_SEL pin is asserted.
- The HSSTP Debug Accessory Mode (HT-DAM) adapter that plugs into the USB Type-C port causes
- CC1=CC2=LOW. Logic on platform drives NVDBG_SEL=HIGH when it sees CC1=CC2=LOW. If
- CORESIGHT_CFG_CBDCR_0[SWDDFD_NVDBGSEL_EN]=0, NVDBG_SEL is ignored. However, if
- SWDDFD_NVDBGSEL_EN=1, then if NVDBG_SEL goes HIGH, it causes the USB2 pins
corresponding to the port selected by CORESIGHT_CFG_CBDCR_0[SWD_PORT_SEL] to switch from USB2 controller to SWD controller. Now via SWD-over-USB2 pins, debugger can program
- CORESIGHT_CFG_HSSTP_INTERRUPT to interact with BPMPFW. BPMPFW based on these
interactions configures and switches the UPHY lanes (USB3 pins) from USB3 (XUSB) controller to
- HSSTP controller. These interactions between debugger and BPMPFW and subsequent BPMPFW
programming requirements are described in the subsequent Part-1 and Part-2 subsections.
- Part-1: Debugger informs SoC about intention to connect HSSTP
- Part-1a: Debugger notifies intent to connect
1.
- Debugger connects and programs CORESIGHT_CFG_HSSTP_INTERRUPT[MSG_0, INT_0] to
send message with MSG_PID=0x1, MSG_SID=0x1 , INT_0=1 and applicable MSG_DATA values.
- BPMPFW based on SoC/platform knowledge (e.g., based on BCT/DT) responds to the
message with MSG_PID=0xA, MSG_SID=0x1, INT_0=0x0 and applicable MSG_DATA. If the debugger requests a frequency, BPMPFW responds with a frequency that is the highest supported by the SoC less than or equal to the one requested by the debugger. If the debugger requests a number of lanes, BPMPFW responds with the highest number of supported lanes by the SoC less than or equal to the one requested by the debugger. Note: BPMPFW does not need to poll for INT_0=1. When INT_0=1, it receives an interrupt.
- The debugger waits until an ACK. When the debugger sees the ACK, if the SoC capabilities
are conveyed by BPMPFW, the debugger sends a message with MSG_PID=0x1, MSG_SID=0x2, INT_0=0x1 and applicable MSG_DATA to BPMPFW to configure HSSTP.
- Typically, these settings are the same as those recommended by BPMPFW in the previous
step. If the debugger knows the SoC capabilities, it can skip the previous two steps. 2. 3.

- Design for Debugging (DFD)
4.
- Based on configuration requests (MSG_PID=0x1, MSG_SID=0x2, INT_0=0x1 and applicable
- MSG_DATA), BPMPFW interprets frequency requested as the highest frequency supported
by the SoC that is less than or equal to the requested frequency by the debugger. Similarly, it interprets the number of lanes requested as the highest number of lanes supported by the SoC that is less than or equal to the requested number of lanes by the debugger.
- Note: If BPMPFW does not understand the debugger request, it responds with
- MSG_PID=0xE, MSG_SID=0x1, MSG_DATA=0x0, INT_0=0. When the debugger sees this
response, it rectifies its message and retries, if necessary.
- Part-1b: BPMPFW does basic programming of controller with preferred defaults
- This reduces the amount of programming the debugger needs to do if it is using preferred
defaults. The debugger can choose to override some of these settings as described in Part-2. 1. (Optional) Security checks: Check if system permits switching the UPHY lanes. If not, respond with MSG_PID=0xE, MSG_SID=0x2, MSG_DATA=0x0, INT_0=0. Skip the rest of the programming and exit the flow. BPMPFW configures CSITE_CLK to 625MHz.
- Ensure CSITE_CLK frequency is higher than hsstp_l%_clk (HSSTP parallel lane clock)
frequency. The serial frequency can be inferred from MSG_DATA value provided by the debugger. The parallel frequency is 1/20th the serial frequency. Typically, use CSITE_CLK=625MHz (REF_PLLE).
- CLK_RST_CONTROLLER_CLK_SOURCE_CSITE_0=PLLREFE_VCOCLK
(This enum is called ‘refPLLE_gated’ because there is a clock gate on the DFD branch of the
- VCOOUT; use the CLK_RST_CONTROLLER_CLK_OUT_ENB_PLLREFE_0 register to enable it, if
it is disabled.)
- CLK_RST_CONTROLLER_CLK_SOURCE_CSITE_0[CSITE_CLK_DIVISOR]=0
- CLK_RST_CONTROLLER_CLK_OUT_ENB_CSITE_SET_0[SET_CLK_ENB_CSITE]= ENABLE
- BPMPFW programs DFD/HSSTP with recommended settings considering preferences
suggested by the debugger. 2. 3. a. b. Use serial frequency from Part-1a:Step-4 in the RATE_ID table to infer RATE_ID.
- Program this RATE_ID in CORESIGHT_CFG_HSSTP_SPEED_CFG[RATE_ID]
Infer lane mapping from MSG_DATA.
- Based on the number of lanes from Part-1a:Step-4 and based on the SoC/platform
configuration, program lane map in CORESIGHT_CFG_HSSTP_LANE_CFG[HSSTP_TO_UPHY_LANE_MAP].
- For example, if the platform supports HSSTP over UPHY Lanes-0,1 and the debugger
requests single lane, then program: HSSTP_TO_UPHY_LANE_MAP=4’b0001.
- If the platform supports HSSTP over UPHY Lanes-0,1 and the debugger requests dual lane,
then program: HSSTP_TO_UPHY_LANE_MAP=4’b0011 c. d.

- Design for Debugging (DFD)
- If the platform supports HSSTP over UPHY Lanes-4 and the debugger requests single lane,
then program: HSSTP_TO_UPHY_LANE_MAP=4’b0100. (Optional) Functional checks: Inform the necessary software entities that the lanes will be repurposed for HSSTP and will not be available for other usage until a subsequent cold system reset (also known as L0/L1 reset).
- Program CORESIGHT_CFG_HSSTP_INTERRUPT[MSG_0] with the inferred frequencies and
number of lanes from Part-1a:Step-4, along with MSG_PID=0xA, MSG_SID=0x2. However, do not clear CORESIGHT_CFG_HSSTP_INTERRUPT[INT_0] yet as further settings are necessary. e. f. 4.
- BPMPFW programs DFD with general recommended settings. In most cases, these settings
match the reset value in which case BPMPFW need not program them (noted below for information purposes). Note: If they match the reset value, they are gray’ed out. a.
- In NVLPCR
i.
- LINK_nDALT_VAL=1’b1
- FLIP_BIT_ORDER=1’b1
- FLIP_BYTE_ORDER=1’b0
- SEND_PRIMING_SEQ=1’b0
- FORCE_ASSERT_STPCR_NRST=1’b0
- CHANNEL_BUSY_WAIT_INDEX=5b’10100
- TX_DATA_EN_SRC_SEL=1’b0
ii. iii. iv. v. vi. vii. b.
- In NVFFCR
i.
- NOCRC_CFG=1’b0
- SW_TRIG_OUT=1’b0
ii. c.
- In NVFTCR
i.
- MIN_FREE_CNT=0x0B
- MAX_FREE_CNT=0x1D
- SRC_THROTTLING=1’b0
- CG_THROTTLING=1’b1
- TRACECTL_BASED_FILTER=1’b1
- HALFWORD_SYNCPKT_FILTER=1’b1
- FULLFRAME_SYNCPKT_FILTER=1’b0
- FSP_FILTER_LEN=0x10
ii. iii. iv. v. vi. vii. viii. d.
- In NVFLCR
i.
- MAX_VALID_FRAME_LENGTH=0x100
- MAX_EMPTY_CYCLE_COUNT=0x100
ii. e.
- In NVPTCR
i.
- MIN_FREE_CNT=0x03
- MAX_FREE_CNT=0x06
ii. f.
- In NVUL{*}_AUX_CTL_1,

- Design for Debugging (DFD)
i.
- AUX_TX_IDDQ=0
- AUX_TX_TERM_EN=0
- AUX_TX_RDET_EN=0
- AUX_TX_RDET_BYP=0
- AUX_TX_RDET_CLK_EN=0
Note: * indicates applicable only for lanes on which HSSTP is enabled. ii. iii. iv. v. g.
- In NVUL{*}_MISC_CTL_1
i.
- RESET_=0
- TX_IDDQ=1
- TX_SLEEP=2’b11
- TX_DATA_READY=0
- TX_DATA_EN=0
ii. iii. iv. v. h.
- In NVUL{*}_DYN_CTL_1
i.
- TX_DRV_AMP=0x27
- TX_DRV_POST=0
- TX_DRV_PRE=0
ii. iii. i.
- In NVUL{*}_MISC_CTL_3
i.
- TX_RATE_PDIV_=2’b01 //(implies interface width = 20bits)
5. BPMPFW programs HSSTP with the recommended settings below: a.
- In STPCR
i. nSW_RST=0 nRST=0
- STP_EN=0
- STP_PWRUP=0
ii. iii. iv. b.
- In STPLSR
i.
- If HSSTP_TO_UPHY_LANE_MAP[3:0]==4’b0011, program STP_LANESEL[0]=1’b1; else
leave it to its reset value (1’b0). c.
- In PCSR
i.
- SYNC_COUNT=0x1000 (decimal 4096)
d.
- Program LLIR = 0x7FFFF387
i.
- VERIFY_LEN=9’h1FF (d’511)
- BOND_LEN=9’h1FF (d’511)
- ALIGN_LEN=13’h1387 (d’4999)
ii. iii. e.
- Program LLIR2 = 0x000081
i.
- VERIFY_MUL=0x0
- BOND_MUL=0x0
- ALIGN_MUL=0x8
- LLIR2[3:0] should always be 4’b0001
ii. iii. iv.

- Design for Debugging (DFD)
- Part-2: BPMP-FW sets up UPHY lanes and Clocks for HSSTP
Part-2a: BPMPFW qualifies the request and configures HSSTP controller. 1.
- BPMPFW enables MGMT_CLK for the associated UPHY PLL. This is normally enabled during
boot and independent of which controller is selected on the UPHY lane. However, in case it is not enabled, enable relevant MGMT_CLK.
- Part-2b: BPMPFW powers down UPHY lanes for HSSTP
1. (Optional) BPMPFW informs hypervisor/CPU that the functional interface/device on lanes being repurposed for HSSTP are no longer available as lanes are being reassigned for HSSTP.
- BPMPFW powers down the intended UPHY lanes that are switched to HSSTP. This step can
be skipped if the UPHY lane is already powered down. To power down the UPHY lanes, perform the following programming (perform each sub-step for all applicable lanes before moving to the next sub-step; i.e., first do ‘a’ for all HSSTP lanes, then do ‘b’ for all HSSTP lanes, etc.): 2. a. b.
- UPHY_LANE_MISC_CTL_1_0: TX_DATA_EN, TX_DATA_READY, RX_DATA_EN =all(0)
- UPHY_LANE_MISC_CTL_1_0: TX_DATA_OVRD, RX_DATA_OVRD =all(1)
- UPHY_LANE_MISC_CTL_3_0: TX_RATE_PDIV, RX_RATE_PDIV =all(2’b01) //20bits
- UPHY_LANE_MISC_CTL_1_0: TX_SLEEP, RX_SLEEP =all(2’b11) //P3
- UPHY_LANE_MISC_CTL_1_0: TX_PWR_OVRD, RX_PWR_OVRD =all(1)
- UPHY_LANE_MISC_CTL_1_0: TX_IDDQ, RX_IDDQ =all(1)
- UPHY_LANE_MISC_CTL_1_0: TX_IDDQ_OVRD, RX_IDDQ_OVRD =all(1)
c. d. e. f. g.
- Part-2c: BPMPFW sets up UPHY PLL for HSSTP
- Refer to the HSSTP PLL Mappings section regarding how BPMPFW decides which UPHY PLL to
assign for HSSTP. BPMPFW decides which UPHY PLL to use for UPHY lanes assigned to HSSTP. 1.
- BPMPFW can read
- CLK_RST_CONTROLLER_HSIO_UPHY_PLL_SEL_CFG*_0[HSIO_UPHY_L*_PLL_SEL] to know
which PLL the UPHY lane was previously using. BPMPFW can read UPHY_PLL_CTL_1_0[RATE_ID] to determine the frequency of a PLL.
- If the assigned UPHY PLL for the UPHY lanes in concern is already used for 10GHz serial
frequency for its functional usage, then the same UPHY PLL can be used.
- If PLL<>LANE mapping or PLL frequency information cannot be scavenged easily at run-
time, BPMPFW does know it, as part of boot-time configuration, because it initializes UPHY for functional reasons. It can use that information to determine which UPHY PLL to use for HSSTP UPHY lanes.
- For automotive platforms, HSSTP is primarily targeted over UPHY lanes 0/1, which are
otherwise used for USB and use UPHY PLL0 at 10GHz. Hence, in typical automotive cases, HSSTP UPHY lanes are Lane-0/1 and using UPHY PLL0 at 10GHz. a. b. c. d.

- Design for Debugging (DFD)
2.
- BPMPFW polls for idle state of CAR PLL FSM
(CLK_RST_CONTROLLER_HSIO_UPHY_PLL*_CFG0_0[HSIO_UPHY_PLL*_SEQ_STATE] != 2 for the appropriate UPHY PLL) and takes controls through software registers present in the CAR space. a.
- If the FSM does not come to idle state, then upon wait expiration, proceed to the next
state (wait expiration limit should be 500us or more). 3. Always follow the steps below (a & b). If PLL is ON, these steps ensure that it remains ON. If
- PLL is OFF, they ensure that PLL gets turned ON. (Note: Whether PLL is at 10/16 is
determined at boot based on BCT. So, at boot, it is known which PLLs are 10G versus 16GHz.
- Also, read the UPHY_PLL_CTL_1_0.RATE_ID registers for the PLLs of interest, to determine
the frequency of the PLL being mapping to.) a.
- Program respective PLL’s CLK_RST_CONTROLLER_HSIO_UPHY_PLL<0/1/2/3>_CFG0_0
registers which act as source with the following: i.
- HSIO_UPHY_PLL*_PLL_PD_OVERRIDE=1’b0
- HSIO_UPHY_PLL*_LANE_PD_OVERRIDE=1’b0
- HSIO_UPHY_PLL*_PLL_RESET_OVERRIDE=1’b0
- HSIO_UPHY_PLL*_SEQ_IN_SWCTL=1’b1
ii. iii. iv. b. Poll for HSIO_UPHY_PLL*_SEQ_STATE to be ON
- Part-2d: BPMPFW switches lane controller to HSSTP
- BPMPFW switches UPHY lane controller for the respective UPHY lanes to HSSTP by
programming the corresponding UPHY_LANE_MUX_0[HSSTP_ACTIVE]=1’b1 1.
- Part-2e: BPMPFW enables lane clocks for HSSTP
- BPMPFW configures registers to indicate the lane_map and rate_id configuration is valid by
programming CORESIGHT_CFG_HSSTP_ACTIVATE_CFG: 1. a. {RATE_ID_VALID, UPHY_LANE_MAP_VALID, UPHY_LANE_CTL_VALID} = 3’b111 2.
- Program
- CLK_RST_CONTROLLER_HSIO_UPHY_HSSTP_CLK_CTRL_0[HSIO_UPHY_HSSTP_PLL_SEL_VALI
D] to 1’b1.
- BPMPFW programs common clock enable
- CLK_RST_CONTROLLER_HSIO_UPHY_HSSTP_CLK_CTRL_0[HSIO_UPHY_HSSTP_CLK_ENABLE]
=1’b1.
- BPMPFW programs CAR registers to ungate the clock for the respective lanes mapped to
- HSSTP by programming the respective clock enable register fields
- HSIO_UPHY_HSSTP_L{0/1/4/5}_CLK_ENABLE of register
CLK_RST_CONTROLLER_HSIO_UPHY_HSSTP_CLK_CTRL_0 to 1’b1.
- As RX clocks are not needed during normal functional operation,
HSIO_UPHY_HSSTP_L{0/1/4/5}_RX_CLK_ENABLE should be 1’b0. 3. 4. 5.
- Part-2f: BPMPFW resets, initializes, and powers up UPHY lanes for HSSTP
[Action:Reset] BPMPFW toggles functional and CFG reset for the lane using: 1.

- Design for Debugging (DFD)
a. b.
- SWR_PEX_USB_UPHY_L{0/1/4/5}_RST and
- UPHY_LANE_DIRECT_CTL_2[CFG_RESET_] for respective UPHY lanes, i.e.,
- UPHY_LANE{0/1/4/5}.UPHY_LANE_DIRECT_CTL_2[CFG_RESET_]
2. [Action:Initialize] BPMPFW programs init array for HSSTP; configuring various internal registers within the UPHY using the UPHY’s CFG interface (i.e.,
- CFG_{WDS,RDS,ADDR,WDATA,RDATA} ) using
UPHY_LANE{0/1/4/5}.UPHY_LANE_DIRECT_CTL_2_0[CFG_RDS/WDS/ADDR/WDATA]. [Action:Power Up] BPMPFW powers up the UPHY lane(s) intended for HSSTP and configures them for the desired operation. HSSTP controller configuration (step-4) and the control tie- offs take care of all the correct values. So, this part involves a smooth transition from removing the OVRD enforced values to those driven by the HSSTP controller and then powering up the lanes using the controls in the HSSTP controller. For all applicable lanes where OVRDs were enforced previously, de-assert them as below: 3. a. b.
- UPHY_LANE_MISC_CTL_1_0: TX_IDDQ_OVRD=0
- UPHY_LANE_MISC_CTL_1_0: TX_PWR_OVRD=0
- UPHY_LANE_MISC_CTL_1_0: TX_DATA_OVRD=0
c. 4.
- Using controls in DFD, power up the lanes as shown below. ‘#’ implies index for registers
corresponding to applicable lanes (#=0/1/2/3 for UPHY lanes 0/1/4/5 resp.). Perform each step/sub-step for all lanes before moving to the next step. a. CORESIGHT_CFG_NVUL#_MISC_CTL_1: i. RESET_ =1. Wait 1us. TX_IDDQ =0. Wait 50ns. TX_SLEEP =2’b00. Wait 500ns. TX_DATA_READY =1. Wait 50ns. ii. iii. iv. b.
- NVLPCR
i.
- TX_DATA_EN_SRC_SEL =1
- FORCE_ASSERT_STPCR_NRST =1
ii.
- Part-2g: BPMPFW acknowledges the debugger request
- BPMPFW records the dynamic switch action so as to restore HSSTP as lane-controller,
instead of boot-time configured lane-controller, after an SC7 entry-exit cycle. Upon SC7 exit, restore the state of CORESIGHT_CFG, HSSTP, UPHY lanes/PLL and clocks up to this point. BPMPFW clears CORESIGHT_CFG_HSSTP_INTERRUPT[INT_0] as an ACK to the debugger. 1. 2.
- Part-3: Debugger enables HSSTP controller
- The debugger waits for an ACK before proceeding, then clears
CORESIGHT_CFG_HSSTP_INTERRUPT. (Optional) The debugger then programs HSSTP related configuration registers in CSITE_CFG, HSSTP and TPIU. Normally, BPMPFW configures HSSTP/TPIU as per recommendations.
- However, this provides an opportunity to change certain settings as required without
requiring a BPMPFW upgrade for minor tweaks and experiments. 1. 2.

- Design for Debugging (DFD)
3.
- Debugger programs HSSTP to start (e.g., de-assert nRST, assert STP_EN, etc.)
a. NVPTCR: i.
- MAX_FREE_CNT = 0x1 // prevents TIS from going downstream before downstream reset
is deasserted by causing MIN_FREE_CNT>MAX_FREE_CNT b. STPCR: i.
- STP_PWRUP =1
nRST =1 nSW_RST =1
- STP_EN =1
ii. iii. iv. c. NVPTCR: i.
- MAX_FREE_CNT = 0x6 // restores MIN_FREE_CNT<MAX_FREE_CNT
4. The debugger programs TPIU with the default settings below. a. b.
- CORESIGHT_TPIU_CSTPIU_REGS_LAR_0=0xC5ACCE55
- CSTPIU_REGS_CURRENT_PORT_SIZE =32’h1000_0000
- CSTPIU_REGS_TRIGGER_COUNTER_VALUE =0x0
- CSTPIU_REGS_TRIGGER_MULTIPLIER =0x0
- CSTPIU_REGS_CURRENT_TEST_PATTERN_MODE=0x0
- CSTPIU_REGS_TPRCR =0x0
- CSTPIU_REGS_FSCR =0x40
- CSTPIU_REGS_FFCR
c. d. e. f. g. h. Until TPIU is in normal or bypass mode, tracectl is ‘1’. This allows trace-filtering to prevent garbage contents from TPIU to stream to downstream sync-FIFO. Then after TPIU is configured to the correct width, changing mode to continuous is okay because the full-sync packets are 32b wide and do not appear as garbage to the downstream 32b wide trace path. a. b.
- EnFCont=1’b1
- EnFTC=1’b1
The following are recommendations while configuring TPIU, which acts as the formatter stage in the HSSTP pipeline:
- Always use TPIU port width as 32-bit wide
- Preferably use TPIU in continuous mode
5. Debugger programs
- CORESIGHT_CFG_HSSTP_STREAM_CTL[ALLOW_IO_TRACE_STREAMING]=1
- Part-4: Debugger enables tracing
1.
- The debugger programs ETF, Funnels and finally ETMs, PTMs, and other trace sources, as
needed to start generating trace.
- Configure downstream components before configuring upstream components to ensure that
the downstream components can handle trace sent from upstream. 2.

- Design for Debugging (DFD)
- Boot Guidelines for HSSTP Support
Communication standards and certification bodies require limiting EMI for any communication interface. A normal fixed frequency square wave generates considerably high EMI. Hence, to reduce
- EMI, spread spectrum clocking (SSC) is used. This introduced a deterministic jitter in the
communication stream, thus reducing EMI significantly at the cost of small signal quality. However, such EMI restrictions are not applicable for debug environments and hence, to improve signal quality during debug, SSC may need to be disabled. Boot flow (in the following case, boot ROM) must disable SSC while initializing PLLE based on Fuse (fuse:opt_ssc_dis) to help improve signal quality. Below is the flow to initialize PLLE with the highlighted section being the change to disable SSC based on Fuse. Only if fuse:opt_ssc_dis==1 should SSC be disabled. Otherwise, enable SSC to match legacy behavior.
- After powerup, IDDQ=1 and ENABLE=0
- SETUP bits = (normally 0)
- IDDQ = 0
- Wait 5uS
- With a stable input clock, program M/N/P and configuration bits
- SSC_BYP=1, BYPASS_SS=1 INTERP_RESET=1 EN_SDM=0 EN_SSC=0
- ENABLE = 1 and wait for PLL to lock
- IF ( fuse:opt_SSC_DIS==0 )
{
- Load Spread Coefficients
- BYPASS_SS=0
- SSC_BYP=0
- Wait 300nS and INTERP_RESET=0
} where, 'BYPASS_SS' is CLK_RST_CONTROLLER_PLLE_SS_CNTL_0[PLLE_BYPASS_SS] 'SSC_BYP' is CLK_RST_CONTROLLER_PLLE_SS_CNTL_0[PLLE_SSCBYP]

- Design for Debugging (DFD)
Also, the decision as to whether SSC is enabled/disabled during SC7 exit is based on the same fuse.
- Boot-time (Static) and Run-time (Dynamic) use cases for switching to HSSTP
Common use cases for automotive platforms are: 1.
- Using HSSTP over USB Type-C connector where HSSTP is configured in dual-lane (x2) mode
on UPHY Lane-0 and Lane-1
- Using HSSTP over USB Type-A connector where HSSTP in configured in single-lane (x1) mode
on UPHY Lane-0 or Lane-1. 2. At boot time, Lane-0 is used for USB-RCM. After the boot ROM phase of boot, USB-RCM mode is not supported. Also, typically self-driving automotive platforms do not use USB storage devices. If HSSTP must be configured via BCT, it is done during the BPMP-FW phase of boot. For example, during the boot ROM phase, the port is available for USB-RCM. Then after BPMP-FW starts execution, BPMP-FW switches the port from USB to HSSTP based on BCT. This BCT based switch to HSSTP is referred to as Boot-time (or Static) switch to HSSTP. Automotive infotainment markets use USB storage, thus, it is necessary to be able to have USB as the default configuration on such platforms and only switch to HSSTP when requested by debugger. This ability to switch the lane from its existing boot-time configuration (e.g., USB, etc.) to HSSTP based on a run-time request by an agent (e.g., external debug host/debugger) is referred as Run-time (or Dynamic) switching to HSSTP. Refer to the steps to be performed by BPMPFW in previous section for dynamically switch the lanes based on request from debugger. To switch back a lane that has been dynamically switched to HSSTP, to its former configured controller (e.g., USB), the chip must undergo a cold system reset (e.g., L0 or L1 reset).
- HSSTP Unit Programming Guidelines
- VERIFY_LEN and VERIFY_MUL
#VerifBytes = VERIFY_PATTERN_MULTIPLIER*(LLIR.VERIFY_LEN + 1) where, VERIFY_PATTERN_MULTIPLIER
- 4, if LLIR2.VERIFY_MUL is b0000
- not defined (actually, infer as 4 (default)), if LLIR2.VERIFY_MUL is b0001
- 2^(LLIR2.VERIFY_MUL), for all other values of LLIR2.VERIFY_MUL
Program LLIR.VERIFY_LEN and LLIR2.VERIFY_MUL such that: 1. 2. #VerifBytes is a multiple of 64 #VerifBytes is at least 256

- Design for Debugging (DFD)
- Enabling hot-plug support for HT-DAM
- CORESIGHT_CFG_CBDCR_0 must be programmed by MB2 based on MB2-BCT for enabling hot-
plug capability facilitated via the HT-DAM adapter. Specifically, the following settings are needed:
- CORESIGHT_CFG_CBDCR_0[SWD_JTAG_CFG]=0 (reset default)
- CORESIGHT_CFG_CBDCR_0[SWD_PORT_SEL]=1 (if USB2 Port-1 is mapped to USB Type-C)
- CORESIGHT_CFG_CBDCR_0[SWDDFD_NVDBGSEL_EN]=1 is needed to enable hot-plug
These should be done as early as possible in boot (in MB2 during cold boot) for the subsequent stages to benefit from closed box debug and hot-plug support. They should also be restored as early as possible during SC7-exit. (Note: Per boot arch, they are restored in MB2-RF (counterpart of MB2) in SC7-exit).
- HSSTP Usage Guidelines
- TPIU and Triggers
- When using TPIU in Normal mode, program ‘FFCR.TrigEvt=FFCR.TrigIn=FFCR.TrigFl=0’ because
triggers communicated on TRACECTL are not converted to trigger packets downstream.
- When TPIU is programmed in Bypass mode, HALFWORD_SYNCPKT_FILTER and
- FULLFRAME_SYNCPKT_FILTER are disabled. This is to avoid filtering trace data with values
0x7FFF_7FFF or 0x7FFF_FFFF at output of TPIU.
- NVPTCR
- To have the ability to change reset defaults, ensure NVPTCR[MIN_FREE_CNT] >= 0x2,
NVPTCR[MAX_FREE_CNT] <= 0xA and NVPTCR[MIN_FREE_CNT] < NVPTCR[MAX_FREE_CNT].
- NVFTCR
- To have the ability to change reset defaults, ensure NVFTCR[MIN_FREE_CNT] >= 0x0A (if
- CG_THROTTLING=0) / 0x01 (if CG_THROTTLING=1), NVFTCR[MAX_FREE_CNT] <= 0x1F and
NVFTCR[MIN_FREE_CNT] < NVFTCR[MAX_FREE_CNT]. It is also recommended to program FSP_FILTER_LEN greater than 0x8, if CG-throttling is disabled, to avoid livelocks.
- DLY_TRIG0 and DLY_TRIG1
- Background
Two triggers from CTI to HSSTP have programmable delays on them: DLY_TRIG0 and DLY_TRIG1.
- DLY_TRIG0 can modify ALLOW_IO_TRACE_STREAMING bit, using AITS_SET / AITS_CLR, which
controls the flow of trace into TPIU. DLY_TRIG1 can modify STP_EN which in turn can cause an in- progress Aurora Frame to be completed gracefully by inserting an ECP (if there is not an Aurora

- Design for Debugging (DFD)
Frame in progress, then ECP is not inserted. “Aurora Frame in progress” implies no ECP has yet been sent after the last SCP). These allow avoiding trace loss during debug due to an L2 reset, as shown below.
- Sample Configuration
Configure CTI to route pmc2dfd_CSYSREQ_inv to TPIU’s FLUSHIN, DLY_TRIG0 and DLY_TRIG1. Program TPIU’s FFCR[FOnFlIn]=1 to generate a flush when TPIU’s FLUSHIN is asserted and also program TPIU’s FFCR[StopFl]=1. Configure DLY_TRIG0_PERIOD=5’b10000 (64K cycles of
- CSITE_CLK), AITS_CLR=1’b1, DLY_TRIG1_PERIOD=5’b10001 (128K cycles of CSITE_CLK) and
- STPEN_CLR=1’b1. DLY_TRIG1_PERIOD and DLY_TRIG0_PERIOD are configured such that DLY_TRIG1
asserts after DLY_TRIG0. Additionally, configure DLY_TRIG1_PERIOD such that DLY_TRIG1 occurs reasonably (~100 CSITE_CLK cycles) before L2 reset occurs so that frame contents downstream of “Packing & Framing Stage” drain off-chip. Also, DLY_TRIG1_PERIOD should be configured such that DLY_TRIG1 occurs reasonably (~100 CSITE_CLK cycles) after DLY_TRIG0 to ensure all trace data flushed from TPIU has passed through the Packing & Framing stage. Note: If RAMDUMP_EN=0 and L2 reset occurs earlier after dfd2pmc_CSYSACK_inv, PMC’s L2 reset
- FSM still waits in state:WAIT_CLK_STOP for PMC_IMPL_RST_REQ_TIMER_0[WAIT_CLK_STOP_VAL]
+1 32kHz cycles before asserting the reset even when state:WAIT_PMIC_SEQ is skipped. Default value of WAIT_CLK_STOP_VAL=0x6 provides seven 32kHz cycles in addition to one 32kHz cycle in
- RAMDUMP_FSM to assert WDT_DFD_RST_ACK (also known as dfdrst_ack). Thus, by default eight
32kHz cycles provide approximately 136K cycles on CSITE=625MHz clock).
- Operation
- Debug is enabled when HSSTP is expected to be used. Hence, L2-Reset FSM triggers RAMDUMP
FSM upon an applicable L2 reset request. RAMDUMP FSM triggers pmc2dfd_CSYSREQ_inv. pmc2dfd_CSYSREQ_inv triggers a CTITRIGIN which in turn is routed to CTITRIGOUTs that drive TPIU’s FLUSHIN, DLY_TRIG0 and DLY_TRIG1. First, TPIU’s FLUSHIN input is asserted, which causes TPIU to request a flush upstream. This allows all upstream contents to be flushed out.
- When DLY_TRIG0 asserts, it causes ALLOW_IO_TRACE_STREAMING to clear which prevents further
trace from upstream components like ETF/downsizer (on L1warm reset) to drain into TPIU (on
- L2warm reset). Clearing ALLOW_IO_TRACE_STREAMING also forces AFREADY input to TPIU
(HSSTP) to be forced to ‘1’ thus indicating completion of trace to TPIU. TPIU eventually sends any trace contents buffered in it followed by NULL trace packets to indicate completion of trace. Later, when DLY_TRIG1 asserts, it clears STP_EN. If any Aurora Frame has not completed (no ECP sent after last SCP), this forces it to completion by insertion of ECP and preventing further contents from upstream to be sent. This allows graceful reception of all Aurora Frames with actual trace data by receiver.

- Design for Debugging (DFD)
As there are approximately 8K cycles of CSITE_CLK left, they are more than sufficient for contents to drain through HSSTP pipeline downstream of Packing and Framing stage.
- Eventually, after PMC’s L2 Reset FSM transitions from state:WAIT_CLK_STOP to
state:RESET_ASSERT, it triggers L2 reset. But because either trace data downstream of
- ALLOW_IO_TRACE_STREAMING has been sent to TPA (HSSTP Probe) or it has been retained in
between ETF and ATB-Downsizer, both of which are on L1warm reset and hence retain their contents, no trace data is lost. This ability to avoid trace loss is useful when WAIT_CLK_STOP_VAL is configured to a smaller value and hence DLY_TRIG1_PERIOD cannot be large enough to drain entire ETF. In which case, post L2 reset, HSSTP can be re-enabled to either drain subsequent trace over HSSTP if needed. Requiring this is a low probability also because the point of interest in trace is when first or second expirations of the crashing WDT occur. As these events occur much earlier than the fourth expiration, in most cases, those trace points have already streamed through to the external TPA or can stream through with a smaller DLY_TRIG1_PERIOD). It usually takes less than 30us to stream out ETF contents while a WDT inter-expiry delay is of the order of at least a few milliseconds.
- HSSTP PLL Mappings
If HSSTP is being configured over a lane previously assigned to USB, as USB and HSSTP can use same PLL, UPHY Lane<>PLL remapping is not needed.
- However, if HSSTP is being configured over a lane previously assigned to PCIe Gen-3, then
if there does not exist an unused PLL and if the available PLLs are being used either by MPHY or PCIE Gen-3 as depicted in corner-case#1, BPMPFW returns an error. if there exists a nearby unused (disabled) PLL, either that can be enabled for HSSTP and
- UPHY lane<>PLL mapping reconfigured for the lane over which HSSTP is being configured as
depicted in corner-case#2 Corner-Case#1: In the following HSIO UPHY configurations, if HSSTPx1 is enabled over Lane-4/
- Lane-5, BPMPFW returns an error: “HSSTP_ERROR_NO_PLL”
- Config
- Number
- PLL0
- Lane 0
- Lane 1
- PLL1
- Lane 2
- Lane 3
- PLL2
- Lane 4
- Lane 5
- Lane 6
- Lane 7
- PLL3
- Disab
led
- USB3.1
- P0
- USB3.1
- P1
- USB3
/
- PCIe
- G2
- USB3.1
- P2
- PCIe x1
- C1
(Gen2)
- PCIe
- C4
only
- PCIe x2
- C4
- UFS x2
- MPH
Y
- USB3
/
- PCIe
- G2
- USB3.1
- P0
- USB3.1
- P1
- PCIe
- C0
only
- PCIe x2
- C0
- PCIe
- C4
only
- PCIe x2
- C4
- UFS x2
- MPH
Y
- PCIe
- G4
- PCIe x1
- C0
- USB3.1
- P1
- USB3
/
- PCIe
- G2
- USB3.1
- P2
- PCIe x1
- C1
(Gen2)
- PCIe
- C4
only
- PCIe x2
- C4
- UFS x2
- MPH
Y

- Design for Debugging (DFD)
- Config
- Number
- PLL0
- Lane 0
- Lane 1
- PLL1
- Lane 2
- Lane 3
- PLL2
- Lane 4
- Lane 5
- Lane 6
- Lane 7
- PLL3
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- PCIe
- C4
only
- PCIe x2
- C4
- UFS x2
- MPH
Y Corner-Case#2: In the following HSIO UPHY configurations, when HSSTP is going to be activated over a lane previously assigned to PCIe Gen-3 and the lane has a nearby unused (‘DISABLED’) PLL, BPMP-FW must re-configure HSSTP lane PLL_SEL and enable the previously disabled PLL0 or PLL3 at 10GHz. (a) CAR PLL_SEL
- CLK_RST_CONTROLLER_HSIO_UPHY_PLL_SEL_CFG0_0[HSIO_UPHY_L0_PLL_SEL] and/or
- CLK_RST_CONTROLLER_HSIO_UPHY_PLL_SEL_CFG0_0[HSIO_UPHY_L1_PLL_SEL] or
- CLK_RST_CONTROLLER_HSIO_UPHY_PLL_SEL_CFG1_0[HSIO_UPHY_L4_PLL_SEL] or
- CLK_RST_CONTROLLER_HSIO_UPHY_PLL_SEL_CFG1_0[HSIO_UPHY_L5_PLL_SEL] or
(b) UPHY lane cfg PLL_SEL
- The UPHY PLL_SEL lane mapping can be programmed through the lane CFG port, which has
four bits, one for each rate_id. 8’d1: DLN_CFG_ID_CTRL {12’h0, PLL_SEL[3], PLL_SEL[2], PLL_SEL[1], PLL_SEL[0]}
- Config
- Number
- PLL0
- Lane 0
- Lane 1
- PLL1
- Lane 2
- Lane 3
- PLL2
- Lane 4
- Lane 5
- Lane 6
- Lane 7
- PLL3
- USB3
/
- PCIe
- G2
- USB3.1
- P0
- USB3.1
- P1
- PCIe
- C0
only
- PCIe x2
- C0
- PCIe
- C4
only
- PCIe x4
- C4
- Disab
led
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- PCIe
- C4
only
- PCIe x4
- C4
- Disab
led
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- USB3
/
- PCIe
- G2
- PCIe x1
- C2
- PCIe x1
- C3
- PCIe x2
- C4
- PCIe
- G4
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- USB3
/
- PCIe
- G2
- PCIe x1
- C2
- PCIe x1
- C3
- PCIe x1
- C4
- USB3.1
- P3
- PCIe
- G4
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- PCIe
- C4
only
- PCIe x2
- C4
- UFS x2
- MPH
Y

- Design for Debugging (DFD)
- Config
- Number
- PLL0
- Lane 0
- Lane 1
- PLL1
- Lane 2
- Lane 3
- PLL2
- Lane 4
- Lane 5
- Lane 6
- Lane 7
- PLL3
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- USB3
/
- PCIe
- G2
- PCIe x2
- C4 (Gen2)
- UFS x1
- USB3.1
- P3
- MPH
Y
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- USB3
/
- PCIe
- G2
- PCIe x1
- C2
(Gen2)
- PCIe x1
- C3
(Gen2)
- UFS x2
- MPH
Y
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- USB3
/
- PCIe
- G2
- PCIe x1
- C2
(Gen2)
- PCIe x1
- C3
(Gen2)
- UFS x1
- PCIe x1
- C4
(Gen2)
- MPH
Y
- Disab
led
- PCIe x4
- C0
- PCIe
- C0
only
- PCIe x4
- C0
- USB3
/
- PCIe
- G2
- PCIe x1
- C2
(Gen2)
- PCIe x1
- C3
(Gen2)
- UFS x1
- USB3.1
- P3
- MPH
Y
- HSSTP General Notes
- Reset Polarity and Nomenclature in CAR Register Specifications
- When CLK_RST_CONTROLLER_RST_DEV_HSSTP_0=0 (DISABLE), car2hsstp_rstn=1
- When CLK_RST_CONTROLLER_RST_DEV_HSSTP_0=1 (ENABLE), car2hsstp_rstn=0
- CLK_RST_CONTROLLER_RST_DEV_HSSTP_CLR_0=1 causes
- CLK_RST_CONTROLLER_RST_DEV_HSSTP_0=0
- CLK_RST_CONTROLLER_RST_DEV_HSSTP_SET_0=1 causes
- CLK_RST_CONTROLLER_RST_DEV_HSSTP_0=1
#### 9.10.2.2 Closed Box Debug Over USB2
Debug (similar to ArmJTAG but over SWD) and Instrumentation (UART) features can be used via the USB Type-C connector port. In addition, UART is also supported over DP_AUX port to allow SWD and UART to be used in parallel for debug in closed box solutions where the required USB and DP_AUX functional pins (respectively) are available.

- Design for Debugging (DFD)
**Figure 9.87 Closed Box Debug Block Diagram**

- Design for Debugging (DFD)
##### 9.10.2.2.1 USB2 and Dedicated JTAG Ports
- Selection Matrix
The table below provides a summary of the values of different input signals and configurations, and the resulting features. Which on-chip controller, e.g., NVJTAG (Test Initiator, DFT JTAG), ArmJTAG (CoreSight JTAG,
- DFD JTAG), DFD-SWD (CoreSight SWD), USB2, and UART8, is connected to which port (USB2
Port0/1, Dedicated JTAG port) based on different configuration inputs, such as: fuses (e.g., FUSE_OPT_USB2NVJTAG_DISABLE_0) pins (e.g., NVDBG_SEL, NVJTAG_SEL) software configurable MMIO register[bits] (e.g., SWDDFD_NVDBGSEL_EN,
- UART_PORT_SEL, SWD_PORT_SEL, etc.)
- The colors in the System State columns highlight which debug connection (NVJTAG versus
ArmJTAG versus DFD-SWD) is supported in that mode, while the green boxes with bold texts in the Inputs columns show some of the most important inputs in that connection.
- Table 9.76 Selection Matrix Table
- Inputs
- System State (USB2 and
- Dedicated JTAG ports)
- USB2 Port0
- PINMUX CFG
- USB2 Port1
- PINMUX CFG
- Controller Connected to
- SWDDF
D _NVDB
- GSEL
_EN
- UAR
T _PO
- RT
_SE L
- SW
D _PO
- RT
_SE L
- NVD
- BG
_SEL
- NVJT
- AG
_SEL
- USB2
- Port1
pins
- Dedicated
- JTAG pins
- USB2
- Port0
pins x x x x
- NVJTAG
(DFT)
- USB2
- USB2
x x x
- NVJTAG
(DFT)
- USB2
- UART8
x x x x
- NVJTAG
(DFT)
- USB2
N/A x x x
- NVJTAG
(DFT)
- UART8
- USB2
x x x
- NVJTAG
(DFT)
- UART8
N/A x x x x
- NVJTAG
(DFT) N/A
- USB2
x x x
- NVJTAG
(DFT) N/A
- UART8
x x x
- ArmJTAG
(CoreSight)
- USB2
- USB2

- Design for Debugging (DFD)
- Inputs
- System State (USB2 and
- Dedicated JTAG ports)
- USB2 Port0
- PINMUX CFG
- USB2 Port1
- PINMUX CFG
- Controller Connected to
- SWDDF
D _NVDB
- GSEL
_EN
- UAR
T _PO
- RT
_SE L
- SW
D _PO
- RT
_SE L
- NVD
- BG
_SEL
- NVJT
- AG
_SEL
- USB2
- Port1
pins
- Dedicated
- JTAG pins
- USB2
- Port0
pins x x
- ArmJTAG
(CoreSight)
- USB2
- UART8
x x N/A
- USB2
- DFD-SWD
(CoreSight) x x
- ArmJTAG
(CoreSight)
- UART8
- USB2
x N/A
- UART8
- DFD-SWD
(CoreSight) x x N/A
- DFD-SWD
(CoreSight )
- USB2
x N/A
- DFD-SWD
(CoreSight )
- UART8
x x
- ArmJTAG
(CoreSight)
- USB2
- USB2
x
- ArmJTAG
(CoreSight)
- USB2
- UART8
x N/A
- USB2
- DFD-SWD
(CoreSight) x
- ArmJTAG
(CoreSight)
- UART8
- USB2
N/A
- UART8
- DFD-SWD
(CoreSight) x N/A
- DFD-SWD
(CoreSight )
- USB2
N/A
- DFD-SWD
(CoreSight )
- UART8
x x N/A
- DFD-SWD
(CoreSight )
- USB2
x N/A
- DFD-SWD
(CoreSight )
- UART8

- Design for Debugging (DFD)
- Inputs
- System State (USB2 and
- Dedicated JTAG ports)
- USB2 Port0
- PINMUX CFG
- USB2 Port1
- PINMUX CFG
- Controller Connected to
- SWDDF
D _NVDB
- GSEL
_EN
- UAR
T _PO
- RT
_SE L
- SW
D _PO
- RT
_SE L
- NVD
- BG
_SEL
- NVJT
- AG
_SEL
- USB2
- Port1
pins
- Dedicated
- JTAG pins
- USB2
- Port0
pins x x N/A
- USB2
- DFD-SWD
(CoreSight) x N/A
- UART8
- DFD-SWD
(CoreSight) Notes: Once NVDBG_SEL is asserted, do not change its value. NVDBG_SEL is driven via USB Type-C microcontroller or as NVDBG_SEL = ~ (CC1 || CC2). Refer to the How HT-DAM hot-plugging works section for more details.
- USB2NVJTAG_DISABLE_FUSE input from fuse is forced to ‘1’ in DFD (so actual fuse value is
ignored in DFD) Fuse2all_fuse_valid indicates whether all the fuses have been sensed.
- USB2 PINMUX CFG register behavior depends on a combination of different inputs/settings
and, hence, a signal in isolation may not be able to describe the state of the system.
- Switching from USB2/UART to SWD after a Hard-Hang (Hot-plugging)
The BCT entries only indicate the recommended system configuration that should be configured by Boot Software post L0/L1/L2/warm reset. The entries do not indicate the registers into which these settings need to be copied. Note: Pinmux for both Port 0 and Port 1 should not be configured for UART8 at the same time as there is only one UART8 controller. Similarly, they should not both be configured for SWD at the same time as there is only one SW-DP. However, they can both be configured for USB at the same time as they are connected to two separate USB controllers. When the USB2 port is not configured for SWD and a hard-hang occurs, the port can be forced to
- SWD mode by assertion of NVDBG_SEL. To allow such dynamic switching based on NVDBG_SEL,
during boot set SWDDFD_NVDBGSEL_EN to ‘1’ as early as possible but after programming SWD_PORT_SEL. UART_PORT_SEL, SWD_PORT_SEL, and SWD_JTAG_CFG are programmed based on MB2-BCT. These need to be restored by MB2RF post SC7 exit. Configuring SWD, UART, or USB on a USB2 Port-0/1 can be done during boot. However, if the user needs the USB2 port for USB2 or UART purposes during normal operation, and only wants to use it for SWD when a hang occurs, this is made possible using NVDBG_SEL pin. To do this, configure the

- Design for Debugging (DFD)
port(s) for the required mode – USB2 or UART and program SWD_PORT_SEL to 0/1, depending on which port you want to use for SWD when the hang occurs, and set SWDDFD_NVDBGSEL_EN=1. Continue normal functional operation/use case. When the hang occurs, assert NVDBG_SEL. Based on SWD_PORT_SEL=0/1, the existing configuration of the respective USB2 Port-0/1 is ignored and instead, that port is switched to SWD mode. This ability to switch to SWD at run-time after a hang occurs, is indicated by the rows in the Selection Matrix where NVDBG_SEL=1 and
- SWDDFD_NVDBGSEL_EN=1. Also refer to the How HT-DAM hot-plugging works section for more
details. It is also possible to statically dedicate one USB2 Port for SWD by programming the pinmux for the required USB2 port as SWD during boot.
##### 9.10.2.2.2 FSI Debug and Trace Support
Functional Safety Island (FSI) contains two processor clusters:
- Cluster-0: An Arm Cortex-R5 based cluster with two cores acting in lock-step as one
independent core. This is also referred to as Crypto Hardware Security Module (CHSM).
- Cluster-1: An Arm Cortex-R52 based cluster with eight cores acting in lock-step as four
independent cores.
**Figure 9.88 FSI Block Diagram**

- Design for Debugging (DFD)
where, “FSI Cluster-0 (Cortex-R5-PIL) is as below”
- FSI Clocks and Resets
Cortex-R5 processor clock (FSI_CHSM_CPU_CLK) is driven at lower (/2, /3, /4) frequency than R52 processor clock (FSI_CPU_CLK). FSI_CSITE_CLK is used for shared debug and trace logic in FSI cluster. FSI_CSITE_CLK is an FLCG version of FSI_FABRIC_CLK. FSI_CSITE_CLK is enabled by default out of reset. FSI_FABRIC_CLK is derived from R52 core clock (FSI_CPU_CLK) independent of the Cortex-R5 clock (FSI_CHSM_CPU_CLK). Hence FSI_CSITE_CLK can run at faster frequency (e.g., /2 frequency of R52 clock) even if Cortex-R5 is running at a slow frequency (e.g., /3-/4 frequency of R52 clock).
- Clocks and Reset Connectivity for Various SOC400 Components Used in FSI
FSI_CSITE_RSTN is a software controlled L2warm reset provisioned by CAR in the FSI cluster for some CoreSight (SOC400) components in FSI. By default, FSI_CSITE_RSTN is deasserted (also known as ‘disabled’). FSI_LA_RSTN is also a software controlled L2warm reset provisioned by CAR in the FSI cluster. By default, FSI_LA_RSTN is deasserted (also known as ‘disabled’). The following table provides a brief overview of these connections.

- Design for Debugging (DFD)
- Component
- Port
- Driven by
- Comment
- APB async bridge (for R52 debug-
- APB)
pclks
- FSI_CSITE_CLK
(see above) presetsn
- FSI_CSITE_RSTN
- Sync to corresponding
pclks (see above) pclkm
- R52’s CLKIN
(see above) presetmn
- R52’s nPRESETDBG
- Sync to corresponding
pclkm
- APB async bridge (for SOC-to-FSI
debug-APB crossing) pclks
- DBGAPB_CLK
(see above) presetsn csitel2rstn
- Sync to corresponding
pclks (see above) pclkm
- FSI_CSITE_CLK
(see above) presetmn
- FSI_CSITE_RSTN
- Sync to corresponding
pclkm
- FSI ATB Funnels (both, 8:1 and 2:1)
clk
- FSI_CSITE_CLK
(see above) resetn
- FSI_CSITE_RSTN
- Sync to corresponding clk
- ATB sync bridges (which are
immediately preceding the funnels) and
- ATB sync bridge (which is
immediately preceding the upsizer on
- Cortex-R5 trace path)
clk
- FSI_CSITE_CLK
(see above) resetn
- FSI_CSITE_RSTN
- Sync to corresponding clk
- ATB sync bridges (which are
immediately preceding the upsizers on R52 trace path) clk
- R52’s CLKIN
(see above) resetn
- R52’s nPRESETDBG
- Sync to corresponding clk
- ATB async bridges
(for FSI-to-SOC ATB crossing) clks
- FSI_CSITE_CLK
(see above) resetsn
- FSI_CSITE_RSTN
- Sync to corresponding clks
(see above) clkm
- CSITE_CLK
(see above) resetmn csitel2rstn
- Sync to corresponding clkm
- ATB async bridges
(which take trace from R52’s CLKIN to FSI_CSITE_CLK) clks
- R52’s CLKIN
(see above) resetsn
- R52’s nPRESETDBG
- Sync to corresponding clks
(see above) clkm
- FSI_CSITE_CLK
(see above) resetmn
- FSI_CSITE_RSTN
- Sync to corresponding clkm

- Design for Debugging (DFD)
- Component
- Port
- Driven by
- Comment
- ATB upsizer on R52 ETM outputs
(both, 32:128 and 64:128) clk
- R52’s CLKIN
(see above) resetn
- R52’s nPRESETDBG
- Sync to corresponding clk
- ATB upsizer on Cortex-R5 ETM output
(32:128) clk
- FSI_CSITE_CLK
(see above) resetn
- FSI_CSITE_RSTN
- Sync to corresponding clk
- FSI Collator APBIC
clk
- FSI_CSITE_CLK
resetn
- FSI_CSITE_RSTN
- Sync to corresponding clk
- FSI Top CTM
ctmclk
- FSI_CSITE_CLK
ctmclken
- Tie-off HIGH (1)
ctmresetn
- FSI_CSITE_RSTN
- Sync to corresponding
ctmclk
- FSI Top CTI
cticlk, pclkdbg
- FSI_CSITE_CLK
cticlken, pclkendbg
- Tie-off HIGH (1)
ctiresetn, presetdbgn
- FSI_CSITE_RSTN
- Sync ctiresetn to cticlk;
- Sync presetdbgn to
pclkdbg;
- Connectivity for CSYREQ and CSYSACK of APB/ATB async bridges used for voltage crossing
- The Arm SOC400 components, APB Async Bridge and ATB Async Bridge, used for SOC-to-FSI and
FSI-to-SOC power-domain crossings of debug-APB and ATB interfaces, respectively, have their CSYSREQ/CSYSACK connectivity as follows:
- RTL Guideline
1. 2. 3.
- FSI side of async bridge uses FSI_CSITE_RSTN
- SoC side of async bridge uses CSITEL2RSTN
- Add the following MMIO reg in FSI: FSI_MISC_ISOLATION_DFD_0 and
- FSI_MISC_ISOLATION_DFD_ACK_0
a.
- FSI_MISC_ISOLATION_DFD_0[ATB] (R/W) drives CSYSREQ input of ATB async bridge;
- FSI_MISC_ISOLATION_DFD_0[APB] (R/W) drives CSYSREQ input of APB async bridge; their
reset value is '1' to ensure default cluster interface is not off after power-up.
- FSI_MISC_ISOLATION_DFD_ACK_0[ATB] (RO) is driven by CSYSACK output of ATB async
bridge. FSI_MISC_ISOLATION_DFD_ACK_0[APB] (RO) is driven by CSYSACK output of APB async bridge. b. 4.
- FSI2SOC signals: FSI_MISC_ISOLATION_DFD_0[ATB] and FSI_MISC_ISOLATION_DFD_0[APB]
have clamp value '0'
- Programming Guideline

- Design for Debugging (DFD)
When FSI-SW decides to isolate debug interfaces in mission mode (when FSI debug is disabled) by asserting FSI_CSITE_RSTN and gating FSI_CSITE_CLK, follow the sequence below: 1. 2. 3. 4.
- Program FSI_MISC_ISOLATION_DFD_0[ATB]=FSI_MISC_ISOLATION_DFD_0[APB]=0
- Poll FSI_MISC_ISOLATION_DFD_ACK_0[ATB]=FSI_MISC_ISOLATION_DFD_ACK_0[APB]=1
- Assert FSI_CSITE_RSTN
- Turn off FSI_CSITE_CLK
Debug interfaces use Arm's SOC400 async bridges for MV crossing on Arm defined interfaces. Arm recommends using CSYSREQ and CSYSACK to quiesce the interface before turning either side OFF.
- FSI Cache and TCM Debug
- R52 Caches
CFGL1CACHEINVDISx inputs to each core are driven by independent MMIO bits (reset default: ‘0’) in FSI (FSI_MISC_CPU_x_CFG_0.nCACHE_INVALIDATE). Each control is AND’ed with corresponding R52’s HIDEN before driving the R52’s CFGL1CACHEINVDISx input. This is to facilitate per-core control and security granularity. The MMIO bit survives R52 cluster resets - nCORERESETx and nCPUPORESETx. It is accessible via CBB accesses with MSTRID:CSITE when FSI debug is enabled.
- When driven high, it disables automatic hardware controlled L1-cache invalidation across
nCORERESETx or nCPUPORESETx. Thus, post these resets, the debugger can connect to the core and read out the cache contents. R52 being an Armv8 based architecture provides instructions for much better visibility into its caches compared to Cortex-R5, which is an Armv7 based architecture. Refer to the R52-TRM section 7.4 Debug access to internal memory for details regarding R52 cache debug.
- R52 TCMs
R52 TCMs can be accessed using the AXIS interface into the corresponding R52 cores.
- Cortex-R5 Caches and TCMs
- FSI-R5’s R5AXISLAVE AMAP aperture does not include the Cortex-R5 cache range. Thus, FSI-R5
caches are not accessible via its R5AXISLAVE port.
- FSI Cross-trigger Support
Refer to the CTI Mappings in R5-CoreSight PILs section for CTI connectivity within the R5-Cluster. Refer to the CTI Mappings in R52 Cluster section for CTI connectivity within the R52-Cluster. Refer to the FSI Top CTI Mappings section for CTI connectivity of FSI Top CTI.

- Design for Debugging (DFD)
- FSI EDBGRQ, DBGACK and Freezing Timers
Refer to the EDBGRQ, DBGACK and freezing timers during debug section. The SOC2FSI and FSI2SOC signals (e.g., EDBGRQ, DBGACK and dfd2all_freeze_timers_req) are additionally masked/clamped as described in the FSI FFI in context of debug section.
- FSI WDT
Refer to the Watchdog for Debug and Recovery section for details on WDT expiration behavior, PMC_IMPL_RAMDUMP_CTL_STATUS_0, TKE debug controls, wdt-freeze, etc. At a high level: FSI WDTs expirations are connected/mapped as follows: 1st expiration – corresponding servicing core’s IRQ 2nd expiration – corresponding servicing core’s FIQ 3rd expiration – FSI Top CTI’s CTITRIGIN (refer to the FSI Top CTI Mappings section for details) Note: FSI TKE exports only one/common 3rd expiration, although it has five WDTs in it. This is also routed to FSI-R5’s AVIC and FSI-R52’s GIC. 4th expiration – L2 reset request to PMC (also, with RAMDUMP support) 5th expiration – L1 reset request to PMC dfd2all_wdt_freeze drives WDT’s freeze input. As FSI-TKE exports a single/common port for all the WDT instances contained in it, its DBGEN input is driven by AND-ed version of all dbgen inputs of cores associated with the contained WDTs instances.
- FSI TSC
- FSI TSC Freeze
- FSI has a separate TSC from the SoC TSC. However, dfd2all_freeze_timers_req drives the
freeze_timers_req input for FSI TSC. As this signal is masked/clamped to ‘0’ as part of FFI debug signals, FSI TSC’s freeze_timers_req input being driven from dfd2all_freeze_timers_req in the SoC is not a concern.
- FSI TSC Unit of Increment
A single unit in FSI TSC represents 32ns (31.25MHz). However, the FSI TSC interface is on a slightly faster 40MHz clock (fsi_xtal_clk). For comparison, a single unit increment in the SoC TSC also

- Design for Debugging (DFD)
represents 32ns (31.25MHz) but the SoC TSC interface is on a tscref_clk, which is also 31.25MHz (a pulse skipped version of slightly faster 38.4MHz (SOC-OSC) clock).
- Using FSI-TSC versus SOC-TSC for R52 ETM Timestamping
Use the same FSI-TSC to correlate FSI-CPU actions and trace with other events in FSI. It does make correlating FSI trace with SoC trace a bit difficult given that FSI TSC starts from 0 when FSI boots and SoC TSC is at a different value by that time. The probability of correlating FSI software events with FSI hardware events during debug is higher than the probability of correlating FSI software with SoC software or hardware events. Hence, using FSI-TSC for R52 is the best option.
- Using Binary Timestamp
For uniformity, binary timestamping is used. As the binary format of TSC is used only within the chip and async FIFOs do clock crossings, using binary TSC offers no disadvantage while ensuring uniformity with existing architecture.
- FSI_CSITE_TSINTP Render Configuration
Use the following render configurations:
- SCLK_R=64 (default)
- CLK_SCLK_R=256 (default)
- Note: While maximum R52 is 1200MHz and TSC unit increment is constant at 31.25MHz allowing
- SCLK_R=1 and CLK_SCLK_R=39 (and hence N=6), ARM recommends SCLK_R=64 and
- CLK_SCLK_R=256. As using the recommended settings has no major drawback, render
configurations are set per recommended settings.
- Connectivity
High-level connectivity: 1. 2. FSI-TSC (56b binary) -> Async-FIFO -> FSI_CSITE_TSINTP -> R52’s TSVALUEB input.
- FSI_CSITE_TSINTP
a. b.
- R52’s TSVALUEB[63:0] = FSI_CSITE_TSINTP's tsvalueintpb[63:0]
- FSI_CSITE_TSINTP's tsvalueb[63:0] = {8’b0, 56’b(56bit binary timestamp output from
- Async FIFO)}
- FSI_CSITE_TSINTP's clk = R52’s CLKIN
c. 3.
- Async-FIFO
a. b.
- Async-FIFO’s read-side (also known as output side) should be on R52’s CLKIN
- Async-FIFO’s write-side (also known as input side) should be FSI_XTAL_CLK, which is a
separate crystal-based clock input to FSI operating at 40MHz.
- Note: TSC tick is still 31.25 MHz (32ns), however the launch clock is FSI_XTAL_CLK
(40MHz). That is, timestamp changes at 31.25MHz but changes are conveyed at 40MHz (so two subsequent cycles of 40MHz may not always convey a change as that is faster than the rate at which change occurs, which is 31.25MHz).

- Design for Debugging (DFD)
c. FSI_CSITE_TSINTP does not have a signal to indicate whether its input is valid or not.
- Hence, when there is no data to be read from Async-FIFO, the last valid data read from
- Async-FIFO should be held at the input of FSI_CSITE_TSINTP until the next valid data can
be read from the Async-FIFO (e.g., use data_valid to enable/disable latch that drives; the example is just a suggestion for implementation).
- Async-FIFO must never backpressure on the write-side (e.g., write_enable connected to

