# 7 txns

- W2P
turn Penalty (hidden behind w2p)
- RCD
- TA catchup
- RAS
- Total
Different latency allowance rubrics are used for: 1. 2. 3. 4. bandwidth-soak read clients low-latency CPU read clients
- ISO read clients (i.e., display)
write clients The rules are programmed by the NVIDIA driver based in information provided from an API.
- Latency Allowance for Bandwidth-Soak Read Clients

- Memory Subsystem (MSS)
Bandwidth soak clients use the above equation and assume that client_bandwidth is 85% of the peak_dram_bw. The LA for NISO read clients at peak dramclk frequency is 41 tickets; for SISO clients it is 37 tickets.
- Note that client_bandwidth, unloaded_latency_minus_snap_arb_to_row_sorter, and
expiration_time are all functions of clock frequency. For highest accuracy, perform this calculation for each set of operating frequencies. However, since the frequency-dependent terms are roughly inversely proportional to dramcclk frequency and, assuming the various clock frequencies in the MSS pipeline roughly scale with each other, the latency allowance is estimated at a given frequency by: latency_allowance = target_latency_allowance (at base_freq)
- (base_freq / emcclk_freq)
At low frequencies, the latency allowance can be larger than the maximum value allowed by the register field and so capped at this maximum value (255 ticks, where a tick is 30 nsec). Since latency_allowance for bandwidth soak clients depends on frequency, the values must be updated when a frequency change occurs. The proper values are programmed by emc_reg_calc.h. Note that this equation does not take into account large latency disruptions caused by infrequent events (also called bandwidth disruption events).
- Latency Allowance for CPU Read Clients
Because CPU reads are latency-critical, the latency allowance needs to be short. The default is 4 ticks (120 ns), but the high-priority CPU request feature can drop it to 0 ticks for designated requests.
- Latency Allowance for ISO Read (i.e., display) Clients
Display clients differ in several significant ways from the non-ISO clients: 1.
- Non-ISO clients can tolerate occasional bandwidth disruptions or excess-latency events;
average throughput is what matters. Display clients can tolerate occasional bandwidth disruptions as long as there is enough data prefetched and buffered in the mempool to tolerate the bandwidth disruption; display clients must not underflow.
- Display’s internal latency tolerance is limited only by the number of queued up read
responses in its internal mempool buffer. The memfetch unit and display itself independently track progress through the frame. Memfetch greedily requests all the pixels required for a frame, subject only to back-pressure from MSS and isohub clock. The datapath portion of display reads pixels from the response buffer in raster order at the required rate. There is no internal buffer connecting memfetch and display proper that limits display’s latency tolerance. 2. Display’s internal mempool is used to tolerate: Total latency, which includes display internal latency, MSS static latencies + drain time of a saturated row sorter
- Bandwidth disruption events

- Memory Subsystem (MSS)
- DVFS events
- Blocklinear SMMU miss period buffering
- Fetch amortized buffering
Display’s MCCIF buffer is used to tolerate static latencies and all the usual dynamic latencies incurred during steady state operation of the memory subsystem (notably not bandwidth disruption or DVFS events). The considerations for determine display latency allowance are complex and are encapsulated in NVIDIA software.
- Latency Allowance for Write Clients
Because of the WCAM, the latency allowance for write clients is greatly simplified which required quick scheduling of writes so that write acknowledges could be returned. Once a request has passed the WCAM, even for a low-latency client like CPU, the contents of the write are globally visible. The scheduling of the write can be done to facilitate DRAM efficiency without direct impact on the client. It is desirable to have a high latency allowance for writes, so the row sorter has flexibility in when to schedule writes and there is time for multiple write requests to the same page to arrive and be processed together. The disadvantage to a long latency allowance for writes is that a large fraction of the row sorter may be tied up with writes and unavailable for buffering reads so that reads can be done efficiently. The latency allowance equation for writes is: latency allowance (emcclk) = min(255, 128*(1066 MHz/emcclk)) The deadline determined at the hub is ignored and all write requests are re-deadlined with LA
- MC_LATENCY_ALLOWANCE_CIFLL_WR_0 (0x3ff) at the channel. Direct turn arbitration generally
determines when writes are scheduled. Write scheduling is determined by direction turn arbitration, not deadline expiration. The large LA of 1023 ticks ensures that writes do not remain in the row sorter for an excessive time.
#### 3.1.2.15 Logical Transaction Pipeline
Requests enter and pass through the memory system in a logical pipeline and are distributed over memory-system components. These requests can spend differing amounts of time, may be steered to different paths, and potentially may be reordered. Client attributes may be modified at certain stages. The following table lists the stages in the logical pipeline for SoC clients. NVLink requests merge into the pipeline at the input request XBar in MCF and share the remainder of this pipeline. Two paths to DRAM memory are available: the non-coherent path, and the path through SCF which supports I/O coherence. Requests to SCF may (or may not) snoop the CPU caches
- Table 3.3 Logical Transaction Pipeline
- Location
- Operation
- Controlling Register(s)
- Effect

