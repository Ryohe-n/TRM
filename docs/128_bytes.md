# 128 bytes

- Replacement policy
- Least Recently Used (LRU)
- Write policy
- None (I-cache read only)

- Programmable Computer-Vision Accelerator (PVA)
- Characteristic
- Configuration
- Hit under miss (nonblocking, if/when VPU
requests another instruction word that's available, go ahead and return hit)
- No, fetch interface is in-order, so after a miss, if following fetch request
hits, it's not possible to indicate so.
- Miss under miss (if/when VPU requests
another instruction word that's unavailable, request for that cache line as well)
- Yes (request/ready pipelining allows following fetch request to be
conveyed, and if it's a miss involving another cache line, request can be sent out as well)
- Hit latency
- Two cycles
- Prefetch (software request to fetch cache
lines ahead of execution)
- Yes, up to full cache in single Cortex-R5/VPU interaction. Depending on
outstanding transaction allocation may request in batches
- Prefetch request from Cortex-R5 and VPU
- Yes, it has separate config register entries for concurrency
- Prefetch and fetch concurrency
- Yes, giving fetch higher priority
- ECC single error correction
- Yes, corrected on the fly and sent back to VPU
- ECC single/double error detection
- Yes. Single error is corrected but is not written back to cache, single
error handling software should invalidate cache line to initiates refetch when the line is requested.
- Invalidation from Cortex-R5
- Yes, configurable address range
- Invalidation from VPU
- Yes, configurable address range
##### 8.2.2.2.7 Vector Memory
VPU vector memory (VMEM) contains three superbanks of memory and arbitration logic to support various load/store accesses from VPU and external client, which includes DMA. VMEM houses local data memory for VPU to access so it can implement various image processing and computer vision algorithms efficiently. VMEM supports various complex memory access functionality for VPU, including transposition, table lookup, histogram, vector addressed stores. It also supports accesses from outside-VPS hosts like DMA and Cortex-R5, to allow data exchange with Cortex-R5 and other system-level components.
- VMEM includes VMEM Interface (I/F) arbitration block and three VMEM superbanks as shown
below.

- Programmable Computer-Vision Accelerator (PVA)
**Figure 8.19 VMEM Block Diagram**
- VMEM Superbanks
- The three memory superbanks appear as three memory regions in the VPU memory map,
differentiated by high address bits to allow programmers to allocate, based on memory footprint and bandwidth needs. Typically, one memory region is assigned to time-share between VPU and DMA, and the two remaining regions are accessed only by VPU so can be 100% allocated to load/ store instructions. It's also possible to use two regions to ping/pong between DMA and VPU, and to allocate only one region 100% to load/store. Each superbank has 64 KB of capacity. Each superbank consists of 32 banks of 2 KB (16-bit wide) RAMs. Each of the 32 memory banks are independently addressable per clock cycle. This enables a rich set of access patterns:
- Read/write one byte on any byte alignment
- Read/write one 16-bit half-word on any half-word alignment
- Read/write one 32-bit word on any word alignment
- Read/write 8 or 16 consecutive 32-bit words from any half-word alignment
- Read/write 16, 24, or 32 consecutive 16-bit half-words from any half-word alignment

- Programmable Computer-Vision Accelerator (PVA)
Read/write 32 or 64 consecutive 8-bit bytes from any half-word alignment (starting odd byte is not supported and is forcefully aligned to an even byte, and generates an error interrupt to
- Cortex-R5)
- Read/write 8 or 16 words with 16K+1-word offset, useful for column-wise access of 32-bit
array
- Read/write 16 or 32 half-words with 32K+1-half-word offset, useful for column-wise access
of 16-bit array
- Read/write 32 bytes with 64K+2-byte offset, useful for column-wise access of 8-bit array
Read/write independent memory rows in each 16-bit bank, leveraged by parallel table lookup, parallel histogram, and vector addressed store
- Table Lookup
- VMEM Superbanks support parallel table lookup with the following data element size and
parallelism combinations:
- For byte element size, 1/2/4/8/16/32 ways of parallelism
- For half-word (16-bit) element size, 1/2/4/8/16/32 ways of parallelism
- For word (32-bit) element size, 1/2/4/8/16 ways of parallelism
The VPU sends a table base address (512-bit or 64-byte aligned) and an index vector to the VMEM
- Interface. The VPU also sends along addressing mode (to convey that it's a table lookup
transaction), element size and parallelism as sideband signals. The first K elements of the index vector are consumed for K-way lookup; the rest are ignored.
##### 8.2.2.2.8 Histogram
VMEM Superbanks support parallel histogram with the following data element size and parallelism combinations:
- There is no byte element size support
- For half-word (16-bit) element size, 1/2/4/8/16/32 ways of parallelism
- For word (32-bit) element size, 1/2/4/8/16 ways of parallelism
The VPU sends a histogram base address (512-bit or 64-byte aligned), an index vector and an update vector to the VMEM Interface. The VPU also sends along addressing mode (to convey that it's a histogram transaction), element size and parallelism as sideband signals. Compared to conventional/normal histogram, VPU parallel histogram feature implements weighted histogram (by allowing an update vector to be added instead of only incrementing by one), and supports bin value read-back, which is useful in certain applications.

- Programmable Computer-Vision Accelerator (PVA)
##### 8.2.2.2.9 Vector Addressed Store
- VMEM Superbanks support vector addressed store, which is also called reverse lookup, since
instead of reading back indexed entries, data is written to the indexed entries. We support the maximal parallelism, 32 half-word and 16-word configurations.
#### 8.2.2.3 DLUT Description
DLUT supports parallel lookup with one common table, DLUT also supports one configuration of contention free lookup/interpolation most helpful in accelerating target CV workloads. DLUT also supports table reformatting needed to bridge between DMA and DLUT or VPU lookup operations. Table reformatting by DLUT can offload VPU processing cycles with higher performance and lower power.
#### 8.2.2.4 DLUT Features
- The DLUT shall provide these functionalities
1D/2D lookup from one common table, with conflict detection/resolution 1D/2D lookup from parallel tables, inherently conflict-free Optional integer only or fixed-point integer + fraction indices, via configurable number of fractional bits
- Optional 1D/2D post-lookup interpolation
1D lookup with linear interpolation 2D lookup with bilinear interpolation
- Out-of-range sentinel return value
- Out-of-range predicate off output write
- Configurable X/Y offset to translate between global coordinates and local coordinates
- Table reformatting as a separate operation mode
- Indices can be unsigned 16-bit, or 32-bit (each X or Y in case of 2D lookup)
Table entries (and output) can be 8-bit, 16-bit, or 32-bit, signed or unsigned, and entry data type is independent of index data type 2D lookup and interpolation with indices automatically generated by DLUT, limited to Word indices and Halfword table entries
#### 8.2.2.5 DMA Unit Description
PVA DMA is a data and tile movement engine that is programmed for data transfer from anywhere to everywhere in the PVA cluster/MC subsystem space. The DMA maintains a high level of system

- Programmable Computer-Vision Accelerator (PVA)
efficiency on the external memory interface bus to DRAM, CVNAS, SysRAM, and VIDMEM (dGPU memory). The DMA maximizes the throughput and minimize the transfer time on the bus.
##### 8.2.2.5.1 DMA Features
- Table 8.8 List of Supported Features in DMA Hardware
- Feature
- Benefit
- Multi-dimensional addressing
- Five dimensions
- Linked List
- To reduce programming overhead and to reduced latency of
software interaction
- Channel Arbitration
- Supports Weighted RR arbitration
- Boundary handling (constant, repeat)
- Reduce VPU workload
- Software sequencer
- Flexibility
- DMA MISR (Func. Safety)
- Permanent fault detection and Software BIST
2D and Circular buffer aware
- Buffer management
- Hardware event-based DMA
- For triggers and sequencing
- Block Linear Support
- Raw format
- Outstanding requests

