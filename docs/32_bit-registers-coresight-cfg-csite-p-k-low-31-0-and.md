# 32 -bit registers CORESIGHT_CFG_CSITE_<p>_<k>_LOW[31:0] and CORESIGHT_CFG_CSITE_<p>_<k>_HIGH[31:0].

- Given <k> ∈ { LOG , SNAP }
- CORESIGHT_CFG_CSITE_<p>_<k> [63:0] = { CORESIGHT_CFG_CSITE_<p>_<k>_HIGH[31:0],
- CORESIGHT_CFG_CSITE_<p>_<k>_LOW[31:0]}
- If CORESIGHT_CFG_CSITE_<p>_LOG not equal to CORESIGHT_CFG_CSITE_<p>_SNAP, assert
csite_<p>_trig =1; else csite_<p>_trig =0;

- Design for Debugging (DFD)
- If software writes ‘1’ to CORESIGHT_CFG_EXT_DBG_LOG_CTL[SNAP_CSITE_<p>], value of
- CORESIGHT_CFG_CSITE_<p>_LOG is copied into CORESIGHT_CFG_CSITE_<p>_SNAP (which
results in deassertion of csite_<p>_trig to ‘0’ too). SNAP_CSITE_<p> clears to ‘0’ on the next clock cycle after which it was set to ‘1’;
- Value of csite_<p>_trig is reflected in CORESIGHT_CFG_EXT_DBG_LOG_STATUS
[ CSITE_<p>_TRIG ] respectively. Below are on L1warm reset (csite_l1sysreset_rstn) and their reset value is ‘0’:
- CORESIGHT_CFG_CSITE_<p>_((LOG)|(SNAP))_((HIGH)|(LOW))
- CORESIGHT_CFG_EXT_DBG_LOG_CTL[SNAP_CSITE_<p>]
csite_<p>_trig
- CORESIGHT_CFG_EXT_DBG_LOG_STATUS [ CSITE_<p>_TRIG ]
- CORESIGHT_CFG_EXT_DBG_TRIG_MASK [ CSITE_<p> ]
The following registers are RO for software:
- CORESIGHT_CFG_CSITE_<p>_((LOG)|(SNAP))_((HIGH)|(LOW))
- CORESIGHT_CFG_EXT_DBG_LOG_STATUS [ CSITE_<p>_TRIG ]
The following are RW for software:
- CORESIGHT_CFG_EXT_DBG_LOG_CTL[SNAP_CSITE_<p>]
- This bit can be set to ‘1’ by software and hardware auto-clears it on subsequent cycle. Priority is given to hardware clearing action than software write action.
- CORESIGHT_CFG_EXT_DBG_TRIG_MASK
CORESIGHT_CFG_SCR_EXT_DBG_LOG_STATUS protects:
- CORESIGHT_CFG_CSITE_<p>_((LOG)|(SNAP))_((HIGH)|(LOW))
- CORESIGHT_CFG_EXT_DBG_LOG_STATUS [ CSITE_<p>_TRIG ]
CORESIGHT_CFG_SCR_EXT_DBG_LOG_CTL protects:
- CORESIGHT_CFG_EXT_DBG_LOG_CTL
CORESIGHT_CFG_SCR_EXT_DBG_TRIG_MASK protects:
- CORESIGHT_CFG_EXT_DBG_TRIG_MASK
As always, SCRs are on csite_sysreset_rstn (which is an l2warm reset). The above algorithm is implemented on logic running on DBGAPB_CLK.
- Typical Usage Model
The LOG counters start updating out of reset. However, out of reset, the MASK is ‘0’ and hence, no interrupt is generated. Programming the corresponding MASK bit as ‘1’ can enable interrupt generation. If any activity prior to this needs to be ignored, write ‘1’ to corresponding
- CORESIGHT_CFG_EXT_DBG_LOG_CTL[SNAP_CSITE_<p>] bit. That way
- CORESIGHT_CFG_CSITE_<p>_SNAP is updated with CORESIGHT_CFG_CSITE_<p>_LOG and hence,
counts prior to this do not trigger an interrupt.

