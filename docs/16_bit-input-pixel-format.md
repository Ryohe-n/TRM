# 16 -bit input pixel format

- Internal data-path precision promotion
#### 7.3.1.5 Power Management
In the SoC, VIC is spread over two layout partitions namely VICA and VICB, but all of it belongs to a single PG domain VIC.
##### 7.3.1.5.1 Clock Gating Requirements
- Hierarchical Clock Gating
VIC supports clock gating. First-level clock gating (FLCG) refers to clock gating of the top-level VIC_CLK clock input into the VIC unit which is controlled by software. First-level clock gating can be enabled by software to reduce power when VIC is inactive. Second-level clock gating (SLCG) refers to clock gating of individual portions of the VIC pipeline, controlled by the VIC hardware, with software overrides. When each frame completes, no further work is pending in the method stream and all portions of the VIC pipeline are idle, then each major portion of the VIC pipeline is clock gated automatically by the hardware.

- Video Image Compositor (VIC)
A block-level clock gating (BLCG) controller monitors vic_idle (idling of all logic in the vic_clk domain). When vic_clk logic is idle, the vic_clk clk_en signal to CAR is deasserted, automatically disabling the vic_clk at the root and thus saving power in the clock tree. A free running vic_clk_nobg clock is required for the BLCG controller to work. The BLCG controller is configurable (e.g., enable, idle_delay count, wakeup delay count, etc.) via CSB registers in the VIC MISC space.
- Activity Monitor Activity Signal
The VIC does not include any direct power monitoring features. It exports an activity monitoring signal that is utilized by the DVFS software to program the VIC clock frequencies and voltages. A Per-Unit Activity Monitor (ACTMON) monitors VIC activity. The ACTMON receives an activity signal from the VIC engine, and using that information, generates an IIR average that is compared against watermark thresholds, and interrupts software whenever certain activity thresholds are exceeded.
- The ACTMON is monitored by software and aids in power management policies, such as setting
VIC's clock frequency, enabling and disabling first level clock gating, and power gating of the engine. The VIC activity sent to the ACTMON is asserted from the time that VIC first fetches a method for processing from THI, until the moment that pixel data processing completes and end of frame is asserted. Any activity within the THI either before the start of method fetch by VIC or after end of frame does not add to the accumulated VIC activity.
##### 7.3.1.5.2 Power Gating
The VIC is located in its own partition(s) which are power-gateable. VIC power-gating is enabled in LP0/LP1 states, as well as after extended periods of inactivity. When the VIC is split across multiple partitions, it is expected that all partitions are power-gated (or not) together; there is no use-case where some partitions are power-gated and other partitions are not. Software is responsible for making sure VIC is idle, saving/restoring context, reloading the Falcon firmware, and rebooting it whenever power-gating the unit.
##### 7.3.1.5.3 Power Gating Sequence
- VIC Clocks and Resets
The following are the CAR register fields associated with VIC clocks:
- CLK_RST_CONTROLLER_CLK_OUT_ENB_VIC_0.CLK_ENB_VIC
The following are the CAR register fields associated with VIC resets:
- CLK_RST_CONTROLLER_RST_DEV_VIC_0.SWR_VIC_RST

- Video Image Compositor (VIC)
- VIC Power Gating
1. 2.
- Enable VIC clock(s)
- Flush MC client VIC
a. Set the MC register bit:
- MC_CLIENT_HOTRESET_CTRL_0.VIC_FLUSH_ENABLE
Poll MC_CLIENT_HOTRESET_STATUS_0 until the following bits are set:
- VIC_HOTRESET_STATUS
b. 3.
- Apply clamps
a. b.
- Write to PMC_IMPL_PART_VIC_CLAMP_CONTROL_0 with CLAMP=ON
- Wait 100 ns for clamps to engage
4. 5. 6.
- Assert VIC resets
- Disable VIC clocks
- Set VIC power state to PG
a. b.
- Write PMC_IMPL_PART_VIC_POWER_GATE_CONTROL_0
- Poll PMC_IMPL_PART_VIC_POWER_GATE_CONTROL_0 until bit START==DONE
- Read PMC_IMPL_PART_VIC_POWER_GATE_STATUS_0 and verify that desired state is
reached. If there is a mismatch, flag ERROR c.
- VIC Power Ungating
1.
- Set VIC power state to ON
a. b.
- Write PMC_IMPL_PART_VIC_POWER_GATE_CONTROL_0
- Poll PMC_IMPL_PART_VIC_POWER_GATE_CONTROL_0 until bit START==DONE
- Read PMC_IMPL_PART_VIC_POWER_GATE_STATUS_0 and verify that the desired state is
reached. If there is a mismatch, flag ERROR c. 2. 3.
- Enable VIC clock(s)
- Assert VIC reset(s)
a. b.
- Write CAR register(s) specified above
- Add 2 µs delay to allow flushing of non-resettable flops
4.
- Release clamps
a. b.
- Write to PMC_IMPL_PART_VIC_CLAMP_CONTROL_0 with CLAMP=OFF
- Wait 100 ns for clamps to disengage
5. 6.
- Deassert VIC reset(s)
Enable MC client VIC by clearing the following bits: a.
- MC_CLIENT_HOTRESET_CTRL_0.VIC_FLUSH_ENABLE
7. Optionally (if requested by the unit's driver), disables VIC clock(s).

- Video Image Compositor (VIC)
##### 7.3.1.5.4 Instantiate Error Collator and Hook Up Faults to HSM
To standardize the reporting and testability of fault reports to the HSM, the VIC adopts the standard Error Collator plug-ins. The VIC instantiates these plugins to collect the various safety related errors and provide two fault lines (correctable and uncorrectable) to the HSM. The errors reported to the HSM are the Falcon IMEM-ECC (correctable, uncorrectable), Falcon DMEM-Parity, Falcon firmware (correctable, uncorrectable) including timeout, and errors discovered during periodic testing.
- Table 7.67 List of VIC Error Types
- Error name
- Produced by
- Output error signal
- Falcon IMEM ECC SEC
- ECC plugin terminal
vic_fault_corrected
- Falcon IMEM ECC DED
- ECC plugin terminal
vic_fault_critical
- Falcon DMEM parity
- Parity plugin terminal
vic_fault_critical
- Falcon Software correctable Error
- Software corrected errors
vic_fault_corrected
- Falcon Software critical Error
- Software critical errors
vic_fault_critical Embedded safety within Falcon provides two ERBs (Embedded RuBys) for firmware to send fault reports. These ERBs connect to the error collator, while Falcon reports both corrected errors and critical errors detected by firmware based protection. The errors include:
- Corruption of critical configuration registers
- Internal IP hardware timeout
- Other firmware based safety errors
#### 7.3.1.6 Virtualization
Virtualization is implemented by the Host Interface (THI); the Host Interface serves as an interface between the SoC Host Controller and Falcon microcontroller(s).
- Two StreamIDs should be available for VIC engine, one (StreamID1) for internal Falcon use,
and the other (StreamID0) for VIC processing pipeline use.
- Both StreamIDs should be programmable by Host Controller RM privilege (TrustZone is
optional), but NOT by other security privileges.
- StreamID0 should be programmable by either Channel programming or MMIO, StreamID1
should be only programmable by MMIO.
- Channel Lock (CH_LOCK) should be supported, when enabled (CH_LOCK=1), push buffer
commands should NOT be allowed to access non-THI registers.

- VIC Programming Guidelines

