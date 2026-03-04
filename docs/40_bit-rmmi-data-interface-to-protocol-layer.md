# 40 -bit RMMI data interface to protocol layer

- Works with UPHY brick supporting M-PHY analog
- Brick configuration control logic
- Configurable SI dithering support
- Auto detection of Rx polarity or Rx polarity control through M-PHY specification defined
register
- Configurable lane mapping between M-PHY and protocol layer
##### 10.4.1.1.1 Top Level Connection
- RMMI Interface
- The M-PHY supports a Remote Monitor and Maintenance Interface (RMMI) interface, which is
defined as the Reference M-PHY MODULE Interface in the M-PHY specification. It is an interface between the M-PHY and the upper PROTOCOL layer. This is used for register access alongside the APB interface.
##### 10.4.1.1.2 M-TX Digital
M-TX Digital and M-RX Digital blocks are powered only when MTD_Enable and MRD_Enable, respectively, are asserted. The following figure illustrates the top-level block diagram of M-TX Digital, with widths marked for the data buses between functional blocks. The section for M-TX Analog in the figure is for illustration purposes only.

- MIPI M-PHY
**Figure 10.18 M-TX Digital Top-Level Block Diagram**
M-TX LS-MODE transmission, including LCC Command transmission, utilizes the Tx bypass mode of M-TX Analog, where the HS Serializer inside the M-TX Analog is disabled. The complete M-TX Digital data path other than PWM Serializer runs at 1/40 of the link data rate (TX_Symb_Clk). PWM- Serializer works at 3x outbound sub-link data rate (TX_LS_3xbit_Clk) and is responsible to convert the 120-bit parallel interface (40 PWM bits) into the serialized signaling. M-TX HS-MODE transmission utilizes the HS Serializer of M-TX Analog, where the M-TX Digital data path runs at 1/40 of the link data rate (TX_Symb_Clk) until the input of M-TX FIFO at the interface to M-TX Analog.
##### 10.4.1.1.3 Register Block
Register Control is necessary to configure M-TX to the required mode, gear, rate series, or setting other parameters. This configuration control block also provides capabilities of M-TX so that protocol can discover what a module can do and what values of parameters need to be met for reliable module operation. M-TX registers can be accessed either through APB (4.0 Compliant) or through RMMI. The following table shows the read/write permission through both these interfaces.

- MIPI M-PHY
- Table 10.6 Write/Read Permission through APB and RMMI
- Register Set
- RMMI Interface
- APB Interface
- Write
- Read
- Write
- Read
M-TX Configuration Attributes
- Yes
- Yes
- Yes
- Yes
M-TX Capability Attributes
- No
- Yes
- Yes
- Yes
M-TX Status Attributes
- No
- Yes
- No
- Yes
- OMC Write-only Attributes
- Yes
- No
- Yes
- Yes
- PVR Registers
- No
- No
- Yes
- Yes
- APB Register Access
Software can write to and read from TX_PRV Registers only through APB, as no write or read path exists through RMMI. Software can write to TX_Capability Registers only through APB, as no write path exists through RMMI. Read can be done from both the interfaces.
- Write Path
Software updates the required APB shadow registers (TX_Capability Register, TX_Configuration Register, OMC_Write_Only_Attribute Registers, and PRV registers) first, then software writes 1 to the Reg_xfer_go bit to transfer the values from the APB shadow register to actual registers, which are used by MTD.
- Read Path
APB read always gives the values present in Actual Registers, however there is short delay (three cycles in worst case) between the value being updated and when it is ready to be read.
- RMMI Register Access
The M-TX digital register is accessed via RMMI along with the reset hookup. Register access via RMMI works on TX_Cfg_Clk.
- Write Path
- The write path to Actual Registers is through RMMI Shadow Registers (TX_Configuration RMMI
- Shadow register, OMC_Write_Only_Attribute RMMI Shadow Register, LCC Sequencer RMMI Shadow
- Register and LCC Enable RMMI Shadow Register). Protocol can write to the RMMI Shadow
Registers at any time, but the values are transferred to Actual Registers only after RCT/CFG_UPD occurs. There is no write path to TX_PRV Registers through RMMI.

