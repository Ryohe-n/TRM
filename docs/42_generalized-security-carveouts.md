# 42 generalized security carveouts

- The block diagram in the Introduction chapter shows where the MSS fits in the overall SoC
architecture.

- Memory Subsystem (MSS)
#### 3.1.1.2 Block Diagram
**Figure 3.1 MSS Block Diagram**

- Memory Subsystem (MSS)
#### 3.1.1.3 Speeds and Feeds
There are complex bandwidth requirements with requests from:
- SoC clients
iGPU and memory destinations:
- DRAM
- SCF Cache
- SysRAM
- AON TZ-SRAM
Local DRAM bandwidth (up to 256 bits of LPDDR5 @ 6.4Gbps) gives a peak DRAM bandwidth of up to 205 GB/sec. The SCF cache has additional bandwidth that can be used by GPU when SCF allocation is enabled. The main datapaths through MCF and SCF support up to 8*32B*scfclk = 273 GB/sec in both read and write directions.

