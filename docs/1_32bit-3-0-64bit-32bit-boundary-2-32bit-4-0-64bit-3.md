# 1 > 32bit 3.0 64bit 32bit boundary 2> 32bit 4.0 64bit 32bit boundary 3> 64bit 3.0 96bit 32bit boundary 4> 64bit 4.0 128bit 64bit boundary


- SDMMC Controller Functional Description
#### 10.10.2.10 ADMA3
- SDHOST4.2 mentions a new DMA called ADMA3. ACT0 bit (=1) in the Attribute field of the
descriptor distinguishes ADMA2 descriptor from ADMA3 descriptor. ADMA2 can gather data from fragmented System Memory and store it into a contiguous location in the SD Flash. For a read, the SD Flash can be read contiguously and the data can be scattered into the System Memory. ADMA3 supports scatter gather even in the Flash. This requires issuing different commands to the SD Device without CPU intervention. 1.
- The Host Driver builds an Integrated Descriptor in the System memory. {ACT2, ACT1, ACT0} =

