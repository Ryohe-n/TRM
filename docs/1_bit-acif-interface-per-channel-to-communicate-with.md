# 1 -bit ACIF interface per channel to communicate with other AHUB clients through AXBAR

- Samples transfer through both DMA and register access (PIO mode)
Support of packing (8 or 16 bits to 32 bits) in upstream direction and unpacking (32 bits to 8 or 16 bits) in downstream direction
#### 7.7.2.3 ADMA
- The ADMA caters to the DMA needs of APE clients. It performs audio samples transfer among
system memory, internal memory/ARAM, and AHUB through multiple unidirectional channels. A unidirectional channel is a point-to-point virtual connection for facilitating blocks of data movement with minimal CPU intervention. ADMA is plugged into the APE with the interfaces AXI interconnect for datapath, AHOST/REGDEC for programming interface, and AHUB for DMA requests originating from its internal clients.
##### 7.7.2.3.1 ADMA Features
- Flow controlled (Memory ↔ AHUB or AHUB ↔ AHUB) and non-flow controlled (Memory ↔
- Memory) DMA transfers
- DMA requests based on FIFO status of the requesters in case of flow controlled transfers

- Audio Processing Engine (APE)
- Two AXI Master interfaces
(One of them dedicated to the transferring of data to and from AHUB and the other one is hooked up to ACONNECT for the transfers to and from ARAM/DRAM)
- Per channel pre-mask Interrupt for indicating transfer completion to the AGIC
- AGIC routes the post-mask Interrupt to ADSP/CPU