- Design for Debugging (DFD)
- After programming the MASK bit, if value in CORESIGHT_CFG_CSITE_<p>_LOG exceeds value in
CORESIGHT_CFG_CSITE_<p>_SNAP, an interrupt is generated. The processor handling the interrupt must program the CORESIGHT_CFG_EXT_DBG_LOG_CTL[SNAP_CSITE_<p>] bit to ‘1’. This causes
- CORESIGHT_CFG_CSITE_<p>_SNAP to be updated with CORESIGHT_CFG_CSITE_<p>_LOG value
and thus clear the interrupt.
- Finally, CORESIGHT_CFG_CSITE_<p>_LOG and CORESIGHT_CFG_CSITE_<p>_SNAP are compared
for equality and not greater/less-than. Hence, overflow is not an issue and even if it is a concern, the 64-bit value overflows after more than 15 years even if DBGAPB is run at its maximum frequency of 136MHz. Software is responsible to log such debug attempts to non-volatile media. Counters are reset on an L1warm reset. Hence, software is responsible for logging the information to non-volatile media if required for use later. Boot ROM does not cause a chip reset request to be generated or turtle mode to be entered based on these sidebands from DFD. This is because invalid attempts may occur. To differentiate between innocent invalid attempts and intentional invalid attempts, software/OEM uses BCT bits to determine when to start checking for such attempts and what actions to take.
#### 9.10.2.4 Watchdog for Debug and Recovery
- Typical Watchdog Timers (WDTs) in the SoC have five expiration events. The 1st and 2nd
expirations trigger IRQ and FIQ for the processor with which they are associated. The 3rd expiration is routed to the system LIC and can map to CCPLEX's (or any other processor e.g., SCE's) IRQ. For subsequent sections, it is assumed that LIC maps the 3rd expiration to CCPLEX. The 4th expiration typically triggers a Level-2 reset, while 5th expiration triggers a Level-1 reset. Watchdogs can be used for debug or recovery. "Debug" here implies trying to understand what went wrong. "Recovery" here implies trying to get the processor to restart work, ignoring what went wrong. The OS can either use a scheduled task to clear a watchdog timer periodically, or it could use the 1st expiration of the watchdog timer as interrupt with ISR to clear the watchdog. Reaching 2nd expiration is an indication that software was unable to clear the watchdog in an expected manner and should be an indication of system not behaving in a normal functional manner. For debug purposes, upon 2nd expiration, the processor can store all its context in DRAM and wait for 3rd expiration. The 3rd expiration triggers an interrupt to CCPLEX, which can check which WDT's 3rd expiration triggered and store system (e.g., other BTCMs, SYSRAM, any other system context as required/accessible) context in DRAM. It can then wait for the 4th expiration from the tripping WDT. For debug purposes, when RAM dump is enabled, the Level-2 reset request from WDT/CSITESW/HSM causes the CCPLEX caches to be flushed, DRAM to be put in self-refresh, and then L2 reset is asserted. Post L2 reset, system boots until MB2 and DRAM contents can be scavenged by a tool on the host machine via talking to MB2 via XUSB.

- Design for Debugging (DFD)
For recovery purposes, upon 2nd expiration, the processor, if capable may reset itself. If unable to do so, for AUXP, it could rely on the CCPLEX to reset it upon 3rd expiration. Upon 4th expiration, RAM dump is disabled if the system intends to recover rather than debug. The system should be able to boot to kernel upon L2 reset. Kernel can extract and process the RAS related contents and eventually trigger a L1 reset (via SWMAINRST) causing the chip to reboot. L1 reset resets most of the SoC. Boot ROM may choose to boot the chip or request PMIC to trigger an external reset to the chip based on the BR-PMIC structure loaded in SCRATCH by MB1. There are various hardware and software components, and various exceptions/caveats can come into play. The subsequent sections provide information on what is present in hardware and recommendations for software on how to leverage the hardware features.
##### 9.10.2.4.1 Various WDTs in the SoC
The table below gives an overview of various WDTs in the system and any caveats pertaining to them. #
- WDT (AMAP
- Aperture)
- Owner/Use Case
- Comments
- TOP WDT0 (WDT0)
- CCPLEX
- TOP WDT1 (WDT1)
- TOP WDT2 (WDT2)
- APE (Cortex-A9)
- APE WDT
(APE_TKE_WDT)
- Do not use
4th and 5th expiration triggers are not connected to anything.
- BPMP WDT
(BPMP_TKE_WDT)
- BPMP
- SPE WDT
(AON_TKE_WDT)
- SPE
- Probability of SPE WDT 4th/5th expiration as
the cause of reset being low because SC7RF issues a CSITE-SW reset if wake from SC7 is due to SPE WDT’s 3rd expiration. SC7RF stores the cause, i.e., SPE WDT expiration, in a scratch register for software to know if
- CSITE-SW reset was triggered as result of
the above wake event. 1st expiration (drives IRQ) and 2nd expiration (drives FIQ) can potentially trigger wake (through aggregated IRQ and FIQ which are programmable wake events), although typically these are intended to be handled by SPE-FW. 3rd expiration is an AO-NPG WAKE event. 4th expiration is also an AO-NPG wake.
- However, this should not be used as a
wake event.
- AOWDT (RTC)
- SPE
- AOWDT is a system resource and ownership
may be shared or taken over by any other entity like BPMP/SCE/ CCPLEX based on software architecture or OEM/Platform specific needs when the chip is not in SC7 mode. This should only be used for recovery. Always runs only on 32-kHz source. 2nd expiration triggers a WAKE event. 4th expiration does not trigger RAMDUMP even if RAMDUMP_EN=1.
- Thus, its 4th expiration always triggers
L2 reset.
- SCE WDT
(SCE_TKE_WDT)
- SCE
- RCE WDT
(RCE_TKE_WDT)
- RCE

