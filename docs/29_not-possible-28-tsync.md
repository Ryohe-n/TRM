# 29 (not possible) > 28 - TSYNC

- HS-G2
> 28 - TSYNC
- HS-G3
> 28 - TSYNC
- HS-G4
> 28 - TSYNC
- PAYLOAD of BURST is transmitted after the SYNC period in HS-MODE and after the PREPARE
period in PWM-BURST. PAYLOAD starts with a MARKER0 and ends with any symbol before a TAIL- OF-BURST.
- In HS-MODE, after sending the SYNC sequence for TSYNC period, the M-TX sends MARKER0 upon
protocol request. If protocol does not make symbol transmission request after TSYNC has elapsed, the M-TX continues to send the SYNC sequence. In LS-MODE, the PREPARE period is extended after it has elapsed in case protocol does not request symbol transmission in time. However, in LS- MODE, the Protocol ensures that PREPARE period is less than TLINE-RESET-DETECT (1 ms). If during a BURST at any time after the first MARKER0 the protocol does not provide the next symbol request on time, the MTD inserts FILLER symbols to prevent failure and corruption of the serial stream.
- Upon deassertion of TX_Burst signal, MTD sends TOB to go to the LINE-CFG state if
TX_LCC_Enable == YES and TX_CfgUpdt issued, or any configuration write request is made. Otherwise, MTD sends TOB to indicate SLEEP or STALL state entry. MTD provides TX_Controlled_ActTimer signal at RMMI. When this signal is asserted, MTD controls TACTIVATE upon HIBERN8 exit. Otherwise, the protocol controls the TACTIVATE upon HIBERN8 exit. When the TX_Controlled_ActTimer signal level is high when TX_LineReset is asserted, then MTD

- MIPI M-PHY
drives DIF-N at least for TACTIVATE before driving DIF-P for TLINE-RESET. If TX_Controlled_ActTimer is set to "0" when TX_LineReset is asserted, the MTD immediately drives DIF-P for TLINE-RESET.
- After inserting PREPARE and SYNC (for INERNAL_SYNC or EXTERNAL_SYNC) at the beginning of a
BURST, whose lengths are governed by M-TX Configurations registers, M-TX Digital must not insert bubbles in a burst to assert TX_PhyDIRDY. If Protocol chooses EXTERNAL_SYNC and the SYNC symbol request by the Protocol does not meet configured PHY BW target, M-TX Digital inserts default SYNC symbols, alternately, to avoid bubbles.
- ADAPT State
Sub-states of BURST state are depicted below. ADAPT state is mandatory for High Speed GEAR 4 (HS-G4) support. During ADAPT state, Rx (UPHY RX) can perform equalizer training. M-PHY v4.1 specification supports two ADAPT operation options: INITIAL and REFRESH. Protocol configures/ controls M-PHY entering ADAPT state with the INITIAL option selected before entry to HS-G4 for the first time since cold boot/fundamental reset de-assertion. Subsequent entry to ADAPT state can use the REFRESH option by protocol.
**Figure 10.19 Sub-states of BURST-SAVE**
- The protocol can initiate subsequent retraining through asserting TX_ADAPT_REQ signal,
reconfiguring TADAPT at the M-TX, and writing the ADAPT_control field of RX_ADAPT_Control from
- SYNC to ADAPT and setting the ADAPT_type field of RX_ADAPT_Control to either INITIAL or

