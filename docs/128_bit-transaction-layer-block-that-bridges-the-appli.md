# 128 -bit, Transaction Layer block that bridges the application and the MAC

- Ten queues in single RAM on TX side and another ten on RX side
- Programmable burst length, up to half the size of the MTL Rx queue or Tx queue size, to
support burst data transfer in the XGMAC-MTL
- Supports store and forward and threshold modes for data transfer in FIFO. Programmable
threshold capability for each queue (default of 64 bytes) Programmable size for each queue buffer.
- Transmit Features
- Transmit memory size from 1 KB to 32 KB for single queue configurations. Up to 128 KB for
multiple queues configurations, with size configurable in powers of 2.
- Programmable size with granularity of 256 bytes per queue
- Checksum module to calculate and insert IPv4 (L3) header checksum and TCP, UDP, or ICMP
(L4) checksum in each queue

10G Ethernet Controller
- The TX queues can be mapped into eight traffic classes for scheduling and bandwidth
allocation. Multiple (up to eight) traffic classes are supported, with the following scheduling algorithms. The number of traffic classes and transmit queues can be independently selected so that the number of transmit queues is always greater than or equal to the number of traffic classes.
- Weighted Round Robin (WRR)
- Deficit-Weighted Round Robin (DWRR) (when DCB enabled)
- Weighted Fair Queuing (WFQ) (when DCB enabled)
- Strict Priority (SP)
- Packet level control for
- VLAN tag insertion or replacement
- Ethernet source address insertion
- Checksum insertion
- One-step timestamp correction
- Timestamp control
- CRC and pad control
- When audio-video bridging is enabled, it supports credit-based Shaper scheduling
algorithms in configurations with multiple queues. Forwarding the Transmit status to the application. Useful when time-sensitive networking is enabled using Time-Based Scheduling (TBS).
- Receive Features
- Rx FIFO size from 4 KB to 32 KB for single queue configurations. Up to 192 KB for multiple
queues configurations, with size configurable in powers of 2.
- Programmable size with granularity of 256 bytes per queue
Insertion of Rx status vectors into the Rx queue after the EOP transfer (in Threshold mode) and before SOP (in Store-and-Forward mode) in XGMAC-MTL configuration. In store-and- forward mode, the status is available before the packet data. Therefore, the application can take the packet processing decision even before the packet is read from the queue. This enables multiple-frame storage in the Rx queue without requiring additional memories blocks to store the Rx status of packets. Option to filter all error packets on reception and not forward them to the application in the store-and-forward mode.
- Option to forward the undersized good packets
- Automatic generation of Pause packet control to the MAC based on the Rx queue fill level
with programmable Flow control thresholds in each Rx queue.
- Received packets are mapped into the multiple queues based on the Priority field of the
VLAN tag or on Packet Type (DCB control packet, and so on). Option to select Audio-Video Bridging feature on Rx side only (AVB Listener applications) by un-selecting this feature on Tx side

10G Ethernet Controller
##### 10.8.2.5.4 DMA
The DMA block exchanges the data between the MTL block and the host memory. The host can use a set of registers (DMA CSR) to control the DMA operations. The DMA block supports the following features: 128-bit data transfers Multichannel Transmit and Receive engines (up to 10 Transmit and 10 Receive channels).
- Separate DMA channel in the Transmit path for each queue in MTL. Single or multiple DMA
channels for any number of queues in MTL Receive path Descriptor structure to support the following:
- Byte-aligned addressing for data buffer
Dual-buffer descriptor ring and support for 64-bit addressing in descriptor structure. Expandable descriptor with context descriptor for additional control and status information
- Descriptor architecture to permit large blocks of data transfer with minimum CPU
intervention (each descriptor can transfer up to 8 KB of data).
- TCP Segmentation offload (TSO) and IEEE 1588 timestamps
One-step PTP time correction in Tx, that is, input 64-bit timestamp provided in descriptor. Option to provide 64-bit timestamp for received packets.
- Option to give up to two VLAN tags in descriptor for insertion or replacement in Tx and
stripped VLAN tags in Rx
- Option to split the packet header (Layer 3 and Layer 4) and Layer 4 payload in different
buffers.
- Delivers RSS hash and Out-of-Sequence information for packets received with TCP/UDP
over IP payload
- Individual programmable burst size for Tx DMA and Rx DMA engines for optimal host bus
utilization
- Local memory for storing TSO headers for better performance
- Selectable number of Tx DMA channels with TCP Segmentation offload (TSO) feature
enabled. TSO engine to support TCP over IPv4/IPv6 segmentation
- Routing of received packets to the DMA channels based on RSS hash or the Ethernet DA or
VLAN Priority in multichannel DMA configurations. Register programmable RX buffer sizes for each DMA channel.
- Additional per-DMA channel interrupt for normal packet transfers
Per-packet Transmit and Receive Interrupt control in descriptors.
- Enhanced DMA (EDMA) architecture for better performance and throughput
- Supports prefetching and caching up to 32 descriptors for each DMA channel
- Descriptor fetches, data transfers, and Descriptor writes are de-linked and performed
independently to reduce gaps between data transfers of each DMA.
- TxDMA engines have capability to issue up to 16 outstanding requests for packet/burst
transfer.

10G Ethernet Controller
- DMA descriptor writes can be “posted”, so that next descriptor can be processed
immediately for next packet.
- Option to support L2 Network Virtualization protocol (VXLAN/NVGRE) stateless-offloading
functions are as follows:
- Recognition and processing of either VXLAN or NVGRE (selectable through programming)
based Tunneled packets.
- Checksum offload functions act on both outer UDP/IP header as well as the inner L3-L4
headers.
- TCP Segment offload Engine segments a tunneled packet into multiple segments each
with necessary tunneled packet headers
- Routing of the incoming tunneled packets based on VNI/TNI, FlowID (for NVGRE), Inner DA
and Optionally Inner VLAN Tag Supports Hash based mechanism to select the RxDMA channel for forwarding.
- Option to transfer the complete header (including Tunneling header and Inner Packet
header) and inner payload in to separate buffers.
- Support for processing both Tunneled (VxLAN/NVGRE) packets and Untunneled (normal)
packets simultaneously
- Time-sensitive conditional packet transmission by comparing the Slot Time information
provided in the descriptor (useful for AV applications)
##### 10.8.2.5.5 AXI Interface
- AXI Master Interface
The AXI master interface is compatible to interface with AXI-4 slave ports. It supports the following features: 40-bit address width, little-endian, and byte-invariant big-endian modes
- AXI low-power interface