- Memory Subsystem (MSS)
- Client
- Interface
- Receive
transaction
- AXICIF
- MemType
override <C>_MEMTYPE_OVERRIDE
- SO_DEV=(AxCache==0bxx0x), may be overridden
based on register setting.
- AXICIF
- HubID
determination <MC>_HUB_MASK <C>_NORMAL_HUBID_OVERR
- IDE
<C>_NORMAL_HUBID <C>_SODEV_HUBID
- Determine HubID using address-based hash or
override value.
- PCFIFO
- PCFIFO
interlock
- PCFIFO_<C>_ORDERED_CLIE
- NT
- Conditionally stalls transactions until conflicting prior
transactions have completed.
- PCFIFO
- Large read
request coalescing
- MC_COALESCE_CTRL_0
- MC_CLIENT_COALESCE_CON
- FIG_*
<C>_COALESCER_ENABLED
- Whether to coalesce identified sequences of 64B read
requests into large read requests.
- Ring 1/Ring
- Virtual channel
determination <C>_TRAFFIC_TYPE_CONFIG
- Identify client as ISO, SISO, NISO
- TBU
- Wrapper
- AXI ID override
<C>_AXI_ID_OVERRIDE
- Conditionally overrides AXI ID
- TBU
- Wrapper
- NS, STREAMID
override <C>_NS_OVERRIDE <C>_STREAMID_OVEERIDE
- Conditionally overrides NS flag and Stream ID
- TBU
- Wrapper
- TBU steering
control
- SMMU_BYPASS_CTRL
<C>_TBU_MASK <C>_NORMAL_TBUID _OVERRIDE <C>_NORMAL_TBUID <C>_SO_DEV_TBUID
- Determine TBU ID (or TBU bypass)
- TBU
- Wrapper
- SMMU steering
control
- SMMU_CLIENT_STEERING_CT
- RL
<C>_SMMU_STEERING_CTRL
- Select between ISO and NISO SMMU
- TBU
- Wrapper
- Translation to
- ACE-Lite
- AXI fields and per-translation flags mapped to ACE-
Lite fields (AxCACHE, AxDOMAIN).
- AxDOMAIN forced to System Shareable (0b11) for
SO_DEV requests per AMBA specification.
- TBU
- Wrapper
- Preserve
- SO_DEV
through SMMU
- MC_TBU_TRANSACTION_ATT
R_CTRL
- TBU_SO_DEV_ATTR_PRESERV
E
- Whether to preserve upstream SO_DEV attribute
through SMMU (default) or reset it based on AxDomain in PTE.
- TBU
- Translation
- TBU page table entries and/or
internal registers
- Addresses transformed from virtual to physical. PTE
values determine or modify various transaction attributes.
- Request
- Coloring
- Block (RCB)
- Barrier
processing
- Consumes barrier request from TBU, sets CNTR_ID
attribute, tracks transactions by color, provides barrier response to TBU.
- Client Hub
- AXI to MCF
command mapping Map AXI to MCF commands.

