# 1 ’b1; the example is just a suggestion for implementation). d. 4.

- Ownership
a.
- Only FSI_CSITE_TSINTP is provided by DFD with default render configurations. Async-FIFO
is not provided by DFD. FSI must hook it up as per the connectivity described above, including the Async-FIFO. b.
- Calculating Time-Interval Using Timestamps
Let TSA be timestamp at time TA and TSB be timestamp at a later time, TB. Let TB-A be time difference between TB and TA. It is calculated as follows:
- TB-A = ((TSB-TSA)/256)*32ns = ((TSB-TSA)/8)ns
- FSI ALIVE STATUS
The following signals from FSI are exported to DFD for proof-of-life and access control.
- Register: CORESIGHT_CFG_FSI_CLUSTER1_ALIVE_STATUS_0
- Bit
- Type
- Category
- Signal(s)
- Comments
[0] - - -
- RAZ/WI
[18:0]
- RO
- Resets
[nTOPRESET, nPRESETDBG, nCORERESETx, nCPUPORESETx, nCORERESETDCLSx, nCPUPORESETDCLSx]
- Input(s) to R52 cluster
[22:19]
- RO
- Reset related
- CPUHALTx
- Input(s) to R52 cluster
[26:23] - -
- RAZ/WI
[27]
- RO
- Isolation
- FSI-SOC MV APB Async Bridge’s
- CSYSACK
[28]
- RO
- Isolation
- FSI-SOC MV ATB Async Bridge’s
- CSYSACK
[29]
- RO
- Isolation
- FSI-SOC MV APB Async Bridge’s
- CSYSREQ
[30]
- RO
- Isolation
- FSI-SOC MV ATB Async Bridge’s
- CSYSREQ
[31]
- RO
- - -

- Design for Debugging (DFD)
- Register: CORESIGHT_CFG_FSI_DBG_ALIVE_STATUS_0
- Bit
- Type
- Category
- Signal(s)
- Comments
[15:0]
- RO
- Debug
dfd2fsi_cluster1_core<x>_<d >
- These signals are procured locally from
within DFD and not exported from FSI to DFD. <x> ∈ {0,1,2,3}, <d> ∈ {hiden, hniden, dbgen, niden}, [17:16]
- RO
- Debug
dfd2fsi_cluster0_core0_<p>
- These signals are procured locally from
within DFD and not exported from FSI to DFD. <p> ∈ {dbgen, niden}; [21:18]
- RO
- Resets
- FSI Cortex-R5’s {nRESET,
- DBGRESETn, PRESETDBGn,
nSYSPORESET}
- Input(s) to Cortex-R5 cluster
[22]
- RO
- Resets
- FSI_CSITE_RSTN
- Input(s) to some (not all) SOC400
components in FSI cluster [23]
- RO
- [24]
- RO
- Clock
- FSI_FABRIC_CLK_TOGGLE
- This is a 32b counter on
- FSI_FABRIC_CLK. Overflow bit toggles
side-band to SOC-DFD. This bit toggles at a very low frequency of around 1/ (2^32) the frequency of the FSI_FABRIC_CLK. [25]
- RO
- Clock enable
- FSI_CHSM_CPU_CE
- FSI-R5 clock (FSI_CHSM_CPU_CLK)
enable [26]
- RO
- Clock enable
- FSI_CSITE_CE
FSI_CSITE_CLK’s enable. [27]
- RO
- [28]
- RO
- - - [30:29]
- RO
- Power
- FSI’s Power clamps
- Signals come from PMC
(pmc2fsi_rg_clamp and the pmc2fsi_clamp_pre_fs). [31]
- RO
- Debug
- FSI Debug-APB ACCESS-
- TIMEOUT
Generated within SOC-DFD locally.
- CORESIGHT_CFG_FSI_CLUSTER1_ALIVE_STATUS_0 and
CORESIGHT_CFG_FSI_DBG_ALIVE_STATUS_0 are protected by a common SCR: CORESIGHT_CFG_SCR_FSI_ALIVE_STATUS_0.
- Note: The counter used in FSI_FABRIC_CLK_TOGGLE is enabled only when FSI-R5’s DBGEN (also
known as dfd2fsi_cluster0_core0_dbgen) is HIGH.