- MIPI M-PHY
- REFRESH. During the execution of ADAPT, starting from TX_ADAPT_REQ de-assertion to
TX_ADAPT_ACTIVE protocol, the controller does not assert the TX_Burst signal. In general, the TX_Burst signal is not asserted while TX_ADAPT_ACTIVE or TX_ADAPT_REQ are asserted.
#### 10.4.1.2 Retiming Interface
The interfaces between M-TX Digital, M-RX Digital, and Protocol adopt the RMMI interface defined in Annex A of the M-PHY Specification.
#### 10.4.1.3 Clocks
Clocks for LS mode and HS mode Rx are generated from REFPLLE (also a form of Core PLL) whose VCO frequency is 625 MHz. HS mode TX clock is generated from UPHY PLL (UPHY_PLL3) residing in UPHY pad.
##### 10.4.1.3.1 Operating Frequencies
- Table 10.10 M-TX Clocks and Operating Frequencies
- Clocks/
- Mode
- PWM-G
- PWM-G2
- PWM-G3
- PWM-G4
- HS-G1
- HS-G2
- HS-G3
- HS-G4
- Rate
A B A B A B A B
- Link
- Freq/BW
(mbps) 3 ~ 9 6 ~ 18 12 ~ 36 24 ~ 72 – 59. – 18. 4 – 6.8 – 73. L.D. - 4.34 H.D. - 8.68 L.D. -8.68 H.D. -17.3 L.D. - 17.36 H.D. - 34.72 L.D. - 34.72 H.D. - 67.77 N/ A N/ A N/ A N/ A N/ A N/A N/ A N/A 1. L.D.
- Rate
slab (Mbps) 2. H.D.
- Rate
slab (Mbps) mphy_<l x>_tx_sy mb_clk 0.11 0.22 0.22 0.43 0.43 0.87 0.87 1.74 .2 36. .4 72. 4.8 .92 9.6 .84
- mphy_<
lx>_tx_2 x_symb_ clk N/A N/A N/A N/A .4 72. 4. 5.9 9.6 .84 9.2 .68 mphy_<l x>_tx_ls _3xbit_c lk 13.02 26.04 26.04 52.08 52.08 104.1 104.1 208.3 N/ A N/ A N/ A N/ A N/ A N/A N/ A N/A

- MIPI M-PHY
- Clocks/
- Mode
- PWM-G
- PWM-G2
- PWM-G3
- PWM-G4
- HS-G1
- HS-G2
- HS-G3
- HS-G4
mphy_<l x>_tx_cf g_clk mphy_tx _1mhz_r ef_clk 1.01 1.01 1.01 1.01 1. 1.0 1. 1.0 1.0 1.0 1.0 1.0 mphy_c ore_pll_f ixed_clk 208.33 208.33 208.33 208.33 8. 8.3 8. 8.3 8.3 .33 8.3 .33 mphy_io bist_clk N/A N/A N/A N/A .0 39. .1 78. 6.2 .25 2.5 .5 mphy_<l x>_pclk (maximu m) Note: 1) L.D. is Lower Data Rate slab and 2) H.D. is Higher Data Rate slab.
- Table 10.11 M-RX Clocks and Operating Frequencies
- PWM
-G3
- PWM
-G4
- HS-G1
- HS-G2
- HS-G3
- HS-G4
- PW
M-
- G2
- Clocks/
- Mode
- PW
M-
- G1
- Rate
A B A B A B A B
- Link Freq/BW
(mbps) 3 ~ 9 6 ~ 12 ~ 24 ~ 1456 – 1459.2 2912 – 2918.4 5824 – 5836.8 11648 – 11673.6 mphy_<lx>_rx _symb_clk 0.30 0.52 1.04 1.95 39.0 39.06 78.1 78.13 156.2 156.25 312.5 312.50 mphy_<lx>_rx _ls_bit_clk 12.0 20.83 41.67 78.13
- NA
- NA
- NA
- NA
- NA
- NA
- NA
- NA
mphy_<lx>_rx _pwm_bit_clk
- UPHY Brick interface clock
- NA
- NA
- NA
- NA
- NA
- NA
- NA
- NA
mphy_<lx>_rx _cfg_clk mphy_<lx>_p clk (maximum) uphypm2mph yrx_<lx>_rx_h s_analog_sy mb_clk N/A N/A N/A N/A 62.4 72.96 124. 145.92 249.6 291.84 499.2 583.68

