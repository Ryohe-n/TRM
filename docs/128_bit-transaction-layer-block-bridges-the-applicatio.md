# 128 -bit Transaction Layer block (bridges the application and the MAC) Data transfers executed using simple FIFO protocol.

- Synchronization for all clocks in the design (Transmit, Receive, and Application clocks)
- Optimization for packet-oriented transfers with packets delimiters
- Programmable burst length, up to half the size of the MTL Rx Queue or Tx Queue size, to
support burst data transfer in the EQOS-AXI configuration
- Programmable threshold capability for each queue (default of 64 bytes)
- Optional debug and slave mode operation on Queue 0 (default queue)
- Tx Features
- FIFO sizes on transmission: up to 128 kB
- Multiple queues (up to eight) on the Transmit path with a common memory for all Tx Queues
- Store-and-Forward mechanism or threshold mode (cut-through) for transmission to the MAC
- Programmable queue size in configurations with multiple queues. Each queue size can be
programmed in terms of 256 bytes.
- Automatic retransmission of collision packets in half-duplex mode
- Discard packets on late collision, excessive collisions, excessive deferral, and under-run
conditions with appropriate status. Calculate and insert IPv4 header checksum and TCP, UDP, or ICMP checksum.
- Programmable interrupt options for different operational conditions
- Statistics by generating pulses for packets dropped (due to underflow) in the Tx FIFO
- Optional statistics related to bandwidth consumption by each queue of up to 16 blocks over
a 125 µs period Optional packet-level control for:
- VLAN tag insertion or replacement
- Ethernet-source address insertion
- Layer 3/Layer 4 Checksum insertion control
- One-step timestamp
- Timestamp control
- CRC and pad control
The following scheduling algorithms in configurations with multiple queues:
- Strict Priority (SP)
(When Audio-Video Bridging is enabled) Credit-based Shaper (CBS)
- Option to support dropping of Tx Status to improve the Transmit throughput
- Rx Features
- Rx Queue sizes in the receive path: up to 128 kB

1G Ethernet Controller
- Multiple queues (up to eight) on the receive path with a common memory for all Rx Queues
Insertion of Rx Status vectors into the Rx Queue after the EOP transfer (in Threshold mode) and before SOP (in Store-and-Forward mode) in EQOS-AXI configuration
- Programmable Rx Queue threshold (default fixed at 64 bytes) in Threshold (or cut-through)
mode Option to filter all error packets on reception and not forward them to the application in the store-and-forward mode.
- Option to forward the undersized good packets
- Statistics by generating pulses for packets dropped (due to overflow) in the Rx FIFO
- Automatic generation of Pause packet control or backpressure signal to the MAC based on
the Rx Queue fill level. Arbitration among queues when multiple queues are present. The following arbitration schemes are supported:
- Weighted Strict priority (WSP)
- Strict Priority (SP)
#### 10.6.1.4 Direct Memory Access (DMA) Block
- The DMA block exchanges data between the MTL block and system memory. The well-defined
descriptors structure acts as a software and hardware interface. The application uses a set of registers (DMA CSR) to control the DMA operations. The DMA block supports the following features:
- Support for a maximum of eight DMA channels

