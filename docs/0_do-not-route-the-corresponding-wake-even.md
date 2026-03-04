# 0 : Do not route the corresponding wake event to Tier_x wake 1: Route the corresponding wake event to Tier_x wake

##### 4.2.3.2.7 Tier1/2 Wakes as SPE interrupts
- Interrupt (pmc2vic_intr) can be raised to SPE on a valid wake by setting
- WAKE_AOWAKE_TIER1/2_CTRL_0_INT_EN. This notifies the SPE that a Tier1 or 2 wake occurred
leading to SC7 exit.
##### 4.2.3.2.8 Wake Promotion
The wake engine supports the ability to promote a wake to a different tier dynamically. For example, to promote a specific wake in Tier0 category to Tier1/2, the SPE can update respective fields in the WAKE_AOWAKE_TIER1/2_ROUTING registers. Once this register is updated, the wake status propagates as the wake event to the desired master. On a high level, the sequence of actions in this scenario would be:
- SPE receives Tier0 Wake interrupt

- PMC Programming Guidelines
- SPE does not clear the status bit
- SPE updates Tier1/2 wake routing registers
The wake event is now enabled as a Tier1/2 wake interrupt, which will wake up the BPMP/CCPLEX. In this case, the SCRs for the Tier1/2 wake routing registers must be set up so that the SPE can access those registers. Also, the BPMP/CCPLEX must have access to the wake registers specific to this Tier0 wake (i.e., CNTRL, MASK, and STATUS), if BPMP/CCPLEX must clear the status bit. During wake initialization, wake events can statically be routed to multiple tiers as well. In this case, wake-specific configuration can be handled by either of the masters. SCRs should be set up accordingly.
##### 4.2.3.2.9 Wake Masking and Status
- The WAKE_AOWAKE_MASK_W_x register can be used to unmask/mask the desired wake lines. This
register is assigned per wake event. By default, all the wake events are masked. The wake status post masking is captured in the WAKE_AOWAKE_STATUS_R_x registers. The wake status can be cleared by writing to the WAKE_AOWAKE_STATUS_W_x_CLEAR registers. This register is assigned per wake event. These wake status registers are also cleared by the PMC hardware during the SC7 entry provided that WAKE_DET_EN is not set. If WAKE_DET_EN is set, software can clear these registers. If software does not enable wake detection, the wake event gets reflected in the wake status register only on the SC7 exit (WAIT_FOR_DPD_DIS) state.
- The wake engine also has a second set of status registers under software control. The
- WAKE_AOWAKE_SW_STATUS_R_x registers are used to latch the wake status without mask
control. These registers reflect true wake-up status even outside of the SC7 provided that DET_EN is set. Software can clear the status of all wakes by writing to the
- WAKE_AOWAKE_SW_STATUS_W_0_CLEAR register. The SC7 sequencer cannot clear these
registers. WAKE_AOWAKE_LATCH_SW_0_LATCH_SWEN needs to be enabled to latch wakeup events into these registers.
##### 4.2.3.2.10 WAKE_DET_EN
By default, wake detection is not enabled and so, none of the wakes get detected after boot. While entering SC7, wake detection is enabled in hardware on entering the ASSERT_CLAMP state of the SC7 sequencer. In order to capture the events that occur outside of SC7, software needs to enable wake detection by setting the WAKE_AOWAKE_DET_EN register. Along with the wake events in SC7, setting this bit ensures that the following are captured:
- The events that could occur before the hardware enters SC7 state, but after software has
instructed hardware to enter the state
- Events occur after hardware wake-up, but before software has enabled the peripherals that
process the wake-up events

