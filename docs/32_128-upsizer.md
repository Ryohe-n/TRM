# 32 :128 Upsizer

- STM
dAPB
- CSITE
- Target
- CoreSight Major APBIC
- ETR
- AXI-DBB
(AXI3)
- CSITE
- Initiator
- DBB
- ETR
-
- ATB3
- CSITE
- Target
- Replicator

- Design for Debugging (DFD)
- Addr Width
(bits)
- Protocol
- Clock
- Directi
on
- Connected to
- IP
- Data
width (bits)
- ETR
dAPB
- CSITE
- Target
- CoreSight Major APBIC
- HSSTP
- 8b10b
- PEX-
- UPHY’s
- L0_TX_CL
K
- Initiator
- PEX-UPHY Lane-0 mux
- HSSTP
- 8b10b
- PEX-
- UPHY’s
- L1_TX_CL
K
- Initiator
- PEX-UPHY Lane-1 mux
- HSSTP
- 8b10b
- PEX-
- UPHY’s
- L4_TX_CL
K
- Initiator
- PEX-UPHY Lane-4 mux
- HSSTP
- 8b10b
- PEX-
- UPHY’s
- L5_TX_CL
K
- Initiator
- PEX-UPHY Lane-5 mux
- HSSTP
-
- ATB4
- CSITE
- Target
- Replicator (the signal passed
through 128:32 downsizer before connecting to HSSTP)
- HSSTP
dAPB
- CSITE
- Target
- CoreSight Major APBIC
- CTI0 (in DFD partition)
dAPB
- DBGAPB
- Target
- CoreSight Major APBIC
- CTI1 (in DFD partition)
dAPB
- DBGAPB
- Target
- CoreSight Major APBIC
- CTI0
events
- CSITE
in/out ETF/ETR/STM/etc.
- CTI1
events
- CSITE
in/out ETF/ETR/STM/etc.
- AXI-AP
- ACE-Lite
- DBGAPB
- Initiator
- DFD 1x2 NIC
- AXI-
- CBB(AXI4)
- DBGAPB
- Initiator
- CBB
- DFD 1x2 NIC
- AXI-
- DBB(AXI4)
- DBGAPB
- Initiator
- DBB
- CoreSight Major APBIC
- APB3
- DBGAPB
- Target
- CBB
- CoreSight Major APBIC
- APB3
- DBGAPB
- Target
- APB-AP
- ArmJTAG

