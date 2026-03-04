# 1588 -2002 supports PTP transported over UDP/IP and IEEE 1588-2008 supports PTP transported over Ethernet. The MGBE provides programmable support for both standards. The controller supports the following features: Provides an option to take snapshot of all packets or only PTP type packets. Provides an option to select the node to be a master or slave.

- Identifies the PTP message type, version, and PTP payload in packets sent directly over
Ethernet and sends the status. Provides an option to measure sub-second time in digital or binary format. Supports both one-step and two-step PTP Timestamping. Provides the flexibility to program the start or stop time, width, and interval of the pulse generated on the ptp_pps_o output. Provides capability to generate PTP Ethernet messages periodically or from the application or based on reception of a particular PTP message.
##### 10.8.3.8.5 Multiple Channels and Queues
The MGBE supports up to ten queues and channels on Tx and Rx paths. The following figure shows the architecture of MGBE with multiple queues and channels. The Tx queue and Rx queue should be 2 * maximum packet size.

10G Ethernet Controller Functional Description
**Figure 10.112 Multiple Channels and Queues**
In the Transmit direction, the MGBE supports up to ten Transmit DMA and Transmit queues. The number of Tx DMA channels is equal to the number of Tx queues, and is direct one-to-one mapping. This enables the interleaving of packet/data transfer of multiple Tx DMA on the host/ system bus and each Tx Queue is reserved for the corresponding Tx DMA. Therefore, the integrity of packet transfer by each Tx DMA is maintained in the Tx queue and enables efficient utilization of the host bus for data transfers among multiple Tx DMA without depending on the packet length, Transmit Buffer availability and so on. In the receive direction, The MGBE controller provides multiple Rx queues to support classification and distribution of ingress packets. The MAC receiver pushes the ingress packets to the Rx queues based on packet type (tagged, untagged, multicast, PTP, AVB, DCB, and so on), tag priorities, MAC packet filter results, preemptable, or express packet, and so on. The distribution is controlled by the settings of the MAC_RxQ_Ctrl* and MAC_Packet_Filter register fields. The packets from any Rx