- Design for Debugging (DFD)
#
- WDT (AMAP
- Aperture)
- Owner/Use Case
- Comments
- DCE WDT
(DCE_TKE_WDT)
- DCE
- PVA0 WDT
(PVA0_TKE_WDT)
- PVA0 (Cortex-R5)
4th and 5th expiration triggers are not connected to anything. - - -
- FSI WDT
(Total: 5 WDTs)
- FSI
For each WDT: 1st and 2nd expirations routed to both,
- R52 and Cortex-R5. 1st expiration can be
used for IRQ and 2nd expiration for FIQ for processor handling the WDT. 3rd expiration: refer to the FSI TOP CTI Mappings section. 4th expiration supports L2 reset (with
- RAMDUMP) and 5th expiration supports
L1 reset. The PMC_IMPL_RST_STATUS_0 can be used to determine the source of a reset. WDT 5th expirations, for WDTs that can trigger L1 reset, can also trigger an external PMIC reset to the chip based on PMC_IMPL_RST_REQ_CONFIG_0. However, the platform PMIC must support this capability to accept a side band input for reset request.
#### 9.10.2.5 Global Freezing for WDTs
##### 9.10.2.5.1 Overview
There are two bits in the chip that can freeze all WDTs (subject to certain conditions described below).
- PMC_MISC_WDT_FREEZE_REQ_0[FREEZE_REQ] is an MMIO register[bit] added to PMC, which can
be used by software for freezing WDTs. This register is on L1cold reset with reset value of ‘0’ (‘UNFREEZE’) and protected by an SCR. There is also a creg bit (DC_MISC_CTL.wdt_disable). This is only accessible to MCE and MTS code owned by NVIDIA and hence, not usable by Arm software or other entities that can access MMIO registers. MCE/MTS’s ability to drive the creg bit is qualified by the CPU DFD disable bit. The signal from creg is routed only to PMC, which is in AO power-domain. The signal should have a debug clamp and the clamped value for the creg signal should be ‘0’. The PMC bit and the creg bit are OR’ed in PMC and the OR’ed output (dfd2all_wdt_freeze) drives the wdt-freeze input to all the WDTs. Additionally, all WDTs also use locally available debug-enable signal from DFD to qualify the wdt-freeze request. The wdt-freeze request signal is ignored if the local debug-enable is ‘0’. Each of the WDTs also have a software programmable bit

