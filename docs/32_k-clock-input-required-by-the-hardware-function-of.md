# 32 K clock input, required by the hardware function of IST.

- SYS_RESET_N
- Functional
PMIC drives it depending on the power state of the system.
- AO_RETENTION_N
- Functional
- Used as IST_DONE notification to MCU at the normal/partial (due to abrupt
thermal event) completion of IST. More details are covered in the Special-purpose GPIOs Actively Managed during IST sub-section below.
- THERM_DP
- Functional
Thermal sensor connection for thermal management.
- THERM_DN
- Functional
- JTAG_TRST_
- Functional
JTAG path interface connectivity for IST debug.
- JTAG_TDO
- Functional
- JTAG_TMS
- Functional
- JTAG_TCK
- Functional
- JTAG_TDI
- Functional
- NVJTAG_SEL
- Functional
ARM JTAG (default) or NVJTAG selection.
- NVDBG_SEL
- Functional
Used for switching to MIPI debug modes in closed-box system.
- Various DFD I/Os
- Functional
- DFD Debug Observation Bus (OBS) signals are listed in the DFD OBS Pins Table in
the DFD OBS Signals section above.

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
- The GPIO pads used for DFD must not be transitioned in to DPD state. The DFD observation
signals are routed through the pad's test mode inputs over TM/TASEL, etc. Hence, these DFD observation signals do not need any of the following: PinMux overrides. Scan isolation. IST hardware management.
##### 9.4.2.8.2 Interrupts
This category of I/O (input only) interface signals (pins) is needed to channel Interrupts from aggregated platform events to the DFT master logic to cause shutdown of the IST sequence during IST. This Interrupts category I/Os are summarized in the following table.
- Table 9.53 IST Interrupt Category I/Os
- Signal/Pin
- Names
- IST Pin-
state
- IST Description
- SOC_GPIO14
- Interrupt
(functional)
- Notification on any of these pins causes IST abrupt shutdown depending on mask
selection. These Interrupt lines are of fixed “Active HIGH” polarity convention. The
- DFT master has provision to enable/mask for I/Os used as aggregated platform level
triggers. Register definition of such IST Interrupt filtering controls details can be found in the IST Manuals. The IST retains them in the DPD mode, while the VD/VDVX pad type I/O core side input (ZI_WAKE) is propagated into the core DFT logic.
##### 9.4.2.8.3 Toggle
This category of I/O interface signals (pins) is meant to be used by the various PWM-based Voltage Regulator (VR) controls during IST. This Toggle category I/Os are summarized in the following table.
- Table 9.54 IST Toggle Category I/Os
- Signal/Pin Names
- IST Pin-
state
- IST Description
- SOC_GPIO07
(pin-mux option GP_PWM6)
- Toggle
PWM-based CPU-VR.
- TOUCH_CLK
(pin-mux option GP_PWM4)
- Toggle
PWM-based SOC-VR.
- GP_PWM2
- Toggle
PWM-based GPU-VR.
- GP_PWM3
- Toggle
PWM for fan control. Must be turned on during IST to set the fan at some fixed speed.

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
- Signal/Pin Names
- IST Pin-
state
- IST Description
- SOC_GPIO21/GP_PWM5
- Toggle
PWM for 2nd fan control (optional feature).
- SOC_GPIO19/GP_PWM7
- Toggle
PWM based CV-VR. NOTE:
- PWM controllers as listed in the table above together with related SoC logic need to be
isolated from the logic BIST.
- PWM outputs as listed in the table above need PinMux/pad control “JTAG_override”, since
this logic portion is not scan-isolated. Specifically, PWM1 with “JTAG_override” provision is not intended to be used to control and config VRs or alike. The requirements for the PWM interfaces used for High-current VRs in the auto-platform are: Voltage must be set at a level required to safely complete the IST sequence.
- PWM ports for VR must keep toggling with outputs not to be sequenced out (IDLE or
inactive) by BPMP software towards IST initialization, or by system software during
- IST, and
shutdown sequence in auto platforms (that are IST relevant).
- An un-used PWM port must be regarded as a Static category I/O (details in the sub-section
below) for that platform, with software transitioning it to the DPD state to keep it in safe I/O state.
##### 9.4.2.8.4 Static
This category of I/O interface signals (pins) is expected to maintain at a pre-defined level (pin- state) during IST, including certain PWM output signals expected to be parked at certain pre-defined “static” state (depending on platform GPIO usage), and any un-used PWM port (to be programmed by software prior to IST like any other Static signals in order to be excluded from DFT boundary scan coverage).
- To achieve Static” state,
the BPMP IST software selects a Toggle I/O as GPIO mode to drive the output state to HIGH or Low, and the BPMP IST software includes the selected I/O together with other similar I/Os that need to transition to the DPD state to be parked safe during IST. Another approach to achieve safe Static state during IST is using the JTAG_override mechanism. However, this involves additional coding in the IST μCode to read the Pad controls (including the PM field for JTAG_override), is therefore not a preferred option.

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
It is important to note that transition I/Os to the pre-defined pin state is not limited only to the
- Static category I/Os, but all I/Os that are not active to perform the IST
This Static category I/Os are summarized in the following table.
- Table 9.55 IST Static Category I/Os
- Signal/Pin
- Names
- IST Pin-
state
- Description of Chip I/O State & Requirements
- SOC_PWR_REQ
- Static
- Need to be parked at Logic-HIGH state in the system during IST. This ensures that
chip's not-Always-On core voltage request is asserted to the PMIC.
- This is achieved by
- JTAG override programming to set up in “tri-state” or “Logic-HIGH” as part of the
- IST μCode (as described in the Drive SOC_PWR_REQ HIGH during IST sub-
section below, since the I/O does not support DPD control, thus not covered by
- DPD control programming), and
a board-level pull-up resistor.
- CPU_PWR_REQ
- Static
- Need to be parked at Logic-HIGH state in the system during IST. This ensures that the
CPU core power request is asserted to the PMIC. BPMP firmware needs to drive the GPIO accordingly before IST mode is entered. Subsequently, DPD mode of the pad maintains the I/O state.
- GPU_PWR_REQ
- Static
- Need to be parked at Logic-HIGH state in the system during IST. This ensures that the
GPU core power request is asserted to the PMIC. BPMP firmware required to drive the GPIO accordingly before IST mode is entered. Subsequently, DPD mode of the pad maintains the I/O state.
- CV_PWR_REQ
- Static
- Need to be parked at Logic-HIGH state in the system during IST. This ensures that chip
CV core power request is asserted to the PMIC. BPMP firmware needs to drive the GPIO accordingly before IST mode is entered. Subsequently, DPD mode of the pad maintains the I/O state.
- SOC_GPIO28
(DGPU_PWR_E N)
- Static
- Need to be parked at Logic-Low state in the system during IST. This also requires
turning off the GPU power rails. BPMP firmware needs to drive the GPIO accordingly before IST mode is entered. Subsequently, DPD mode of the pad maintains the I/O state.
- SOC_ERROR_N
- Static
- Need to be parked at Logic-HIGH state in the system during IST. This ensure that Orin
does not flag a fault notification to the MCU, while IST is being performed. This is achieved by the board-level Pull-up resistor as the default state of this I/O driven by HSM logic is “tri-state” (open-drain connection). Subsequently, DPD mode of the pad maintains the I/O state.
- BOOTV_CTL_N
- Static
- Need to be parked at Logic-Low state in the system during IST. This ensures that safe
voltage level (Vboot) for VDD_SOC power is supplied by the power regulator powering Orin after IST.
- This is achieved by the board-level Pull-down resistor as the default pin is tri-state
(open-drain selection). Subsequently, DPD mode of the pad maintains the I/O state.
- SHUTDOWN_N
- Static
- Need to be parked at Logic-HIGH state in the system during IST. This ensures that Orin
does not trigger shutdown during IST.
- This is achieved by
- JTAG override programming to set up in “tri-state” as part of IST μCode (as
described in the Tri-state SHUTDOWN_N during IST sub-section below, since the I/O does not support DPD control, thus not covered by DPD control programming), and a board-level pull-up resistor.

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
##### 9.4.2.8.5 I/O Safe State Considerations
It is required that all unused I/Os are transitioned to the DPD state and safely parked in a quiescent state prior to IST. The quiescent state of each GPIO can vary from platform to platform. Software must ensure that the required IDLE state is achieved on these I/O interfaces or GPIOs prior to entering IST, followed by DPD/power-down as applicable. The Transitioning I/Os to DPD State sub- section below provides details and references to DPD control programming of these inactive or non-operational I/Os during IST. System software is responsible for keeping the following in a safe and quiescent state as per DPD/ power-down sequence programming guidelines: all unused MPIO I/O pad groups (with PMC DPD control per group). all unused high-speed bricks (with DPD control). The I/O safe state I/Os are: 1. 2. All the I/Os listed as Interrupt and Static category. Other I/Os not covered by the IST categories. This means all I/Os with no IST implication need to be at IDLE state and managed per functional IDLE state requirements. The DPD control settings during IST provide the full summary of DPD/power-down controls and settings required by system software transitioning prior to entering IST. For all such unused I/Os, miniTMC must sample and hold the DPD controls when entering the IST mode and keep them at safe and quiescent state.
##### 9.4.2.8.6 Special-purpose GPIOs Actively Managed during IST
- The signals as summarized in the table below need to be
toggled at the start/end of IST sequence, or actively driven to a “Static” state by the DFT hardware.
- These signals are presented here because they need
pad inputs (i.e. A and OEN as shown in the IST_DONE Signaling to MCU diagram below) overrides in the functional path, or actively driving a desired Pin-state by the IST firmware or hardware as described below.

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
- Ball Name
- Platform
- Symbol Name
- GPIO Register
- Usage
- Driven by
- AO_RETENTIO
N_N
- GP02
GPIO_AON Register:
- PIO_EE_OUTPUT_VALU
E_02_0 Output SFIO:
- Notification to
MCU. (IST_DONE) IST hardware. POR default: Low.
- IST_DONE_N is used as handshake
notification to MCU as described below.
- HIGH: by BPMP-IST at completion of
voltage settings.
- LOW: by IST hardware at completion
of IST.
- SOC_GPIO34
- GP186
GPIO_CTL3 register:
- GPIO_L_INPUT_03_0
Input GPIO:
- IST request from
MCU.
- MCU
- The following diagram shows the scheme for one of such I/Os, IST_DONE, notification to the
external MCU.
**Figure 9.47 IST_DONE Signaling to MCU**
- Software Sequence for IST_DONE_N Output GPIO Driving HIGH
The software programming steps to assert IST_DONE(AO_RETENTION_N) HIGH are as follows: Configure Pad control to select the pin function as GPIO including electrical control settings:
- Write (PADCTL_SYS_AO_RETENTION_N_0.GPIO_SF_SEL = 1’b0)
- Write (PADCTL_SYS_AO_RETENTION_N_0.E_IO_HV = 1’b0)