10G Ethernet Controller Functional Description queue can be serviced by any of the Rx DMA. As all the packets of Rx Queues are stored in a shared
- RXFIFO buffer in MTL, the Rx scheduler selects the Rx queue whose packet data is to be
transferred to the destination Rx DMA, which then forwards the packet data to the host memory.
- The DMA arbiter performs the fixed priority arbitration between the Tx and Rx paths of DMA
channels for accessing descriptors and data buffers. Descriptor accesses of a Tx or Rx channel is given higher priority when requests from both are active together. The Weighted Round Robin arbitration is supported for Transmit DMA channel read access to AXI
- Read Data Channel. The weights corresponding to each Transmit DMA Channel is programmed in
the indirect registers using the DMA_CH_Ind_Control and DMA_CH_Ind_Data registers. The default weights in the indirect register correspond to Round Robin arbitration.
##### 10.8.3.8.6 Traffic Shapers
- Queue Modes and Priorities
- Transmit Direction
Transmit queues can be divided into generic, DCB, and AV traffic types.
- Generic queues are serviced in WRR (Weighted Round Robin) or WSP (Weighted Strict
Priority) order. DCB queues are serviced in WRR, WSP, DWRR, WFQ order. AV queues are serviced using CBS (Credit Based Shaper) or SP (Strict priority). In the strict priority algorithm, Traffic Class 0 has the lowest priority, and the priority increases with the Traffic Class number. For example, in a four-TC configuration, TC3 has the highest priority, followed by TC2, TC1, and finally TC0. The highest priority Traffic Class is serviced first. If there is no packet in the highest priority Traffic Class, then the next priority Traffic Class is serviced. The following register settings are used to control transmit queue operation.
- MTL_TxQ(#i)_Operation_Mode (for i = 0; i <= min(7,DWCXG_NUM_TXQ-1)) provides Queue to
TC Mapping.
- MTL_TC(#i)_ETS_Control (for i = 0; i <= DWCXG_NUM_TC-1) provides TC to “Transmit
- Selection Algorithm” per TC (SP, CBS, ETS)
- User can program the bandwidth required for each traffic class by programming the
MTL_TCn_Quantum_Weight register corresponding to a traffic class. 1. 2. 3.
- For PFC Handling, TC to Priority mapping is provided by programming TL_TC_Prty_Map0 and
- TL_TC_Prty_Map1 registers. The controller uses the programmed priorities for blocking the
transmit queue when a PFC packet is received. If multiple priorities are assigned to a traffic class, PFC is enabled, and one or more priorities assigned to a traffic class are paused, then all queues in

10G Ethernet Controller Functional Description the traffic class are paused. Similarly the same priority can be assigned to more than one Traffic Class. In this case, all the Traffic Classes with that priority are paused when that priority is paused. The software should put packets with correct priorities in the respective programmed queue on Tx side. The MAC uses the programmed priorities for blocking the Tx queues when a PFC packet is received. If a single queue is selected for multiple priorities and PFC is enabled, the entire queue is paused if one or more priorities in the queue are paused.
- Receive Direction
You can enable or disable a Rx Queue by programming the RXQ#EN field of corresponding queue in the MAC_RxQ_Ctrl0 register. The following list explains how Rx queues are enabled based on the selected features: 1. 2. Received tagged packets can be routed to any of the Rx Queue from Q0 to Q9.
- Each queue has a corresponding field (PSRQ fields in the MAC_RxQ_Ctrl2/3 registers) by
which you can indicate the packets of specific VLAN priority values that should be routed/ pushed into that queue. Care should be taken that each priority value can be routed to a specific queue within the set of AV/DCB enabled queue. In other words. bits corresponding to the same priority value should not be set in multiple PSRQx fields within the AV/DCB set enabled queues, but you can route multiple priorities into the same queue.
- Other types of packets such as un-tagged packets, multicast packets, and so on, are routed
to specific Rx queues as programmed in the MAC_RxQ_Ctrl1 register.
- When DCB feature is enabled, the setting programmed in the PSRQ fields of the respective
RxQ is used to populate the Priority Enable Vector field of the PFC frame that is generated and transmitted when the flow control is triggered in that Rx Queue. Thus, only Rx Queue 0 to Rx Queue7 can be used for PFC based flow control.
- When PFC-based flow control is disabled (or DCB feature is not selected), then a PAUSE
frame is generated when the flow control is triggered in any of the Rx Queues.
- The queuing is done based on the VLAN Tag priority for AV packets. The VLAN Tag priority
should match the PSRQ field of the MAC_RxQ_Ctrl2 and MAC_RxQ_Ctrl3 registers. The Rx packets can also be routed to a particular DMA channel based on the DCS field of perfectly matched MAC Address Register. The AV control packets (tagged or untagged) are routed based on the AVCPQ field of the MAC_RxQ_Ctrl1 register. The PTP-over-Ethernet packets are routed based on the AVPTPQ field of MAC_Rx- Q_Ctrl1 register. 3. 4. 5. 6. 7.
- Data Center Bridging
The Data Center Bridging feature supports three types of algorithms.
- Weighted Round Robin: In this mode, all queues are serviced in round-robin order based on
weight setting.
- Deficit Weighted Round Robin: In this mode, queues are assigned a weight based on the
percentage of configured bandwidth. A deficit counter holds the credit for transmission.

10G Ethernet Controller Functional Description
- Weighted Fair Queuing: In this mode, each queue is assigned a weight based on the
percentage of the configured bandwidth. Controller schedules the packet with the fastest finish time to start transmission first. The queues assigned to operate in DCB mode are scheduled using above defined algorithms. These queues are also capable to support PFC based flow control.
- Audio Video Bridging
The AV feature enables transmission of time-sensitive traffic over bridged local area networks (LANs). The following standards define various aspects of the AV feature implementation: IEEE 802.1Qav-2009: Supports forwarding and Queuing for Time-Sensitive Streams. IEEE 802.1Qat-2009: Allows the network resources to be reserved for specific traffic streams traversing a bridged local area network
- IEEE 802.1AS-2011: Specifies the protocol and procedures used to ensure that the
synchronization requirements are met for time-sensitive applications. Queues assigned to operate in AV mode, support CBS (Credit based shaper as specified in IEEE 802.1-Qav) or SP scheduling algorithms.
##### 10.8.3.8.7 Time Sensitive Networking
There are many applications that require predictable network latency. Some of these applications include audio and video, initially defined in Audio Video Bridging (AVB) standards, automotive sensor control networks as well as advanced driver assistance. To support tight time tolerance as well as predictable network latency requirements of these applications, MGBE implements the following features in hardware.
- Enhancements to Scheduled Traffic (EST) as defined in IEEE 802.1Qbv
- Frame preemption and Interspersing Express Traffic as defined in IEEE 802.1Qbu and IEEE
802.3br
- Time-Based Scheduling to enable above defined features
- Enhancements to Scheduled Traffic
The IEEE 802.1Qbv-2015 defines the schedule for each of the queues on every egress port, which makes the implementation aware of traffic arrival schedule. This information can be used to block the lower priority traffic from transmission in this time window/slot. This ensures that scheduled traffic is forwarded from sender to receiver through all the network nodes with a deterministic delay. This behavior is shown in the following figure.

10G Ethernet Controller Functional Description
**Figure 10.113 Enhancements to Scheduled Traffic**
As per the standard, the following updates are needed in Transmit Scheduler to support EST.
- Implementation of Gate Control List (GCL)
- Enforcing gate controls in the scheduler
- Accounting for Gate Open (O) duty cycle in the computation of idleSlope (CBS)
The controller supports all 3 of these requirements in hardware. When EST is used in isolation, the Gate Control List manages the final open/close state of the Queues along with the checks carried out by the Transmission Selection Algorithm in MTL. As the Gate Controls operate on a predefined repetitive schedule, it is recommended to use Strict Priority or Credit Based Shaper (CBS) scheduling algorithms.
- Frame Preemption and Interspersing Express Traffic
Preemption allows one or more higher priority (express) frames to interrupt the transmission of a lower priority (preemptable) frame; the preemptable frame transmission is resumed and completed after the express frame transmission is complete. To support frame preemption, the following two abstractions of the MAC are used: A preemptable MAC, called pMAC, which carries the preemptable traffic. An express MAC, called eMAC, which carries the express traffic. pMAC and eMAC operate in parallel as shown in the following figure.

10G Ethernet Controller Functional Description
**Figure 10.114 Frame Preemption and Interspersing Express Traffic**
In the implementation, only parts of the MAC that holds the state during preemption is replicated and represented as pMAC and eMAC. The MAC uses the following two ways to puts on hold, the transmission of the preemptable traffic, in the presence of express traffic: The MTL scheduler interrupts the preemptable traffic that is currently being transmitted. When the preemption capability is active, the MAC interrupts the transmission and reception of preemptable frames. A preempted fragment can be followed by zero or more express frames, before the continuation fragments. The preemptable frame can be fragmented any number of times, however, the minimum final and non-final fragment length criterion must be is met. However, interleaving of more than 1 preemptable packet is not permitted. This implies that if a preemptable packet is fragmented by an express packet, another preemptable packet cannot be transferred until all the remaining fragments of the first-preempted packet are transferred. The MTL scheduler prevents starting the transmission of preemptable traffic. When the preemption capability is inactive, the pMAC entity is disabled and only express traffic is transmitted or received. Frame preemption feature can be enabled by setting EFPE field of the MAC_FPE_CTRL_STS register.

10G Ethernet Controller Functional Description
- Time-Based Scheduling
- To support strict transmit-time requirements of EST, Controller adds Time-Based Scheduling
feature. In this feature, the transmit DMA fetches the packet from the host memory for transmission at designated time. This helps the software to set up the Transmit descriptors in advance even before packet is ready/available. The following “Time” parameters control the queue behavior and enable the controller to adhere to strict time requirements of EST. Launch Time: The time beyond which MTL can schedule the packet for transmission.
- Fetch Time: The time beyond which the Tx DMA can schedule a packet-fetch from the host
memory. Expiry Time: The time beyond which the packet is dropped by MTL. The Time-Based Scheduler does not directly influence the Transmission Selection Algorithm but has an indirect influence as it determines if a queue is eligible to participate in the scheduling. If a frame of a specific queue has a valid Launch Time, the Time-Based Scheduler ensures that the frame participates in Transmit Scheduling (TRC Scheduler) only after the Launch time has elapsed.
##### 10.8.3.8.8 TCP/UDP/IP Offload Features
Communication protocols such as TCP and UDP implement checksum fields, which help determine the integrity of data transmitted over a network. The most widespread use of Ethernet is to encapsulate TCP and UDP over IP datagrams. Therefore, the MAC has an optional Checksum Offload Engine (COE) to support checksum calculation and insertion in the Transmit path, and error detection in the Receive path. The details on various offload features provided in the Controller are explained in the sections below.
- Transmit Checksum Offload Engine
The MAC has a Checksum Offload Engine (COE) to support checksum calculation and insertion in the Transmit path, using which, the software can offload the task of checksum insertion to the hardware. In the transmit path MAC calculates the checksum and inserts it in the Tx packet. This feature helps in reducing the load on the software and can improve the overall throughput of the system. Checksum Offload Engine (COE) supports the following checksum offloads on Transmit path. IPv4 Checksum Offload:
- TCP/UDP/ICMP checksum offload (not true for IPv4 fragment)
L3/L4 checksum can be controlled for each packet using the following options.
- CIC bits (Transmit Descriptor TDES3 Bits[17:16]). Software needs to program these bits to
have checksum generation and insertion in Tx frame.

10G Ethernet Controller Functional Description
- Checksum insertion is enabled for tunneled packets when VNE bit of MAC_Tx_Configuration
register is set and the VNP=3’b011 in the Tx Descriptor of the corresponding packet.
- Setting CSC bit of MAC_Timestamp_Control: This bit enables checksum correction during
- OST for PTP over UDP/IPv4 packets. Software needs to set this bit to keep the UDP
checksum correct for changes made to origin timestamp and/or correction field as part of one-step timestamp operation. This bit is only applicable for PTP packets.
- Receive Checksum Offload Engine
- Similar to Transmit Checksum Offload engine, Receive Checksum Offload Engine detects the
following checksum errors. IPv4 Checksum Offload:
- TCP/UDP/ICMP checksum offload (not true for IPv4 fragment)
The Receive Checksum Offload can be controlled for each packet using the following options:
- Receive Checksum Offload can be enabled by setting IPC bit in MAC_Rx_Configuration
register.
- TCP/IP Checksum Error packet drop control: Setting
- MTL_RxQ(i=0:9)_Operation_Mode.DIS_TCP_EF bit disables dropping of checksum error
packets on Receive. When DIS_TCP_EF bit is set, the MAC does not drop the packets, which only have the errors detected by the Receive Checksum Offload engine. Checksum verification for different types of tunneled packets can be controlled as well using provided register controls.
- Software can enable/disable checksum error-related interrupts from MMC Counters through
MMC_IPC_Rx_Interrupt_Mask register. By default, all interrupts are enabled.
- TCP/IP Segmentation Offload (TSO) Engine
In the TCP segmentation offload (TSO) feature, the DMA splits a large TCP packet into multiple small packets and passes these packets to the MTL as shown in the following figure.
**Figure 10.115 TCP Segmentation Offload**
The flowchart for the TSO operation is explained in the following figure.

10G Ethernet Controller Functional Description
**Figure 10.116 TCP Segmentation Offload Flow**
The application must create the header in Buffer 1 of the first descriptor of the packet to be segmented and provide the header length in TDES2 of the first descriptor (FD = 1). When the FD bit is set, the DMA reads the header from the header buffer to which the TDES0 is pointing. Buffer 2 of the first descriptor can be used for payload and TDES0 and TDES1 of subsequent descriptors. For subsequent descriptors (FD = 0), the address to which the TDES0 and TDES1 are pointing is treated as payload buffer address of the same packet.

10G Ethernet Controller Functional Description
**Figure 10.117 TCP Segmentation Header and Payload fields**
- UDP/IPv4 Fragment Offload (UFO) Engine
The UFO breaks down a large UDP packet into smaller packets using IPv4 fragmentation. Each IPv4 fragment contains the following header or payload information:
- Ethernet Header
- IP Header
- UDP Header (only in the first fragment)
- UDP Payload
- In this mode, the MSS field in the context Descriptor (TDES2[17:0]) and DMA_CH(#)_Control
register, are interpreted as Maximum Fragmentation Size (MFS). This is the maximum size of the payload after the IPv4 header in each fragment. When UFO is enabled, the MSS field must be programmed in multiples of 8 bytes, because, the IP fragments offset is defined in terms of 8 bytes. UFO functions in two modes.
- UFO with valid UDP checksum
- UFO with no UDP checksum
- Using the IPv4 ARP Offload Engine
The MGBE supports the Address Recognition Protocol (ARP) Offload for IPv4 packets. This feature allows the processing of the IPv4 ARP request packet in the receive path and generating corresponding ARP response packet in the transmit path. MGBE generates the ARP reply packets

10G Ethernet Controller Functional Description for appropriate ARP request packets. The ARP packet for IPv4 is L2 layer packet with Length/Type of 0x0806.
##### 10.8.3.8.9 Flow Control
- Enabling Flow Controls
The flow control in Tx and Rx direction can be enabled using the following controls.
- To enable independently Transmit Flow Control for each Rx queue, set the TFE bit in the
MAC_Q#_Tx_Flow_Ctrl register. To enable Pause Flow Control, set the RFE bit in the MAC_Rx_Flow_Ctrl register. The MGBE uses one of the following packet types for flow control:
- IEEE 802.3x Pause packets
- Priority flow control (PFC) packets
The PFC packets are used only when the Enable Data Center Bridging option is selected. The PFCE bit of MAC_Rx_Flow_Ctrl register determines whether PFC packets or IEEE 802.3x Pause Control packets are used for flow control. If the PFCE bit is set, the MAC sends the PFC packets.
##### 10.8.3.8.10 Virtualization
The Ethernet Controller supports hardware-assisted virtualization (multiple operating systems share underlying hardware). The Hypervisor is responsible to allocate queues and channels to different VMs. Common registers shared by multiple VMs must be programmed by the Resource Manager or one trusted OS. Host accesses controller registers over APB bus. Each VM is allocated a 64 KB address window in this interface for it to program its registers. Similarly, RM is provided a separate 64 kB register window to program common registers. A given VM will only have access to the registers allocated to it and is not permitted to access other VMs register space.
- Registers Address Space
The following figure shows the Address map of the MGBE. The following figure shows how register space is mapped to various VMs, RM, and HV. They are physically aliased at 64 KB to enable easy mapping in the host MMU. The VMs have access and visibility to register only the space marked in blue. The RM controls specific VMs to access this space by configurating appropriate mapping register in the MGBE. Other register spaces are only assigned to the RM. The RM can also access all the registers that are accessible by VMs.

10G Ethernet Controller Functional Description
**Figure 10.118 MGBE Register Address Space**
The following register access operations are considered illegal operations.
- One Guest OS trying to access other Guest OS registers
- Any Guest OS trying to access registers belonging to RM or HV page
- RM trying to access registers in HV page
- HV trying to access registers in RM or any Guest OS page

10G Ethernet Controller Functional Description The Guest OS illegal access status is captured in the following register.
- MGBE_VIRTUAL_APB_ERR_STATUS_0
The option to generate APB slave error for guest OS illegal access can be enabled by programming the following register.
- MGBE_VIRTUAL_APB_ERR_CTRL_0
Similarly, the RM or HV illegal access status is captured in the following register.
- MGBE_HV_APB_ERR_STATUS_0
The option to generate APB slave error for RM or HV illegal access can be enabled by programming the following register.
- MGBE_HV_APB_ERR_CTRL_0
The implementation is illustrated in the following figure.
**Figure 10.119 Illegal Access Detection**
- PTP Register Access from VMs
The PTP registers require common read access by all VMs. Therefore these registers are placed in a separate 64 kB address window, which is accessible by all VMs. MGBE VM5 AMAP page is used for this purpose.

10G Ethernet Controller Functional Description
- System Memory Protection Mechanism for MGBE Controller
Since the DMA controller of MGBE generates memory requests on AXI using AXI_ID[3:0], which is based on issuing channel number, a conversion table is provided at the interface to convert AXI_ID[3:0] to ASID (address space identifier for different VMs in Ethernet Controller) used by SMMU. Hypervisor programs this conversion table before the Controller VMs issue any access to system memory. Generally, a guest OS memory space is protected by the CPU MMU (for CPU-generated requests) or by the MC SMMU (for non-CPU generated requests). The 1GMAC DMA controller makes requests directly to system memory over its AXI interface.
- Assuming 1GMAC is performing DMA on behalf of multiple guest OSes; each memory request has
to be annotated with the correct ASID (address space identifier) to enable SMMU to determine whether 1GMAC is allowed to perform the desired operation.
- The AXI ID [3:1] issued on the AXI master interface, correspond to the DMA channel number
associated with the request. A mapping table is envisioned to map AXI ID [3:0] to ASID. The mapping table is mapped to 64KB HV page. The reset value of ASIDs will be 0. There are only 10 ASID needed in MGBE per instance.
- Interrupt Management
In the MGBE wrapper, multiple internal functional interrupts are consolidated and sent out to LIC module. Similarly, multiple safety signals are consolidated and sent to HSM module. The functional and safety signals are as follows:
- Table 10.61 MGBE Wrapper Internal Interrupts
- Output
- Description
mgbe_pcs_intr_o
- Interrupt status for DWC_XPCS
mgbe_xgmac_intr_o
- Interrupt status for DWC_XGMAC
mgbe_xgmac_wrapper_intr_o
- Interrupt status in XGMAC wrapper
mgbe_MACsec_secure_intr
- Secured interrupt status from MACsec
mgbe_MACsec_non_secure_intr
- Non-Secure interrupt status from MACsec
mgbe_tx_dma_intr[9:0]
- Individual TX DMA channels interrupts
mgbe_rx_dma_intr[9:0]
- Individual RX DMA channel interrupts

10G Ethernet Controller Functional Description
- Table 10.62 MGBE Wrapper Internal Safety Fault Signals
- Output
- Description
mgbe_pcs_fault_o[1:0]
- Fault Status for PCS
- Bit 0–Correctable Error
- Bit 1–Uncorrectable Error
mgbe_xgmac_fault_o[1:0]
- Fault Status for XGMAC
- Bit 0–Correctable Error
- Bit 1–Uncorrectable Error
mgbe_MACsec_fault_o[1:0]
- Fault status for MACsec
Bit 0–Reserved.
- Bit 1–Uncorrectable Error
mgbe_xgmac_wrapper_fault_o[1:0]
- Fault status for XGMAC wrapper
- Bit 0–Correctable Error
- Bit 1–Uncorrectable Error
Note: Safety faults are sent to LIC as well as HSM modules.
- Descriptor Prefetch
The MGBE supports descriptor cache. When the descriptor cache operation is enabled, the DMA uses the memory for transmit and receive descriptor cache. Each Tx/Rx DMA channel can cache multiple descriptors. The threshold is programmed in DMA_Tx_EDMA_Control.TDPS and DMA_Tx_EDMA_Control.RDPS locations.
#### 10.8.3.9 Clocks and Resets
##### 10.8.3.9.1 Clocks
The following diagram gives the list of clocks present in MGBE.

10G Ethernet Controller Functional Description
**Figure 10.120 MGBE Clock Diagram**
- Table 10.63 MGBE Clocks Derived from UPHY
- Clock Name
- Description
- MGBE_MAC_CLK
- CAR generates this clock (Sourced from UPHY TX, which provides
TXCLKREF)). It is the clock at which MGBE-MAC Operates.
- If (Port Speed =10G) then MGBE_MAC_CLK = 312.5
- If (port speed = 5G), then MGBE_MAC_CLK = 312.5/2
- If (port speed = 2.5G), then MGBE_MAC_CLK = 312.5/4 (Default)
- MACSEC_CLK
- This is the clock at which MACsec operate. It is same as MGBE_MAC_CLK
though it can be gated.
- MGBE_TX_SER_CLK
PCS Gear Box operates on this clk. UPHY Gear Box input interface also operates on this clk.
- MGBE_TX_CLK
UPHY Gear Box output interface operates on this clk.

10G Ethernet Controller Functional Description
- Clock Name
- Description
- MGBE_TX_PCS_CLK
PCS operates in this clk domain.
- MGBE_MAC_CLK/2 for USXGMII_10G mode
- MGBE_MAC_CLK/4 for USXGMII_5G mode
- MGBE_RX_SER_CLK
- Recovered clock from UPHY RX
- MGBE_RX_PCS_CLK
UPHY RX delivers this clock along with recovered RX_SER clock.
- Table 10.64 MGBE Clocks Not Derived from UPHY
- Clock Name
- Description
- MGBE_APP_CLK
(Application clock): The clock at which the MGBE Tx/Rx DMA operates. It is fixed at 480 MHz.
- MGBE_EEE_PCS_CLK
- Free-running clock needed for EEE functionality