- PMC Programming Guidelines
While setting or changing the wake configuration, wake detection needs to be disabled first. Configure all wake settings and then enable detection.
##### 4.2.3.2.11 Timestamping of Wake Events
- Software can program WAKE_AOWAKE_TSC_CTRL_0_WAKE_INDEX to indicate which event to
select for TSC snap. This resets the TSC snap value to 0.The snap value gets incremented once that specific wake status gets updated. The snap value is latched in WAKE_AOWAKE_TSC_SNAP_VALUE_0.
#### 4.2.3.3 Thermtrip Programming Guidelines
##### 4.2.3.3.1 Direct Shutdown on Thermtrip
The PMC optionally asserts the shutdown pin to the off-chip PMIC when a thermtrip alert triggers.
- This thermtrip alert can come either from SoC THERM or FSI THERM. The PMIC treats the
- SHUTDOWN_N sideband as a failsafe trigger for shutting the system down. Then, the user
manually turns the system on by pressing the power button or equivalent inputs. The PMC provides a configuration bit PMC_IMPL_DIRECT_THERMTRIP_CONFIG_THERMTRIP_EN to enable the failsafe shutdown option. When the THERMTRIP_EN bit is set, the PMC asserts the internal reset when it asserts SHUTDOWN_N but does not de-assert the internal reset when the source of thermtrip is cleared in hardware. The system software can choose to enable a failsafe shutdown or continue with the Boot ROM-based legacy shutdown solution.
- The PMC does not power gate the CPU partitions on a thermtrip alert. CPU_PWR_REQ is de-
asserted because of L1 reset, so CCPLEX is rail-gated. SHUTDOWN_N is always an active low signal from the SoC perspective. This pin is driven LOW only when the SoC wants to shut down the system. At all other times, this output is tri-stated. This flexibility allows other external platform components to assert the shutdown pin to the PMIC.
- The internal system reset events do not affect the SHUTDOWN_N pin state. The pin, when
asserted, reverts to its default when external chip reset (SYS_RESET_N) is asserted or on the expiry of SHDN_ASSERT_PULSE_WIDTH counter, whichever is earlier. The DPD controls for this pad are tied OFF to never enter DPD mode.
- Note: The SHUTDOWN_N output is always treated as an active LOW signal, and the platform
enables the appropriate external pull ups on these signals. If the PMIC supports an OTP option to choose the polarity of the shutdown input, it is critical that this setting is configured to enable ACTIVE LOW operation.

- PMC Programming Guidelines
**Figure 4.36 THERMTRIP Sequence**
#### 4.2.3.4 Power Gating Controller
Power-gating logic in PMC handles the following cases from the SRAM and logic power control point of view.
##### 4.2.3.4.1 Boot/Reset Requirements
Boot/Reset requirements on PMC PG HW:
- PMC ensures that all Power-gate-able Power domains on SoC, CV rails except the XUSB
domain on SoC rail are in power-gated state on all cold and warm resets.
- XUSB power domain alone needs to be brought up in functional state on all cold and warm
boot cycles. All AON RAMs need to be brought to functional mode on all flavors of cold boot cycles. This is ensured by asynchronously asserting the following controls on any reset deassertion in the following order:
- Assert the power down request
- Assert the power gating clamp
- Assert power gating controls (except XUSB) controls such that both logic and RAMs are in
- SLEEP mode
Power-gating status registers are also updated accordingly. It is Boot software or runtime FW responsibility to power ungate relevant Power domains as per the use case.

