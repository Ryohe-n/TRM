# 32 -bit data width

#### 7.7.2.9 ACAST and ADAST
There are two instances of AST: ACAST and ADAST. AST is responsible for looking up 40-bit address and transaction attributes based on the 32-bit address.
##### 7.7.2.9.1 ACAST
DRAM accesses originates from ADSP go through ACAST. There are eight AST regions in ACAST. ACAST looks up transaction attributes using address.
##### 7.7.2.9.2 ADAST
- DRAM accesses from ADMA and ASRC go through ADAST. There are eight AST regions in ADAST
and is looked up based on APR enable and region ID associated with the transactions.
#### 7.7.2.10 APB-AXI Shim
APB-AXI Shim (AAS) is an APB2AXI shim which converts APB requests into AXI requests. The CPU accesses APE registers through the AAS over the APB bus. The AAS converts the requests to AXI and sends to ACONNECT which forwards the requests to the destination slaves.
##### 7.7.2.10.1 AAS Features
- APB4
- Support of AxProt[2:0]
- PSLVERR
- Maximum of one outstanding APB request
- Support of request
- INCR 1: 32-bit Read/Write
#### 7.7.2.11 APE HSP
Hardware Sync Primitives (HSP) captures shared mailboxes and shared semaphores from the APE