- Multi-Purpose I/O Pins and Pin Multiplexing (PinMux)
- Write (PADCTL_SYS_AO_RETENTION_N_0.TRISTATE = 1’b0)
Configure per pin GPIO registers to enable GPIO o/p mode of operation:
- Write (GPIO_EE_ENABLE_CONFIG_02_0.INOUT = OUT(1’b1)) to select the GPIO pin usage as
output.
- Write (GPIO_EE_OUTPUT_CONTROL_02_0.GPIO_OUT_CONTROL = DRIVEN(1’b0)) to have it
driven by GPIO logic, not floated.
- Write (GPIO_EE_ENABLE_CONFIG_02_0.GPIO_ENABLE = ENABLE(1’b1)) to enable GPIO
function. Write (GPIO_EE_OUTPUT_VALUE_02_0.GPIO_OUT_VAL = 1’b1)) to drive GPIO to HIGH value.
- Software Sequence for IST_REQ_N Input GPIO
The software programming steps to initialize IST_REQ_N (SOC_GPIO34) HIGH are as follows: Configure Pad control to select the pin function as GPIO including electrical control settings:
- Write (PADCTL_PEX_CTL_SOC_GPIO34_0.GPIO_SF_SEL=1’b0)
- Write (PADCTL_PEX_CTL_SOC_GPIO34_0.E_IO_HV=1’b0)
- Write (PADCTL_PEX_CTL_SOC_GPIO34_0.TRISTATE =1’b0)
Configure per pin GPIO registers to enable GPIO input mode of operation:
- Write (GPIO_L_ENABLE_CONFIG_03_0.INOUT = IN(1’b0)) to select the GPIO pin usage as
output.
- Write (GPIO_L_OUTPUT_CONTROL_03_0. GPIO_OUT_CONTROL = FLOATED(1’b1)) to float
the GPIO (not driven by GPIO logic).
- Write (GPIO_L_ENABLE_CONFIG_03_0.GPIO_ENABLE = ENABLE(1’b1)) to enable GPIO
function. Read GPIO_L_INPUT_03_0.GPIO_IN to check the GPIO pin status.