- Design for Debugging (DFD)
(DisallowWDTFreeze) that when set can cause the individual WDT to ignore wdt-freeze signal request. Refer to the Timers chapter for details. #
- WDT (AMAP Aperture)
- Signal Driving WDT’s DBGEN
- TOP WDT0 (WDT0)
global_dbgen
- TOP WDT1 (WDT1)
global_dbgen
- TOP WDT2 (WDT2)
global_dbgen
- APE WDT (APE_TKE_WDT)
ape_dbgen
- BPMP WDT (BPMP_TKE_WDT)
bpmp_dbgen
- SPE WDT (AON_TKE_WDT)
spe_dbgen
- AOWDT (RTC)
spe_dbgen
- SCE WDT (SCE_TKE_WDT)
sce_dbgen
- RCE WDT (RCE_TKE_WDT)
rce_dbgen
- DCE WDT (DCE_TKE_WDT)
dce_dbgen
- PVA0 WDT (PVA0_TKE_WDT)
pva0_dbgen - - -
- FSI TKE WDT
dfd2fsi_cluster0_core0_dbgen & dfd2fsi_cluster1_core0_dbgen & dfd2fsi_cluster1_core1_dbgen & dfd2fsi_cluster1_core2_dbgen & dfd2fsi_cluster1_core3_dbgen The local debug-enable should use a debug clamp while crossing from the SoC to AO and clamped value should be ‘0’. Note: The signal from PMC to freeze all the WDTs is called dfd2all_freeze_wdt_req. Do not confuse it with the signal dfd2all_freeze_timers_req that is driven from DFD. dfd2all_freeze_timers_req can freeze timers (and WDTs if WDT’s source is not TSC) whereas dfd2all_freeze_wdt_req can only freeze WDTs. The mask bit in TKE and related units, DisallowWDTFreeze, used to mask dfd2all_freeze_wdt_req is protected using the TKE’s sticky safety protect bit – StickyEnabled. However, the StickyEnabled does not and must not protect (prevent writes) to the bit – HDBG that masks dfd2all_freeze_timers_req. Most of the individual debug-enables are derived from a few common debug-enable signals. The status of most such debug enables can be inferred from CORESIGHT_CFG_DND_STATUS_0 and
- CORESIGHT_CFG_CUSTOMER_DFD_ALIVE_STATUS_0 (FSI related are in
- CORESIGHT_CFG_FSI_DBG_ALIVE_STATUS_0) and can help determine whether a specific WDT will
be frozen after programming PMC_MISC_WDT_FREEZE_REQ_0[FREEZE_REQ] or DC_MISC_CTL[WDT_DISABLE].

- Design for Debugging (DFD)
##### 9.10.2.5.2 Boot Impact
- Boot/SC7RF software that programs the SCRs for *TKECR_0[HDBG] must allow AXI-AP access to
modify the HDBG bit.
##### 9.10.2.5.3 Reset and Timer Source for WDTs
All WDTs except SPE WDT (AON_TKE_WDT) and AOWDT (RTC) use L2warm reset. SPE WDT (AON_TKE_WDT) uses L2cold reset. AOWDT (RTC) uses L1cold reset. AOWDT is used to recover from hangs occurring during L2 reset. AOWDT expiration period must be long enough such that even if L2 reset occurs before AOWDT 3rd expiration and, hence, software that is expected to pet AOWDT is unable to do so, due to the large period, post L2 reset, chip can boot up to a point where Boot ROM executes and software entities that can handle AOWDT are loaded and are able to pet or restart the AOWDT. That is, the AOWDT’s period between two expirations should be longer than entire duration of L2 reset (including preceding actions like cache flush, putting DRAM in self refresh, power sequencing, etc.) and subsequent Boot-SW execution (including time for steps like loading, authenticating, decrypting and executing sary binaries, system initialization, etc.). Thus, Boot ROM must not be required to pet AOWDT even if it is ticking post L2 reset. (Typically, for AOWDT, timeout is recommended to be configured as 10 seconds.) Similarly, Boot ROM must not be required to pet SPE WDT post SC7 exit even though it is ticking across the warm reset. Duration of SPE-WDT must also be large enough to accommodate such boot post SC7 exit until software expects to pet or handle SPE-WDT expirations is able to do so without causing SPE-WDT to reach its next expiration before the software is able to service the prior expiration if required.The timer to be selected for AOWDT and SPE-WDT must be the always running TSC. Configuration options exist for selecting other timer sources, but software must refrain from selecting any other timer. This is because timers other than TSC stop counting on L2 reset assertion, while the TSC is on L1 reset.
##### 9.10.2.5.4 AO-WDT
- AO WDT is a system resource, not a cluster specific resource. AO-WDT serves as an in-chip
alternative for external PMIC WDT. The external PMIC WDT can be disabled and the more convenient AO-WDT can be used if required. AO WDT uses the 32-kHz clock and remains active in power state when OSC is stopped and/or OSC has issues and/or other WDT are rail gated. For SC7 state, the SPE WDT can be used, as it also present in AON cluster. The AO WDT works during cases when OSC is shut off. AO WDT provides a new time-based SC7 wake signal, possibly easier to use than the RTC based alarms (RTC alarms are not periodic). As AO-WDT is a system resource, its expirations are mapped as follows:

- Design for Debugging (DFD)
1st expiration: IRQ to SPE 2nd expiration: If system is in SC7 state, this triggers a WAKE. If system is not in SC7 state, this triggers interrupt (depending on wake tier config) to SPE VIC (Tier-0), BPMP VIC (Tier-1), or CCPLEX GIC (Tier-2). 3rd expiration: Does not trigger wake. Remote interrupt to LIC like other WDTs. 4th expiration: Do not enable. 5th expiration:
- If L1BAOWDTRST_WDT_OUT_RST_EN==1, toggles externally visible signal that can act as
side-band to PMIC to request a chip reset. If L1BAOWDTRST_WDT_OUT_RST_EN==0, generates an L1 reset request.
##### 9.10.2.5.5 Typical WDT Expiration Behavior
Unless specified otherwise, typical WDT expirations are as follows: 1st expiration – IRQ to processor owning the WDT 2nd expiration – FIQ to processor owning the WDT 3rd expiration – Remote interrupt to LIC 4th expiration – Triggers L2 reset request. If RAMDUMP is enabled, CCPLEX caches are flushed and DRAM is put in self-refresh. Then L2 reset occurs. 5th expiration – Triggers L1 reset request. If RAMDUMP_EN==1 && RAMDUMP_WDT_L1_DISABLE=0xA, the reset request is masked. Else, L1 reset occurs. Note: HSM and CSITESW reset triggers an L2 reset with support for RAMDUMP too.
##### 9.10.2.5.6 WDT Programming Guidelines
The previous subsections describe WDT expiration related features in hardware. This section provides guidance on how the features in hardware can be used by software for system Debug and Recovery. Software may choose alternate implementations based on specific circumstances. Upon L0/L1 reset, all WDTs are disabled.
- ROMs
1.
- Boot ROM does not enable any WDT except for its local WDTs (i.e., BPMP WDT) when
applicable (i.e., when its respective WDT enable fuses are burnt). a. b. Boot ROM enables BPMP WDT’s 5th expiration based on fuse. During bringup, do not burn these fuses. 2. 3. When Boot ROM enables its WDTs, they only enable the 5th expiration. Boot ROM does not program the sticky bits in any WDT.

- Design for Debugging (DFD)
4. Boot ROM programs the WDT timeout such that expiration interval is at least 10s. If there is no expiration skipping, then as 5 expirations are encountered for reaching 5th expiration, each expiration timeout should be at least 2s. Thus, total duration to reach 5th expiration = 5 expirations x 2s/expiration = 10s. If skipping directly to 5th expiration, then timeout per expiration should be 10s, as only one expiration duration is encountered before actions associated with 5th expiration occur.
- TSC does not run during Boot ROM phase. During BR, WDT must use the microsecond timer
running off the OSC clock. If it is a WDT/HSM/CSITESW L2 reset and RAMDUMP_EN=1, it is a L2-RAMDUMP Boot. 1.
- Boot ROM does not decide whether to regenerate or reuse the carveout keys based on
SCRATCH_SECURE_RSV50_SCRATCH_0. This is delegated to MB1. 5. 6.
- SC7RF
1. If it is a warm reset (SC7 exit) where the cause for the wake is SPE-WDT 3rd expiration and if RAMDUMP_EN=1, then Boot ROM does normal SC7 exit and passes execution to SC7RF.
- SC7RF logs the SPE WDT 3rd expiration wake event in an AO-SCRATCH register and issues a
CSITE-SW L2 reset.
- MB1 (with additional MCE guidelines)
1.
- MB1 programs PMC_MISC_DEBUG_AUTHENTICATION_0 and
PMC_IMPL_RAMDUMP_CTL_STATUS2_0[RAMDUMP_EN] based on BCT.
- Post-L2 reset, if ((PMC_IMPL_RAMDUMP_CTL_STATUS2_0[RAMDUMP_EN]==1) &&
(PMC_IMPL_DEBUG_AUTHENTICATION_0[SPIDEN]==0 ||
- FUSE_DEBUG_AUTHENTICATION_0[SPIDEN_DIS]==1)), MB1 issues an L1 reset
- MB1 decides whether to regenerate or reuse the MSS carveout keys based on BCT and NV-
policy. 2. 3.
- If (Preproduction mode)
{ Do not regenerate keys for any carveout. Instead, reuse/redistribute existing keys. } else { if ((ECID_Check==MATCH) & ((PMC_IMPL_RAMDUMP_CTL_STATUS2_0[RAMDUMP_EN]==1) &&

- Design for Debugging (DFD)
(PMC_IMPL_DEBUG_AUTHENTICATION_0[SPIDEN]==1 &
- FUSE_DEBUG_AUTHENTICATION_0[2]==0)))
// FUSE_DEBUG_AUTHENTICATION_0[2] is fuse for spiden_dis {
- Regenerate and distribute MSS carveout keys (e.g., MTS, TZ, VPR, GSC) based on BCT (If BCT
suggests don’t regenerate the specific key(s), then don’t regenerate specific key(s) and instead reuse/redistribute existing key(s).) } else { Regenerate and distribute all MSS carveout keys (e.g., MTS, TZ, VPR, GSC) independent of BCT } 1.
- If ((RAMDUMP_EN==1) and (IST Boot**))
a. {Do not set the sticky lock-bits ( WDTCMDR_0[StickyStart] ) in WDTs} 2.
- If (PMC_IMPL_RAMDUMP_CTL_STATUS2_0 [ RAMDUMP_EN ] ==1)
a. { PMC_MISC_WDT_CFG_0 [ RAMDUMP_WDT_L1_DISABLE ] = 0xA } 3.
- If WDT/HSM/CSITESW-L2 Boot with RAMDUMP_EN=0, it is a L2-RAS Boot. Continue normal
boot flow on path to boot to kernel. RAS-FW then stores RAS contents into Flash and issues an L1 reset.
- If WDT/HSM/CSITESW-L2 Boot w/ RAMDUMP_EN==1 and
(PMC_IMPL_DEBUG_AUTHENTICATION_0[SPIDEN]==1 && FUSE_DEBUG_AUTHENTICATION_0[SPIDEN_DIS]==0), it is an L2-RAMDUMP Boot.
- If L2-RAMDUMP Boot, and DRAM is in self-refresh,
4. 5. a. MB1 disables ECC check based on BCT. i.
- IF (RAMDUMP-Boot && DRAM in self-refresh &&
- BCT:ECC_CHECK_DISABLE_DURING_RAMDUMP),
- THEN, program ECC_CHECK_DISABLE=ON
b.
- MB1 takes DRAM out of self-refresh
6.
- MB1 loads CPU-MB2. (Note: If possible, do not load SPE-FW during L2 boot with RAMDUMP
enabled. That way, if L2 was post a SPE 3rd expiration in SC7, then, MB2 could potentially scavenge SPE related contents too.)
- CPU-MB2

