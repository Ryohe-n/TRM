# 10 RxDMA channels One of the outstanding requests is reserved for high priority Descriptor operation.

- Posted writes during multiple data transfers from the AXI master interface to maximize the
bus utilization. AXI-ID based on DMA channel number. Each TX and RX DMA has its own ID for data transfer.

10G Ethernet Controller
- APB Slave Interface
CSR access is provided over 32-bit APB interface.
##### 10.8.2.5.6 Audio Video Support
XGMAC supports the following Audio Video (AV) features:
- Separate channels or queues for AV data transfer
- Up to eight queues on the Receive paths for AV traffic and seven queues on the Transmit
path for AV traffic
- IEEE 802.1-Qav specified credit-based shaper (CBS) algorithm for Transmit channels
- Single Tx FIFO and Rx FIFO (MTL) for all selected queues (system-side interface [AXI, or
native] remains the same).
##### 10.8.2.5.7 Time Sensitive Networking Features
XGMAC supports the following Time Sensitive Networking (TSN) features:
- IEEE 802.1Qbv-2015, Enhancements to Scheduling Traffic
- IEEE802.1Qbu/802.3br, Frame preemption, and Interspersing Express Traffic
##### 10.8.2.5.8 Automotive Safety Features
The automotive safety features are targeted to improve the reliability and reduce the time taken to detect faults in the controller. XGMAC supports the following features for automotive safety:
- Error correction code (ECC) protection for memories
- On-chip datapath parity protection
- FSM parity and timeout protection
- Application/CSR interface timeout protection
##### 10.8.2.5.9 Monitoring, Testing and Debug
- Support for internal loopback on the XGMII/GMII for debugging
- DMA states (Tx and Rx) as status bits
- Current Tx or Rx Buffer pointer as status registers
- Current Tx or Rx Descriptor pointer as status registers
- Statistical counters to calculate the bandwidth served by each Transmit channel when DCB
support is enabled.

10G Ethernet Controller
- Provides debug status register that gives the status of FSMs in the Transmit and Receive
datapaths and FIFO fill-levels
- Provides Complete network Ethernet statistics (optional) with RMON-MIB counters (RFCs