- PMC Programming Guidelines
During SC7 entry, as per the definition of AON power states, these RAMs are expected to be put in SLEEP/RET mode. During exit, it is SC7 exit FW responsibility to ensure the RAMs are in functional mode before they are accessed. Irrespective of the hardware actions to bring RAMs out of functional mode on reset deassertion, current scheme recommended to Boot ROM is to write POWER GATING REGISTERS corresponding to the RAMs required for booting. If the RAMs happen to be in functional mode already, it should just be a NOP. The Boot ROM has unconditionally written to the register to bring RAMs to active state in each boot path, regardless anyway, including when it is not needed like L0 reset.
##### 4.2.3.4.2 Power Gating Scenarios
If logic in a partition is required to be powered off, software should request for both LOGIC_SLEEP as well as SRAM_SLEEP or SRAM_RET. When a partition is requested to be power gated off completely using the preceding controls, the PMC logic makes sure that the logic sleep and SRAM SLEEP controls are sequenced in the correct way. The SRAM SLEEP controls are asserted first, before asserting the logic sleep controls while power gating. Similarly, when the partition is power ungated, the logic sleep controls are de-asserted before bringing SRAMs out of SLEEP mode. If the software programs use only the LOGIC_SLEEP bit to power off a partition, then the PMC hardware asserts the SRAM SLEEP controls and only then asserts LOGIC_SLEEP controls. During such an illegal request from software, the PMC can raise an interrupt to LIC, if enabled using the PMC_IMPL_PMC2LIC_INTR_ENABLE_0_ILLEGAL_SRAM_LOGIC_POWER_STATE bit.
- The following table summarizes the types of power gating actions supported and the PMC
involvement in these actions.
- Table 4.22 Power Gating Actions
- Power Gating Type
- Definition
- SoC NPG
Logic Not Power Gated; no power gating controls from PMC.
- SoC PG
- Logic Can be Power Gated; SRAMs can be put in SLEEP mode by the
software through PMC.
- AO-PG
- Logic in AO domain power gated by the PMC upon receiving request from
the local hardware. The PMC provides software-controlled RAM SLEEP/RET controls. The local hardware requests the PMC to put TCMs/Caches in RET mode.
- AO-NPG
Logic in AO not power gated. The PMC provides RAM SLEEP/RET controls.
- CV-PG
- Logic in the CV can be power gated. PMC provides RAM SLEEP and LOGIC
SLEEP controls. PMC does not drive any controls to CV-SRAM(FCM-based). The PG controller follows a priority order to avoid race conditions from requests coming from the software. The SC7 hardware sequencer and the AOPM hardware sequencer undo SLEEP/RET commands on reset deassertion.

- PMC Programming Guidelines
##### 4.2.3.4.3 Software Interface for Power Gating
The PMC supports one register per power domain for power gating support. Software can specify the target power state for logic and the SRAMs in each partition through the
- PMC_IMPL_<PART>_POWER_GATE_CONTROL register. Clamp control registers are supported
separately. Power gating software asserts the clamp controls and reset/clock gating controls (located in CAR) as required to accomplish entry into and out of power-gated states. None of the timer/configuration settings should be changed when power gating hardware is active (i.e., one or more PMC_IMPL_<PART>_POWER_GATE_CONTROL.START bits are set). Software requests for a SRAM/Logic-low power mode by setting the START bit. The START bit should always be set after configuring the target power state.
- The power-gating control logic samples the requested power state information in the
- PMC_IMPL_<PART>POWER_GATE_CONTROL register. Setting the START bit validates the request
for power control management. Though software can set up multiple partitions for power gating, the power gating sequencer handles only one request from the software at one time. Similarly, the PMC_POWER_GATE_STATUS register reflects the status of the supported power controls. All the fields marked here are not applicable to all the power gating partitions. For SoC, CV, PG partitions, SRAM_RET_EN, and the corresponding status register is reserved. For AON RAMs,
- LOGIC_SLEEP_EN, and CLAMP controls and the status bits are reserved. There is no software
control for power gating the AOPG partition. The AOPM can request the PMC to power gate it during the AON deep dormant state. When software requests a power mode entry, which is identical to the present power mode, the sequencer ignores the request. For example, the hardware sequencer does not re-sequence the controls to enter the mode. However, if the respective status bit is cleared in the
- PMC_IMPL_POWER_GATE_STATUS register, hardware sets this bit again in response to the new
request. To simplify the hardware design of the controller, it is required that software always requests power mode transitions, in a consistent manner as far as all the partition power controls are concerned. For example, it is illegal to request a state transition in a single request, which takes the SRAMs out of SLEEP and also asserts SRAM_RET and LOGIC_SLEEP. In other words, requests that flip the PMC_IMPL_POWER_GATE_CONTROL [3:0] bits in the opposite direction (0 ->1 and 1 ->0) in a single request are not supported. When software requests for multiple power gating actions, there is no specific arbitration scheme implemented in the hardware; it depends on the micro-architectural implementation.
##### 4.2.3.4.4 AON RAM PG/UPG Sequence
The following is the sequence for bringing RAMs out of low-power states. 1. Set the power state for the <AORAM> to OFF state.