- Design for Debugging (DFD)
1. 2. RAMDUMP logic to extract OEM carveouts from DRAM is part of MB2 binary.
- If RAMDUMP boot is enabled, MB2 waits for USB host commands and dumps the OEM-
DRAM carveout if RAMDUMP boot is enabled. Commands from host-side to MB2: 3. a. find cause of L2 reset i.
- For example, which WDT/HSM/CSITESW triggered L2-RAMDUMP and if CSITESW, then
also contents of SCRATCH_SECURE_RSV106_SCRATCH_0 /
- SCRATCH_SPE_WDT_3RD_EXPIRY_DURING_SC7
- SCRATCH assigned above must be cleared during L0/L1 reset but not during L2 reset
ii. b. query DRAM size dump DRAM contents from PA: X to Y dump ETF RAM contents continue boot c. d. e. 4. 5. On receiving continue boot, MB2 provides reset of the boot. RAS contents are extracted by later boot-stages by Secure Arm software. BPMP-IST (This executes on the IST-Boot path): {
- Do all the stuff that BPMP-IST needs to do before setting pre-ist-mode bit [No change]
- If (RAMDUMP_EN==1)
{
- Disable 4th expiration of armed WDTs
If (PMC_IMPL_RAMDUMP_CTL_STATUS_0[RAMDUMP_CSTATE]!=IDLE), spin in loop. }
- PMC_MISC_WDT_CFG_0[IST_L1L2_DISABLE] = 0xA
- Set the pre-ist-mode bit. [No change]
- Do all the stuff that BPMP-IST needs to do after setting pre-ist-mode bit [No change]
} Note: IST Boot refers to the Boot that occurs upon an L1 reset after which MB1 loads BPMP-IST instead of MB2. Additional Guidelines on Handling WDT Expirations: 1st expiration:
- Upon 1st expiration of a WDT, IRQ for processor owning the WDT should restart
corresponding WDT. (e.g., set WDTCMDR_0[StartCounter]=1) 2nd expiration: Upon 2nd expiration of the WDT, check if debug is enabled for the particular processor.

