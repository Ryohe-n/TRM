# 3. Boot and Power Management

## 3.5 symbol
4 symbol
- Latency from RXP/RXN to
RX_DATA.
- TDATAEN-DATAREADY
- DATA_EN inactive to
- DATA_READY inactive
50 ns
- Allow internal pipelined data
to be sent.
- TDATAREADY-SLEEP
- DATA_READY inactive to
- SLEEP active
50 ns
- Transmitter driver clock
disabled.
- TSLEEP-IDDQ
- SLEEP active to IDDQ active
200 ns
- Allow internal bias to power
down.
- Note: The sequence shows a single edge for SLEEP, DATA_READY, and DATA_EN events but these
events should be staggered across lanes.
- Table 10.39 Power Down Timing: Lane
- Symbo
l
- Parameter
- Min
- Ma
x
- Notes
- Minimum
- SLEEP active
time. 1 µs
- Minimum time hold time between stopping a power down sequence and
starting a power up sequence.
- TSLEEP-
- MIN
- Exit event to
data active time. ns
- Defines the time allocated to power up the lanes and prepared them for
sending and receiving data. Measured from the start of an exit request to where TX/RX are permitted to move into a data active state.
- TEXIT-
- DATAEN
**Figure 10.75 Lane Power Down Sequence**
- Staggering
In order to minimize power transients, it is required to stagger that the SLEEP, DATA_READY, and DATA_EN events across the lanes in the link. The staggering sequence is composed of the delta between events and the step between lanes for each event.

10G Ethernet Controller Functional Description
**Figure 10.76 Power Up Sequence: Lane Staggering**
- Table 10.40 Stagger Timing: Lane
- Symbol
- Parameter
- Mi
n
- Def
- Max
- Notes
- TSLEEP-
- STEP
- SLEEP step time
between lanes. ns 35 ns 500 ns
- Wait time between lanes. Programmed through
- PCS_WRAP_UPHY_TX_CONTROL_1_0 and
PCS_WRAP_UPHY_RX_CONTROL_1_0 registers. T
- DATAREADY-
- STEP
- DATA_READY step
time between lanes. ns 35 ns 500 ns
- Wait time between lanes. Programmed through
- PCS_WRAP_UPHY_TX_CONTROL_2_0 and
PCS_WRAP_UPHY_RX_CONTROL_2_0 registers.

10G Ethernet Controller Functional Description
- Symbol
- Parameter
- Mi
n
- Def
- Max
- Notes
- TDATAEN-
- STEP
- DATA_EN step time
between lanes. ns 35 ns 500 ns
- Wait time between lanes. Programmed through
- PCS_WRAP_UPHY_TX_CONTROL_3_0 and
PCS_WRAP_UPHY_RX_CONTROL_3_0 registers.
- Rate Controls
The lanes have several controls that are used to configure the lane for operation at each target speed including: the serial interface speed the width of the parallel interface used to transfer data between the pad the core logic, and other electrical settings
- The PLL generates a common clock and the “TX_RATE_ID” signals are used to select the lane
configuration for the desired serial frequency of operation. The following two registers per MGBE port are used for this operation. CLK_RST_CONTROLLER_GBE_UPHY_MGBE0/1/2/3_CLK_CTRL_0.
- GBE_UPHY_MGBE0_TX_CLK_DIV_RATIO; Divide by [N+1]: Divider ratio selection
CLK_RST_CONTROLLER_GBE_UPHY_MGBE0/1/2/3_CLK_CTRL_0.
- GBE_UPHY_MGBE0_TX_CLK_ENABLE
