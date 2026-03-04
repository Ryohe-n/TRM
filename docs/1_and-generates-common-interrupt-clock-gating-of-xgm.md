# 1 and generates common interrupt. Clock gating of XGMAC RX CLK should be done in the MGBE wrapper. 3.

- AXI Low Power Interface Control
Programming guideline to second-level clock gate AXI clock: 1. 2. 3. Program MGBE_WRAP_AXI_LPI_CTRL_0.CSYSREQ to 1'b0 to enable AXI clock gating.
- Poll the MGBE_WRAP_AXI_LPI_CTRL_0.CSYSACK signal until it is 1'b0;
- Check the value of MGBE_WRAP_AXI_LPI_CTRL_0.CACTIVE if 1'b1 AXI low power request was
not accepted and clock was not gated. If 1'b0, request was accepted and AXI clock was gated internally.

10G Ethernet Programming Guidelines a.
- If CACTIVE was set to 1'b1 in step 3, software must program CSYSREQ to 1'b1 to exit the
Low power request before initiating another request.
- Programming Guidelines for XPCS Energy Efficient Ethernet (EEE)
- Programming Guidelines to Enable EEE Feature
To enable the Energy Efficient Ethernet (EEE) feature, the host should complete the following: Program various timers used in the EEE mode depending on the clk_eee_i clock frequency: 1. Program the following registers:
- VR_XS_PCS_EEE_MCTRL0
- VR_XS_PCS_EEE_TXTIMER
- VR_XS_PCS_EEE_RXTIMER
- - - Enable the EEE feature on the Tx path by setting Bit 0 of VR_XS_PCS_EEE_MCTRL0 Register.
- Similarly, enable the EEE feature on the Rx path by setting Bit 1 of VR_XS_PCS_EEE_MCTRL0
- Register. When these bits are set, DWC_xpcs enables the encoding or decoding of the LPI
code groups and also enables the EEE Tx and Rx controllers. 2. Notes: The clk_eee_i clock can be independent of Tx and Rx path clocks. It should be free running.
- DWC_xpcs has recovery time after it comes out of the LPI mode and before it is ready to
send the frames. The worst-case recovery time is equal to the following:
- Four Clocks of clk_eee_i period + 3 clocks of clk_xgmii_tx_i, clk_xgxs_i, or clk_rpcs_tx_i
(whichever is slower among these three clocks).
- DWC_xpcs supports 'Transparent LPI mode' in the Tx datapath. This mode can be enabled by
programming 'TRN_LPI' bit of VR XS or PCS MMD EEE Mode Control 1 Register or VR
- MII MMD EEE Mode Control 1 Register. In this mode, DWC_xpcs does not support any sort of
clock-gating. 1. 2. 3.
- Programming Guidelines for Configuring XPCS Tx in EEE State
Follow these steps to enable EEE mode in transmit direction:
- When XPCS detects LPI codewords from MAC, it drives “xpcs_lpitx_quiet_o” signal to 1
indicating that XPCS is in the EEE state.
- When this signal is asserted, UPHY TX can be put in low-power mode. Also, the XPCS clocks
can be clock gated. 1. 2. PLL can be turned off (requires around 40 µs to wake up). Transmitter logic can be put to sleep. a. b.
- Programming Guidelines for Configuring XPCS Rx in EEE State
The PCS receiver carries out following functions in EEE state:

10G Ethernet Programming Guidelines 1. When XPCS detects the LPI codewords, it carries out following operations. a.
- Drive “xpcs_lpirx_quiet_o” to 1
2.
- When this signal is asserted, PCS RX clocks can be clock gated. Also, some portion of UPHY
RX can be put into low-power mode. a.
- PLL can be turned off (but for this, both Tx and Rx must be Off). Since the PLL is shared
between all four ports, all four ports must be turned OFF. Therefore, turning PLL OFF will be difficult. But PLL can be put to sleep. The Rx logic in UPHY can be put to sleep. b. Software must program the following overrides to “0” for power savings (disable free running clocks). Default value is “1” (free running clocks ON). 1.
- PCS_WRAP_CLOCK_CNTL_0 -->“0”to disable free running clocks in UPHY, XGMII, and PCS for
Tx/Rx direction.
- The detailed programming guidelines for EEE feature in XPCS, refer to the "Programming
Guidelines for Energy-Efficient Ethernet" section.
- Programming Guidelines for IEEE 1588 Timestamping
- Initialization Guideline for System Time Generation
You can enable the timestamp feature by setting Bit 0 of the MAC_Timestamp_Control register. However, it is essential that the timestamp counter should be initialized after this bit is set. Complete the following steps during DWC_xgmac initialization:
- Mask the Timestamp Trigger interrupt by clearing the bit 12 of MAC_Interrupt_Enable
register. Set Bit 0 of MAC_Timestamp_Control register to enable timestamping. Program MAC_Sub_Second_Increment register based on the PTP clock frequency.
- You can use either the Coarse Correction Method or the Fine-Correction Method to update
the time.
- Program MAC_System_Time_Seconds_Update register and
MAC_System_Time_Nanoseconds_Update register with the appropriate time value.
- Set Bit 2 in MAC_Timestamp_Control register. The timestamp counter starts operation as
soon as it is initialized with the value written in the Timestamp Update registers. If one-step timestamping is enabled 1. 2. 3. 4. 5. 6. To enable one-step timestamping, program Bit 27 of the TDES3 Context Descriptor.
- Program registers MAC_Timestamp_Ingress_Asym_Corr and
- MAC_Timestamp_Egress_Asym_Corr to update the correction field in PDelay_Req PTP
messages. a. b. Enable the MAC receiver and transmitter for proper timestamping. 7. Note: If timestamp operation is disabled by clearing Bit 0 of MAC_Timestamp_Control register, you must repeat all these steps to restart the timestamp operation.

