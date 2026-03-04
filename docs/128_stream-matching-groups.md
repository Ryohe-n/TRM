# 128 stream matching groups

- Eight TBUs in each NISO SMMU and four TBUs in ISO SMMU
The configuration parameters above may have an effect on registers defined in the Arm System Memory Management Unit Architecture Specification. Revision of the Arm IP used:
- TBU: r2p2
- TCU: r2p4
- For the memory subsystem (MSS) datapath to operate correctly, the following must be
programmed: AArch32 short descriptors should not be used. The SoC supports only 7-bit StreamIDs, so SMR.MASK[14:7] must be programmed to 'hFF. Program SCTLR.CFRE / SCTLR.CFIE / CR0.GFRE / CR0.GFIE / CR0.GCFGFRE / CR0.GCFGFIE = 1. The stall-fault model is not supported. Program SCTLR.CFCFG = 0. Prefetch must be disabled by setting SMMU_CBn_ACTLR.CPRE = 0.
#### 3.6.1.2 StreamID
The StreamID is used to select a context in SMMU that is used for translation. For information on how to map a StreamID to a context, refer to the Arm System Memory Management Unit Architecture Specification. The StreamID can be set by a client on a per-transaction basis. However, this behavior can be overridden by programming the StreamID override registers. The override is applied on a per-client basis for all transactions issued by that client. Refer to the Memory Controller (MC) chapter for client details. The StreamID override registers are part of a separate aperture aligned to 64 KB so that it can be controlled by the hypervisor in a virtualized system.

- Boot and Power Management
4. Boot and Power Management