- Design for Debugging (DFD)
- FSI FFI in Context of Debug
Freedom From Interference (FFI) implies methods to ensure FSI functionality is not impacted by other units that do not meet the necessary safety rating. Provisions are available to prevent DFD from impacting FSI functional behavior due to any DFD failures.
- Isolation through reset and clock gating
- This approach relies on FSI_CSITE_RSTN assertion and FSI_CSITE_CLK gating (refer to the
Connectivity for CSYREQ and CSYSACK of APB/ATB async bridges used for voltage crossing section). To avoid flush from hanging when FSI is not being traced but logically isolated, ensure Major ATB Funnel does not enable FSI ATB port.
- CNA Fault Detection
Check Not Asserted (CNA) Fault Detection is a mechanism to generate faults when a signal takes a value that it is otherwise not expected to take during mission mode. In addition to signal clamping/ masking, debug related signals that are not expected to be active can be plugged into such CNA logic to generate faults. FSI Cluster-0 debug related signals included in CNA list are: inv(ETMPWRUP)
- ETMPWRUP must be ‘1’ for R5-DCLS to function correctly. As R5-DCLS CNA mechanism generates
faults when selected signals are ‘1’, this signal is inverted before plugging into the Cortex-R5 cluster’s CNA logic. FSI Cluster-1 debug related signals included in CNA list are:
- R52 cluster’s HIDENx, HNIDENx, DBGENx, NIDENx
By default, CNA faults only cause interrupts to R52 GIC/Cortex-R5 VIC. The FSI-R52 GIC/FSI-R5 VIC by default ignore interrupts out of reset. FSI software must follow guidelines mentioned in the FSI
- Boot/Software Impact section to not mask these CNA errors/faults when debug intent is
established for FSI in the system. As debug intent is established much before FSI software starts execution, this should not be a problem for FSI software.
- FSI Boot/Software Impact
- Software configures FSI_CSITE_RSTN and FSI_CSITE_CLK based on BCT. FSI software programs
- FSI_MISC_ISOLATION_DFD_0[ATB, APB] on the platform when it asserts FSI_CSITE_RSTN and
disables FSI_CSITE_CLK for isolation. If FSI debug is enabled, FSI software must not engage debug signals isolation while entering “cocoon mode” or while trying to isolate itself. This is necessary to debug issues around cocoon mode and hence, debug interfaces have separate isolation controls.

- Design for Debugging (DFD)
- FSI-SW must mask all CNA errors/faults/interrupts associated with Cortex-R5 and R52 debug
signals if FSI debug is enabled in the system. FSI_LA_CLK has separate FLCG enable/disable controls for software in FSI-CAR. FSI-SW can disable FSI_LA_CLK.
##### 9.10.2.2.3 Debug Address Map
- Detailed ROM Table Hierarchy and Components
Table 9.77 Color Coding Table for ROM Table Hierarchy (for use reading the ROMs Table below)
- Color
- Table Hierarchy
- Top ROM Table
1st level nested ROM Table 2nd level nested ROM Table 3rd level nested ROM Table 4th level nested ROM Table
- Table 9.78 ROMs Table
- Component
- Address When
- Accessed by
- Self-hosted
- Software
(MMIO) (in HEX)
- Component
- Address When
- Accessed by
- External
- Debugger
(in HEX)
- Componen
t Type
- Component
- Name
- Component
- Offset
- Relative to
- Top APBIC
(in HEX)
- APBIC
- ROM Table
- ROM Table
- Entry (in
- HEX)
- CoreSight
- Major APBIC
- Custom
- CORESIGHT_C
- FG

