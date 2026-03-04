# 1 to 12 bits

- Yes
1. 2.
- Mode B assumes General Counting Mode (GCM) is used
- Mode E assumes General Counting Mode (GCM) is used
#### 9.12.1.3 Performance Event Considerations
It is useful to consider performance in terms of the metrics germane to the IP being monitored. For example, OFA IP might consider “motion vectors per second”. This requires two pieces of information: motion vector count and timestamps associated with the count. Other metrics may include two or more counts.
##### 9.12.1.3.1 Average Latency Support
- The SoC HWPM supports latency histograms within the PERFMONs. However, this requires the
entire PERFMON, thus limiting performance metric capture to a single metric. By supporting average latency, a fraction of the Mode C PERFMON counters are available for capturing other metrics. A key metric to capture with latency is the associated IP bandwidth. Average latency requires three counters:
- Request Count (R_COUNT)
- Accumulated over the profiling period
- Outstanding Request Count (OR_COUNT)
- Increments with request
- Decrements with response
- Count changes every cycle based on requests and response activity
- Count returns to zero when all responses are received

- Hardware Performance Monitor (HWPM)
- Accumulated Outstanding Request Count (AOR_COUNT)
- Accumulates the outstanding request count over time
- AOR_COUNT = AOR_COUNT + OR_COUNT
The average latency for an outstanding request is calculated using the following formula:
- Average Latency = AOR_COUNT / R_COUNT
The figure below illustrates an example of calculating average latency using the three counters listed above where two back-to-back requests are followed by back-to-back responses seven cycles later.
**Figure 9.94 Average Latency Example**
Support for average latency with HWPM requires IP to implement the outstanding request count (OR_COUNT) prior to the PERFMUX. Additionally, the PERFMON group must contain the following inputs:
- Request Count
- Outstanding Request Count
Resetting of outstanding request count prior to profiling run helps ensure a more accurate count of outstanding requests per cycle. To avoid counter wrapping negative, IPs should clamp the outstanding request count (OR_COUNT) to zero.
- Accumulated Outstanding Request Support
- AOR_COUNT is implemented with PERFMON counters. Two implementations are described in this
section:
- Using multiple PERFMON counters
- Allows for capturing outstanding requests at a finer granularity

- Hardware Performance Monitor (HWPM)
- Useful for high frequency sampling of PERFMON records of high bandwidth clients
- Using single PERFMON counter
- Allows for capturing over six additional metrics in a single pass
- Useful for capturing average latency over wider time periods
#### 9.12.1.4 Performance Trigger Considerations
Performance monitors use a variety of triggers to cause PERFMON to output data to memory. Reasons to output performance monitor records are:
- Periodic sampling
- Simultaneously snapping all IP PERFMONS. PERFMON is configured to snap on
pma_trigger. pma_trigger is driven by a periodic pulse from the PMA.
- Performance monitor overflow
- PERFMON automatically writes out a record if the count reaches a fixed threshold. See the
“Performance Monitor Streaming Overflow Threshold” table.
- IP context switching
- Forcing records to memory for a given IP when IP switches contexts
- Required for multi-VM platforms
- Local trigger
- Cross triggering
- Triggering record writes between SoC and GPU HWPM subsystems
- CPU trigger
- CPU generated trigger based upon PMA register write
- NV_PERF_PMA_TRIGGER_GLOBAL (used by many tools)
- NV_PERF_PMA_SYS_TRIGGER_START
- NV_PERF_PMA_SYS_TRIGGER_STOP
- - -
- CPU generated local trigger based upon PMM register write
- -
- NV_PERF_PMM_CONTROLB_FLUSH_RECORD
- NV_PERF_PMM_STARTEXPERIMENT
- Local PERFMON trigger
-
- PERFMONs can be configured to snap records on other events on the PERFMON watch
bus. t_pulse – Local periodic clock with rates of 2{10-16} cycles in the PERFMONs clock domain.
- Mode E – any 1-bit signal (on a pulse)
- Mode C – any 4-bit predicate (including t_pulse, pma_trigger, etc.)
valid + 32-bit bookmark – direct IP trigger to cause snapshot

