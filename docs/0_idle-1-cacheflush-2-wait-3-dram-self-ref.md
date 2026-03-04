# 0 = IDLE 1 = CACHEFLUSH 2 = WAIT 3 = DRAM_SELF_REFRESH 4 = DEBUG_RESET_ACK 5 = WAIT_FOR_SW_ACK

- RW
0x0 HALT_IN_FIQ: (SW Read/Writable)- indicates if the CCPLEX FIQ handler should halt the CPUs for external debugger to poke.
- RW
0x0 FSI_CLUSTER1_WDT3_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 FSI_CLUSTER1_WDT2_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 DCE_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 RCE_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 RAMDUMP_2ND_BOOT_COMPLETE:
- SW needs to set this bit before intiating DRAM dump to
host PC. This allows RAMDUMP FSM go back to IDLE
- RW
0x0 CCPLEX_REMOTE_EXITED_GRACEFULLY: not used by HW
- RW
0x0 FSI_CLUSTER1_WDT1_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 FSI_CLUSTER1_WDT0_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 FSI_CLUSTER0_WDT_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 SCE_FIQ_EXITED_GRACEFULLY: not used by HW

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 APE_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 SPE_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 BPMP_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 CCPLEX_CLUSTER1_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0 CCPLEX_CLUSTER0_FIQ_EXITED_GRACEFULLY: not used by HW
- RW
0x0
- Reserved
- RO
X DRAM_SELF_REFRESH_REQUEST_TIMEOUT:
- DRAM could not be put in self refresh. Contents of DRAM on
WDT boot may not be reliable.
- RO
X DRAM_IN_SELF_REFRESH: MC was able to successfully put DRAM into Self Refresh.
- Contents of DRAM on WDT boot are reliable
- RO
X CCPLEX_CACHEFLUSH_REQUEST_TIMEOUT:
- CCPLEX cache flush failed. DRAM does not have CCPLEX
caches flushed.
- RO
X CCPLEX_CACHEFLUSH_DONE:
- CCPLEX cache flush successful. DRAM has latest data
- RO
X
- WDT_DFD_RST_ACK
- RO
X
- WDT_DFD_RST_REQ
- RW
0x0 CCPLEX_CACHE_RSTDISABLE:
- Not connected in Parker. Reserved for Future use
- RW
0x0
- Reserved
- PMC_IMPL_RAMDUMP_TIMEOUT_0
- Offset: 0x110
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_RAMDUMP_TIMEOUT_SCR_0
- Reset: 0x00007d00 (0b0000,0000,0000,0000,0111,1101,0000,0000)

- PMC IMPL Registers
- Bit
- Reset
- Description