- Memory Subsystem (MSS)
- Client Hub
- Coherent
steering and snoop control <C>_COH_PATH_OVERRIDE_
- NORMAL
<C>_COH_PATH_OVERRIDE_S O_DEV order_id
- SCF routing decision and conditional override of snoop
bit.
- Client Hub
- Order ID and
sequence_num generation
- MC_CLIENT_ORDER_ID
<C>_ORDER_ID
- Select order_id for ordered write clients and attach
sequence_num for ordered streams
- MCF
- Slice
determination
- CHANNEL_MASK_*
Map transaction to one of four MCF/SCF slices.
- SecChk
- Error checks
E.g., EMEM_BOM,
- EMEM_SIZE, SYSRAM_BOM,
- SYSRAM_TOM, GSC and VPR
checks, etc.
- Various error checks NISO_REMOTE requests that
DECERR map to NISO VC.
- Coherent
path
- SCF
- SNOC / URT
interlock
- Various
- Enforces ordering for ordered threads and same-
address ordering.
- SCF
- Coherence
fabric
- Various
- Requests with dependencies (on snoops or pending
transactions) may be stalled. Transactions may be merged or satisfied by SCF cache according to transaction rules.
- SCF
- Channel
determination
- SCF version of
- CHANNEL_ENABLE,
- CHANNEL_MASK_*
- SCF has its own copy of these registers for requests
originated from CCPLEX.
- Memory
- Destination
(DRAM,
- SysRAM,
- SyncPoint)
- Completion
- Various
- Transactions are completed according to Memory
- Destination ordering rules. ECC and/or encryption may
be applied.
- SCF
- Read response
reordering
- Various
- Responses to different addresses may be reordered by
the coherence fabric.
- SCF
- WrAck
reordering
- ORDER_ID_*
- WrAcks for ordered clients are processed in full or
partial order at URT. WrAcks may be reordered after URT.
- MCCIF
- Response
reordering Responses are returned to SoC clients in order.
- Noncoher
ent (direct) path
- MCF
- Channel
determination
- CHANNEL_ENABLE,
- CHANNEL_MASK_*
- Determine channel
- Memory
- Destination
(SCF cache,
- DRAM,
- SysRAM,
+SyncPoint)
- Completion
- Various
- Transactions are completed according to Memory
- Destination ordering rules. ECC and/or encryption may
be applied.

- Memory Subsystem (MSS)
- MCCIF
- Response
reordering Responses are returned to SoC clients in order.
#### 3.1.2.16 Transaction Ordering
Clients differ in their ordering and bandwidth requirements. The AXI interface provided at the client/MC boundary provides a general framework for expressing ordering. Some clients are not equipped to express their ordering requirements using AXI, so configuration registers are provided to specify ordering behavior for these clients.
##### 3.1.2.16.1 Normal MSS Clients
The DMA fabric treats all clients except NVLink and PCI ordered clients as normal clients. Normal MSS clients use the AXI ordering model for Normal memory by default. MSS provides the following ordering guarantees to each normal MSS client. 1.
- Read responses are returned in the same order that requests were received at the input to
the DMA fabric regardless of the AXIID, even though AXI only requires this for requests using the same AXIID. a.
- Reads can get data from younger writes since AXI places no ordering dependencies
between reads and writes. 2. Write acknowledges are returned in the same order that the writes were received at the input to the DMA fabric regardless of the AXIID. a.
- Writes can be completed in any order by the DMA fabric, but the write acknowledges
always return in order even though AXI only requires this for requests using the same AXIID. WrAck guarantees that all previous writes are globally visible.
##### 3.1.2.16.2 PCI Ordered Clients
For PCI-ordered clients such as PCIe, XUSB, and AZA_HDA, each IP is responsible for all PCI ordering requirements except for write after write (WAW) ordering. WAW ordering for these clients is the responsibility of both the client and the DMA fabric. MSS clients are not allowed to send a mixture of SO/DEV requests and Normal requests. The DMA fabric does not provide read after read ordering for any clients. SO/DEV reads requests are treated as Normal non-cacheable reads.
##### 3.1.2.16.3 High Bandwidth PCI Ordered Clients
High-bandwidth PCI-ordered writes use the SCF-interlock. The ordering interlock is implemented in SCF’s SNOC – a point where latencies are shortest since all interlock latencies are within one module. It directs full ordered bandwidth to one slice at a time. Each slice is provided with elasticity above and below the interlock to provide smooth bandwidth above and below the interlock.