- MIPI M-PHY
- Read Path
The read path is directly from Actual Registers and is always enabled irrespective of the state of the M-TX. An RMMI read path does not exist for TX_PRV registers.
- SI Dithering
- SI Dithering is enabled by disabling bypass_dithering (BYPASS_DITHERING = 0) in the
APB_TX_VENDOR2 register for HS-BURST. (By default, dithering is enabled.) M-TX Digital supports eight random start positions for SI Dithering. SI Dithering is performed by inserting the pre- determined pseudo random number of DIF-P bits before the SYNC periods at the start of an HS- Burst and removing the same numbers of DIF-N or DIF-P bits at the Tail-of-Burst of an HS-BURST. UI Shift is set to 0 for all PWM-BURSTs, and UI Shift is set to 0 for all HS-BURSTs when SI Dithering is disabled. When SI Dithering is enabled, UI Shift for each HS-BURST is determined by the following mechanism: 4-bit LFSR to generate the pseudo random UI Shift offset number.
- Implements the polynomial: G(X) = X4 + X + 1
- Advance one shift after each HS-BURST end
- Initialize to 0xFFFF with assertions of M-PHY RESET and M-PHY LINE-RESET
UI Shift = (UI Shift offset) % UI_SHIFT_VALUE, where UI_SHIFT_VALUE = 1, 2, 4, 8, and 4 is the reset value (defined in APB_TX_VENDOR2 register)
- LCC Generator
- LCC Generator is responsible of inserting LCC frames based on the M-PHY specification. For
simplicity, all LCC frames may start at Symbol 0 and end at Symbol 3. LCCs are 10-bit long and are always preceded by a PWM-b0. LINE-INIT is part of, and complete, LCCs except LCC-MODE. The LCC Generator inserts nine PWM-b1s and one PWM-b0 bits between two LCC frames to signal LINE-INIT. LCCs is only issued starting from LINE-INIT state. The LCC Generator outputs DIF-N after the LCC MODE frame ends.
- PWM Serializer and PWM Encoder
PWM-BURST utilizes the bypass path of M-TX Analog, where the parallel to serial signal mapping and PWM signaling transformation are performed by the LS Serializer and PWM Encoder. PWM Encoder runs on TX_Symb_Clk and encodes each bit into 3-bit PWM data. PWM Serializer works on TX_LS_3xbit_Clk and transmits each bit to Analog pad.

- MIPI M-PHY
M-TX FSM and Burst FSM M-PHY specification depicts the required (Type-I) FSM for M-TX. Upon de-assertion of M-PHY Reset or fundamental reset, M-TX transitions to HIBERN8 state and waits in this state until TX_HIBERN8_Control is set to EXIT and TX_CfgUpdt is issued.
- Once directed to exit HIBERN8 after power-on sequence, MTD enters SLEEP state. MTD goes to
BURST state by entering PREPARE period when TX_Burst is asserted. PREPARE period is at least TPWM_PREPARE and does not exceed the minimum value of TLINE-RESET-DETECT (1 ms). The following table lists the value of TX_LS_PREPARE_LENGTH required.
- Table 10.7 PREPARE Length Required in LS Mode
- PWM-Gear
- TX_LS_PREPARE_LENGTH
- PWM-G1
- PWM-G2
- PWM-G3
- PWM-G4
- PWM-G5
- PWM-G6
- PWM-G7
In LS-MODE, the MTD sends the PWM bits, and the input clock rate is programmed to deliver the required PWM-GEAR rate. When TX_Burst is deasserted, MTD ends the burst. MTD transitions to the STALL state when configured to HS-MODE after RCT. The input clock rate allows delivery of the high-speed data rate required for the configured HS-GEAR. MTD starts the
- PREPARE period upon assertion of TX_Burst when TX_MODE=HS_MODE. PREPARE period, THS-
PREPARE. After completion of THS-PREPARE, the MTD starts the SYNC period. During SYNC period, the MTD transmits data stream provided at TX_Symbol when TX_SYNC_Source is set to EXTERNAL_SYNC.
- Otherwise (i.e., TX_SYNC_Source == INTERNAL_SYNC), the MTD generates a default
synchronization pattern which is an alternating D10.5 and D26.5 pattern that starts with either of the two symbols. The default value of TX_SYNC_Source is INTERNAL_SYNC. The SYNC sequence can start with RD of +1 or -1. However, for DC-balance, the SYNC sequence is encoded according to Running Disparity rules. The following table shows the value of TX_HS_PREPARE_LENGTH required.

- MIPI M-PHY
- Table 10.8 HS PREPARE Length Calculation with No Retiming at RMMI
- HS-Gear
- EXTERNAL_SYNC
- INTERNAL_SYNC
- TX_HS_PREPARE_LENGTH
- TX_HS_PREPARE_LENGTH
- HS-G1
> 12 - TSYNC
- HS-G2
> 12 - TSYNC
- HS-G3
> 12 - TSYNC
- HS-G4
> 12 - TSYNC
- Table 10.9 HS PREPARE Length Calculation with Two Retiming Stages at RMMI
- HS-Gear
- EXTERNAL_SYNC
- INTERNAL_SYNC
- TX_HS_PREPARE_LENGTH
- TX_HS_PREPARE_LENGTH
- HS-G1