- Design for Debugging (DFD)
If system debug has been enabled, store the cluster's state (e.g., CPU registers, local cache's, BTCMs, etc.) used by the processor in DRAM and wait for 3rd expiration.
- If system is in mission mode, software can attempt to recover the subsystem if security
permits. For example, the processor can change its reset vector to the starting location of the firmware and request itself to be reset. 3rd expiration: This is routed as a remote interrupt to the LIC.
- If system debug has been enabled, CCPLEX can request the other processors to save their
state in DRAM. It can also save its own state and any system state (e.g., SYSRAM) that can help debug into DRAM. Then it can wait for system to be reset via L2 reset. If the 3rd expiration occurred in SC7 state, then there are no contents from other processors to be stored. SC7RF logs the event in SCRATCH and issue CSITESW L2 reset (which also supports DFD-RAMDUMP). FSI 3rd expiration is not routed to LIC directly. However, as it is routed to R52 GIC and Cortex- R5 VIC, either of them can scavenge the state of the other, i.e., if FSI-R52 WDTs were tripping,
- FSI-R5 can scavenge R52’s state it can access; or, if FSI-R5 WDT was tripping, FSI-R52 can
scavenge Cortex-R5’s state (as much as it has access to; for security reasons, all state may not be accessible; in which case any information helpful for debug may be logged). Additionally, FSI WDT 3rd expiration is also routed to FSI_TOP_CTI, from there it can trigger an interrupt to the processor that services WDT 3rd expiration LIC interrupts for rest of the SoC via cross-trigger network for it to scavenge and store and debug pertinent information.
- If system is in mission mode, CCPLEX may attempt to recover the cluster that reached 3rd
expiration by resetting the cluster depending on the particular platforms security settings. 4th expiration: This triggers a L2 reset. See above on boot post L2 reset. 5th expiration:
- This triggers a L1 reset. Based on PMC_IMPL_RST_REQ_CONFIG_0, it may result in request to
- PMIC to trigger an external reset in which case, system post boot sees it as a L0 reset
- Additional Guidelines on Programming WDTs (from Debug and Recovery Perspective)
The following table provides a broad recommendation on how WDTs should be configured across the chip.
- WDT
- Debug
- Recovery
expiration 1st 2nd 3rd 4th 5th 1st 2nd 3rd 4th 5th
- TOP_WDT0
- EN
- EN
- DIS
- EN
- DIS
- EN
- EN
- DIS
- EN
- EN
- TOP_WDT1
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- TOP_WDT2
- EN
- EN
- EN
- EN
- DIS
- EN
- EN
- EN
- EN
- EN

- Design for Debugging (DFD)
- WDT
- Debug
- Recovery
- AOWDT
- EN
- EN
- EN
- DIS
- DIS
- EN
- EN
- EN
- DIS
- EN
- SPE_WDT
- EN
- EN
- EN
- EN
- DIS
- EN
- EN
- EN
- EN
- EN
- - - - - - - - - - -
- BPMP_WDT
- EN
- EN
- EN
- EN
- DIS
- EN
- EN
- EN
- EN
- EN
- SCE_WDT
- EN
- EN
- EN
- EN
- DIS
- EN
- EN
- EN
- EN
- EN
- RCE_WDT
- EN
- EN
- EN
- EN
- DIS
- EN
- EN
- EN
- EN
- EN
- DCE_WDT
- EN
- EN
- EN
- EN
- DIS
- EN
- EN
- EN
- EN
- EN
- PVA0_WDT
- EN
- EN
- EN
- DIS
- DIS
- EN
- EN
- EN
- DIS
- DIS
- PVA1_WDT
- EN
- EN
- EN
- DIS
- DIS
- EN
- EN
- EN
- DIS
- DIS
- APE_WDT
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- DIS
- FSI_WDT
- EN
- EN
- EN
- EN
- DIS
- EN
- EN
- EN
- EN
- EN
Note: The gray cells must always be programmed as indicated. Note: The WDT 3rd expiration routes an interrupt to Legacy Interrupt Controller (LIC). LIC can be programmed to route this interrupt to any processor (e.g., CCPLEX, BPMP, etc.). Also, the local interrupt controller for the processor (e.g., VIC, GIC, etc.) may choose to trigger IRQ/FIQ to the processor based on its configuration. The above table assumes the 3rd expiration events are routed by LIC to CCPLEX and hence, CCPLEX itself does not need to enable 3rd expiration for its own WDT. This applies for any other processor. (If BPMP were to be responsible for handling WDT 3rd expiries from other processors, the 3rd expiration for WDT owned by CCPLEX would be enabled and that for BPMP would be disabled). In the above table, APE_WDT is shown as unused because APE is expected to use TOP_WDT2. TOP_WDT1 is current unused as shown above. If there is a viable use for it, it may be programmed based on the use case. FSI WDT 3rd expiry is not routed to LIC. Instead, it is routed to FSI_R52_GIC, FSI_R5_VIC and FSI_TOP_CTI.
#### 9.10.2.6 Debugging Low Power States
##### 9.10.2.6.1 SC7 Debug Mode
In True SC7 state, most of the SoC and the entire CCPLEX and GPU are powered off. However, SPE processor and other logic in the Always ON (AON) cluster is powered and active. There could be

