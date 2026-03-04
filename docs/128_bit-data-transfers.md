# 128 -bit data transfers

- Multichannel Transmit and Receive engines (up to eight transmit channels; up to eight
receive channels).
- Separate DMA channel in the Transmit path for each queue in MTL
- Single or multiple DMA channels for any number of queues in MTL Receive path
- Fully synchronous design operating on a single application clock (except for CSR module,
when a separate CSR clock is configured). Optimization for packet-oriented DMA transfers with packet delimiters.
- Byte-aligned addressing for data buffer support
- Dual-buffer (ring) descriptor support
- Descriptor architecture to permits large blocks of data transfer with minimum CPU
intervention (each descriptor can transfer up to 32 KB of data). Comprehensive status reporting for normal operation and transfers with errors.
- Individual programmable burst length for Tx DMA and Rx DMA engines for optimal host bus
utilization
- Programmable interrupt options for different operational conditions
Per-packet Transmit or Receive Complete Interrupt control.

1G Ethernet Controller
- Round-robin or fixed-priority arbitration between the Receive and Transmit engines
- Start and Stop modes
- Separate ports for host CSR access and host data interface
- Selectable number of Tx DMA channels with TCP Segmentation Offload (TSO) feature
enabled
- Received packets routing to the DMA channels based on the DA or VLAN Priority in
multichannel DMA configurations. Header Payload Split: Option to split the packet header (up to Layer 2, Layer 3 and Layer 4) and payload in different buffers
- Time-sensitive conditional packet transmission by comparing the Slot Time information
provided in the descriptor (useful for Audio Video applications)
#### 10.6.1.5 MACsec Media Access Control Security (MACsec) Block
The Ethernet Controller supports the following MACsec features: Supports IEEE 802.1AE_2018 based packet authentication. Packet Encryption is not supported.
- Supports up to 1G port speed. Only supported in full duplex mode
- Supports AES-GCM-128 and AES-GCM-256 based ICV generation and checking
Only 16 bytes ICV configuration is supported.
- Thirty-two Secure Association Keys (SAKs) supported in Receive and Transmit direction
- Maximum number of Secure Channels (SCs) supported is 16 with two Association Number
(AN) each. With 4 AN, maximum eight SCs can be supported.
- Supports 32-bit Packet Number (PN)
No supports for 64-bit PN support (Extended PN as defined in IEEE 802.1AEbw-2013).
- Hardware-based Packet Number (PN) exhaustion check and automatic jump over to next AN,
if configured, in transmit direction.
- Replay Window or strict-order based replay protection
- Flow-based or global Bypass support
- Permits uncontrolled port traffic flowing through Ethernet port
- Statistics and Status for various MACsec related states and counters as defined by IEEE
802.1AE_2018
- Support for Preemptible and Express packets as specified in as defined by
- IEEE 802.1Qbu-2016
- Classification based on Flexible Offset
- Flexible Frame Validation check on Ingress
- Support for Legacy-Ethernet packets like SNAP, LLC packets
Majority of SecY functionality is implemented in hardware.

1G Ethernet Controller
- Hard Separation of register space for SecY and KaY pages
- SecY manages various MACsec controls like lookup, and so on.
- KaY manages Crypto Keys, Crypto ICVs, and Crypto state control parameters.
- Advanced debug support for both Receive and Transmit direction
- Safety features for Safety Critical applications
##### 10.6.1.5.1 Reduced Gigabit Media Independent Interface (RGMII)
The RGMII module is implemented in DWC_ether_qos to reduce the pin count. The RGMII specification reduces the pin count of the interconnection between the MAC and the PHY for GMII and MII interfaces. To achieve this, the datapath and control signals are reduced and multiplexed together with both edges of the Transmit and Receive clocks. For Gigabit operation, the clocks operate at 125 MHz; for 10/100 operation, the clock rates are 2.5 MHz/25 MHz.
##### 10.6.1.5.2 AXI Interface
AXI interface features can be divided into the following categories:
- AXI Master Interface Features
- AXI Slave Interface Features
- AXI Master Interface Features
The AXI master interface supports the following features:
- Interfaces with the application through AXI4 compatible interface

