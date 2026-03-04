# 128 clock cycles (for XGMII). If the MAC is in RX LPI mode and the RX clock is stopped by PHY, the application should not write to CSR registers that are synchronized to RX clock domain.

- LPI Timers
The transmitter maintains the following timers that are loaded with the respective values from MAC_LPI_Timers_Control and MAC_LPI_Auto_Entry_Timer registers:
- LPI LS TIMER
The LPI LS TIMER counts, in milliseconds, the time expired since the link status is UP. This timer is cleared every time the link goes down and is incremented when the link is UP.
- The XGMAC-CORE does not drive the LPI pattern unless the terminal count, programmed by
the software, is reached. This ensures a minimum time during which no LPI pattern is driven after a link is established with the remote station. This period is defined as 1 second in the IEEE standard 802.3-az, version 2.0. The LPI LS TIMER is 10-bit wide. Therefore, the software can program up to 1023 milliseconds.
- LPI TW TIMER
- The LPI TW TIMER counts, in microseconds, the time expired since the de-assertion of
- Transmit LPI. The MAC can resume the normal transmit operation after the Transmit TW
time. The software programs the Transmit TW time based on auto-negotiation. The MAC supports the LPI TW TIMER in units of microsecond. The LPI TW TIMER is 16-bit wide. Therefore, the software can program up to 65535 us.
- LPI AUTO ENTRY TIMER
- This timer counts in steps of eight microseconds, the time for which the MAC transmit path
has to remain in idle state (no activity), before the MAC Transmitter enters the LPI IDLE state and starts transmitting the LPI pattern. This timer is enabled when LPIATE bit in Optional FeaturesMAC_LPI_Control_Status register is set.

10G Ethernet Controller Functional Description
- Power-Down Mode Support
The LPI mode (low power mode) and power-down mode features are implemented independently in DWC_xgmac. However, the MAC can go to the power-down mode when it is in the LPI mode. Similarly, the MAC can go to the LPI mode when it is in the power-down mode. This section describes the power-down and power-up sequence for the following sections: "Power-Down Support when MAC in RX LPI Mode” “Rx LPI Support when MAC is in Power-Down Mode”
- When the DWC_xgmac is in the low-power and power-down mode, the link partner should come
out of the low-power mode before it sends any packets to wake up DWC_xgmac.
- When the DWC_xgmac is in the power-down mode, it cannot enter the TX LPI mode as the
bit 16 (LPI Enable) of the LPI Control and Status Register is in power-off domain.
- When the DWC_xgmac is in TX LPI mode, the MAC can enter the power-down mode if the
Receiver is not in the Rx LPI state. If the Receiver is in Rx LPI state, the power-down support is as explained in the section below.
- Power-Down Support When MAC in RX LPI Mode
- When the MAC is in the Rx LPI mode but not in the power-down mode, you cannot perform any
write operation on the MAC_PMT_Control_Status. If the MAC enters the power-down mode when it is already in the Rx LPI mode, it waits for the Rx Exit Interrupt to update the PMT Control and Status Register. This is because the Rx clocks may not be available during Rx LPI Mode. When PHY receives the LPI pattern, it can disable the receive clock after 128 cycles and go into the
- LPI mode on the receive side. The application can program the bit 16 (LPITXEN) of
- MAC_LPI_Control_Status to make the PHY enter the LPI mode on the transmit side. The MAC
starts sending the LPI pattern after completing the current frame transmission. When the transmit side is in the LPI mode, the transmit clock can be gated after sbd_tx_clk_gating_ctrl_o is asserted. To save more power, the application can make the DWC_xgmac to go to the power-down mode. However, to make the DWC_xgmac to go to the power-down mode, the application must have programmed the PMT Control and Status Register. The following sections describe the power-down and power-up sequence when the MAC is in the Rx LPI mode: “Power-Down Sequence” “Power-Up Sequence”
- Power-Down Sequence
Note: The power-down support (with UPF flow) with LPI is not supported in this release. The following list describes the power-down sequence: 1. The software should set the bit 0 (PWRDWN) of the MAC_PMT_Control_Status.

