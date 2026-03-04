# 10 (Combination of L2 or L3/L4

- Split)
- L3/L4 split
- Non-IP Packet
- L2 Split
- NA
- Reserved
The points at which the header is split are shown in the following figure.
**Figure 10.95 Header Split Points**
##### 10.8.3.6.1 Split Header Descriptor Structure
The following figure shows the descriptor structure without the Split Header Frame.

10G Ethernet Controller Functional Description
**Figure 10.96 Descriptors without Split Header Feature**
The following figure shows the descriptor structure with the Split Header feature.
**Figure 10.97 Descriptors with Split Header Feature**
- The DMA writes the header of the received packet by using the header address to which the
RDES0 in the first descriptor is pointing (FD bit of RDES3 is set). The DMA writes the payload of the received packet into the buffer address to which the RDES2 is pointing. For subsequent descriptors (FD is set to 0), the address to which RDES0 (Header address) is pointing is not used. The payload is written only to buffers to which the RDES2 (payload address) is pointing. The DMA writes the header length in RDES2 of the first receive descriptor (RDES3[29] (FD Bit) is set) for the packet. The packet length is written in RDES3 of the last receive descriptor (RDES3[28] (LD Bit) set). The buffer length for the payload is set by the driver through the RBSZ field in the corresponding DMA Channel Receive Control Register. The DMA fills receive buffers fully in all except the last descriptor. The maximum header length is limited by the value programmed in the HDSMS field of MAC_Rx_Configuration register.

10G Ethernet Controller Functional Description The following figure shows the descriptor structure with the Split Header feature for a tunneled packet.
**Figure 10.98 Descriptors with Split Header for Tunneled Packets**
The header of the outer packet and onner packet are part of data written in the Header buffer. Only the Payload of the Inner packet is written into the buffers pointed by RDES2.
#### 10.8.3.7 Enhanced Descriptor for Time-Based Scheduling
The time-based scheduling feature needs Enhanced Descriptors (that are 32 Bytes) to be enabled on all the required DMA channels that intend to use the feature. By configuring the number of channels that use the time-based scheduling feature. 1.
- Use the DWCXG_NUM_DMA_TBS_CH parameter to specify the number of DMA channels
that use the time-based scheduling feature. Specify the channels in the descending order.
- By setting the EDSE bit of DMA_CH(#i)_TX_Control register
a. b. The structure of 32-byte Descriptor for the Context and the Normal Descriptor in Read and Write formats are described in the following sections.
##### 10.8.3.7.1 Enhanced Normal Descriptor - Read (32-Bit Mode)
The fields present in the first 16 bytes of the Enhanced Descriptor format of normal descriptor are as follows:
- LTV: Launch Time Valid indicates the Launch Time (LT) and GSN fields present in the
descriptor are valid. The LTV must be set only if the FD bit of the descriptor is not.

10G Ethernet Controller Functional Description GSN: This field indicates the GCL slot number associated with the packet. Launch Time (LT): This field indicates the Launch Time associated with the packet.
**Figure 10.99 Enhanced Normal Descriptor - Read (32-Bit Mode)**

10G Ethernet Controller Functional Description
##### 10.8.3.7.2 Enhanced Normal Descriptor (Write, 32-Bit Mode)
**Figure 10.100 Enhanced Normal Descriptor (Write, 32-Bit Mode)**
##### 10.8.3.7.3 Enhanced Context Descriptor (Read, 32-bit Mode)
The first 16 bytes of the Enhanced context descriptor (ETDESC4 to ETDESC7) are reserved and must be zeros. The fields present in last bytes of the Descriptor (TDESC0 to TDESC3) are same as the context descriptor (TDESC0 to TDESC3) in 16 byte format.

10G Ethernet Controller Functional Description
**Figure 10.101 Enhanced Context Descriptor (Read, 32-bit Mode)**

10G Ethernet Controller Functional Description
##### 10.8.3.7.4 Enhanced Context Descriptor (Write, 32 Bit Mode)
**Figure 10.102 Enhanced Context Descriptor (Write, 32 Bit Mode)**
##### 10.8.3.7.5 Interfaces
- Internal Interfaces
- AXI4 Master Interface
- The XGMAC DMA controller issues requests on an AXI4 master interface to access system
memory. Each channels is assigned a unique ASID value via
- MGBE_WRAP_VIRTUAL_AXI_ASID[2:0]_CTRL_0 registers. The memory controller services requests
(belonging to a given ASID in-order), and the response, are also returned in-order. The following table specifies the AXI parameters.
- Table 10.57 MGBE AXI parameters
#
- Parameter
- Size
- AXI Address Width