- Memory Subsystem (MSS)
To use the high-bandwidth ordered architecture, client and software configuration must do the following: Client must connect to the ordered hub. If native AXI client: Client uses Device memory type. Client sets AXI ID to a constant value (e.g., 0). If legacy MCCIF client: Set AXI_ID_OVERRIDE to CGID_ZERO. All clients: Use MEMTYPE_OVERRIDE to force the MemType to Device. Set SO_DEV_HUBID to the appropriate value for the client. Set SO_DEV_TBUID to the appropriate value for the client. Disable the PCFIFO interlock for the client by programming the client-specific field in the MC_PCFIFO_CLIENT_CONFIG* register to UNORDERED. Set TRAFFIC_TYPE_CONFIG to NISO. Set ORDER_ID to one of ORD_1, ORD_2, or ORD_3. MSS hub configuration should steer requests to SCF. Requests are directed to an MCF slice using an address-based hash.
##### 3.1.2.16.4 Low Bandwidth PCI Ordered Clients
Low-bandwidth PCI ordered clients can use any client hub. They use the PCFIFO interlock during boot and use the high-bandwidth interlock afterwards. Client and software configurations must do the following:
- Client normally connects to the ordered hub but may connect to an unordered hub (for
example, if client requires ordering during boot but not during normal operation) If native AXI client: Client uses Device memory type. Client sets set AXI ID to a constant value (e.g., 0). If legacy MCCIF client: Set AXI_ID_OVERRIDE to CGID_ZERO. All clients: Use MEMTYPE_OVERRIDE to force the MemType to Device. Set SO_DEV_HUBID to the appropriate value for the client.

- Memory Subsystem (MSS)
Set SO_DEV_TBUID to the appropriate value for the client.
- Enable the PCFIFO interlock for the client by programming the client-specific field in the
MC_PCFIFO_CLIENT_CONFIG* register to ORDERED.
- TRAFFIC_TYPE_CONFIG may be programmed to NISO
- Set ORDER_ID to ORD_0 in the MC_CLIENT_ORDER_ID* register
Requests are directed to an MCF slice using an address-based hash.
- Requests can be routed through either the SCF or the MCF bypass path, using one of the
methods of specifying snooping/coherent routing. Ordered clients that need fast ordered writes must use the SCF path. Any client that consumes a buffer generated by an ordered client that wrote through SCF and depends on the ordering behavior must also use the SCF path.
#### 3.1.2.17 Error Checking and Reporting
There are multiple classes of errors that are detected by the system, as shown below. Containable means unrelated parts of the system may continue running while the affected client or subsystem is reset. The remaining columns describe what is done to the offending transaction, how the error is reported to the system, and how it is reported to the client.
- Table 3.4 Error Types and Responses
- Error type
- Where detected?
- Containa
ble
- Effect on
transaction
- Report to system
- Report to client
- Security check
failure
- Security check
blocks in MCF and
- SCF
- No
- DECERR bit set in
request.
- MCF: Log and
optional interrupt.
- SCF: Optional log and
interrupt (prefetcher can fetch out of range)
- Note: requests
arriving with DECERR from SMMU are not reported as failures at MCF.
- DECERR is reported
to client hub or
- NVLinkHub, but hubs
do not return DECERR to client.
- DECERR of PTC
request causes
- SMMU fault for
requests that hit on TLB entry.
- DRAM ECC
single-bit read error
- EMC
- Yes
- Correct data value
- Log and optional
interrupt
- None
- Pipeline ECC
single-bit error
- Point data is used
- Yes
- Correct data value
- Log and optional
interrupt
- None
- DRAM ECC
dual-bit read error
- EMC
- Yes
- None
- Log and optional
interrupt
- SLVERR bit set in data
packet
- Pipeline ECC
dual-bit error
- Point data is used
- Yes
- None
- Log and optional
interrupt
- SLVERR bit set in data
packet