- Design for Debugging (DFD)
issues in the AON cluster that may need to be debugged using DFD components. However, DFD partition is powered by the VDD_CORE power rail, which is typically shut down in True SC7 state.
- To debug components in the AON cluster using DFD components in VDD_CORE domain, a new
state was created – SC7 Debug Mode. In this SC7 Debug state, the system requirements are as follows: VDD_CORE rail must remain powered ON throughout SC7 transition.
- Note: Throughout SC7 transition implies: during SC7 debug mode entry, during SC7 debug
mode execution, and during SC7 debug mode exit. The voltage on the VDD_CORE rail, when it is ON must be sufficient for SoC operation. DFD partition is not reset at any time throughout SC7 transition. The following signals are not clamped and transmit their values in normal functional manner. From/to DFD to/from AON cluster. From Fuse to DFD cluster.
- Note: Signals to the AON cluster from the rest of the SoC (including clusters like CCPLEX,
- GPU, etc.) should be clamped as per their regular SC7 clamp values. This ensures that for
the logic in the AON partition, the SoC appears similar to how it would during a True SC7 state.
- To support SC7 Debug Mode in Open Box Debug environment (i.e. over ArmJTAG), there are
additional requirements: JTAG pads/IOs are functional and can perform JTAG transactions.
- Signals from/to JTAG pins to/from DFD partition are not clamped and transmit their values
in normal functional manner.
- To support SC7 Debug Mode in Closed Box Debug environment (i.e., over SWD-DFD), there
are additional requirements: USB2 pads/IOs and padmacro are functional and can operate USB2 pins in SWD mode.
- Signals from/to USB2 pins to/from DFD partition are not clamped and transmit their values
in normal manner.
- SC7 Debug Flow Details
- Program PMC_IMPL_SC7_DEBUG_CTRL_0[GLITCH_FREE_CLKEN]=ENABLE while enabling
SC7 Debug mode to avoid clock glitch issues during SC7 Debug exit.
- Program PMC_IMPL_SC7_DEBUG_CTRL_0[DFD_CLAMP_OVERRIDE]=1 to avoid DFD signals
from being clamped during SC7 Debug mode.
- Retain PMC_IMPL_SC7_DEBUG_CTRL_0[MAIN_CLAMP_DEBUG]=0 to ensure non-debug
related signals are clamped during SC7 Debug mode.
- Program PMC_IMPL_SC7_DEBUG_CTRL_0[DBGRST_OVR]=1 to avoid DFD from being reset
during SC7 Debug exit.
- Retain PMC_IMPL_SC7_DEBUG_CTRL_0[RESET_DEBUG]=0 to ensure warm reset is asserted
during SC7 Debug exit.

- DFD Registers
- Program PMC_IMPL_SC7_DEBUG_CTRL_0[DPD_ENABLE_DEBUG]=1 to ensure pads do not
enter Deep-Power-Down (DPD) state during SC7 Debug mode.
- Program CLK_RST_CONTROLLER_AON_CPU_PGRST_CTRL_0[AON_PG_EMULATE]=1
- Skipping this programming step causes debug-logic in AO-PG to be held in reset when AO-
PG is power-gated in SC7 Debug mode.
- Note: If ACCESS BLOCK/TIMEOUT features in DFD are not enabled, a debug-APB access to
a cluster held in reset will hang.
- Program PMC_IMPL_CNTRL_0[PWRREQ_OE]=1 to ensure VDD_CORE remains powered on
during SC7 Debug.
- Clocks
- OSC may be turned off in SC7 mode. Hence, 32 kHz is available as a source for DBGAPB and
CSITE, and LA clock muxes.