10G Ethernet Programming Guidelines
- Coarse Correction Method
To synchronize or update the system time in one process (coarse correction method), complete the following steps: 1.
- Set the offset (positive or negative) in the Timestamp Update registers
(MAC_System_Time_Seconds_Update and MAC_System_Time_Nanoseconds_Update).
- Set Bit 3 (TSUPDT) of the MAC_Timestamp_Control register. The value in the Timestamp
- Update registers is added to or subtracted from the system time when the TSUPDT bit is
cleared. To synchronize or update the system time to reduce system-time jitter (fine correction method), complete the following steps: 2. a.
- With the help of the algorithm explained in “System Time Register Module,” calculate the
rate by which you want to make the system time increments slower or faster.
- Update the MAC_Timestamp_Addend register with the new value and set Bit 5 of the
MAC_Timestamp_Control register. Wait for the time for which you want the new value of the Addend register to be active. You can do this by enabling the Timestamp Trigger interrupt after the system time reaches the target value.
- Program the required target time in MAC_PPS(#i)_Target_Time_Seconds Register and
MAC_PPS(#i)_Target_Time_Nanoseconds Register. Enable the Timestamp interrupt in bit 12 of MAC_Interrupt_Enable register. Set bit 4 in MAC_Timestamp_Control register. When this trigger causes an interrupt, read MAC_Interrupt_Status register. Reprogram MAC_Timestamp_Addend register with the old value and set bit 5 again. b. c. d. e. f. g. h.
- Fine-Correction Method
To synchronize or update the system time over a period of time (fine-correction method), complete the following steps: 1. 2. Program Bit 1 of MAC_Timestamp_Control register to select the Fine Update method.
- Program MAC_Timestamp_Addend register and set Bit 5 of MAC_Timestamp_Control
register. Poll the MAC_Timestamp_Control register until Bit 5 is cleared. 3.
- Programming Guidelines for TSO
1.
- Program TSE bit of corresponding DMA_CH(#i)_Tx_Control register to enable TCP packet
segmentation in that DMA. In addition to the normal transfer descriptor setting, the following descriptor fields must be programmed to enable TSO for the current packet: 2. a. b. Enable TSE in Bit 18 of TDES3.
- Program the length of the unsegmented TCP/IP packet payload in bits [17:0] of TDES3 and
the TCP header in bits [22:19] of TDES3. Program the maximum size of the segment in: c.

10G Ethernet Programming Guidelines i. MSS of DMA_CH(#i)_Control register (OR). MSS in the context descriptor.
- If MSS field is programmed in both DMA_CH(#i)_Control register and in the context
descriptor, the latest software-programmed sequence is considered. ii. 3.
- The header of the unsegmented TCP/IP packet should be in Buffer 1 of the first descriptor
and this buffer must not hold any payload bytes. The payload can be allocated starting from Buffer 2 of the first descriptor or any buffer of the subsequent descriptors.
- Programming Guidelines for L3/L4 Filtering
In DWC_xgmac, L3-L4 filter registers are implemented as indirect-addressed registers. Follow these steps to access these registers.
- Writing to the Indirect-Addressed Registers
1. 2. Write the data into the MAC_L3_L4_Data register.
- Program the following fields of the MAC_L3_L4_Address_Control register
a. b. Set the IDDR field to the required register-offset address of the L3-L4 filter register. Set the TT field to 0, to indicate write operation. 3. Write 1 to the XB field of MAC_L3_L4_Address_Control register. Wait until the XB bit is reset, before initiating the next write operation. This ensures that appropriate L3-L4 filter registers are programmed correctly. Note: IDDR[7:4] specifies the filter number; 0 for L3-L4 filter 0, 1 for L3-L4 filter 1, and so on. IDDR[3:0] specifies the filter register of a specific L3-L4 register, as follows: 0: MAC_L3_L4_Control#(i) 1: MAC_Layer4_Address#(i) 2-3: Reserved 4: MAC_Layer3_Addr0_Reg#(i) 5: MAC_Layer3_Addr1_Reg#(i) 6: MAC_Layer3_Addr2_Reg#(i) 7: MAC_Layer3_Addr3_Reg#(i) 8-15: Reserved
- Reading the Indirect-Addressed Registers
1. 2. Set the TT field to 1, to indicate read operation.
- Program the IDDR field of MAC_L3_L4_Address_Control register with the required L3-L4
filter register-offset address.
- Write 1 to the XB bit of MAC_L3_L4_Address_Control register and wait until the XB bit is
reset. 3.

10G Ethernet Programming Guidelines 4. After the XB bit is reset, read the MAC_L3_L4_Data register; it should have the content of the requested L3-L4 filter register.
- Programming Guidelines for Split Header on Receive
When split header support is enabled, the buffer 1 (RDES0) of the descriptors is used only for the header. Therefore, the DMA writes the header of the received packet in buffer 1 when FD bit of RDES3 is set. The payload of the received packet is directed to the buffer2 (RDES2). For subsequent descriptors (FD is set to 0), buffer1 is not used and the payload is written only to buffer 2. When the host enables split header structure by setting the SPH bit[24] of register DMA_CH(#i)_Control_register, the host must ensure that Buffer1 is always valid in all descriptors. This is done by creating Buffer1 and indicating this by providing a nonzero buffer1 address.
- Programming Guidelines for VLAN Filtering on Receive
1. Program the MAC_VLAN_Tag register for the following bit to select the filtering method: a. b. ETV: Enable 12-Bit VLAN Tag comparison or 16-bit VLAN Tag comparison. VTHM: VLAN Tag Hash Table Match Enable.
- ERIVLT: Enable inner VLAN Tag or outer VLAN Tag (to enable the inner or outer VLAN Tag
filtering, Double VLAN Processing should be enabled by setting EDVLP).
- ERSVLM: Enable Receive S-VLAN Match or C-VLAN match (for S-VLAN processing to be
enabled, set ESVL). DOVLTC: Ignores VLAN Type for Tag Match. VTIM: to enable VLAN Tag Inverse Match instead of the normal VLAN Tag matching. c. d. e. f. 2. 3. Program VL of MAC_VLAN_Tag register for the 12 bit or 16bit VLAN tag.
- If Hash filtering of VLAN tag is enabled, program MAC_VLAN_Hash_Table register. The upper
four bits of the calculated CRC are used to index the contents of the VLAN Hash table. For example, a hash value of 4’b1000 selects Bit 8 of the VLAN Hash table.
- Programming Guidelines for Extended VLAN Filtering and Routing on Receive
For the indirect access of the per VLAN Tag registers, follow these steps: Write: Write the required data into the MAC VLAN Tag data register. Program the VLAN Tag Control Register's OFS field with the required filter register's offset and command type to the CT field. For a write command, set this bit to 0.
- Write 1 to the OB field and wait until the OB bit is reset to do the next write. This
guarantees that the appropriate VLAN Tag Filter register has been programmed. Read:
- Program the VLAN Tag Control Register's OFS field with the required register's offset and
command type to the CT field. For a read command, set this bit to 1.

10G Ethernet Programming Guidelines Write 1 to the OB field and wait until the OB bit is reset. The appropriate VLAN Tag Filter register's value is available in the MAC VLAN Tag Data Register.
- Bus Error Handling
When EDMA feature is selected, any DMA Channel receiving an AXI Bus Error goes into a fatal state and stops functioning. After issuing the soft reset, software should wait until the completion of the soft reset. The software can identify the root cause of the error, fix the issue, and reinitialize or restart the enabled DMA channels when required.
- Transmit DMA Channel
On getting an AXI Error response, Tx DMA channel sets its Fatal Bus Error Interrupt Status (FBE bits of DMA_CH(#i)_Status register). Then it goes into ERROR state and terminates any ongoing packet transfer immediately and tags that packet to have CRC error. It also accepts and drops the rest of the packet or next packet scheduled for fetching from the system memory before the bus error event. It then goes into the STOP state after setting the DMA Stopped Interrupt status (TPS bits of DMA_CH(#i)_Status register). The sbd_intr_o is generated if the corresponding interrupts are enabled in the DMA_CH(#i)_Interrupt_Enable Register. Driver Flow for Tx DMA Channel Bus Error Recovery is as follows: 1. 2. 3. 4. Wait for FBE Interrupt (FBE bit of DMA_CH(#i)_Status register). Wait until the DMA is stopped (TPS bits of DMA_CH(#i)_Status register) Interrupt. Fix the root cause of the bus error.
- Service the FBE and TPS Interrupts and Clear those interrupts by writing DMA_CH(#i)_Status
register. Issue a soft reset by setting the SWR field of the DMA_Mode register and wait until the SWR field is cleared. Reconfigure the DMA new PBLs, New Ring Length. Program the New List Address. Start the DMA by setting ST of DMA_CH0_Tx_Control register. 5. 6. 7. 8. Note: Step 6 initiates the Descriptor list. DWC_xgmac ignores the descriptors that would have fetched before the bus error event.
- Receive DMA Channel
On getting an AXI Error response, Rx DMA channel sets its Fatal Bus Error Interrupt Status (FBE bits of DMA_CH(#i)_Status register), go into ERROR state and gracefully terminate any ongoing packet transfer immediately. It also accepts and drops the rest of the packet from MTL RxQ. It goes into the STOP state after setting the DMA Stopped Interrupt status (RPS bits of DMA_CH(#i)_Status register). The sbd_intr_o is generated if the corresponding interrupts are enabled in the DMA_CH(#i)_Interrupt_Enable register. Driver Flow for Rx DMA Channel Bus Error Recovery is as follows:

10G Ethernet Programming Guidelines 1. 2. 3. Wait for FBE Interrupt (FBE bit of DMA_CH(#i)_Status register). Wait until the DMA is stopped (RPS bits of DMA_CH(#i)_Status register) Interrupt.
- Program RPF (bit[31]) of the DMA_CH(#i)_Rx_Control register to prevent head-of-line
blocking. Instruct the DWC_xgmac to drop packets in any RxQ intended to this RxDMA. Channel in STOP/ERROR state. Fix the root cause of the bus error.
- Service the FBE and TPS/RPS Interrupts and Clear those interrupts by writing
DMA_CH(#i)_Status register. Issue a soft reset by setting the SWR field of the DMA_Mode register and wait until the SWR field is cleared. Reconfigure the DMA, new PBLs, and New Ring Length. Program the New List Address. Start the DMA by setting SR (bit[0]) of DMA_CH(#i)_Rx_Control. 4. 5. 6. 7. 8. 9. Note: Step 6 initiates the Descriptor list. DWC_xgmact ignores the descriptors that would have fetched before the bus error event.
- Programming Guidelines for VxLAN/NVGRE Tunneled Packets Processing
1.
- Set VNE (bit[24]) of MAC_Tx_Configuration register to enable DWC_xgmac to recognize and
process the tunneled packets.
- Select tunneling mode (VxLAN or NVGRE) by programming VNM (bit[25]) of
MAC_Tx_Configuration register.
- As per the selected tunneling mode, program the MAC_Tunnel_Identifier register to enable
- DWC_xgmac to recognize the VxLAN tunneled packets based on Outer Packet Header UDP
destination Port ID or NVGRE Tunneled Packets based on Protocol Type field. By default/ reset, this register contains the UDP Destination Port ID value of 0x12B5 (4789) as defined by IANA for VxLAN.
- Set VUCC and DNTU bits in the MAC_Packet_Filter register as per requirement for tunneled
packets.
- By default all received tunneled packets are directed to RxDMA Channel 0. To classify the
received packets and direct them to different RxDMA channels (in a multi-RxDMA channel configuration), there are two options: 2. 3. 4. 5. a.
- External lookup: Set ELEN (bit[30]) of MAC_Rx_Configuration register. The external lookup
engine provides the RxDMA channel based on the information (header fields) provided by the MAC receiver signals outputs.
- Internal lookup: Do not set ELEN but enable RSS hash lookup. Program the RSS LUT as
required. b. 6.
- Set SPH bit in DMA_CH(#i)_Control register to enable the DWC_xgmac to transfer the
outer+inner header and inner payload of received tunneled packets into separate buffers.
- To indicate a tunneled packet to TxDMA, set VNP field in corresponding TxDMA Descriptor
(TDES). 7.

10G Ethernet Programming Guidelines
- This enables TSO, TxCOE operations to be performed on tunneled packets during
transmission. The status/identification of tunneled packets are given in RxDMA Descriptor Status (RDES). 8.
- Programming Sequence for Queue/Channel-Based VLAN Inclusion Register
To enable this feature, set CBTI of MAC VLAN Include register. This bit must be set before any indirect access to the queue/channel-specific VLAN Include register. Note: Indirect VLAN include registers are not accessed while setting the CBTI bit.
- Indirect read/write access to the queue/channel-specific VLAN inclusion register is done
using the VLT, CSVL, ADDR, RDWR, and BUSY fields. Disable this feature by clearing CBTI bit. This operation does not initiate an indirect access to the queue/channel-specific VLAN inclusion registers. After it is disabled, program VLT and CSVL to the correct values as these two fields might have changed during the operation.
- Programming Guidelines for EST
- Program the gate control values and time intervals in the Software Owned Gate Control List
(SWOL) along with the other EST-related registers to appropriate values. The following subsections provide step-by-step details for programming the Gate Control List (GCL) and the other EST- related registers.
- Programming the GCL and GCL Linked Registers
- Follow these steps to program the Gate Control List (GCL) and the four other registers
implemented per GCL. 1.
- The GCL and the four other GCL-linked registers should be accessed through indirect
addressing using the MTL_EST_GCL_Control and MTL_EST_GCL_Data registers. The SWOL bit of the MTL_EST_Status register indicates if software owns GCL0 or GCL1.
- To program the GCL, write the 32-bit write data to MTL_EST_GCL_Data register. Then
program TL_EST_GCL_Control register to write the write address and other control information. In the MTL_EST_GCL_Data register, Write Data consists of up to 8 bits (configurable) of gate controls and up to 24 bits (configurable) of Time Interval. Gate Close is indicated by programming a '0' and Gate Open is indicated by programming a '1.' For a 4-TC and 20-bit Time Interval Configuration, the data width is 24-bits and the remaining 8-bits are reserved/ read-only. The data should be written in the following format. {8'h0, TC3, TC2, TC1, TC0, 20-bit Time Interval} where TCx = 0 or 1.
- MTL_EST_GCL_Control register: Program the SRWO bit to 1 (to start a Write Op) and
program the address and R/W fields appropriately.
- Poll and check for hardware clears the SRWO bit to indicate the completion of the previous
operation before initiating a new R/W operation through the same indirect addressing mode. Repeat steps 3, 4, 5 until the programming of the GCL is completed. 2. 3. 4. 5. 6.

10G Ethernet Programming Guidelines 7. Using the same indirect addressing method, program the BTR, CTR, TER and LLR registers. Set the GCRR bit in the MTL_EST_GCL_Control register appropriately. The GCRR bit interprets the address field as belonging to these registers (instead of the GCL). After programming of the GCL and the related registers, program the MTL_EST_Control register to let hardware own and process the GCL. When the List Length (as indicated in LLR) is 1, the associated Time Interval should be greater than the value of the Cycle Time Register. Otherwise, an error is reported as a single set of gate controls add no value in the TSN context. Note: The time unit in all the GCL-related registers is Seconds and Nanoseconds. In cases where internally generated PTP System Time is used, the nanoseconds field must be programmed to use the Digital Rollover mode. (TSCTRLSSR field of MAC_Timestamp_Control must be set to value '1').
- Programming the EST Registers
After completing the steps mentioned in Programming the GCL and GCL linked registers, program the MTL_EST_Control register. 1. Set the Current Time Offset Value and Time Internal Left Shift fields of the MTL_EST_Control register appropriately. Also, set the Enable EST (EEST) and Switch to SWOL (SWOL) bits.
- This enables the hardware to own and process the new GCL and make a switch to the new
GCL at the BTR value. The hardware provides an interrupt (if enabled) when the switch to the new list happens.
- Software takes appropriate action to address any other interrupts received during the
hardware execution of the GCL. 2. 3. Note: The CTOV recommendations for single-port RAM configurations are: 96 * Tx clock period, for 32- and 64-bit data width configurations. 128 * Tx clock period for 128-bit data width configurations. The CTOV recommendations for non-single-port RAM configurations are: 30 * Tx clock period, when SA/VLAN insertion is enabled. 22 * Tx clock period, when SA/VLAN insertion is not enabled. Set the SSWL (Switch to Software Owned List) bit in the MTL_EST_Control register to handoff to hardware. Software cannot write to the GCL and GCL linked registers when the SSWL bit is set, because the new GCL might be in use by the hardware. Hardware resets/clears the SSWL when it successfully switches to the new list. The hardware also flips the SWOL bit to indicate the new GCL that the software owns.
- To install a new GCL, program the GCL it owns (indicated by SWOL bit) as described in
Programming the GCL and GCL linked registers and then program the MTL_EST_Control register.
- Ensure that the new BTR is set to an appropriate value to avoid BTR Error that may
require software intervention in some cases. To avoid transmission overruns, the packet length

10G Ethernet Programming Guidelines (frame size) information should be available at all times. Therefore, in the DMA configurations, program the packet length in the first descriptor of every Tx frame. Similarly, in the MTL configuration, provide the packet length in the control word. Note: To avoid transmission overruns, the packet length provided in the transmit descriptor should account for the SA and VLAN insertion. If applicable, packet length should represent the actual packet length on the Ethernet line.
- Programming the Launch Time in Time-Based Scheduling
The Launch Time is programmed in the Context Transmit Descriptors in DMA configurations and is driven as a control word in MTL configurations as follows: The OSTC and Launch Time features are mutually exclusive. They should not be used together. In case of a conflict (if OSTC = LTV = 1 in MTL configuration), priority is given to OSTC and the Launch Time is ignored. In DMA configuration, if a context descriptor is received with a valid OSTC, TBSV, and LTV values, the Launch Time/GSN is ignored. Note: 1. For a proper TBS usage, the application should update the tail pointer after adding context as well as the first normal descriptor in the transmit ring. Use separate channel (without TBS enabled) for time-critical traffic. Mixing such traffic with TBS enabled traffic can cause delays in transmitting time-critical traffic. 2.
- Programming Guidelines for ECC Protection for Memories
Programming guidelines for the ECC protection for memories:
- Enable the ECC feature for the respective memory by setting the appropriate bit in
MTL_ECC_Control register. A correctable interrupt (sbd_sfty_ce_intr_o) or an unrecoverable interrupt (sbd_sfty_ue_intr_o) are generated to indicate to the application if any correctable/ uncorrectable/address errors are detected. Appropriate status is indicated in the DMA/ MTL_ECC_Interrupt_Status register. Debug mode is provided for each non-FRP memory to insert errors.
- For details of Flexible Receive Parser ECC Hardware Error Injection method, refer to the
section “Programming Guidelines for ECC Hardware Error Injection for Flexible Receive Parser
- Memory.”
Note: Enable the ECC feature before the traffic is online (or after the reset). Otherwise false interrupts might be triggered.
- Programming Guidelines for ECC Hardware Error Injection (Debug Mode)
Follow these steps for ECC Hardware Error Injection. This does not apply for Flexible Receive Parser Memory.

10G Ethernet Programming Guidelines
- Enable the ECC error injection feature for MTL TX/RX and DMA TSO, by setting the
appropriate bit in the MTL_DBG_CTL register. Enable the ECC error injection feature for the EST memory by setting the appropriate bit in the EST_GCL_Control register. In the debug mode, software should ensure that no traffic is present online.
- Where multiple CSR writes are required, for writing single data word into the memory, the
application should ensure that all the CSR writes corresponding to one memory write should have the same value for the error injection control word.
- Programming Guidelines for ECC Hardware Error Injection for Flexible Receive Parser Memory
Follow these steps for ECC hardware error injection for Flexible Receive parser Memory: 1. Enable the ECC error injection for Flexible Receive Parser memory by setting the appropriate bit in the MTL_RXP_Indirect_Acc_Control_Status register while reading instruction. To access Flexible Receive Parser memory in debug mode, disable the Flexible Receive Parser feature by setting the FRPE bit field of MTL_Operation_Mode register to 0. (Avoid error injection in the
- MSB, reserved bits.)
- DWC_xgmac can detect FRP ECC error without reading instruction from the application, in
the periodic ECC check mode. To enable this mode, 2. a. b. Set a nonzero value in the TMR field of the MAC_FSM_ACT_Timer register. Set a default value in the CTMR field of the MAC_FSM_ACT_Timer register. Enable TMOUTEN field of the MAC_FSM_Control register. c.
- For every tick generated, DWC_xgmac checks ECC from 0th instruction to the last-valid
instruction.
- Programming Guidelines for On-Chip Datapath Parity Protection
Follow these steps for on-chip datapath parity protection:
- Set the EDPP bit of MTL_DPP_Control register to enable the generation of parity and
detection of parity Mismatch on datapath. An odd parity generation/detection can be enabled by setting the OPE bit of MTL_DPP_control register; otherwise, by default, even- parity generation/detection is active. An unrecoverable interrupt (sbd_sfty_ue_intr_o) is generated to indicate to the application if any parity Mismatches are detected and the appropriate status is indicated in DMA/ MTL_Safety_Interrupt_status and MAC_DPP_FSM_Interrupt_Status register.
- Debug mode is supported for each parity generator, to insert error. Each parity checker
supports a control to inject parity error. When enabled, one programed (EIM/BLEI field of the MTL_DPP_ECC_EIC register) bit parity/data of the first valid data at the generators are flipped. Application must set the appropriate bit in the MTL_DPP_Control/DMA_DPP_Control register; after the respective parity/data bit is flipped the hardware clears the same. After the checker inserts error in the parity/data input, the checker should detect the mismatch and

10G Ethernet Programming Guidelines report the error status in the MAC_DPP_FSM_Interrupt_Status/DMA_DPP_Interrupt_Status register. Note: To avoid false safety interrupts, enable the datapath parity protection before the start of Rx or Tx traffic.
- Programming Guidelines for FSM Parity and Timeout
Follow these steps to program the FSM parity and timeout:
- Set the PRTYEN and TMOUTEN fields of MAC_FSM_Control register to enable the FSM parity
and timeout feature respectively. For parity error detection, force the FSMs to enter into a state with even number of 1s and wait for the safety-unrecoverable interrupt to be set with FSMPES of MAC_DPP_FSM_Interrupt_Status. For error injection mode in FSM parity, select the appropriate clock domain for which parity error injection should be set using the [23:16] bits of MAC_FSM_Control register. Wait for the safety-unrecoverable interrupt to be set with FSMPES of MAC_DPP_FSM_Interrupt_Status.
- For FSM timeouts, program the large and normal mode values indicated by LTMRMD and
NTMRMD of MAC_FSM_ACT_Timer register.
- Select large or normal mode tic generation per clock domain by using the [31:24] bits of
MAC_FSM_- Control Register.
- Set the TMR field of the MAC_ACT_Timer field with the appropriate number of CSR clock
cycles used to generate 1us tic. Force the FSM in a particular clock domain to be in an active state for timeout duration (for example, T-2T). Check for the safety interrupt and the status bit for the corresponding clock domain getting set in [15:8] bits of MAC_DPP_FSM_Interrupt_Status register.
- For error injection mode in FSM timeout, select the appropriate clock domain for which
timeout error injection must be set using the [15:8] bits of MAC_FSM_Control register. Wait for the safety-uncorrectable interrupt along with the corresponding error status set in MAC_DPP_FSM_Interrupt_Status. For application /CSR interface timeout, only normal mode tic generation is used. Based on the timeouts of configured interface, appropriate fields (MSTTES, SLVTES) of MAC_DPP_FSM_interrupt_Status is set along with the safety interrupt.
- Programming Guidelines for Flexible Receive Parser
Following are the programing guidelines for the Flexible Receive Parser. 1.
- Program NVE, NPE, and the required interrupts such as,
a. b.
- PDRFIE: Packet Drop due to RF Interrupt Enable
- FOOVIE - Frame Offset Overflow Interrupt Enable
- NPEOVIE - Number of Parsable Instructions Overflow Interrupt Enable
- NVEOVIE - Number of valid Instructions Overflow Interrupt Enable
c. d.

10G Ethernet Programming Guidelines 2. Program or build the Flexible Receive Parser Instruction Table, using the indirect register accessing.
- Enable Flexible Receive Parser
Set FRPE bit to 1, in the MTL_Operation_Mode register. Do not disable the L2 filtering when Flexible Receive Parser is enabled, though L2 filtering result has an effect on flexible receiver parser result. After setting FRPE bit to 1, optionally, software can wait until RXPI field of MTL_RXP_Control_Status register becomes 1 (active). Optionally, check the status of the Flexible Receive Parser for each frame in Receive normal descriptor (write-back format). 3. 4. 5.
- Single Indirect Read/Write Access
The following figure shows the flow chart for single indirect read/write access.
**Figure 10.134 Flow Chart of Single Indirect Read/Write Access**
- Continuous Indirect Read/Write Access
The following figure shows the flow chart for continuous indirect read/write access.

10G Ethernet Programming Guidelines
**Figure 10.135 Flow Chart of Continuous Indirect Read/Write Access**
Note: Byte wise Write/Read is not supported when Continuous Read/Write Mode is enabled.
- Indirect Flexible Receive Parser register does not support continuous indirect read/write
accessing.
##### 10.8.4.8.2 DWC_XPCS Programming Guidelines
##### 10.8.4.8.3 XPCS Initialization
Complete the following steps to initialize the DWC_xpcs controller: 1. 2. 3. 4. Switch on the power supply. Reset is asserted (pwr_on_rst_n=0). Wait for the required amount of time depending on the PHY requirements. De-assert reset (pwr_on_rst_n=1).
- For configurations with Multi-Protocol 12G/16G/25G PHY (with SRAM support in PHY
enabled), perform the steps mentioned in the following table.

10G Ethernet Programming Guidelines 5. Read the following registers and wait until the 15th bit of these registers is read as 0: a. b. SR_XS_PCS_CTRL1 (when not configured in Base1000-X Only configuration). SR_MII_CTRL Register (when configured in Base1000-X Only configuration). 6. Wait for the following register bit to be set to 1: a.
- RLU bit[2] of SR_XS_PCS_STS1 Register (When not configured in Base1000-X Only
configuration)
- LINK_STS of SR_MII_STS Register (When configured in Base1000-X Only configuration)
b. The DWC_xpcs core is now ready to transmit or receive data.
- Switching to USXGMII Mode
USXGMII Mode is based on BASE-R/KR PCS. The serial baud rate can be 10.3125 Gbps or 5.15625 Gbps or 2.578125 Gbps. Therefore, to operate in USXGMII mode, follow these steps: 1.
- Write 4'b0000 to bits[3:0] of SR_XS_PCS_CTRL2 register to switch DWC_xpcs to BASE-R
mode.
- Program bit[9] (USXG_EN) of VR_XS_PCS_DIG_CTRL1 register to 1 to enable USXGMII mode
inside DWC_xpcs.
- Select the appropriate USXGMII mode by programming USXG_MODE field of
VR_XS_PCS_KR_CTRL register to suitable values. Program the PHY to operate at 10.3125 Gbps/5.15625 Gbps/2.578125 Gbps.
- Initiate the vendor-specific software reset by writing 1’b1 to VR_RST bit[15] of
VR_XS_PCS_DIG_CTRL1 register. Wait for bit[15] (VR_RST) of VR_XS_PCS_DIG_CTRL1 register to get cleared.
- Duration of link timer can be changed (default setting corresponds to 1.6 ms) by
programming VR_MII_LINK_TIMER_CTRL Register suitably and by setting bit [3] of VR_MII_DIG_CTRL1 Register to 1.
- If DWC_xpcs is configured as PHY-side USXGMII, program SS5, SS6, and SS13 bits of
- SR_MII_CTRL Register to the desired speed mode. The value programmed to this register
gets advertised to the MAC during auto-negotiation. Enable Clause 37 auto-negotiation by programming bit [12] of SR_MII_CTRL Register to 1. (If interrupt has been enabled) After the completion of auto-negotiation, DWC_xpcs generates an interrupt on sbd_intr_o port.
- Read the auto-negotiation status register (VR_MII_AN_INTR_STS Register). Bit [0] is set to
indicate that auto-negotiation is complete. Bits [14:8] indicate the link-speed, duplex mode, EEE capability, and EEE clock-stop capability indicated by the link partner (PHY chip). Clear the Interrupt by writing 0 to bit [0] of VR_MII_AN_INTR_STS Register.
- Program SS13, SS6, and SS5 bits of SR_MII_CTRL Register to configure DWC_xpcs to the
- USXGMII speed mode (for port 0) indicated by PHY in step 12. The values programmed to
these bits will reflect in the output port xpcs_usxg_speed_o. This step is required only if DWC_xpcs is configured as MAC-side USXGMII. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13.

10G Ethernet Programming Guidelines 14. Wait for some time so that XGMII clocks (clk_xgmii_tx_i/clk_xgmii_rx_i/clk_xgmii_tx_p{1,2,3} _i/clk_xgmii_rx_p{1,2,3}_i) get stabilized at the desired frequencies.
- Program USRA_RST bit (bit [10]) of VR_XS_PCS_DIG_CTRL1 Register to 1 and wait for it to
get self-cleared. For multiport configurations, program the following bits too (and wait for it to get self-cleared). 15. a. b.
- USRA_RST bit of VR_MII_1_DIG_CTRL1 (for Port 1)
- USRA_RST bit of VR_MII_2_DIG_CTRL1 (for Port 2)
- USRA_RST bit of VR_MII_3_DIG_CTRL1 (for Port 3)
c. DWC_xpcs is now ready to operate in the desired USXGMII speed mode.
- MACsec Programming Guidelines
Refer to the "MACsec Programming Guidelines" section.
#### 10.8.4.9 Virtualization Programming Guidelines
The Virtualization register programming is the first step before exercising any other feature of the MGBE IP. 1.
- MGBE has 8x64 KB of address space allocated consecutively. This SoC has four MGBE
controllers. The detailed description of the address ranges for all four MGBEs can be found in the Address Map section of this TRM. Registers WRITE control: 2.
- RM: RM is a trusted software and unrestricted access for write and read of both core and
wrapper registers is provided. Guest OSes: i.
- Core registers: Read access is provided for all registers except the unassigned DMA
channel registers and read_to_clear (RC) registers. Write access is provided to only the
- DMA channel registers that are allocated for that Guest OS. Read and Write accesses are
configured through RM.
- Wrapper registers: Write and Read access is only provided to the RM-configured
respective registers. ii.
- MGBE_WRAP_VIRTUAL_INTR_CH[9:0]_CTRL_0
- MGBE_WRAP_VIRTUAL_INTR_CH[9:0]_STATUS_0
- MGBE_WRAP_VIRTUAL_INTR_DMA_GLOBAL_STATUS_0 ;;Read Access to All
3.
- Allocation of Channels (CHx) MGBE has support for 10 DMA Channels. Single DMA channel
can be allocated to at most one Guest OS by RM for security reasons. RM can allocate ownership of DMA channels to Guest OSes by programming the MGBE_WRAP_VIRTUAL_APB_CH<9:0>_DMA_CTRL_0 register.
- Illegal registers access
4. a.
- The APB4.0 bus has the capability to handle slave error signal. So, the MGBE IP generates
an error signal if there is an illegal register access. Important points:

10G Ethernet Programming Guidelines -
- RM boots up and sets up the MGBE_WRAP_VIRTUAL_APB_CH<9:0>_DMA_CTRL_0
register so that only assigned Guest OS (or RM) can access the channel.
- Hardware knows the access just from the register range. For example, if the request is
coming in RM register access page, it is assumed that HV has allocated this page only to RM.
- After range set up, if HV tries to access non-HV page registers, it is treated as illegal
access and an APB slave error is generated. Similarly, if RM or Guest OSes try to access HV page registers, it is treated as illegal access and an APB slave error is generated. If a Guest OS tries to access the CHx registers that is assigned to other Guest OS, then it is treated as a security issue and hence these are treated as errors.
- The RM can only control the APB slave error generation signal generated by programming
the MGBE_WRAP_VIRTUAL_APB_CH<9:0>_DMA_CTRL_0 and MGBE_WRAP_VIRTUAL_APB_ERR_CTRL_0 registers. During illegal register access, all writes to registers are dropped and all register reads are masked by returning value zero. - - - - - 5.
- Assigning Address Stream ID for all channels on AXI/Memory Interface
- Through MGBE_WRAP_VIRTUAL_AXI_ASID<2:0>_CTRL_0 register programming, only
Hypervisor can assign different address stream IDs for different channels. 6. Interrupt registers:
- Apart from MGBE_WRAP_VIRTUAL_INTR* wrapper registers, only RM can access all other
registers.
- MGBE_WRAP_VIRTUAL_INTR_CH[9:0]_CTRL_0 and
- MGBE_WRAP_VIRTUAL_INTR_CH[9:0]_STATUS_0 registers access can only be accessed
through the window to which it is allocated. So, the respective Guest OS can only clear its respective interrupts status register bit. 7. Steps to recover a DMA channel in an error condition without affecting other channels. a.
- Tx Recovery
i. Stop the Tx DMA (even when it is active state). Flush the corresponding MTL queue. Reprogram the DMA channel specific registers. Start the DMA channel. ii. iii. iv. b.
- Rx Recovery
i. Stop the Rx DMA.
- Set RPF bit so that all packets get flushed one after another (this would lead to packet
drops for that queue). Reprogram the DMA channel specific registers. Start the DMA channel. ii. iii. iv.

10G Ethernet Programming Guidelines
#### 10.8.4.10 Guidelines to Access PTP Registers from VMs
PTP Registers are from offset 0xd00 to 0xdff. Any VM can read these registers through MGBE VM5 AMAP page. All VMs, which require PTP register-read access can issue the read transactions with the base address: NV_ADDRESS_MAP_MGBE<i>_MAC_VM5_BASE, where i={0,1,2,3} is the MGBE instance number. Hardware issues a slave error for any write transactions to VM5 AMAP page. Hardware also issues a slave error for any read other than PTP read to VM5 AMAP page.
#### 10.8.4.11 Interrupt Processing
Interrupt can be generated as a result of various events in the DWC_xgmac. These events are captured in the status registers. Interrupt enables are provided for each source of interrupt such that the interrupt signal (sbd_intr_o) is asserted for an event only when the corresponding interrupt enable is set. When sbd_intr_o is asserted, the DMA_Interrupt_Status register is first level that indicates the major blocks for the interrupt event source. This register is read-only and it contains bits corresponding to each DMA channel (Tx and Rx pair), the MTL, and the MAC. The software application must then read one (or more) of the following registers corresponding to the bits that are set:
- DMA_CH(#i)_Status register
- MTL_Interrupt_Status register
- MAC_Interrupt_Status register
The sbd_intr_o interrupt is a level signal and gets de-asserted only when all the enabled interrupt events are cleared in their respective status registers and correspondingly all the bits in the DMA_Interrupt_Status register are cleared.
- The DMA_CH(#i)_Status register captures all the interrupt events of that TxDMA and RxDMA
channel pair. The DMA_CH(#i)_Interrupt_Enable register contains the corresponding enable bits for each of the interrupt event. There are two groups of interrupts in the DMA channel namely: Normal and Abnormal interrupts. They are indicated by Bits[15:14] of DMA_CH(#i)_Status register respectively. The normal group is for events that happen during the normal transfer of packets while the abnormal interrupt events are for error events. Interrupt events are cleared by writing 1’b1 to the corresponding bit position. When all the enabled interrupt events are cleared (including the NIS and AIS), the interrupt source from the DMA Channel is cleared and the corresponding bit in DMA_Interrupt_Status register is also cleared. Interrupts are not queued. If the same interrupt event occurs again before the driver responds to the previous one, no additional interrupts are generated. For example, Receive Interrupt Bit[6] of the DMA_CH(#i)_Status register indicates that one or more packets were transferred to the application buffer. The driver must scan all descriptors, from the last-recorded position to the first one, owned by the DMA to determine how many packets are received.

10G Ethernet Programming Guidelines An interrupt is generated once for multiple events. The driver must scan the DMA_Interrupt_Status register for the cause of the interrupt and clear the source in the respective Status register. The sbd_intr_o is cleared only when all the bits of DMA_Interrupt_Status register are cleared.
- Periodic Scheduling of Transmit and Receive Interrupt
It is not preferable to generate interrupts for every packet transferred by DMA (RI and TI) for system throughput performance reasons. The DWC_xgmac gives the flexibility to schedule the interrupt at regular intervals using two methods: 1. Set Interrupt on Completion bit in transmit descriptor (TDES2[31]) once for every “required” number of packets to be transmitted. Similarly, set the IOC (RDES3[30]) bit only at some specific intervals of Receive descriptors.
- This way, whenever a received packet transfer to system memory is complete and any of the
descriptors used for that packet transfer has the IOC bit set, only then the RI event is generated. 2. In addition, an interrupt timer (DMA_CH(#i)_Rx_Interrupt_Watchdog_Timer) is given for flexible control and periodic scheduling of Receive Interrupt as described: 1.
- Rx Interrupt Watchdog Timer based on number of application clock cycles: When the RWT
field of DMA_CH(#i)_Rx_Interrupt_Watchdog_Timer is programmed with a nonzero value, interrupt timer gets activated as soon as the Rx DMA completes a transfer of a received packet to system memory without asserting the Receive Interrupt because the corresponding interrupt of completion IOC bit (RDES3[30]) is not set. When this timer runs out as per the programmed value, the RI bit is set. The interrupt is asserted if the corresponding RIE is enabled in DMA_CH(#i)_Interrupt_Enable register. The 2-bit RWTU field in the same register selects the granularity of RWT (8-bit) field. The granularity can be programmed to 256, 512, 1024, or 2048 clock cycles, giving a maximum range of 522240 (= 255*2048) application clock cycles.
- Rx Interrupt Watchdog Timer based on number of transferred bytes: When the RBCT field is
programmed with a nonzero value, the interrupt timer accumulates the packet size in bytes (extracted from the received packet status) beginning with the packet for which the RxDMA does not assert the Receive Interrupt because the corresponding interrupt of completion IOC bit (RDES3[30]) is not set. When the accumulated bytes equal or exceed the programmed value, the RI bit is set. The interrupt is asserted if the corresponding RIE is enabled in the
- DMA_CH(#i)_Interrupt_Enable register. The active range of the RBCT field in
- DMA_CH(#i)_Rx_Interrupt_Watchdog_Timer register is 1 to 1023. The granularity is 1 KB,
which gives a maximum threshold of 1023 KB for the interrupt timer. 2. Both the interrupt timers are stopped and cleared, if the RI is set for a packet transfer whose descriptor's IOC was set or due to expiry of any one of the interrupt timers. The timer is reactivated automatically after the next packet transfer is complete for which the RI event is not generated.

10G Ethernet Programming Guidelines
##### 10.8.4.11.1 Per Channel Transfer Complete Interrupt
The Transmit Transfer complete interrupt (TI) and Receive Transfer complete interrupt (RI) are reflected in DMA_CH(#i)_Status register. The TI bit is set whenever the Tx DMA channel closes a descriptor in which the IOC (Interrupt On Completion - TDES2[30]) bit is set. Similarly, the RI bit is set whenever the Rx DMA channel closes the descriptor with the LD bit set. In any of the descriptors used for transferring that packet, IOC (Interrupt Enable on completion - RDES3[30]) bit is set. The common sbd_intr_o output signal is asserted for the transfer complete interrupts only when the corresponding interrupts are enabled in DMA_CH(#i)_Interrupt_Enable register. The XGMAC also supports the following the Per Channel Transfer Complete interrupt signals. sbd_perch_tx_intr_o[] (Transmit Per Channel Interrupts) sbd_perch_rx_intr_o[] (Receive Per Channel Interrupts) The behavior of the RI/TI/ sbd_perch_tx_intr_o[]/sbd_perch_rx_intr_o[] changes depending on the settings of INTM field bit[13:12] in DMA_Mode register.
#### 10.8.4.12 VM Interrupt Handling Guidelines
1.
- Read MGBE_WRAP_VIRTUAL_INTR_DMA_GLOBAL_STATUS_0 register to find out the DMA
channel details (channel #, TX/RX) that is causing the interrupt. Refer to the section "Interrupt Processing" for handling and clearing the interrupt from the respective DMA channel.
- Clear the wrapper status register MGBE_WRAP_VIRTUAL_INTR_CH<#i>_STATUS_0 to de-
assert the VM interrupt. 2. 3.
#### 10.8.4.13 mgbe_common_intr_o Handling Guidelines
1.
- MGBE_WRAP_COMMON_INTR_ENABLE_0 and PCS_WRAP_INTERRUPT_CONTROL_0 registers
store information about which signals (interrupts and faults) are enabled to propagate on the mgbe_common_intr_o line. a. pcs_intr_o will be OR'd with mgbe_intr_o and generate mgbe_common_intr_o. 2.
- Read Status Registers
a.
- Read the MGBE_WRAP_COMMON_INTR_STATUS_0 register to find out the exact signals
that contributed to mgbe_intr_o assertion (out of the enabled signals found in step 1).
- Read the PCS_WRAP_INTERRUPT_STATUS_0 register to find out the exact signals that
contributed to pcs_intr_o assertion (out of the enabled signals found in step 1). b. 3.
- Handling Interrupts
a. If MGBE_WRAP_COMMON_INTR_STATUS_0.MAC_SBD_INTR field is 1. i. Common interrupt is due to sbd_intr of XGMAC.

10G Ethernet Programming Guidelines ii. Handle the XGMAC interrupt as per the "Interrupt Processing" section.
- Clear the MAC_SBD_INTR field in MGBE_WRAP_COMMON_INTR_STATUS_0 register
(Write 1 to clear). This de-asserts the common interrupt line (if there is no other bit set to 1 in the preceding status register). iii. b.
- If PCS_WRAP_INTERRUPT_STATUS_0. PCS_SBD_INTR_STS field is 1. It should be masked
off for "s" since autonegotiation is not supported. 4.
- Reset Interrupt
a.
- If the following fields are set to 1, clear the corresponding bit in
- MGBE_WRAP_COMMON_INTR_STATUS register (write 1 to clear). This de-asserts the
mgbe_intr_o line. (If there is no other bit set to 1 in the status register) i.
- MGBE_WRAP_COMMON_INTR_STATUS_0.MAC_CORE_UNCORRECTABLE_ERR
- MGBE_WRAP_COMMON_INTR_STATUS_0.MAC_CORE_CORRECTABLE_ERR
- MGBE_WRAP_COMMON_INTR_STATUS_0.MAC_REGISTER_PARITY_ERR
ii. iii. b.
- If the following fields are set to 1, clear the corresponding bit in
- PCS_WRAP_INTERRUPT_STATUS_0 register (write 1 to clear). This de-asserts the
pcs_intr_o line. (If there is no other bit set to 1 in the status register) i.
- PCS_WRAP_INTERRUPT_STATUS_0.PCS_CORE_UNCORRECTABLE_ERR
- PCS_WRAP_INTERRUPT_STATUS_0.PCS_CORE_CORRECTABLE_ERR
- PCS_WRAP_INTERRUPT_STATUS_0.PCS_REGISTER_PARITY_ERR
ii. iii. c. If both mgbe_intr_o and pcs_intr_o are cleared, then mgbe_common_intr_o will be cleared.
#### 10.8.4.14 Blocking Access to CRC Configuration Bits in XGMAC
At the receive side, packets, which violate the MACsec security protocol are corrupted and sent to MAC with incorrect CRC. MAC must drop all such packets. But XGMAC has the CRC Configuration bits with which even incorrect CRC Packets can be taken into the system.
- MAC_Rx_Configuration.DCRCC
;; Disables CRC check
- MTL_RxQ(#i)_Operation_Mode (for i = 0; i <= min(7,DWCXG_NUM_RXQ-1)).RSF
;;Queue is in cut-through mode and [ i = {0,1,2,…9} = Receive queue number]
- MTL_RxQ(#i)_Operation_Mode (for i = 0; i <= min(7,DWCXG_NUM_RXQ-1)).FEP
;; Forward error packets and [ i = {0,1,2,…9} = Receive queue number]
- These register configuration bits must be blocked from software access to ensure that
MACsec rejected packets are dropped in MAC. It is implemented using the Lock control bits in MACsec TrustZone space as shown in the following diagram.
- MACSEC_MAC_CONTROL_0.DCRCC_LOCK --> 1

10G Ethernet Programming Guidelines access control bit in MACsec
- MACSEC_MAC_CONTROL_0.RxQ_FEP_LOCK --> 1
access control bit in MACsec for all 10 queues
- MACSEC_MAC_CONTROL_0.RSF_LOCK --> 1
access control bit in MACsec for all 10 queues. The default value for Locks is “1.” There are two modes of operation: 1. 2. Unsecured: TrustZone always unlocks these bits; any value from software can be written. Secured: TrustZone always keeps these bits locked; only "secure” values can be written. When Lock is applied, normal XGMAC driver cannot update these values from the "normal" world.
**Figure 10.136 Blocking Access to CRC Configuration Bits in XGMAC**

10G Ethernet Programming Guidelines The preceding Lock Control bits are available only in TrustZone, when TrustZone is active based on macsec_hw_tz_check fuse. During the bring-up phase, the RM can access these LOCK bits when the fuse is not blown. RM programs them to “0” and then update the value of DCRC, FEP, and RSF bits to their desired value. When the macsec_hw_tz_check fuse is blown, the TrustZone software only can set or reset these Lock bits.
#### 10.8.4.15 Software Programming Guidelines
Software should program the cycle time greater than the first-time interval in GCL for proper functioning of Qbv. If the cycle time is programmed less than the first-time interval in the GCL list, traffics from all the queues are transmitted irrespective of Gate Open/Close state.
- This case falls under Constant Gate Control Error and all gates are deemed to be in open
state when such error occurs. But, IEEE 802.1Qbv did not put any restriction on this case. As per the specification, Gate Control List(GCL) should be truncated in the first-time interval itself and all the gates should remain in the same state as given for first-time interval in GCL. Software should program the following bit In XGMAC register to enable this interrupt.
- Software should use TSO feature by disabling write to the external TSO memory. (for
example, by setting TMWD bit to 1 in TDES2 Descriptor). The default mode for TSO is TSO without external memory. The MSS field can be programmed within the limits: Max MSS: MSS+header equal to half the programmed Tx Queue size.
- The header length plus the MSS size (which is equal to the size of each TCP segment)
must not exceed 16383. i. ii. Min MSS: i. Configured value should be greater than configured data width in bytes. Recommended to use 64 B. ii.
- Program MTL_RxQ<i>_Operation_Mode.RSF bit to 1 when <i>th queue is configured a a
preemptable queue.
- The reside Queue (RQ) field (of MAC_RxQ_Ctrl1 register) should always be programmed with
a nonzero value as Q0 is the default queue for express packets. Also refer to MGBE_DWCXG_MTL_MTL_FPE_CTRL_STS_0.PFE for Preemption Enable behavior. Identify which descriptor was sent successfully without any error in TX direction. Software requires this info for retransmission in case some error is detected in transmit direction. Unsuccessful transmit status is communicated using the MAC_Rx_Tx_Status register.
- Safety interrupts are routed to HSM module by default. They are also routed as common
interrupt to LIC module when enabled. The following register should be programmed for this functionality MGBE_WRAP_COMMON_INTR_ENABLE_0.
- Four MGBEs and one ETHER_QOS module generates the PTP timestamp. Pick one of the
- PTP timestamps and send it to APE module. Program

10G Ethernet Registers
- MISCREG_PADCTLREG_APE_PTP_CLK_MUX_SEL_0 to select the PTP timestamp to be used
in APE module.
- These modes are enabled by following PCS as per the section "Switching to USXGMII
Mode". Also, the MAC clocks should be set accordingly by programming the CAR registers. Based on platform use-case, BPMP firmware can configure MGBE AXI WR port as ISO port.
- Rx runt packets get counted as part of the Rx-Parser Accept Counter
[DMA_CH(#i)_RXP_Accept_Cnt.RXPAC] if it matches the instruction criteria. This happens because by the time parsing has started, it is not known that the packet will be a runt. This occurs in 10G MAC. Because 10 G is high speed and the parser must work at line rate, this is acceptable. Note: The RXPAC field description mentions runt packets.