- Memory Subsystem (MSS)
- Error type
- Where detected?
- Containa
ble
- Effect on
transaction
- Report to system
- Report to client
- Parity
- Any unit that acts
on the item other than forwarding
- No
- Forward or
suppress, whichever is most natural
- Log and optional
interrupt
- None
- Timeout
- MSS implements
no timeouts N/A N/A N/A N/A
- DECERRs are detected in the SMMU and in the security check blocks in SCF and MCF. A DECERR
indicates the request itself is bad, irrespective of the data. Since DECERRs must generate a response, they must be passed through the pipeline. The DECERR bit is set in the request, so the request is effectively a NOP as it passes through the pipe. DECERRs are routed through SCF, or the bypass path based on the normal parameters of the request. Since a DECERR may have an illegal address, and handling illegal requests is a burden we do not want every memory resource to deal with, all DECERR requests are directed to DRAM; to the DRAM channel indicated by the channel mask decode, ignoring all BOM and TOM registers. Writes with DECERRs are suppressed and reads with DECERRs return all 1's. In general, the unit that detects a DECERR, generates an interrupt for it (under configuration register control). DRAM ECC errors are detected in EMC. EMC corrects single-bit errors and optionally logs them (frequent single-bit errors may indicate an imminent hardware failure). Uncorrectable double-bit errors set the slave error (SLVERR) flag in the data packet, are logged, and optionally generate an interrupt. The SLVERR bit is propagated up to the client. Pipeline ECC errors are detected in the unit that receives the data (whether MSS or a requesting unit). Single-bit errors are corrected and may optionally be logged. Uncorrectable double-bit errors set the SLVERR flag in the data packet, are logged, and optionally generate an interrupt. The SLVERR bit is propagated up to the client. NVLink protocol errors are detected by NVLink logic based on detectable corruption of a request. The error is logged and an interrupt optionally generated. The logic detecting the error may kill the request or forward it on, whichever is most convenient, since there's no obvious way to fix it and a hang is likely to result in any case. Parity errors indicate corruption of the command or address. The error is logged and an interrupt optionally generated. The logic detecting the parity error may kill the request or forward it on, whichever is most convenient, since there is no obvious way to fix it and a hang is likely to result in any case. The client AXI interface returns both the DECERR and SLVERR bits. Typically, at most one is set, but if both are set, DECERR prevails. Clients may or may not observe, or act on error responses.

- Memory Subsystem (MSS)
#### 3.1.2.18 Access Checks (DECERRs)
SMMU performs access checks based on page-table access restrictions. Requests that fail are marked as DECERRs. The NVLink protection table performs address-based access checks for iGPU and NVLink Master requests. In addition, there are several categories of access checks, which ensure requests are legal and that they follow the access rules for apertures:
- Address Range Checks
- VPR Checks
- GSC Checks
- AON TZ-SRAM Checks
- TZ-DRAM Checks
- SMMU Translation Checks
iGPU Carveout Checks
##### 3.1.2.18.1 Location of Access Checks
These additional security and range access checks are performed in the security check blocks in one of two locations: 1. SoC client requests at the input of MCFSlice. Previously, SoC client checks were done within the two client hubs. Now there are four or more client hubs, plus GPU requests come in separately from the hubs. The location minimizes the number of instances of the security check logic, while protecting all SoC client inputs, whether coherent or not. If a request fails a security check, it causes a DECERR. Details of the violating request (address, client ID, failure
- ID) are logged in the MC_ERR_* registers. DECERR write requests are suppressed by clearing
byte enables. DECERR read requests return all 1's, thus preventing dissemination of secure data. If interrupts are enabled, MC throws an interrupt.
- CCPLEX requests at the ingress to SCF. CPU cluster requests are checked the ingress of
- SCF for the same reason as above—to distinguish CCPLEX requests from SoC client requests
in systems that can forward and merge requests. Since no lookup is needed for these tests, the latency can be folded into an existing pipeline stage. If a request fails a security check it is DECERRed. If the request came from a CPU client, an MCA event is generated with a code indicating the type of event (it is not necessarily an error). If the request came from a non- CPU client, no error logging is done. DECERR write requests are suppressed by clearing byte enables. DECERR read requests return all 1's, thus preventing dissemination of secure data. 2.
- Note that SoC client requests that enter SCF are guaranteed to have been fully checked for
DECERRs. They do not need to be further checked for DECERRs, although a given request may have its DECERR bit set based on a prior check.