- PMC Programming Guidelines
a.
- Kick off the PG state machine in PMC by writing
- PMC_IMPL_PART_<AORAM>_POWER_GATE_CONTROL register for that power domain
with: i.
- SRAM_SLEEP = OFF
- SRAM_RET = OFF
- INTER_PART_DELAY_EN = ENABLE
- START = 1
ii. iii. iv. 2.
- Poll PMC_IMPL_PART_<AORAM> _POWER_GATE_CONTROL register until START==0. If the
- START!=0 even after 200us, then flag ERROR
- Read PMC_IMPL_PART_<AORAM>_POWER_GATE_STATUS register to ensure that desired
state is reached without any error flags. Verify that the status fields read as follows. 3. a. b.
- SRAM_SLEEP_STS == OFF
- SRAM_RET_STS == OFF
If there is a mismatch, flag ERROR. <AORAM> in the preceding sequence maps to: 1. 2. 3. 4. 5. “SCRATCH” for PMC scratch RAM “MSS” for MSS_AON Scratch RAM “AONPG” for MSS Encryption RAM “TZRAM” for AON TZRAM RAMs. “DBBRAM” for AON DBB RAMs Note that the LOGIC_SLEEP and CLAMP Controls are defunct for AON RAMs.
##### 4.2.3.4.5 Power Control Sequencing
Below is the sequence to signal a specific partition control (xyz) over the muxed zone bus. This low- level sequencer is triggered for staggering RAM and LOGIC SLEEP_EN bus in a staggered manner.
- This sequence manipulates one control (F_LOGIC_SLEEP or F_SRAM_SLEEP) at one time, for the
partition being managed. The other controls (F_* signals) specific to this partition stays at the default value (of 01) or the last-sequenced value. 1. Set the zone bus to the appropriate initial value (00 when asserting a control, FF when de- asserting the control). Wait for Tzone2force delay. F_xyz [1:0] -> 00. This enables the sampling of the zone bus at the destination. Wait for Tforce2zone delay.
- If zoning is enabled for this control (as defined in PMC_ZONE_CONFIG register), start the
zone signaling and stop at the last zone value (FF or 00 as applicable). Zone timers define the time window between state changes. 2. 3. 4. 5.

