# 64 -bit

- AONPG
- AON DMA memory accesses go
through this target.
- AST0/1 has certain security critical
configuration along with address translation setup for Cortex-R5 and
- DMA’s memory accesses. ASTs are
placed in AONPG domain to retain all such configuration for any latency critical use cases where SPE needs early access to DRAM/MC during the warm boot.
- CBB Intermediate
target
- AXIv4

