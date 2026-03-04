# 22 : Pixels per cycle, or pixels per packet. 1 for 8 PPC, 0 for 4 PPC.

- VI_CSIMUX_INJEC
T
- STREAM
(trigg er)
- Many-hot set of streams on which to inject the packet loaded into the
staging registers.
- VI_CSIMUX_INJEC
T_CFG
- STREAM_S
- WITCH
- Multiplexer enable per stream: set a bit to 0 to take input from CSI, or
to 1 to take input from the Host1x injection stream.
- ACCUMUL
- ATE
- When set, accumulates packets from Host1x injection, to be released
in batch when unset.
- PIPE_STALL
When set, disables CSIMUX pipeline to test overflow functionality. (debug feature)
- FIFO_RD_C
- OUNT
Number of packets in injection FIFO waiting to be consumed.
- FIFO_WR_C
- OUNT
- As FIFO_RD_COUNT, but from write side of FIFO. Use the larger of the
two.
- FIFO_DEPT
H (R/O) Size of injection FIFO, in number of packets available to be held.

- Video Input (VI)
- PPC Calculation
VI6 adds PPC information to the NVCSI-to-VI packet. CSIMUX and CHANSEL can use this info to properly handle user-defined data-types. The register, PPC_CALCULATION, provides for backward compatibility with prior VI programming model. When USE_NVCSI2VI_BUS is 0, the VI pipeline's internal pixel count representation is derived from the reported data-type. However, when USE_NVCSI2VI_BUS is set to 1, PPC info from the NVCSI-to-VI packet is used. The default value of USE_NVCSI2VI_BUS is 1; this is the standard software configuration, unless the PPC info from NVCSI results in unexpected behavior from VI. Note that this register applies to all CSIMUX streams and VI channels.
- Table 7.18 PPC Calculation Register
- Register
- Field
- Bits
- Reset
- Description
- PPC_CALCULATION
- USE_NVCSI2VI_BUS