- Hardware Performance Monitor (HWPM)
In general, the SoC HWPMs configures PERFMONS to snap based upon periodic triggers from the
- PMA. The HWPM subsystem accomplishes periodic sampling by implementing a count-down
trigger in PMA. Once the counter reaches zero, PMA triggers all PERFMONs to snap the counters and stream a 32-byte record to the PMA to be written to memory. SoC HWPMs support triggering for all the reasons listed except for cross triggering between SoC IPs. Cross triggering is only allowed between SoC and GPU HWPM subsystems (PMAs).
##### 9.12.1.4.1 Performance Metric Record Alignment
Performance metric records contain up to a 40-bit “timestamp”. This timestamp is measured in the clock domain of the local PERFMON. This can only be correlated to wall clock time if the frequency of the PERFMON clock domain is fixed. The PMA unit has a feature called PMA record that outputs a global wall clock timestamp (TSC) as part of its record along with TOTAL_TRIG_COUNT that can be matched to PERFMON record TOTAL_TRIG_RCV count to correlate to wall clock time. The following sequence illustrates how the correlation between PERFMON free running counter timestamp and PMA (TSC) timestamp is established:
- PMA periodic timer pops
- PMA sends global trigger to all PERFMONs
- PMA outputs TSC TIMESTAMP and TOTAL_TRIG_COUNT
- PERFMONs send records to PMA with “local counter” TIMESTAMP and TOTAL_TRIG_RCV
- Post processing looks for PERFMON records where TOTAL_TRIG_COUNT equals
- TOTAL_TRIG_RCV. The relationship between wall clock and local timer is established using
corresponding PMA and PERFMON TIMESTAMPs. When considering local triggers, records of a given IP are injected into the HWPM record buffer between the sampled records. Local triggered records can be identified by the
- PMLOCALTRIG_COUNTA field > 0. Tools can either use linear interpolation of PERFMON record
timestamps using two neighboring PMA trigger records or rely on bookmarks to align performance metric records to the IP VM timestamp records in a separate buffer. Correlation of locally triggered and periodically sampled records can be achieved using timestamps in these record types.
##### 9.12.1.4.2 PERFMON Local Triggers
PERFMON supports a variety of local triggers. Local trigger usage is available in Mode C and Mode E specifically external bookmark trigger. A description of local trigger is as follows:
- Modes C and E supports PERFMON Local Triggers. This is a hardwired interface. Each local
trigger supports: 1-bit trigger wire 16-bit bookmark IP implementing local triggers outputs two local trigger/bookmarks:

- Hardware Performance Monitor (HWPM)
- PMA_ENGINE_START, PM_LOCAL_TRIGA, PM_LOCAL_BKMKA
- PMA_ENGINE_STOP, PM_LOCAL_TRIGB, PM_LOCAL_BKMKB
- TOTAL_TRIG_RCV and PM_LOCAL_TRIGB share the same location in the 32-byte record. IP
should use PM_LOCAL_TRIGA.
- Trigger outputs are from IP local trigger registers
IP microprocessor (Falcon or Cortex-R5):
- Writes bookmark
- Toggles trigger
- PERFMON snaps (write out record) when local trigger wire is asserted. If the PERFMON is
unable to snap due to backpressure, the record may be merged with additional PMA or local triggers. If two local triggers are merged, the local trigger count is two and the bookmark is from the most recent trigger. A tool can identify this case and still correlate to the two events in the IPs event log. It is recommended that bookmarks are implemented as a monotonically incrementing ID to support this case. Output PERFMON record contains:
- Mode C
-
- Single 16-bit bookmark and local trigger count
- Mode E
-
- Two 16-bit bookmarks and two local trigger counts
- Mode C Record