- Memory Subsystem (MSS)
##### 3.1.2.18.2 Routing and Memory Destination Errors
Requests are routed to the various memory destinations (DRAM, SysRAM, etc.) over multiple paths (IO coherent path and non-coherent path). Not all combinations are supported. The following combinations are illegal and result in DECERRs and interrupts:
- DECERR_COH_ISO – ISO requests on the coherent path
- This error can be suppressed using the programmable register
MC_MCF_SCF_CFG_0.ALLOW_ISO_REQ_ON_COHERENT_PATH (default is to DECERR).
- DECERR_IGPU_RESTRICTED_ACCESS – iGPU is only allowed to access specific regions of
memory as defined by IGPU_ACCESSIBLE_CARVEOUT(1|2)_(BOM|SIZE)
- The status register MC_ERR_ROUTE_SANITY_STATUS_0 contains the encoding
- ERR_ROUTE_SANITY_ERR_TYPE which describes the kind of error. MC_ERR_ROUTE_SANITY_ADR_0
contains the address of the violating transaction. A new bit, DECERR_ROUTE_SANITY_INT, in the MC_INTSTATUS indicates routing related programming errors.
#### 3.1.2.19 Reporting of Functional Errors
- Each of the following MSS subunits can generate interrupts to inform software of completed
events or error conditions encountered by the hardware. The table below gives the subunit and the subunit's primary interrupt status register.
- Table 3.5 Subunit and Primary Interrupt Status Register
- Module
- Interrupt Status Register
- MCF
- MC_INTSTATUS_0*
- HUB
- MC_HUB_INSTATUS_0
- HUB_COMMON
- MC_HUBC_INTSTATUS_0
- SyncPoint
- MC_MSS_SBS_INTSTATUS_0
- MC Channel
- MC_CH_INTSTATUS_0
- EMC
- EMC_INTSTATUS
Note: MC_INSTATUS_0 is the legacy interrupt status register. Each of the subunits ideally contains the three interrupt registers below, but in some cases only contains the first two: 1.
- INTSTATUS. Contains the interrupt vector. A bit in this register is set when the hardware
detects the specific condition that triggers the interrupt. Writing a 1 to the interrupt vector bit clears the associated interrupt.

- Memory Subsystem (MSS)
2. INTMASK. Contains mask vector for the interrupt vector. Each bit in this register corresponds to a bit in INTSTATUS. If the MASK bit for an interrupt is set (UNMASKED), the corresponding interrupt is forwarded to the global interrupt logic on the non-critical wire. INTPRIORITY. (Not implemented in all units) Contains priority mask vector for the interrupt vector. Each bit in this register corresponds to a bit in INTSTATUS. If the MASK bit for an interrupt is set (UNMASKED), the corresponding interrupt is forwarded to the global interrupt logic on the critical wire. 3. Some subunits have two wires to the global interrupt status logic in HUB-common, and others have only the non-critical wire: intr – interrupt signal to global interrupt logic in HUB-common critical_intr – critical interrupt signal to global interrupt logic in HUB-common For error conditions, ERR_*STATUS registers are provided to log information on the cause of the error (generally the address of the offending transaction, which could be virtual or physical), and other information relevant to the error.
##### 3.1.2.19.1 Global Interrupt Interface
- Global interrupt logic in HUB-common aggregates the incoming signals from the subunits and
exports the following signals to the interrupt processing logic in LIC: mss2lic_mc_critical_intr – OR of incoming critical_intr signals, indicating critical interrupt is active mss2lic_mc_intr – OR of incoming intr signals, indicating non-critical interrupt is active. Each TCU generates secure and non-secure interrupts, and they are routed directly to LIC: mss2lic_smmu_comb_nonsecure_intr – non-secure interrupt from TCU0 mss2lic_smmu_comb_secure_intr – secure interrupt from TCU0 mss2lic_smmu1_comb_nonsecure_intr – non-secure interrupt from TCU1 mss2lic_smmu1_secure_intr – secure interrupt from TCU1 mss2lic_smmu2_comb_nonsecure_intr – non-secure interrupt from TCU2 (ISO SMMU) mss2lic_smmu2_secure_intr – secure interrupt from TCU2 (ISO SMMU) mss2lic_smmu3_comb_nonsecure_intr – non-secure interrupt from TCU3 mss2lic_smmu3_comb_secure_intr – secure interrupt from TCU3 mss2lic_smmu4_comb_nonsecure_intr – non-secure interrupt from TCU4 mss2lic_smmu4_secure_intr – secure interrupt from TCU 4 The following registers within HUB-common show the status of the non-critical and critical input wires from each of the subunits:
- MC_GLOBAL_INTSTATUS_0
- MC_GLOBAL_INTSTATUS_1_0