- PMC Programming Guidelines
6. If zoning is not enabled for this control, the zone bus moves directly from 0x00 to 0xFF (or vice versa). Wait for Tzone2force delay. F_xyz [1:0] -> 01 (to force signal xyz LOW) or 10 (to force signal xyz high). Wait for Tforce2zone delay. 7. 8. 9.
- Certain power domains can contain multiple partitions. When no interpartition delay is
enabled for such power domains (i.e., PMC_IMPL_ <PART>_POWER_GATE_ CONTROL.
- INTER_PART_DELAY_EN = 0), the PG sequencer treats the entire power domain as a single
partition and goes through the individual control handling in parallel. When interpartition delay is enabled for such power domains, the power control of each of the partitions are sequentially handled (steps 1 through 8 preceding), with a delay (defined by
- INTER_PART_DELAY) inserted between each individual sequence. The clamp signal (driven
out of PMC_IMPL_<PART>_CLAMP_CONTROL register) is power domain specific.
#### 4.2.3.5 Pad Control Programming
##### 4.2.3.5.1 DPD Request
The PMC_IMPL_IO_DPD_REQ_0 register is a DPD request register that puts I/O rails in DPD mode or out of DPD mode, even if the chip in not in SC7. Multiple bits are allowed to be set at the same time and no new operation is triggered until the previous one is completed. Consecutive operations, issued by the completion time of the first one, are dropped but the register is still updated. After writing to the IO_DPD_REQ register, software should wait before writing to the same register again (after reading the status). There is no wait required to write between one IO_DPD_REQ register and the others. This is because there is a separate sequencer for every such register. There is a timing relationship between sel_dpd assertion to e_dpd assertion (similarly sel_dpd deassertion to e_dpd deassertion). This is controlled by a programmable timer (PMC_IMPL_SEL_DPD_TIM_0) in the PMC. When the IO_DPD_REQ register is written, sel_dpd of the corresponding pads get asserted and after the SEL_DPD_TIM delay expiry, e_dpd gets asserted. The state machine goes to idle only after this. So, the time between consecutive writes to IO_DPD_REQ is:
- APB clock frequency *(SEL_DPD_TIM + 5)
- The same delay is applicable before software reads the IO_DPD*_STATUS register after the
corresponding IO_DPD*_REQ register is written.

- PMC Programming Guidelines
SEL_DPD_TIM should be set to a safe value as there is a single timer for all pad groups. It can also be lowered, if the APB clock is slower (a minimum 200 ns is required).
##### 4.2.3.5.2 Pad DPD Sequence
Ensure that the PMC_IMPL_SEL_DPD_TIM_0 register is set to recommended value.
- Software can set multiple IO_DPD_REQ registers bits at the same time, indicating a request
to put multiple I/Os into DPD.
- CODE field of IO_DPD_REQ register indicates whether the transition is into or out of DPD
modes. PMC supports separate DPD sequencing logic for each IO_DPD_REQ register.
- PMC DPD sequencing logic will service each set of controls concurrently, until all pending
requests are complete. When a set of DPD sequencing is complete the respective bit will be updated in the IO_DPD_STATUS register.
#### 4.2.3.6 Voltage Monitor Reset and Interrupt Enabling Guidelines
- PMC_IMPL_VFMON_ACTION_0_VMON_EN should always be set to 1 (by reset default
VMON_EN is set to 1, already), for the logic in the PMC to capture masking or to enable reset/ interrupt actions. Irrespective of the action selection, PMC_IMPL_VFMON_STATUS_0 captures the fault status. Writing 1 to this register clears it. Reset enable: To enable VMON faults for generating legacy and/or async resets:
- Each of the minimum and maximum violation has a corresponding bit in
PMC_IMPL_VFMON_ACTION_0 register that needs to be set to RST. In addition, there is a global bit per each rail that is monitored, i.e., one bit for VDD_CORE,
- VDD_CPU0 and VDD_CPU1 rails in PMC_IMPL_L0L1A_RST_SOURCE_EN_0 which needs to
be enabled.
- Interrupt enable: To enable vfmon_intr on any of voltage faults, the corresponding bit in
PMC_IMPL_VFMON_ACTION_0 needs to be set to INTR.
- Interrupt mask: In addition, there are PMC_IMPL_VFMON_INT_MASK_0 register bits that can
be used to mask a fault that can assert this interrupt.

