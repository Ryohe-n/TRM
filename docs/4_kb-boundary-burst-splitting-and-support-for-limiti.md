# 4 KB boundary burst splitting and support for limiting burst to 1 KB boundary

- Up to 32 outstanding Read and Write transactions
- Posted writes during multiple data transfers from the AXI master interface to maximize the
bus use.
- Handshaking on AXI Read and Write data channels

1G Ethernet Controller
- AXI Slave Interface Features
Does not support Slave Interface. Use 32b wide APB interface to access control and status registers.
##### 10.6.1.5.3 Important Usage Models
- Time Sensitive Networking (TSN)
The Ethernet Controller supports the following TSN features:
- Time Synchronization
- IEEE 1588-2008 for precision-networked clock synchronization
- IEEE 802.1as-201, timing, and synchronization for time-sensitive applications in bridged
- LANs
- IEEE 802.1Qat and IEEE 802.1Qav standards, Virtual Bridged LANs
- IEEE 1722-2011, Layer 2-transport protocol for time-sensitive apps in bridged LANs
- IEEE 802.1Qbv-2015 for Enhancements to Scheduling Traffic
- IEEE802.1Qbu/802.3br for Frame preemption and Interspersing Express
- Supports MACsec for both Express and Preemptible frames
MACsec features are defined in a previous section.
- AV Support
The Ethernet Controller supports the following AV features:
- Separate channels or queues for AV data transfer in 100 Mbps and 1,000 Mbps modes
- Up to eight queues on the Receive paths for AV traffic and seven queues on the Transmit
path for AV traffic
- IEEE 802.1-Qav specified credit-based shaper (CBS) algorithm for Transmit channels
Single Tx FIFO and Rx FIFO (MTL) for all selected queues (system-side interface [AHB, AXI, or native] remains the same).
- Monitoring, Testing, and Debugging Support
The Ethernet Controller supports the following features for monitoring, testing, and debugging:
- Internal loop-back from Tx to Rx on the GMII for debugging
- DMA states (Tx and Rx) as status bits
- Debug status register that gives status of FSMs in Transmit and Receive datapaths and FIFO
fill-levels
- Application Abort status bits

1G Ethernet Controller Functional Description
- MMC (RMON) module
- Current Tx or Rx Buffer pointer as status registers
- Current Tx or Rx Descriptor pointer as status registers
- Statistical counters to calculate the bandwidth served by each Transmit channel when AV
support is enabled
- Tx or Rx Queues memory accessible through Slave port for debug
#### 10.6.1.6 Features Not Supported
##### 10.6.1.6.1 Frame-Based Arbitration
When operating in either Threshold (cut through) or Store and forward modes of operation, PBL- based arbitration is recommended over Frame based arbitration.
##### 10.6.1.6.2 Ignore Programmable Burst Length
Before placing a request for a data read from memory, the Tx controller checks that entries equivalent to the data request size (which is equal to Tx PBL) are available in the corresponding Tx Queue. If the space is available, it places a request on memory side. But, the IP also supports Ignore
- Programmable Burst Length (IPBL) in which the DMA does not check for the PBL number of
locations in the MTL before initiating a transfer. Therefore, use of IPBL is not recommended.
##### 10.6.1.6.3 Maximum AXI Burst Length of Four with TSO Enabled
The Ethernet Controller can program the burst length supported on AXI from a value of four up to 256 in powers of 2. When TCP Segmentation Offload is enabled, if the AXI burst length is less than the TCP/IP header size, a defect in the IP can cause one of the DMA channels to stop functioning. Because the maximum IPv4 header is 80 Bytes, if the AXI burst is programmed to a value greater than 5, this limitation does not occur since each burst is of 16B. Therefore, when TSO is enabled, the AXI BLEN enabled in the IP must be a minimum of 8 to avoid this issue.