- Memory Subsystem (MSS)
- MC_GLOBAL_CRITICAL_INTSTATUS_0
- MC_GLOBAL_CRITICAL_INTSTATUS_1_0
##### 3.1.2.19.2 MCF Interrupts (including interrupts from the SecChk block)
The SecChk security block in MCF implements numerous security checks. When an address decode error occurs, the offending address is captured in the MC_ERR_ADDR register and information about the error is captured in one or more MC_ERR_*STATUS registers. The captured information is intended to assist developers in debugging the error. A single request can trigger multiple errors. There are multiple error status registers (MC_ERR_*STATUS) which capture the status of different types of errors, as listed below:
- MC_ERR_STATUS – Multiple violations. When more than one of the following violations
occurs, the highest-priority violation is reported (listed below in descending priority order):
- ERR_TYPE = DECERR_EMEM – DRAM minimum/maximum allowed memory addresses
- ERR_TYPE = SECURITY_TRUSTZONE – TrustZone carveout violations
- MC_ERR_GENERALIZED_CARVEOUT_STATUS – GSC carveout violations
- MC_ERR_SEC_STATUS – SEC carveout violations
- MC_ERR_VPR_STATUS – VPR carveout violations
- MC_ERR_ROUTE_SANITY_STATUS – Routing incompatibility errors (including NVLink access
violations) The capture registers record the following information about the error: the physical address of the error (since security check is post SMMU) which type of fault the captured error corresponds to a read/write indicator the requestor Client ID the swap bit sent by the client
- Subsequent errors (of any type) do not change the status and address registers until the
corresponding interrupt is cleared.
- To prevent requests with address decode errors from modifying memory or accessing memory
they do not have permission to, the MC "squashes" the requests. A write request that is "squashed" has its byte-enables forced to all zeros; this prevents the write data from being applied to DRAM. A read request that is "squashed" has its read-return data forced to all-ones; this protects the data in DRAM from being read by nonsecure sources.
##### 3.1.2.19.3 NVLink Interrupts
- NVLink generates interrupts for malformed NVLink packets, unexpected responses, and NVLink
protection table violations, etc.

- Memory Subsystem (MSS)
##### 3.1.2.19.4 Memory Controller Channel Interrupts
There is currently only one performance warning type interrupt: ARBITRATION_EMEM. It fires when the MC detects that a request has been pending in the Row Sorter long enough to hit the
- DEADLOCK_PREVENTION_SLACK_THRESHOLD. In addition to true performance problems, this
interrupt may fire in situations like clock frequency changes, when the EMC backpressures pending traffic for long periods of time. This interrupt is intended to help developers identify and debug performance and configuration issues.
##### 3.1.2.19.5 EMC Interrupts
EMC generates interrupts on the following conditions:
- ECC error buffer overflow
- ECC correctable error
- ECC uncorrectable error
- Clock change FIFO overflow
- DLL lock timeout
- DLL alarm: From the EMC Digital DLL when the output delay code reaches the maximum
value. Attempt to issue command to device which is in self-refresh.
- Read data from MRR is available (to prevent software from polling for data)
- DRAM clock change sequence complete
- Refresh overflow
##### 3.1.2.19.6 PCIe MSI
- Message Signaled Interrupts (MSIs) are interrupts conveyed from an endpoint device to the
interrupt controller by memory transactions, rather than dedicated wires. PCIe MSIs are 32-bit ordered writes received by the PCIe root port (an MSS client) with system physical addresses that fall within the 64MB MSI address region specified by msi_base (iob_msi_base_match/iob_msi_base_mask) where address bits 25-16 are greater than 31, address bits 25-16 are less than 992, and address bits 15-0 are 0x0000.
- The MSS Hub routes PCIE MSIs through the SMMU to ensure that devices can only trigger
interrupts assigned to the device. MSS Hub routes MSIs to SCF regardless of other considerations. SCF decodes the MSI address range and forwards MSIs to the IOBridge/GIC. MSIs are required to push all previous writes to visibility before the MSI is sent to the interrupt controller. Because GIC is a separate destination in SCF, the standard ordered write implementation for PCIe writes to memory do not provide the required ordering guarantees for MSI messages. MSI ordering is provided by an interlock in the PCIe controller that waits for WriteAcks of all previously issued writes before forwarding an MSI. Because ordering is handled externally and not by the

- MSS Registers
ordered write mechanism in SCF, MSS Hub converts MSIs to non-ordered writes before sending to MCF.
#### 3.1.2.20 Clocking
- There are separate PLLs for each set of 64 DRAM I/O pads. These four PLLs drive a clocking
structure with locally synchronous clocks for the following clock domains:
- Each set of 64 DRAM I/O pads and associated four EMC and four Memory Controller
- Channels
- The hub units: MCF, SCF, Client Hubs, and MSS HubCommon
- Data Backbone (DBB)
#### 3.1.2.21 Software Interfaces
The primary software interface for configuration is via the APB bus registers.
- Initial configuration
- Power management
- Device/Rank management
- SMMU translation management
- Surface allocation
- Statistics and debugging