- MIPI M-PHY
- PWM
-G3
- PWM
-G4
- HS-G1
- HS-G2
- HS-G3
- HS-G4
- PW
M-
- G2
- Clocks/
- Mode
- PW
M-
- G1
lx = l0/l1/l2/l3 (lane0/lane1/lane2/lane3) mphy_rx_clk_uphy_<lx> - Recovered clock from UPHY
#### 10.4.1.4 Resets
##### 10.4.1.4.1 MTD/MRD Fundamental Reset
- The fundamental reset is triggered by mphy_l<x>_tx_rstn for MTD, and mphy_l<x>_rx_rstn for
MRD. These system Power On Resets (PORs) are controlled directly by the Clock and Reset (CAR) module. The fundamental reset state is: M-TX or M-RX line state machines are in the DISABLED state. All pipelines and data path state machines are reset to default state. All output signals of M-RX data interface are deasserted.
- All output signals of M-TX data interface are deasserted. TX_PhyDIRDY is asserted. This
means data received at the interface are silently dropped.
- All attribute registers, including private registers of MTD, MRD, or MPCTL, are reset to
default values. All output signals of the M-TX or M-RX control interface are deasserted. All inputs of the M- TX or M-RX control interface are ignored. This means all attribute register writes are ignored and all attribute register reads return 0x0. -
- All output signals of MTD, MRD, or MPCTL private control interface are deasserted. All
inputs of the MTD, MRD, or MPCTL private control interface are ignored.
- This means all private attribute register writes are ignored and all private attribute
register reads return 0x0. -
- At the deassertion of the fundamental reset and M-PHY Reset, the M-TX or M-RX line state
machines move to the HIBERN8 states.
##### 10.4.1.4.2 MPHY_CLK_CTRL Fundamental Reset
- The M-PHY reset is triggered by TX_Reset for each MTD and RX_Reset for each MRD. This is
corresponding to cold or warm reset of MIPI UniPro® and is expected to be triggered by the link layer the MTD and MRD are connected to. M-PHY resets are also asserted during power on reset. The M-PHY reset state is:

- MIPI M-PHY
M-TX or M-RX line state machines are in the DISABLED state. All pipelines and data path state machines are reset to default state. All output signals of M-RX data interface are deasserted.
- All output signals of M-TX data interface are deasserted. All inputs of the M-TX data
interface are ignored. This means data received in the interface are silently dropped. All specification defined attribute registers, including those marked as not reset by line reset, of MTD or MRD are reset to default values
- The M-TX or M-RX control interface and the private control interfaces remain operational
during M-PHY reset. - -
- All attribute register writes to specification defined registers are ignored
- All attribute register reads to specification defined registers return the value of the
targeted register.
- All specification defined capability registers may be programmed
-
- All private defined attribute registers of MTD or MRD are not reset
All attribute register writes to private registers are handled accordingly. All attribute register reads to private registers return the value of the targeted register.
- At the deassertion of the M-PHY reset, the M-TX or M-RX line state machines move to the
HIBERN8 states.
##### 10.4.1.4.3 M-PHY Line Reset
The M-PHY line reset is triggered by TX_LineReset for each MTD. The M-PHY line reset is detected by the line reset condition detected on the line for each MRD, where MRD signals line reset state to the link layer by asserting RX_LineReset. The M-PHY line reset state is: M-TX or M-RX line state machines are in the LINE-RESET state. All pipelines and data path state machines are reset to default state. All output signals of M-RX data interface are deasserted.
- All output signals of M-TX data interface are deasserted. All inputs of the M-TX data
interface are ignored. This means data received in the interface are silently dropped. All specification defined attribute registers, excluding those marked as not reset by line reset, of MTD or MRD are reset to default values.
- The M-TX or M-RX control interface and the private control interfaces remain operational
during M-PHY reset. -
- Except those marked as not reset by line reset, all attribute register writes to
specification defined registers are ignored; attribute register writes to registers marked as not reset by line reset are handled accordingly.
- All attribute register reads to specification defined registers return the value of the
targeted register. -

M-PHY Registers
- All private defined attribute registers of MTD or MRD are not reset
All attribute register writes to private registers are handled accordingly. All attribute register reads to private registers return the value of the targeted register. At the de-assertion of the M-PHY Line reset, the M-TX or M-RX line state machines move to the SLEEP state.
##### 10.4.1.4.4 Power Management
- Clock Gating
All clocks of M-PHY must be enabled before reset is de-asserted. First Level Clock Gating is performed through clock enables in the CAR module.
- Power Gating
M-PHY modules must exit to prior Mode/Gear when exiting Hibernate state. During Hibernate (HB8) state M-PHY modules context can be saved if reset would be asserted in SC7 state and associated protocol controller saves its context during SC7. Upon exit from SC7 state, the context of M-PHY modules must be restored before initiating HB8 exit if context is saved. UFSHC and M- PHY are subject to reset during SC7 and software/BootROM perform cold boot initialization upon SC7 exit, i.e., no context is saved and restored.

