# 0 as per the VxLAN standard compliance.

- TPL
- TCP Payload Length
- When the TSE bit is reset, this bit is reserved. When the TSE bit is
set, this is Bit 15 of the TCP payload length [17:0]. 14:0
- FL/TPL
- Packet Length or TCP Payload Length
- This field is equal to the length of the packet to be transmitted in
bytes. When the TSE bit is not set, this field is equal to the total length of the packet to be transmitted:
- Ethernet Header Length + TCP /IP Header Length –
- Preamble Length –SFD Length + Ethernet Payload Length
- When the TSE bit is set, this field is equal to the lower 15 bits of
the TCP payload length. This length does not include Ethernet header or TCP/IP header length.

10G Ethernet Controller Functional Description Transmit Normal Descriptor (Write-Back Format). The DWC_xgmac processes the descriptor, acts on it and then writes back with the status content. This operation indicates to the software that the descriptor is free and no longer required by the hardware. TheDWC_xgmac writes only the bits[31:24] of TDES3 during this operation and all the other fields of the descriptor in the host memory are not modified.
**Figure 10.90 Transmit Normal Descriptor (Write-Back Format)**
The field description is shown below.
- TDES3 Normal Descriptor (Write-Back Format)
- OWN
- Own Bit
- When this bit is set, it indicates that the DWC_xgmac DMA owns the
descriptor. The DMA clears this bit when it writes back the descriptor. The DMA closes the descriptor when either of the following conditions are true:
- The DMA completes the transfer of data indicated by the buffers
from the host memory to the corresponding Tx Queue. The B1L and B2L values are zero, indicating empty buffers.
- CTXT
- Context Type
This bit is set to 'b0 for normal descriptor.
- FD
- First Descriptor
This bit indicates that the buffer contains the first segment of a packet.
- Note: When EMDA mode is not selected and working in OSP mode (bit[4] of
DMA_CH0_Tx_Control register is set to 1), this bit is not reliable.
- LD
- Last Descriptor
- This bit is set 'b1 for last descriptor of a packet. The DMA writes the status
fields only in the last descriptor of the packet.

10G Ethernet Controller Functional Description
- TDES3 Normal Descriptor (Write-Back Format)
- DERR
- Descriptor Error
When this bit is set, it indicates that the descriptor content is incorrect.
- The EDMA sets this bit during write-back while closing the descriptor. The
descriptor errors can be:
- AXI Bus Error: This bit is asserted when AXI Bus Error response is
received while processing the descriptor. This can be either when the descriptor itself is fetched or when the packet data indicated by its buffer pointers are fetched.
- Descriptor Definition Error: 1 This bit is asserted if CTXT and LD or LD
bits are set to 1 (CTXT and (FD | LD)).
- All 1s

