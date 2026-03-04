# 64 -bit RMON counters to avoid fast wrap-up at 10 Gbps data rates. For example, octet counters

- Optional features to support Ethernet packet timestamping as described in IEEE 1588-2008
(64-bit timestamps given in the Tx or Rx status of each packet)
- Provides Tx timestamps in CSR Status Register for two-step timestamping as Tx status is
not provided back to the host in XGMAC-AXI configurations. Option to store up to 16 timestamps with packet identifier in the CSR
- One-step timestamping in Tx direction with the host providing a 64-bit timestamp along
with Ts packet. XGMAC-CORE parses PTP (over Ethernet) packets and insert or correct timestamp in appropriate header field. Parses received frames for PTP packets and take timestamps as per configured node.
- Provides registers for asymmetric time correction

10G Ethernet Controller
- Supports internal system time generation and update along with option of taking reference
time as input.
- Support for dynamic selection of reference time source through control bit in CSR
- Flexibility to control the Pulse-Per-Second (PPS) output signal (ptp_pps_o)
- Support for capturing timestamp based on external trigger and providing it in CSR
- Optional PTP offload module to support automatic generation and transmission of SYNC
and Delay request/Response PTP packets Loopback capability at XGMII (transmit data to receive path).
- MDIO Master interface (optional) for multiple PHY devices and their configuration and
management.
- Interrupt generation mechanism through MDIO for hot-plugged XENPAK
- IPv4 header checksum offload on reception
- TCP, UDP, or ICMP checksum offload (IPv4 and IPv6) for received packets
- Receive-Side Scaling (RSS) based on Toeplitz HASH algorithm. The incoming traffic is
segregated into (up to) 16 DMA channels based on the RSS hash. IP out-of-sequence detection for TCP/UDP over IP traffic in each channel based on the RSS hash. The out-of- sequence status is given along with the data.
##### 10.8.2.5.3 MAC Transaction Layer
The MTL block consists of two sets of FIFOs: Transmit FIFO with programmable threshold capability. Receive FIFO with a programmable threshold (default 64 bytes).
- Common Transmit and Receive Features