- PMC Programming Guidelines
#### 4.2.3.7 Frequency Monitor Programming Guidelines
**Figure 4.37 FMON Reset/Interrupt/Fault Connectivity**
- Reset_Action/HSM_Action are from FMON_FAULT_ACTION register
- Interrupt_Action is from VFMON_ACTION register
- Report[3:0] are from FMON_CONFIG register
Direct DC reset request connections are not shown. Refer to the Clock and Reset chapter for clock monitoring details.
##### 4.2.3.7.1 FMON Error Reporting
- The following sequence is written for OSC FMON. The same sequence applies to 32 kHz FMON
(replace OSCnFUSE_CK with PMC_CK in the register/field names). FMON can monitor low threshold violations, high threshold violations, overflow errors, and DC clock stoppage faults. The following register fields must be enabled for reporting the preceding faults. These bits for OSC and 32 kHz are enabled by default and are always kept enabled.
- PMC_IMPL_FMON_CONFIG_OSCnFUSE_CK_0
- FMON_REPORT_DC_FAULT_VIOL_OSCnFUSE_CK_0 for reporting clock stoppage fault
- FMON_REPORT_HIGH_THRESH_VIOL_OSCnFUSE_CK_0 for reporting fault if there is high
threshold violation
- FMON_REPORT_LOW_THRESH_VIOL_OSCnFUSE_CK_0 for reporting fault if there is a low
threshold violation FMON_REPORT_OVERFLOW_ERROR_OSCnFUSE_CK_0 for overflow errors.

- PMC Programming Guidelines
##### 4.2.3.7.2 Enable Reset Request Path from FMONs
- The following sequence is written for OSC FMON. The same sequence applies to 32 kHz FMON
(replace OSCnFUSE_CK with PMC_CK in the register/field names).
- PMC_IMPL_FMON_FAULT_ACTION_OSCnFUSE_CK [0] = 1
This alone enables a reset request path due to all four faults (including clock stop fault) from the OSC FMON. A similar bit exists for 32 kHz FMON- PMC_IMPL_FMON_FAULT_ACTION_PMC_CK [0]. If there is a case where the reset request must be enabled due to clock stoppage alone, but not the other faults like low/high threshold violations, then
- PMC_IMPL_FMON_FAULT_ACTION_OSCnFUSE_CLK[2] = 1
- PMC_IMPL_FMON_FAULT_ACTION_OSCnFUSE_CLK[0] = 0
- In addition, there is PMC_IMPL_L0L1A_RST_SOURCE_EN[SW_OSCRSTREQ], which the
software uses to generate a reset request. For regular sequence of enabling reset request path from FMONs, this register control need not be programmed.
##### 4.2.3.7.3 Enable FAULT and INTERRUPT Path from FMON
- The following sequence is written for OSC FMON. The same sequence applies to 32 kHz FMON
(replace OSCnFUSE_CK with PMC_CK in the register/field names).
- Enable Interrupts and Faults
1.
- Set
- PMC_IMPL_FMON_FAULT_ACTION_OSCnFUSE_CK_0[FMON_ACTION_FAULT_REPORT_OSCnF
USE_CK_0] to ENABLE. This enables the fault_out_pulse from FMON.
- Set PMC_IMPL_VFMON_ACTION_0[FOSC_FAULT_ACTION] to INTR. This enables both
interrupt and fault to HSM.
- To explicitly mask the interrupt and enable only fault to HSM, set
- PMC_IMPL_VFMON_INT_MASK_0[FOSC_FAULT] to MASK. This masks the interrupt line,
keeping the fault line enabled. 2. 3.
- FMON Threshold Settings
- The following sequence is written for OSC FMON The same sequence applies to 32 kHz FMON
(replace OSCnFUSE_CK with PMC_CK in the register/field names). By default, for OSC and 32 kHz FMONs, threshold settings are set assuming +/- 50% inaccuracy in VREFRO clock. These registers use L1A cold reset. Therefore, during L0 and L1A boot, these registers are reset to default values. During boot, once VREFRO calibration is complete, the threshold values must be programmed such that the clocks can be monitored with a much higher accuracy. VREFRO accuracy after calibration is at 5%. Overall, the clock monitoring accuracy requirement is 10%. During the L1B, L1C, and L2 boot paths, both the calibration settings for VREFRO in the CAR page, as well as FMON threshold settings in the PMC, are not reset. There are maintained at +/-10% margins.

- PMC Registers
For details, refer to the Clock Controller chapter.