10G Ethernet Controller Functional Description 2. The PMC should perform the following tasks: a. b. Wait for the assertion of the sbd_pwr_down_ack_o signal. Assert the pwr_clamp_ctrl_i signal to clamp the voltages of the isolation cells.
- Assert the pwr_down_ctrl_i signal to shut down the power to the blocks in the power-off
hierarchy. c.
- Power-Up Sequence
The PHY comes out of the LPI mode by enabling the receive clock and sending the normal idle pattern instead of the LPI pattern. The following list describes the power-up sequence: 1. The MAC asserts the lpi_intr_o signal. At this stage, the Power Management controller can do either of the following: a. b. Wait for the remote wake-up frame to be detected. (Described in Step 2). Initiate the DWC_xgmac to come out of power-down mode (Described in Step 3). 2. 3. The MAC assert the pmt_intr_o signal on receiving the remote wake-up packet. The Power Management Controller should perform the following tasks: a.
- De-assert the pwr_down_ctrl_i signal to enable power to the blocks in the power-OFF
hierarchy. Assert resets to ensure that all registers, in the blocks that were shutdown, are reset. De-assert the resets. De-assert the pwr_clamp_ctrl_i signal. b. c. d. 4. The software should perform the following tasks: a. b. De-assert the pmt_intr_o by reading the MAC_PMT_Control_Status register.
- Perform a write operation (with reset values) to the MAC_PMT_Control_Status register and
the MAC_RWK_Packet_Filter register (if present) so that the corresponding values in the always-on block get synchronized. Otherwise, the values of these registers are different.
- Perform write operations to the MAC_Rx_Configuration, MAC_Address0_Highand
- MAC_Address0_Low registers to synchronize the values in the CSR module and the
respective bits in the always-on block. Otherwise, the MAC receiver is ON even though the Receiver Enable bit is set to 0. c. After completing these steps, the software must initialize all registers, enable the transmitter, and program the DMA (in XGMAC-AXI configuration) to resume the normal operation.
- Rx LPI Support When MAC is in Power-Down Mode
In the power-down mode, a part of the receive block (including the Rx LPI) is in the always ON state. The PHY is operational to receive the magic packet or remote wake-up frames. If the PHY and Link Partner support LPI, then the PHY may assert the LPI pattern by performing the steps described in the section “Receive Path Functions”. At this stage, the PHY can remove the Rx clocks. When the MAC is already in the power-down mode and it receives the Rx LPI patterns, it does not generate the Rx LPI entry Interrupt. This is because the CSR module is in the power-off domain.

10G Ethernet Controller Functional Description However, the MAC generates the Rx LPI Exit Interrupt. The power-up sequence is similar to as described in the section “Power-Up Sequence”.
- Clock Gating During EEE Operation
If EEE mode is enabled, XGMAC Tx clock and XGMAC Rx clock can be clock gated as shown in below diagram. This saves power in Tx and Rx paths during LPI mode.
**Figure 10.124 Clock Gating During EEE Operation**
Clock gating for PCS is illustrated in the figure below.

10G Ethernet Controller Functional Description
**Figure 10.125 Clock Scheme for PCS-R Only Configurations (with USXGMII)**

10G Ethernet Programming Guidelines
- UPHY Low Power Setting in EEE Mode
- UPHY Tx low power mode
- UPHY Tx is programmed to be in low power mode during EEE operation by following the
steps defined in the section "Transmit Path Functions". In this mode, DATA_EN is de-asserted and SLEEP asserted to UPHY.
- UPHY Rx low power mode
- UPHY Rx is programmed to be in low power mode during EEE operation by following the
steps defined in the section "Receive Path Functions". Only DATA_EN is de-asserted to UPHY in this mode.
- Wake on Lan (WOL)
The Wake on LAN (WOL) feature is supported by external PHY in platforms, which require this functionality. The External PHY communicates Wake on LAN Status to SoC through GPIO_PHY_INT pin specified in the "MGBE Clocks not derived from UPHY" table.
##### 10.8.3.10.4 Cold/Warm Boot
The MGBE port bring-up sequence should be the same during cold or warm boot.

