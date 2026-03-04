# 1 = ENABLE 0 = DISABLE 0x0 DBGACK_FSI_R52_CORE3: Debug Acknowledge from FSI R52 CORE3. 1 = ENABLE 0 = DISABLE 0x0 DBGACK_FSI_R52_CORE2: Debug Acknowledge from FSI R52 CORE2. 1 = ENABLE 0 = DISABLE 0x0 DBGACK_FSI_R52_CORE1: Debug Acknowledge from FSI R52 CORE1. 1 = ENABLE 0 = DISABLE 0x0 DBGACK_FSI_R52_CORE0: Debug Acknowledge from FSI R52 CORE0. 1 = ENABLE 0 = DISABLE 0x0 DBGACK_CLUSTER0_CPU0:

- Debug Acknowledge qualifier for CLUSTER0_CPU0 - Aggregated qualifier
for CCPLEX DBGACK. 1 = ENABLE 0 = DISABLE
- CORESIGHT_CFG_CHIPID_0
- CoreSight Chip ID Register
- This R/W register can be used to ensure that any CPU, APBAP and AXIAP are able to make an
access to the system. Debugger is expected to first write and then read this register with a known CHIPID value - after halting the CPU or connecting to an Access Port (APB-AP or AXI-AP) When the read and write data is the same, then the corresponding chipid can be printed. This indicates that the connection with CPU/Access Port is good to use. CHIPIDs are: 1. cluster 0 cpu 0 - chipid = 0xbcbc0000

- CoreSight_CFG Registers
2. cluster 0 cpu 1 - chipid = 0xbcbc0001 3. cluster 1 cpu 0 - chipid = 0xbcbc0010 4. cluster 1 cpu 1 - chipid = 0xbcbc0011 5. cluster 2 cpu 0 - chipid = 0xbcbc0020 6. cluster 2 cpu 1 - chipid = 0xbcbc0021 7. cluster 3 cpu 0 - chipid = 0xbcbc0030 8. cluster 3 cpu 1 - chipid = 0xbcbc0031 9. bpmp - chipid = 0xbbbbbbbb (b= bpmp) 10. ape - chipid = 0xaaaaaaaa (a = ape) 11. spe - chipid = 0x5e5e5e5e (5e = spe, see 5 as "S") 12. sce - chipid = 0x5c5c5c5c (5c = sce, see 5 as "S" and c for camera which is the non- automotive use case) 13. axiap - coresight axiap. chipid = 0xcacacaca (c= coresight a=axiap) 14. dapb - corsight debug apb (0xcdcdcdcd) (c=coresight d=debug apb)
- Offset: 0x20024
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

