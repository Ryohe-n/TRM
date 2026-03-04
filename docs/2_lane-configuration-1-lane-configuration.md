# 2 -Lane Configuration 1-Lane Configuration

- Lane 7
- UFS x2
(UFS L1) N/A The UFS Control sidebands, not requiring high-speed pads, are in the domain of Multi-Purpose I/O Pins. The UFSHC supports the following external sideband interfaces via PinMux.
- UFS_REF_CLK
- Single-ended reference clock from UFS Host Controller to device
- UFS_RST_n
- Single-ended active Low Reset signals from UFS Host Controller to device
For details, see Multi-Purpose I/O Pins and Pin Multiplexing (PinMux) chapter.
#### 10.3.2.3 UniPro
UniPro is a link layer specification developed and supported by the MIPI alliance. It is intended to provide a low-latency and high-bandwidth "pipe" for applications that need a very high-speed interface with no compromise on reliability. The figure below shows a very high-level view of the UniPro layered structure.
**Figure 10.15 UniPro Layered Structure**

- Universal Flash Storage Complex (UFS)
The main features of the UniPro stack are listed below:
- MIPI UniPro-1.8 conformant
- MIPI M-PHY support (no support for D-PHY)
- Single C-Port
- Configurable device ID
- Automatic flow control between local buffer space and peer device (Layer 2 flow control)
- Reliable transmissions through error correction and automatic re-transmission
- Single Traffic Class (TC0)
Supports two Rx and two Tx lanes.
- Generation and check of Layer 1.5 test pattern
- RMMI signaling support between L1.5 and the M-PHY
##### 10.3.2.3.1 UniPro Lane Connectivity
The figure below shows the connection of a UniPro link with two Rx and two Tx lanes. The UniPro protocol uses the unidirectional M-PHY connections to transport the data between the two UniPro devices using dual simplex connections. The figure below shows the connection diagram of a UniPro link from the Physical Adapter Layer of UniPro for forward and reverse direction. UniPro protocol requires feedback on the transmission status; for reverse direction UniPro link must have at least one lane in each direction. M-PHY modules drive the physical link. M-PHY modules convert the parallel data streams provided by UniPro into high-speed differential or low-speed PWM-like transmission.

- Universal Flash Storage Complex (UFS)
**Figure 10.16 UniPro Lane Connectivity**
##### 10.3.2.3.2 UniPro Layer Interaction
The diagram below shows the four layers of UniPro, and the interaction of the different layers.

- Universal Flash Storage Complex (UFS)
**Figure 10.17 UniPro Layer Interaction**
##### 10.3.2.3.3 UniPro Key Layer Features
L1.5 (PHY Adapter):
- Makes UniPro implementation agnostic to the PHY level (L1) implementation and protocol
details
- Transmits and receives data and control 17-bit “symbols”
- Performs lane management
L2 (Data Link):
- Provides reliable data transmission and reception (generates CRC)
- Provides Flow Control
- Initiates PHY interaction via L1.5
- Supports traffic classes TC0 and TC1 (TC1 support not required for UFS application)
- Performs frame composition (Tx) and decomposition (Rx)
- Provides frame preemption support (Not required for UFS application)
- Detects Errors and reports errors to DME
L3 (Network):
- Performs Packet composition and decomposition
- Supports Error handling
- Supports at least one traffic class

- Universal Flash Storage Complex (UFS)
- Device ID support in Network Layer
L4 (Transport):
- Provides addressing, segment composition and decomposition
- Provides End-to-End flow control and Error handling
- L4 (Transport layer) signaling interface
UniPro specification defines a C-Port interface for higher level applications to interface to the Transport Layer C-Port addressing support in L4 (Transport layer).
#### 10.3.2.4 MPHY
MPHY connects to UniPro via the standard Reference M-PHY Module Interface (RMMI) for Tx and Rx.

